class PicasaWebAlbumFacade
  require 'xmlsimple'
  require 'net/https'
  @@picasa_url = 'http://picasaweb.google.com/data/feed/api/user/113115968878931614254'

  @google_photos_url_mapping = { "6322092917200132817" => "https://goo.gl/photos/Y1iP4q1McMjacf956", #CM 2016
                                 "6188873569815108129" => "https://goo.gl/photos/F9tM6tofHFx7SVSA6", #CM 2015
                                 "6069220280649896577" => "https://goo.gl/photos/X9WM9tARn4zuzeKVA", #CM 2014
                                 "6027673502619115985" => "https://goo.gl/photos/RNKm698XyM23drUu8", #Hopp Schwiiz 2014
                                 "5916304782174952801" => "https://goo.gl/photos/CSCEdo9M1JCM1fjK8", #CM 2013
                                 "5785788968661934049" => "https://goo.gl/photos/X57vUjYaJCtBCbb67", #CM 2012
                                 "5646321407522660097" => "https://goo.gl/photos/PLsTja8Jj4XV3Wo6A", #CM 2011
                                 "5489546439564447921" => "https://goo.gl/photos/o84MoZ2QHzdSBcPo6", #Hopp Schwiiz 2010
                                 "5375438016275558593" => "https://goo.gl/photos/qnsoLAybqHZMd6hC7", #CM 2009
                                 "5239650248778752545" => "https://goo.gl/photos/UfQB4PyhHtMXAB2E7", #CM 2008
                                 "5212048226829497361" => "https://goo.gl/photos/7r8BpyamJatn3oBE6", #Hopp Schwiiz 2008
                                 "5192731291146577057" => "https://goo.gl/photos/4yGp5NKo4gT1e7tbA", #IC Ligaerhalt 2005
                                 "5192730784340435937" => "https://goo.gl/photos/5ZtR7HCGYcwL63Vq5", #IC Ligaerhalt 2001
                                 "5192748458130860321" => "https://goo.gl/photos/to5qijmyDKN5wrgN9", #CM 2006
                                 "5192746589820086481" => "https://goo.gl/photos/sDuqoYWfyeb8dDiPA", #CM 2005,
                                 "5192742230428280737" => "https://goo.gl/photos/J66ULJvPGG5Sz1w96", #CM 2004,
                                 "5192749592002226609" => "https://goo.gl/photos/gAshAiivvXUusQs96", #IC 2004,
                                 "5192737991295559345" => "https://goo.gl/photos/x4wxFfxGuFK78NN36", #CM 2003,
                                 "5192733022018397633" => "https://goo.gl/photos/Hv3tvFhqdJN2ZmVu9"} #Nachtturnier 2002,
  
  def self.get_album_feed
    uri = URI.parse(@@picasa_url)
    Net::HTTP.start(uri.host, uri.port) do |http|
      return http.get(uri.path)
    end
  end
    
  #returns a array of albums
  def self.get_albums_by_feed(albumfeed)
    albums = []
    album_xml_parsed = XmlSimple.xml_in(albumfeed, 'KeyAttr' => 'name')
    for entry in album_xml_parsed['entry']
      album = Album.new(entry['title'][0]['content'], entry['group'][0]['thumbnail'][0]['url'])
      picasa_album_id = entry['id'][0].split('/').last
      if(@google_photos_url_mapping[picasa_album_id])
        album.link_url = @google_photos_url_mapping[picasa_album_id]
      else
        album.link_url = entry['link'][1]['href']
      end

      #album.link_url = entry['id']
      album.num_photos = entry['numphotos'][0].to_i
      albums << album
    end
    return albums
  end
  
   #returns a array of albums
  def self.get_albums
    albumFeed = get_album_feed
    return get_albums_by_feed(albumFeed.body)
  end
end

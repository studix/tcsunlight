class PicasaWebAlbumFacade
  require 'xmlsimple'
  require 'net/https'
  @@picasa_url = 'http://picasaweb.google.com/data/feed/api/user/113115968878931614254'

  @google_photos_url_mapping = { "6322092917200132817" => "https://photos.google.com/share/AF1QipPz-rpL2jqdkyc7B__w6TgZ-OmUqOapMy1D2cmzpZXsr0Al8Af3nFhBdR5MBQEhUA?key=anpibjk4a1dON2pMcEw0bWxPSGJscl93eTljQjV3" }
  
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

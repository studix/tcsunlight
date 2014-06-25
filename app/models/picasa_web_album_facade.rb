class PicasaWebAlbumFacade
  require 'xmlsimple'
  require 'net/https'
  @@picasa_url = 'http://picasaweb.google.com/data/feed/api/user/TCSunlightGallerie?kind=album'
  
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
      album.link_url = entry['link'][1]['href']
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

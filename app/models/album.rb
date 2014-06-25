class Album
  @title
  @thumbnail
  @link_url
  @num_photos
  
  def initialize(title, thumbnail)
    @title = title
    @thumbnail = thumbnail
  end
  
  def title
    @title
  end

  def thumbnail
    @thumbnail
  end
  
  def link_url=(new_link_url)
    @link_url = new_link_url
  end
  
  def link_url
    @link_url
  end
  
  def num_photos
    @num_photos
  end
  
  def num_photos=(new_num_photos)
    @num_photos = new_num_photos
  end
  
  
end

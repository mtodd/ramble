class Post < Sequel::Model
  
  # Returns the title as a slug-formatted string with the ID.
  # 
  # Examples
  #   post.id #=> 12
  #   post.title #=> "Hello, world!"
  #   post.slug #=> "12-hello-world"
  # 
  # Returns String:slug
  # 
  def slug
    # hugs and kisses to Rick Olson's permalink_fu
    slug = title
    slug.gsub!(/\W+/, ' ')
    slug.strip!
    slug.downcase!
    slug.gsub!(/\ +/, '-')
    return "#{id.to_s}-#{slug}"
  end
  
end

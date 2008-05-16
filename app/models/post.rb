class Post < Sequel::Model
  
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

class Post < Sequel::Model
  
  # = Associations
  many_to_one :author, :class => User
  
  # = Validations
  validates do
    presence_of :title
    presence_of :body
  end
  
  # = Hooks
  before_create do
    self.created_at = Time.now
    self.updated_at = Time.now
  end
  before_update do
    self.updated_at = Time.now
  end
  
  # = Methods
  
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
    slug = title.dup
    slug.gsub!(/\W+/, ' ')
    slug.strip!
    slug.downcase!
    slug.gsub!(/\ +/, '-')
    return "#{id.to_s}-#{slug}"
  end
  
  # Turns the post into a JSON representation.
  # 
  # Note that it adds the virtual +slug+ attribute into the values hash, as well
  # as the author information before generating the JSON.
  # 
  # Returns String:json_representation_of_post
  # 
  def to_json
    self.values.merge(:slug => self.slug, :author => User[self.author_id].values).to_json
  end
  
end

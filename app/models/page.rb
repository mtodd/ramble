class Page < Sequel::Model
  
  # = Associations
  # many_to_one :author, :class => User
  
  # = Validations
  validates do
    presence_of :title
    presence_of :content
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
  
  # Turns the page into a JSON representation.
  # 
  # Returns String:json_representation_of_page
  # 
  def to_json
    # self.values.merge(:slug => self.slug, :author => User[self.author_id].values).to_json
    self.values.to_json
  end
  
end

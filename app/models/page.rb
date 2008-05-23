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
  
  # ...
  
end

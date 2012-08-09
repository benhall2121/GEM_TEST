class Employee < ActiveRecord::Base
  has_many :chkOutIns

  def self.search(search)
	  if search
	    where('name LIKE ? OR idString Like ?', "%#{search}%", "%#{search}%")
	  else
	    scoped
	  end
  end

end

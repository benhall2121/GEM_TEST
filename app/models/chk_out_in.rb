class ChkOutIn < ActiveRecord::Base
  belongs_to :asset
  belongs_to :employee

  def self.search(search)
	  if search
	    where('employees.name LIKE ? OR assets.name Like ?', "%#{search}%", "%#{search}%")
	  else
	    scoped
	  end
  end

end

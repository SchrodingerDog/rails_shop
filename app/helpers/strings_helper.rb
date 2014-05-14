module StringsHelper 
	
  def self.prettyfiy(str)
    str.to_s.capitalize.split('_').join(' ')
  end
 
end
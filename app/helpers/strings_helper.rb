module StringsHelper 
	
  def self.prettify(str)
    str.to_s.capitalize.split('_').join(' ')
  end
 
end
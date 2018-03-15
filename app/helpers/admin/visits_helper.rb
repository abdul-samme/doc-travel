module Admin::VisitsHelper

def country_name (record) 
	
    country = ISO3166::Country[record]
    cc = country.translations[I18n.locale.to_s] || country.name
    
  
  end
end
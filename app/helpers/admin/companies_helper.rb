module Admin::CompaniesHelper

def status_value (record) 
	
 if record == "Bye"

 status = "Debit"
else
 status = "Credit"
    
  end
end
end 
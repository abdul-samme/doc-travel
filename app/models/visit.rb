class Visit < ApplicationRecord
  before_create :calculate_margin
  before_update :calculate_margin
  before_create :calculate_debit
  before_update :calculate_debit
  before_create :set_client_status
  before_update :set_client_status
  before_update :client_debit_payment, if: :creditAmount?

  def client_debit_payment
   if self.debitAmount.to_f > 0.0
   self.paidAmount = self.paidAmount.to_f + self.creditAmount.to_f
   self.debitAmount = self.debitAmount.to_f - self.creditAmount.to_f
  end
  if self.debitAmount.to_f == 0.0
    self.status = "Cleared"
    else
      self.status = "Not Cleared"
    end
    self.creditAmount = 0.0
end

  def calculate_margin
    self.profit = self.salePrice.to_f - self.actualCost.to_f
  end

  def calculate_debit
    self.debitAmount = self.salePrice.to_f - self.paidAmount.to_f
  end

  def set_client_status
  	if self.salePrice.to_f - self.paidAmount.to_f == 0.0
  		self.status = "Cleared"
  	else
  		self.status = "Not Cleared"
    end
 end
end

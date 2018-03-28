class Ticket < ApplicationRecord

  before_create :calculate_margin
  before_update :calculate_margin
  before_create :calculate_debit
  before_update :calculate_debit
  before_create :set_client_status
  before_update :set_client_status
  before_update :client_debit_payment, if: :creditAmount?

  def client_debit_payment
   if self.debit.to_f > 0.0
   self.paidAmount = self.paidAmount.to_f + self.creditAmount.to_f
   self.debit = self.debit.to_f - self.creditAmount.to_f
  end
  if self.debit.to_f == 0.0
    self.status = "Cleared"
    else
      self.status = "Not Cleared"
    end
    self.creditAmount = 0.0
end

  def calculate_margin
    self.margin = self.sale_price.to_f - self.actual_price.to_f
  end

  def calculate_debit
    self.debit = self.sale_price.to_f - self.paidAmount.to_f
  end

  def set_client_status
  	if self.sale_price.to_f - self.paidAmount.to_f == 0.0
  		self.status = "Cleared"
  	else
  		self.status = "Not Cleared"
    end
 end
end

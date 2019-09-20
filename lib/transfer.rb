class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
      
end

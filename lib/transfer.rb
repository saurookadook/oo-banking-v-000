require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status = "pending" && self.valid?
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

  def reverse_transfer
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
  end

end

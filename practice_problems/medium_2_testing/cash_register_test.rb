require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction = Transaction.new(15.57)
    @transaction.amount_paid = 20.0
    @register = CashRegister.new(100.0)
  end
  
  def test_accept_money
    starting_amount = @register.total_money
    @register.accept_money(@transaction)
    new_amount = @register.total_money
    
    assert_in_delta(starting_amount + @transaction.amount_paid, new_amount)
  end
  
  def test_change
    change = @register.change(@transaction)
    
    assert_in_delta(@transaction.amount_paid - @transaction.item_cost, change)
  end
  
  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end

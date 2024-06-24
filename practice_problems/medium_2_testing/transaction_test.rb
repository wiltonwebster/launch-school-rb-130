require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(15.57)
  end
  
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    
    assert_in_delta(30.0, @transaction.amount_paid)
  end
end

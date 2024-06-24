# Type Assertions

=begin
Write a minitest assertion that will fail if value is not an instance of the 
Numeric class exactly. value may not be an instance of one of Numeric's 
superclasses.
=end

assert_instance_of(Numeric, value)
# Same Object Assertions

=begin
Write a test that will fail if list and the return value of list.process are
different objects.
=end

assert_same(list, list.process)
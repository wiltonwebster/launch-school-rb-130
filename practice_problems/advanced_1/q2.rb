# Exploring Procs, Lambdas, and Blocks: Definition and Arity

=begin
This exercise covers material that you do not have to master. We provide the
exercise as a way to explore the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity 
of lambdas, procs, and implicit blocks. Two groups of code also deal with the 
definition of a Proc and a Lambda, and the differences between the two. Run each
group of code below: For your answer to this exercise, write down your 
observations for each group of code. After writing out those observations, write
one final analysis that explains the differences between procs, blocks, and 
lambdas.
=end

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}


=begin
Observations:

Group 1 - 
  The code in Group 1 creates a proc object, then outputs that object, its
  class, a call to that object without an argument, and another call with an
  argument. The call without an argument leaves the thing variable as nil, while
  the call with an argument causes 'cat' to stored in thing.
  
Group 2 - 
  The code in Group 2 shows two different ways of creating lambdas, which appear
  to be Proc objects. It shows that calling a lambda with the appropriate number
  of arguments works the same as a proc, but calling too few raises an arguement
  error. Lastly, it shows that lambdas cannot be created with Lambda.new, which
  indicates that while Proc is a class, Lambda is not.
  
Group 3 - 
  The code in Group 3 creates a method with a yield keyword, then attempts to 
  call that method with and without a block. The call with a block does not do
  what we want because yield is not passed any arguments, so the argument passed
  into the method never gets passed into the block. The call without a block
  simply fails with a Local Jump Error, since the yield cannot find a block to
  yield to.
  
Group 4 - 
  The code in Group 4 fixes the error from Group 3 by passing the method's
  argument to yield, which in turn passes it to the block. The first call works
  as expected. The second call contains two block parameters, but since we only
  pass in one argument, the second parameter keeps its initial value of nil. The
  third call has no parameters, which is technically allowed, but then the block
  references a paraemeter that doesn't exist, which raises a Name Error
  

Overall Analysis:
  Together, these snippets show how arity requirements differ between blocks, 
  Procs, and lambdas. 
  
  A block can be passed too many or too few arguments and 
  still execute correctly. If passed too many arguments, the extra arguments
  simply will be ignored; if passed too few, the block parameters that aren't
  provided a reference will simply remain as nil.
  
  A Proc will behave similarly - extra arguments will be ignored and extra block
  parameters will retain the value nil.
  
  A lambda appears to be a special kind of Proc object where the number of 
  arguments and the number of block parameters must match, otherwise an Argument
  Error will be raised.
  
  Lastly, yield must always be passed a block when invoked, otherwise a Local 
  Jump Error will be raised.
=end
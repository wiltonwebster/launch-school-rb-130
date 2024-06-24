# Enumerable Class Creation

=begin
Assume we have a Tree class that implements a binary tree.

A binary tree is just one of many forms of collections, such as Arrays, Hashes, 
, Sets, and more. All of these collection classes include the Enumerable module,
which means they have access to an each method, as well as many other iterative 
methods such as map, reduce, select, and more.

For this exercise, modify the Tree class to support the methods of Enumerable. 
You do not have to actually implement any methods -- just show the methods that 
you must provide.
=end

class Tree
  include Enumerable
  
  def each
    #implementation
  end
end

=begin
In order for the included Enumerable methods to work, an #each method must exist
to tell the class how to iterate. #each is not included in Enumerable.
=end
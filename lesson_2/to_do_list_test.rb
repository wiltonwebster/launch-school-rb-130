require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_same(@todo1, @list.first)
  end
  
  def test_last
    assert_same(@todo3, @list.last)
  end
  
  def test_shift
    assert_same(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    assert_same(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done
    assert_equal(false, @list.done?)
  end
  
  def test_invalid_item_error
    assert_raises(TypeError) { @list.add("I'm not a Todo") }
    assert_raises(TypeError) { @list.add([@todo1]) } # array
  end
  
  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo
  
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    new_todo = Todo.new("Write tests")
    @list.add(new_todo)
    @todos << new_todo
  
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_same(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end
  
  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(3) }
  end
  
  def test_mark_undone_at
    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_undone_at(3) }
  end
  
  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(3) }
    assert_same(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end
  
  def test_to_s_all_undone
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    @todo1.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_each_iteration
    result = []
    @list.each { |todo| result << todo }
    assert_equal(result, @list.to_a)
  end
  
  def test_each_return
    assert_same(@list, @list.each { nil })
  end
  
  def test_select
    @todo2.done!
    done_list = @list.select(&:done?)
    assert_equal([@todo2], done_list.to_a)
    refute_same(@list, done_list)
  end
end
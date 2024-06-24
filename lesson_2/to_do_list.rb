# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    
    todos << todo
  end
  
  alias << add
  
  def size
    todos.size
  end
  
  def first
    todos.first
  end
  
  def last
    todos.last
  end
  
  def to_a
    todos.clone
  end
  
  def done?
    todos.all? { |todo| todo.done? }
  end
  
  def item_at(index)
    todos.fetch(index)
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end
  
  def done!
    todos.each { |todo| todo.done! }
  end
  
  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end
  
  def remove_at(index)
    todos.delete(item_at(index))
  end
  
  def to_s
    "---- #{title} ----\n" +
    todos.map { |todo| todo.to_s}.join("\n")
  end
  
  def each
    todos.each { |todo| yield(todo) }
    self
  end
  
  def select
    result = TodoList.new(title)
    each do |todo|
      result << todo if yield(todo)
    end
    result
  end
  
  def find_by_title(input_title)
    select { |todo| todo.title == input_title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end
  
  def all_not_done
    select { |todo| !todo.undone? }
  end
  
  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end
  
  alias mark_all_done done!
  
  def mark_all_undone
    each { |todo| todo.undone! }
  end
  
  private
  
  attr_reader :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect
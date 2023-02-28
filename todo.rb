require 'colorize'

# Define an array to store tasks
tasks = []

# Define a method to display the menu options
def show_menu
  puts "To-Do List:".colorize(:green)
  puts "1. Add task".colorize(:blue)
  puts "2. View tasks".colorize(:blue)
  puts "3. Mark task as complete".colorize(:blue)
  puts "4. Exit".colorize(:red)
  print "Enter your choice: "
end

# Define a method to add a task to the list
def add_task(tasks)
  print "Enter the task: "
  task = gets.chomp
  tasks << { name: task, completed: false }
  puts "Task added.".colorize(:green)
end

# Define a method to view all tasks in the list
def view_tasks(tasks)
  puts "Tasks:".colorize(:green)
  tasks.each_with_index do |task, index|
    status = task[:completed] ? "[X]" : "[ ]"
    puts "#{index + 1}. #{status} #{task[:name]}"
  end
end

# Define a method to mark a task as complete
def complete_task(tasks)
  print "Enter the task number to mark as complete: "
  index = gets.chomp.to_i - 1
  if tasks[index]
    tasks[index][:completed] = true
    puts "Task marked as complete.".colorize(:green)
  else
    puts "Invalid task number.".colorize(:red)
  end
end

# Display the menu and process user input
loop do
  system "clear" or system "cls"
  show_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    add_task(tasks)
  when 2
    view_tasks(tasks)
  when 3
    complete_task(tasks)
  when 4
    puts "Goodbye!".colorize(:red)
    exit
  else
    puts "Invalid choice.".colorize(:red)
  end

  # Pause before clearing the screen
  print "Press enter to continue...".colorize(:cyan)
  gets.chomp
end
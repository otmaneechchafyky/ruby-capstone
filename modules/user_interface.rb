module UserInterface
  SIMPLE_LINE = { char: '-', num: 30 }.freeze
  DOUBLE_LINE = { char: '=', num: 30 }.freeze

  # input data
  def ask_for(message)
    print "Type #{message}: "
    gets.chomp.strip.capitalize
  end

  def say_saving(type, file)
    puts "💾 Saving [#{type}] data into '#{file}'..."
    pause_by(1)
  end

  def say_saved(file)
    puts "✅ Saving '#{file}' was completed."
    puts "\n"
    pause_by(0.5)
  end

  def say_invalid(type)
    puts "\n"
    puts "🛑 Invalid [#{type}], choose a valid one."
    pause_by(0.5)
    false
  end

  def say_missing(elem, type)
    puts "\n"
    puts "🛑 Missing <#{elem}> to create a [#{type}]."
    false
  end

  def say_nothing_to(type, action)
    puts "\n"
    puts "🛑 There are no [#{type}] to #{action}."
    false
  end

  def say_creating(type)
    puts "\n"
    print_line
    pause_by(0.5)
    puts "⌛ - Creating [#{type}]..."
  end

  def say_created(type, name = nil)
    name = " '#{name}'" unless name.nil?

    print_line
    pause_by(0.5)
    puts "✅ - The [#{type}]#{name} was succefully created."
    puts "\n"
    pause_by(1)
  end

  def say_already_exist(type, name)
    print_line
    pause_by(0.5)
    puts "✅ - The [#{type}] '#{name}' was previously created."
    puts "\n"
    pause_by(1)
  end

  def print_title(title)
    puts "\n"
    puts title
    print_line({ char: '=', num: 100 })
  end

  def print_line(params = SIMPLE_LINE)
    puts params[:char] * params[:num]
  end

  def pause_by(secs = 1)
    sleep secs
  end

  def yes_no(value)
    value ? 'yes' : 'no'
  end

  def true_false(value)
    value == 'Y'
  end
end

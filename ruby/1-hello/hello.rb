class Hello
  attr_accessor :name
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end

  def ask_name
    @output.print("What is your name? ")
    @name = @input.gets.strip!
  end

  def say_hello
    @output.puts "Hello #{@name}. Nice to see you!"
  end
end

class Hello2
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end
  
  def ask_name
    @output.print("What is your name? ")
  end

  def say_hello
    @output.puts("Hello #{@input.gets.strip!}. Nice to see you!")
  end
end

class Hello3
  attr_accessor :name
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end

  def ask_name
    @output.print("What is your name? ")
    @name = @input.gets.strip!
  end

  def say_hello
    case @name
      when "Robie"
        @output.puts "Hello #{@name}. Nice to see you!"
      when "Toby"
        @output.puts "Hello #{@name}. Are you going to chase the squirrel?"
      else
        @output.puts "Howdy #{@name}"
    end
  end
end

if __FILE__ == $0
  hello = Hello3.new
  hello.ask_name
  hello.say_hello
end

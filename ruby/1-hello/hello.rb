class Hello
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

  def name?
    @name
  end
end

if __FILE__ == $0
  hello = Hello.new
  hello.ask_name
  hello.say_hello
end

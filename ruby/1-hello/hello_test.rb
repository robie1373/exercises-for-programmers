require 'minitest/autorun'
require 'stringio'

require_relative 'hello.rb'

class TestHello < Minitest::Unit::TestCase
  def setup
    @outputio = StringIO.new
    @inputio = StringIO.new("Robie\n")
    @hello = Hello2.new(input: @inputio, output: @outputio) 
    @hello.ask_name
  end

  def test_ask_name
    res = @outputio.string
    expected = "What is your name? "

    assert res == expected, "Expected #{res}\n to match #{expected}"
  end

  def test_say_hello
    @hello.say_hello
    res = @outputio.string.strip!
    expected = "What is your name? Hello Robie. Nice to see you!"

    assert res == expected, 
      "Expected #{res}\n to match #{expected}"
  end
end


class TestHello3 < Minitest::Unit::TestCase
  def setup
  end

  def test_ask_name
    outputio = StringIO.new
    inputio = StringIO.new("Robie\n")
    hello = Hello3.new(input: inputio, output: outputio) 
    hello.ask_name

    res = outputio.string
    expected = "What is your name? "

    assert res == expected, "Expected #{res}\n to match #{expected}"
  end

  def test_say_hello_robie
    outputio = StringIO.new
    inputio = StringIO.new("Robie\n")
    hello = Hello3.new(input: inputio, output: outputio) 
    hello.ask_name

    hello.say_hello
    res = outputio.string.strip!
    expected = "What is your name? Hello Robie. Nice to see you!"

    assert res == expected, 
      "Expected #{res}\n to match #{expected}"
  end

  def test_say_hello_toby
    outputio = StringIO.new
    inputio = StringIO.new("Toby\n")
    hello = Hello3.new(input: inputio, output: outputio) 
    hello.ask_name

    hello.say_hello
    res = outputio.string.strip!
    expected = "What is your name? Hello Toby. Are you going to chase the squirrel?"

    assert res == expected, 
      "Expected #{res}\n to match #{expected}"
  end
end

require 'minitest/autorun'
require 'stringio'

require_relative 'hello.rb'

class TestHello < Minitest::Unit::TestCase
  def setup
    @outputio = StringIO.new
    @inputio = StringIO.new("Robie\n")
    @hello = Hello.new(input: @inputio, output: @outputio) 
    @hello.ask_name
  end

  def test_ask_name
    res = @outputio.string
    expected = "What is your name? "

    assert res == expected, "Expected #{res} to match #{expected}"
  end

  def test_name?
    assert_equal @hello.name?, "Robie"
  end

  def test_say_hello
    @hello.say_hello
    puts @outputio.string 
    res = @outputio.string.strip!
    expected = "What is your name? Hello Robie. Nice to see you!"

    assert res == expected, 
      "Expected #{res} to match #{expected}"
  end
end

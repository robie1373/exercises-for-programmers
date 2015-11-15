import unittest
from io import StringIO
from hello1 import Hello

class TestHello(unittest.TestCase):
  
  def test_get_name(self):
    names = ["Toby", "Eddie", "Robie"]
    for name in names:
      testinputio = StringIO(name)
      hello = Hello(inputio=testinputio)
      self.assertEqual(hello.get_name(), name)

  def test_ask_name(self):
    testoutputio = StringIO()
    hello = Hello(outputio=testoutputio)
    hello.ask_name()
    self.assertEqual(testoutputio.getvalue(), 'What is your name? ')

  def test_concat_string(self):
    folks = dict(Gandalf="I am %s the Grey", 
      Toby="Give %s some more dinner!", 
      Eddie="Don't worry about %s. I'll be over here in the corner")
    for name, phrase in folks.items():
      hello = Hello()
      res = hello.concat_string(name, phrase)
      self.assertEqual(res, phrase % name)

  def test_run(self):
    folks = dict(Gandalf="I am %s the Grey.\n", 
      Toby="Give %s some more dinner!\n", 
      Eddie="Don't worry about %s. I'll be over here in the corner.\n",
      Robie="Hello %s. Working hard!\n")
    for name, phrase in folks.items():
      greeting_phrase = phrase % name
      expected = "What is your name? %s" % greeting_phrase
      testinputio = StringIO(name)
      testoutputio = StringIO()
      hello = Hello(inputio=testinputio, outputio=testoutputio)
      hello.run()
      self.assertEqual(testoutputio.getvalue(), expected)

if __name__ == '__main__':
  unittest.main()

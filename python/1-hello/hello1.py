import sys

class Hello:

  def __init__(self, inputio=sys.stdin, outputio=sys.stdout):
    self.inputsrc = inputio
    self.outputdst = outputio

  #def ask_name(outputdst=sys.stdout):
  def ask_name(self):
    self.outputdst.write("What is your name? ")
    return self.outputdst
  
  def get_name(self):
    res = self.inputsrc.readline()
    return res
  
  def concat_string(self, name, 
    phrase="Hello %s. Nice to see you!\n" ):
    return phrase % name

  #def say_hello(inputsrc=sys.stdin, outputdst=sys.stdout):
  def say_hello(self, greeting):
    self.outputdst.write(greeting)

  def run(self):
    self.ask_name().flush()
    inputname = self.get_name().strip()
    phrase = self.name_to_phrase(inputname)
    greeting = self.concat_string(inputname, phrase)
    self.say_hello(greeting)
  
  def name_to_phrase(self, name):
    folks = dict(Gandalf="I am %s the Grey.\n", 
      Toby="Give %s some more dinner!\n", 
      Eddie="Don't worry about %s. I'll be over here in the corner.\n",
      Robie="Hello %s. Working hard!\n")
    if name in list(folks.keys()):
      return folks[name]
    else:
      return "Hello %s. Nice to see you!"

if __name__ == '__main__':
  Hello().run()

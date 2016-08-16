# BINARY IPSUM


### Before you begin, confirm you have Ruby and RSpec installed

```
ruby -v
gem list | grep rspec

Example:
➜  LEARNING_NOTES ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
➜  LEARNING_NOTES gem list | grep rspec
guard-rspec (4.7.3, 2.5.4)
rspec (3.4.0, 3.2.0, 3.1.0, 2.99.0)
rspec-collection_matchers (1.1.2)
rspec-core (3.4.4, 3.4.1, 3.2.3, 3.1.7, 2.99.2, 2.14.5)
rspec-expectations (3.4.0, 3.2.1, 3.1.2, 2.99.2, 2.14.2)
rspec-fire (1.2.0)
rspec-mocks (3.4.1, 3.4.0, 3.2.1, 3.1.3, 2.99.4, 2.14.3)
rspec-rails (3.4.2, 3.4.0, 3.1.0, 2.99.0)
rspec-support (3.4.1, 3.2.2, 3.1.2)
spring-commands-rspec (1.0.4)
➜  LEARNING_NOTES

```

If you do not have RSpec installed, you can either add it now, or grab it with
bundle install a bit later as it will be defined in our Gemfile.  To install now
you can run:

```
# Resource:  https://relishapp.com/rspec/docs/gettingstarted
gem install rspec
```


## Create our new project: Binary Ipsum

First figure out where you want to store the files for this project.  For example,
I like to use the following directory structure:

```
/Users/jfhogarty/Documents/LEARNING_NOTES/
```

If you like that structure feel free to create a LEARNING_NOTES directory in your
home directory.  Next we will create a directory for our project.

*Note: If you are cloning the repo, you can skip the next step of creating the
       binary_ipsum directory in your ~/LEARNING_NOTES directory

```
cd ~
cd Documents/RoR/LEARNING_NOTES
mkdir binary_ipsum
cd binary_ipsum
```

Now we need to create our Gemfile and add a few bits to it:

```
touch Gemfile
vim Gemfile

# Add the following:

source 'https://rubygems.org'

gem 'rspec', '~> 3.4.0'
gem 'faker', '~> 1.6', '>= 1.6.2'
```

Now save and exit from the editting of your new Gemfile.  Next, we need to run
bundle to pull in our requirments of rspec and faker:

```
bundle install
```

You should have seen output similar to:

```
Fetching gem metadata from https://rubygems.org/...........
Fetching version metadata from https://rubygems.org/..
Resolving dependencies...
Using diff-lcs 1.2.5
Using i18n 0.7.0
Using rspec-support 3.4.1
Using bundler 1.11.2
Installing faker 1.6.6
Using rspec-core 3.4.4
Using rspec-expectations 3.4.0
Using rspec-mocks 3.4.1
Using rspec 3.4.0
Bundle complete! 2 Gemfile dependencies, 9 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

With RSpec successfully installed we need to run the following command to
initialize RSpec for our project:

```
rspec --init

Example:
➜  binary_ipsum rspec --init
  create   .rspec
  create   spec/spec_helper.rb
➜  binary_ipsum
```

You can confirm that RSpec is working by running:  rspec

```
Example:
➜  binary_ipsum rspec
No examples found.


Finished in 0.00027 seconds (files took 0.12265 seconds to load)
0 examples, 0 failures

➜  binary_ipsum
```

One thing I like to do when I am using RSpec is to add the following to my
.rspec file:

```
--color
--require spec_helper
--format documentation
```


## Write our first test

Now that we have our basic environment setup, we are ready to create our first
test.  We need to create a file for our test.  Before we do that, let's take a
quick look at our directory and file structure as it is right now:

```
➜  binary_ipsum tree
.
├── Gemfile
├── Gemfile.lock
├── README.md
└── spec
    └── spec_helper.rb

1 directory, 4 files
➜  binary_ipsum
```

We want to keep our files organized so we will create our test file in the 
spec/ directory:

```
touch spec/binary_ipsum_spec.rb

➜  binary_ipsum tree
.
├── Gemfile
├── Gemfile.lock
├── README.md
└── spec
    ├── binary_ipsum_spec.rb
    └── spec_helper.rb

1 directory, 5 files
➜  binary_ipsum
```


Let's get this party started - pull up the binary_ipsum_spec.rb file in your
favorite editor:

```
vim spec/binary_ipscum_spec.rb
```

And populate that file with the following:

```
require 'spec_helper'

RSpec.describe BinaryIpsum do
 
end
```

Ok excellent.  Let's practice some good workflow skills and initialze our project
as a git repo and commit what we have so far:

```
git init
git add .
git commit -m 'Initial Commit'
```


## Backstory

Before moving forward I'd like to take a few minutes to discuss a possible approach
to taking a Lorem Ipsum sentence and converting it to Binary.  Most of us humans
do not normally converse in binary.  What exactly is binary?  How does it relate
to the task at hand?

In the simpliest term, we visualize binary as either 0 or 1.  Let's look at word
that is more family to us silly humans:  Ruby

The word 'Ruby' is a collection/string of characters.  Those characters being:

  **R, u, b and y**

Behind the scenes, those letters have a decimal representation.  For example:
  R = 82
  u = 117 
  b = 98 
  y = 121


```
➜  ~ irb
2.2.3 :001 > example_word = "Ruby"
"Ruby"
2.2.3 :002 > example_word.chars.each do |ltr|
2.2.3 :003 >     puts ltr.ord
2.2.3 :004?>   end
82
117
98
121
[
    [0] "R",
    [1] "u",
    [2] "b",
    [3] "y"
]
2.2.3 :005 >
```

*Note:  I took a little short cut above.  The long form way would be:*

```
example_word = "Ruby"
example_as_array = example_word.chars

example_as_array.each do |ltr|
  puts ltr.ord
end

2.2.3 :005 > example_word
"Ruby"
2.2.3 :006 > example_word.chars
[
    [0] "R",
    [1] "u",
    [2] "b",
    [3] "y"
]
2.2.3 :007 >
```


Ok, a quick review.  Above we saw the following:
  R = 82
  u = 117 
  b = 98 
  y = 121

If we dig deeper, the number for each character is represented as binary to the
computer.  So how can we convert each number to its binary equivalent?

I'm going to show you a trick that I used when I had to deal with dotted-decimal
notation back in my Cisco (routers/switches) days.
(Resource: https://en.wikipedia.org/wiki/Dot-decimal_notation)

      128  64  32  16  |  8  4  2  1
0   =   0   0   0   0  |  0  0  0  0
255 =   1   1   1   1  |  1  1  1  1

The pipe charcter is not needed, it just helps me visualize the seperation of
the first four bits from the second four bits.

With the above example present, can anyone tell me which bits should be on (1)
and which should be off (0) in order to come up with the value of 82?

R = 82  =
u = 117 =
b = 98  =
y = 121 =

With the above information at hand, we can now return to writing our first test.
We will use the word 'Ruby', the character codes, and the calculated binary 
represenation to construct our test.


With your favorite editor, re-open the spec/binary_ipsum_spec.rb file if you do
not already have it open.  And let's update that file to have a test that takes
a string and returns the related character codes.

```
require 'spec_helper'

RSpec.describe BinaryIpsum do

  describe "string_to_char_code" do
    xit "returns the character code for a given character" do
      #...
    end
  end

end
```

Go ahead and run your test:  

```
➜  binary_ipsum rspec spec/
/Users/jfhogarty/Documents/RoR/LEARNING_NOTES/binary_ipsum/spec/binary_ipsum_spec.rb:3:in `<top (required)>': uninitialized constant BinaryIpsum (NameError)
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1361:in `load'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1361:in `block in load_spec_files'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1359:in `each'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1359:in `load_spec_files'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:106:in `setup'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:92:in `run'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:78:in `run'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:45:in `invoke'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/exe/rspec:4:in `<top (required)>'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/rspec:23:in `load'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/rspec:23:in `<main>'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/ruby_executable_hooks:15:in `eval'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/ruby_executable_hooks:15:in `<main>'
➜  binary_ipsum
```

Bummer, that is not cool.  We barely have anything defined in our test and already 
we have an issue.  If we scrub through the output, we can focus on this nugget:

uninitialized constant BinaryIpsum (NameError)

Anyone want to take a stab at what the issue is?



Exactly!  We need to create a class file for BinaryIpsum.

```
touch binary_ipsum.rb
vim binary_ipsum.rb

class BinaryIpsum
end
```

Try the test again:

```
➜  binary_ipsum rspec spec/
/Users/jfhogarty/Documents/RoR/LEARNING_NOTES/binary_ipsum/spec/binary_ipsum_spec.rb:3:in `<top (required)>': uninitialized constant BinaryIpsum (NameError)
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1361:in `load'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1361:in `block in load_spec_files'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1359:in `each'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/configuration.rb:1359:in `load_spec_files'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:106:in `setup'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:92:in `run'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:78:in `run'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/lib/rspec/core/runner.rb:45:in `invoke'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/rspec-core-3.4.4/exe/rspec:4:in `<top (required)>'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/rspec:23:in `load'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/rspec:23:in `<main>'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/ruby_executable_hooks:15:in `eval'
	from /Users/jfhogarty/.rvm/gems/ruby-2.2.3/bin/ruby_executable_hooks:15:in `<main>'
➜  binary_ipsum
```

WTF!  I created the file, argh!!!

Anyone out there who can offer me a life line?  What have I done wrong?  Or perhaps
I had forgotten something?


Ah thank you Odo, you are correct.  I forgot to update my test file:

```
# spec/binary_ipsum_spec.rb
require 'spec_helper'
require './binary_ipsum'

{--snip--}
``` 

Ok, try our tests yet again:

```
➜  binary_ipsum rspec spec/

BinaryIpsum
  string_to_char_code
    returns the character codes for a given string (PENDING: Temporarily skipped with xit)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) BinaryIpsum string_to_char_code returns the character codes for a given string
     # Temporarily skipped with xit
     # ./spec/binary_ipsum_spec.rb:6


Finished in 0.00055 seconds (files took 0.08729 seconds to load)
1 example, 0 failures, 1 pending

➜  binary_ipsum
```

AWESOME!  We have made some progress.

Ok, time to get serious.  Let's make our test actually test something:

```
# spec/binary_ipsum_spec.rb
{--snip--}

  describe "string_to_char_code" do
    it "returns the character code for a given character" do
      single_char = BinaryIpsum.new('R')
      char_code   = single_char.to_char_code
      expect(char_code).to eq 82
    end
  end

{--snip--}
```

Now run the test and let's see what happens:

```
BinaryIpsum
  string_to_char_code
    returns the character code for a given character (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_code returns the character code for a given character
     Failure/Error: single_char = BinaryIpsum.new('R')

     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./spec/binary_ipsum_spec.rb:7:in `initialize'
     # ./spec/binary_ipsum_spec.rb:7:in `new'
     # ./spec/binary_ipsum_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.0008 seconds (files took 0.08607 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:6 # BinaryIpsum string_to_char_code returns the character code for a given character

➜  binary_ipsum
```

Ok, a little more progress.  The above error should point us in the right direction.
We passed in 1 argument, but it was expecting 0.  We can fix this!  Go to your
binary_ipsum.rb file and make the following update:

```
  def initialize(lorem_string)
    @lorem_string = lorem_string
  end
```


Save the file and retry the test:


```
BinaryIpsum
  string_to_char_code
    returns the character code for a given character (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_code returns the character code for a given character
     Failure/Error: char_code   = single_char.to_char_code

     NoMethodError:
       undefined method `to_char_code' for #<BinaryIpsum:0x007fb1eb1ebde8 @lorem_string="R">
     # ./spec/binary_ipsum_spec.rb:9:in `block (3 levels) in <top (required)>'

Finished in 0.00058 seconds (files took 0.08835 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:7 # BinaryIpsum string_to_char_code returns the character code for a given character

➜  binary_ipsum git:(master) ✗
```

Cool, new error.  This is good as it means we are making progress.

Focus your attention to the error:

```
 NoMethodError:
   undefined method `to_char_code' for #<BinaryIpsum:0x007fb1eb1ebde8 @lorem_string="R">
```

Ok, so the error is telling us that the method 'to_char_code' is undefined. 
Let's go define it shall we?

Back in your binary_ipsum.rb file, we will make a small edit:

```
  def to_char_code
  end
```

Run the test - I hope you are starting to see a pattern here.  :)

```
BinaryIpsum
  string_to_char_code
    returns the character code for a given character (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_code returns the character code for a given character
     Failure/Error: expect(char_code).to eq 82

       expected: 82
            got: nil

       (compared using ==)
     # ./spec/binary_ipsum_spec.rb:10:in `block (3 levels) in <top (required)>'

Finished in 0.02696 seconds (files took 0.08173 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:7 # BinaryIpsum string_to_char_code returns the character code for a given character

➜  binary_ipsum git:(master) ✗
```

Excellent!  We are very close.  Now we just need to make the 'got' be the same
as the 'expected'.

What is the simplest thing we could do next to make this test pass?

Well, I suppose we could update the to_char_code method as follows:

```
  def to_char_code
    82
  end

```

But that probably is not the best approach.  Let's try a real fix with some code:

```
  def to_char_code
    @lorem_string.ord
  end
```







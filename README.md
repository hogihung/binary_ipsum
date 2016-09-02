# BINARY IPSUM


### REQUIRMENTS:

  1.  Ruby   2.3.0  (please have this version or greater already installed)
  2.  RSpec  3.4.0  (we will install during the workshop if you need it)
  3.  Faker  1.6    (we will install during the workshop if you need it)


*For fun, give an example of the RUBY I did while at AT&T:
~/Dropbox/Programming/krappy_code/ruby_packets-master/DI1412_packet.txt*


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


```
TIP:  To limit the output of grepping for rspec, try this:
      gem list | egrep '^rspec '

      ➜  binary_ipsum git:(master) ✗ gem list | egrep '^rspec '
      rspec (3.4.0, 3.2.0, 3.1.0, 2.99.0)
      ➜  binary_ipsum git:(master) ✗
```

If you do not have RSpec installed, you can either add it now, or grab it with
bundle install a bit later as it will be defined in our Gemfile.  To install now
you can run:

```
gem install rspec

# Resource:  https://relishapp.com/rspec/docs/gettingstarted
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
       binary_ipsum directory in your ~/LEARNING_NOTES directory*

```
cd ~
cd Documents/RoR/LEARNING_NOTES
mkdir binary_ipsum
cd binary_ipsum
```

Now we need to create our Gemfile and add a few bits to it:

```
bundle init 
vim Gemfile

# Add the following (after source 'https://rubygems.org'):
gem 'rspec', '~> 3.4.0'
gem 'faker', '~> 1.6', '>= 1.6.2'
```

*NOTE: If you received an error when running bundle init, you may need to install bundler.*

       Only perform the next step if you need to install bundler:

       gem install bundler


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

As a confirmation step, let's run the following:

```
bundle list
```

**Tip: Want to know where a specific gem was installed?  You can use bundler:**

       bundle show <gem-name-here>
       
       Example:
        ✗ bundle show pry
        /Users/jfhogarty/.rvm/gems/ruby-2.2.3/gems/pry-0.10.4
        ✗

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


Let's get this party started - pull up the binary\_ipsum\_spec.rb file in your
favorite editor:

```
vim spec/binary_ipsum_spec.rb
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
touch .gitignore
echo '**/.DS_Store' > .gitignore    # You should only need this step if you are on a Mac

git init
git add .
git commit -m 'Initial Commit'
```


## Backstory

Before moving forward I'd like to take a few minutes to discuss a possible approach
to taking a Lorem Ipsum sentence and converting it to Binary.  Most of us humans
do not normally converse in binary.  What exactly is binary?  How does it relate
to the task at hand?

In the simpliest term, we visualize binary as either 0 or 1.  Let's look at a word
that is more familiar to us silly humans:  Ruby

The word 'Ruby' is a collection/string of characters.  Those characters being:

  **R, u, b and y**

Behind the scenes, those letters have a decimal representation.  For example:

  - R = 82
  - u = 117 
  - b = 98 
  - y = 121


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
 :001 > example_word = "Ruby"
"Ruby"
 :002 > example_as_array = example_word.chars
[
    [0] "R",
    [1] "u",
    [2] "b",
    [3] "y"
]
 :003 > example_as_array.each do |ltr|
 :004 >     puts ltr.ord
 :005?>   end
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
 :006 > example_word
"Ruby"
 :007 > example_word.chars
[
    [0] "R",
    [1] "u",
    [2] "b",
    [3] "y"
]
 :008 >

```


Ok, a quick review.  Above we saw the following:

  - R = 82
  - u = 117 
  - b = 98 
  - y = 121

If we dig deeper, the number for each character is represented as binary to the
computer.  So how can we convert each number to its binary equivalent?

I'm going to show you a trick that I used when I had to deal with dotted-decimal
notation back in my Cisco (routers/switches) days.
(Resource: https://en.wikipedia.org/wiki/Dot-decimal_notation)

```
      128  64  32  16  |  8  4  2  1
0   =   0   0   0   0  |  0  0  0  0
255 =   1   1   1   1  |  1  1  1  1
```

The pipe charcter is not needed, it just helps me visualize the seperation of
the first four bits from the second four bits.

With the above example present, can anyone tell me which bits should be on (1)
and which should be off (0) in order to come up with the value of 82?

R = 82 
u = 117
b = 98 
y = 121

With the above information at hand, we can now return to writing our first test.
We will use the word 'Ruby', the character codes, and the calculated binary 
represenation to construct our test.


With your favorite editor, re-open the spec/binary\_ipsum\_spec.rb file if you do
not already have it open.  And let's update that file to have a test that takes
a string and returns the related character codes.

```
require 'spec_helper'

RSpec.describe BinaryIpsum do

  describe "string_to_char_codes" do
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

**uninitialized constant BinaryIpsum (NameError)**

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
  string_to_char_codes
    returns the character codes for a given string (PENDING: Temporarily skipped with xit)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) BinaryIpsum string_to_char_codes returns the character codes for a given string
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

  describe "string_to_char_codes" do
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
  string_to_char_codes
    returns the character code for a given character (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_codes returns the character code for a given character
     Failure/Error: single_char = BinaryIpsum.new('R')

     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./spec/binary_ipsum_spec.rb:7:in `initialize'
     # ./spec/binary_ipsum_spec.rb:7:in `new'
     # ./spec/binary_ipsum_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.0008 seconds (files took 0.08607 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:6 # BinaryIpsum string_to_char_codes returns the character code for a given character

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
  string_to_char_codes
    returns the character code for a given character (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_codes returns the character code for a given character
     Failure/Error: char_code   = single_char.to_char_code

     NoMethodError:
       undefined method `to_char_code' for #<BinaryIpsum:0x007fb1eb1ebde8 @lorem_string="R">
     # ./spec/binary_ipsum_spec.rb:9:in `block (3 levels) in <top (required)>'

Finished in 0.00058 seconds (files took 0.08835 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:7 # BinaryIpsum string_to_char_codes returns the character code for a given character

➜  binary_ipsum git:(master) ✗
```

Cool, new error.  This is good as it means we are making progress.

Focus your attention to the error:

```
 NoMethodError:
   undefined method `to_char_code' for #<BinaryIpsum:0x007fb1eb1ebde8 @lorem_string="R">
```

Ok, so the error is telling us that the method 'to\_char\_code' is undefined. 
Let's go define it shall we?

Back in your binary_ipsum.rb file, we will make a small edit:

```
  def to_char_code
  end
```

Run the test - I hope you are starting to see a pattern here.  :)

```
BinaryIpsum
  string_to_char_codes
    returns the character code for a given character (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_codes returns the character code for a given character
     Failure/Error: expect(char_code).to eq 82

       expected: 82
            got: nil

       (compared using ==)
     # ./spec/binary_ipsum_spec.rb:10:in `block (3 levels) in <top (required)>'

Finished in 0.02696 seconds (files took 0.08173 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:7 # BinaryIpsum string_to_char_codes returns the character code for a given character

➜  binary_ipsum git:(master) ✗
```

Excellent!  We are very close.  Now we just need to make the 'got' be the same
as the 'expected'.

What is the simplest thing we could do next to make this test pass?

Well, I suppose we could update the to\_char\_code method as follows:

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

Since we have our test passing now, let's go ahead and do another commit:

```
git status
git add .
git commit -m 'First test is passing'
```


Time for another test.  We have done good so far by converting a single character
to the appropriate character code.  But we need to take it a step further.  We
need to take a whole word, for example 'Ruby', and convert it to an array of 
character codes.

For example, Ruby should equal [82, 117, 98, 121].  Let's go update our test.
Pop on over to the spec file, spec/binary\_ipsum\_spec.rb.  Now, we will add a
new test:

```
require 'spec_helper'
require './binary_ipsum'

RSpec.describe BinaryIpsum do

  describe "string_to_char_codes" do
    it "returns the character code for a given character" do
      single_char = BinaryIpsum.new('R')
      char_code   = single_char.to_char_code
      expect(char_code).to eq 82
    end

    it "returns an array of character codes for the word Ruby" do
      string_ruby = BinaryIpsum.new('Ruby')
      expect(string_ruby.to_char_codes).to eq [82, 117, 98, 121]
    end
  end

end
```

Save your changes and, yes, run the test again.

```
BinaryIpsum
  string_to_char_codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_codes returns an array of character codes for the word Ruby
     Failure/Error: expect(string_ruby.to_char_codes).to eq [82, 117, 98, 121]

     NoMethodError:
       undefined method `to_char_codes' for #<BinaryIpsum:0x007fa7cca5f868 @lorem_string="Ruby">
     # ./spec/binary_ipsum_spec.rb:15:in `block (3 levels) in <top (required)>'

Finished in 0.00111 seconds (files took 0.08997 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:13 # BinaryIpsum string_to_char_codes returns an array of character codes for the word Ruby

➜  binary_ipsum git:(master) ✗
```

Hmmm, another undefined method.  Ok, let's fix this!  Go back to, or re-open
your binary_ipsum.rb file.  We will add a new method:

```
  def to_char_codes
  end
```

Re-running our tests, we see that we made it one step further:

```
BinaryIpsum
  string_to_char_codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby (FAILED - 1)

Failures:

  1) BinaryIpsum string_to_char_codes returns an array of character codes for the word Ruby
     Failure/Error: expect(string_ruby.to_char_codes).to eq [82, 117, 98, 121]

       expected: [82, 117, 98, 121]
            got: nil

       (compared using ==)
     # ./spec/binary_ipsum_spec.rb:15:in `block (3 levels) in <top (required)>'

Finished in 0.02225 seconds (files took 0.08936 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:13 # BinaryIpsum string_to_char_codes returns an array of character codes for the word Ruby

➜  binary_ipsum git:(master) ✗
```

Ok, shall we see if we can get this test to pass?  Try it on your own for a
minute.  We will take a look together shortly.

```
  def to_char_codes
    result = []
    @lorem_string.chars.each do |ltr|
      result << ltr.ord
    end
    result
  end
```

Run the tests and what shall we see?

```
BinaryIpsum
  string_to_char_codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby

Finished in 0.00098 seconds (files took 0.08197 seconds to load)
2 examples, 0 failures

➜  binary_ipsum git:(master) ✗
```

SWEET!  Both tests are green.  Do you know what time it is?  No, not literally.
We have gone from Red to Green.  Now it is time to refactor!

The first thing I think we should try is to tighten up our code that we just
created in the to\_char\_codes method.  The nice thing about having our tests
green at the moment is that we can feel confident about trying out changes to
our code.  Try to improve things.  


```
  def to_char_codes
    @lorem_string.chars.map { |ltr| ltr.ord }
  end
```

With the new code in place, re-run our tests:

```
BinaryIpsum
  string_to_char_codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby

Finished in 0.00119 seconds (files took 0.08715 seconds to load)
2 examples, 0 failures

➜  binary_ipsum git:(master) ✗
```

NICE!  Still green.


Before we commit our changes, I'd like to do a little more clean up.  Do we 
really need two methods here?  I think we can get by with just one.  But we
will need to make a small modification to both our class and our test files.


Below is a quick review of what both our test and class file should look like
now that we have made a few modifications:

```
# spec/binary_ipsum_spec.rb

require 'spec_helper'
require './binary_ipsum'

RSpec.describe BinaryIpsum do

  describe "string_to_char_codes" do
    it "returns the character code for a given character" do
      single_char = BinaryIpsum.new('R')
      char_code   = single_char.to_char_codes
      expect(char_code).to eq [82]
    end

    it "returns an array of character codes for the word Ruby" do
      string_ruby = BinaryIpsum.new('Ruby')
      expect(string_ruby.to_char_codes).to eq [82, 117, 98, 121]
    end
  end

end
```


```
# binary_ipsum.rb

class BinaryIpsum

  def initialize(lorem_string)
    @lorem_string = lorem_string
  end

  def to_char_codes
    @lorem_string.chars.map { |ltr| ltr.ord }
  end

end
```


Now would be a great time to commit our changes:

```
git status
git add .
git commit -m 'Tests passing, code refactored.  New method to_char_codes completed.'
```


## Converting a character code to binary

So far we have seen how to convert a single character, or a word, to an array of
character codes.  For example, we took the word 'Ruby' and converted it to the
array [82, 117, 98, 121].  So the next problem to solve is how do we go from a
normal number to binary?  Let's review what we covered earlier:

```
      128  64  32  16  |  8  4  2  1
0   =   0   0   0   0  |  0  0  0  0
255 =   1   1   1   1  |  1  1  1  1
```

With our little guide above, let's manually convert 'Ruby' to binary.

  - R = 82  =  01010010
  - u = 117 =  01110101
  - b = 98  =  01100010
  - y = 121 =  01111001

Very good!  Now it is time for that next test - to the Bat Mobile!

Let's add a new test.  Below is the rough and dirty of it:

```
  describe "converts a string to binary" do
    xit "returns binary representation for a submitted string" do
  end
```


When we run our test now, we should see the following:

```
BinaryIpsum
  string convert to character codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby
  converts a string to binary
    returns binary representation for a submitted string (PENDING: Temporarily skipped with xit)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) BinaryIpsum converts a string to binary returns binary representation for a submitted string
     # Temporarily skipped with xit
     # ./spec/binary_ipsum_spec.rb:20


Finished in 0.00153 seconds (files took 0.1465 seconds to load)
3 examples, 0 failures, 1 pending

➜  binary_ipsum git:(master) ✗

```


Let's try a real test.  Update your spec/binary\_ipsum\_spec.rb file with:

```
  describe "converts a string to binary" do
    it "returns binary representation for a submitted string" do
      string_ruby = BinaryIpsum.new('Ruby')
      expect(string_ruby.to_binary).to eq "01010010 01110101 01100010 01111001"
    end
  end
```

And yes, run the tests again:

```
BinaryIpsum
  string convert to character codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby
  converts a string to binary
    returns binary representation for a submitted string (FAILED - 1)

Failures:

  1) BinaryIpsum converts a string to binary returns binary representation for a submitted string
     Failure/Error: expect(string_ruby.to_binary).to eq "01010010 01110101 01100010 01111001"

     NoMethodError:
       undefined method `to_binary' for #<BinaryIpsum:0x007fc335899568 @lorem_string="Ruby">
     # ./spec/binary_ipsum_spec.rb:22:in `block (3 levels) in <top (required)>'

Finished in 0.00147 seconds (files took 0.0851 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:20 # BinaryIpsum converts a string to binary returns binary representation for a submitted string

➜  binary_ipsum git:(master) ✗
```


I'm going to go visit the rest room, see if you can figure this one out on your
own.  I'll be back soon.



Figure it out?  First we need to add the missing/undefined method:

```
  def to_binary
    #...
  end
```


Run the tests again:

```
BinaryIpsum
  string convert to character codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby
  converts a string to binary
    returns binary representation for a submitted string (FAILED - 1)

Failures:

  1) BinaryIpsum converts a string to binary returns binary representation for a submitted string
     Failure/Error: expect(string_ruby.to_binary).to eq "01010010 01110101 01100010 01111001"

       expected: "01010010 01110101 01100010 01111001"
            got: nil

       (compared using ==)
     # ./spec/binary_ipsum_spec.rb:22:in `block (3 levels) in <top (required)>'

Finished in 0.02518 seconds (files took 0.08199 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:20 # BinaryIpsum converts a string to binary returns binary representation for a submitted string

➜  binary_ipsum git:(master) ✗
```


New error == progress.  Time to make this puppy pass!


I think now would be a great time to bring in a nice tool from our toolbox - pry.

Update the Gemfile with the following:

```
gem 'pry'
```

Save the Gemfile and run bundle:

```
bundle install
```

Now, back in our class file, binary\_ipsum.rb, in the to\_binary method, add:

```
require 'pry'; binding.pry
```

Save the file and run the test suite.



----
***REVISIT THIS PART REGARDING PRY***
----


Ok, let's take a crack at solving this bit of code:

```
  def to_binary
    character_codes = @lorem_string.chars.map { |ltr| ltr.ord }

    result = []
    character_codes.each do |char_code|
      result << char_code.to_s(2)
    end
    result.join(' ')
  end
```


Run the tests to see if we hit our mark:

```
BinaryIpsum
  string convert to character codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby
  converts a string to binary
    returns binary representation for a submitted string (FAILED - 1)

Failures:

  1) BinaryIpsum converts a string to binary returns binary representation for a submitted string
     Failure/Error: expect(string_ruby.to_binary).to eq "01010010 01110101 01100010 01111001"

       expected: "01010010 01110101 01100010 01111001"
            got: "1010010 1110101 1100010 1111001"

       (compared using ==)
     # ./spec/binary_ipsum_spec.rb:22:in `block (3 levels) in <top (required)>'

Finished in 0.01783 seconds (files took 0.1597 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:20 # BinaryIpsum converts a string to binary returns binary representation for a submitted string

➜  binary_ipsum git:(master) ✗
```



Not there yet, but very close.  Do you see/understand what the problem is? Correct,
our binary's that normaly start with a zero are truncated.

Let's take another crack at it:


```
  def to_binary
    character_codes = @lorem_string.chars.map { |ltr| ltr.ord }

    result = []
    character_codes.each do |char_code|
      result << zero_pad(char_code.to_s(2))   <-- NOTE the change here ***
    end
    result.join(' ')
  end


  def zero_pad(binary_value)
    return "0" + binary_value if binary_value.length < 8
    binary_value
  end
```


AWESOME, are tests are now green again!

```
BinaryIpsum
  string convert to character codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby
  converts a string to binary
    returns binary representation for a submitted string

Finished in 0.00116 seconds (files took 0.08882 seconds to load)
3 examples, 0 failures

➜  binary_ipsum git:(master) ✗
```

What did you say?  Oh yeah, definetly an opportunity to see about refactoring:


```
  def to_binary
    result = []
    self.to_char_codes.each do |char_code|
      result << zero_pad(char_code.to_s(2))
    end
    result.join(' ')
  end
```


I'd like to try one more thing.  See if we can shrink this method down just
a tad more:

```
  def to_binary
    binary_sentence = self.to_char_codes.map { |int| int.to_s(2) }
    binary_sentence = binary_sentence.map { |binary_word| zero_pad(binary_word) }
    binary_sentence.join(' ')
  end
```

I know, not a HUGE difference, but it is a reduction.  The question I want to 
leave you with is: which version of this method is more readable for you?


There is one last change that I would like to make before we move on.  I'm not
a fan of using the instance variable @lorem\_string in the to\_char\_codes method.
How can we fix this?

```
  attr_reader :lorem_string

  -AND-
  
  def to_char_codes
    lorem_string.chars.map { |ltr| ltr.ord }
  end
```


# Pulling it all together, bring in Lorem Ipsum


Now we will we test a more complicated example - an actual Lorem Ipsum based
sentence.  Update your binary\_ipsum\_spec.rb file with this new test:

```
  describe "converts a string of Lorem Ipsum to binary" do
    it "returns binary representation for a lorem ipsum string" do
      lorem_string = BinaryIpsum.new("Sapiente consequatur aperiam eius.")
      expect(lorem_string.to_binary).to eq "xxxxxxxx"  # Note this is fake for now
    end
  end
```

In the interest of saving time, run the test and I want you to focus on this
value in the output:  0100000


```
➜  binary_ipsum git:(master) ✗ clear; rspec spec/binary_ipsum_spec.rb:28
Run options: include {:locations=>{"./spec/binary_ipsum_spec.rb"=>[28]}}

BinaryIpsum
  converts a string of Lorem Ipsum to binary
    returns binary representation for a lorem ipsum string (FAILED - 1)

Failures:

  1) BinaryIpsum converts a string of Lorem Ipsum to binary returns binary representation for a lorem ipsum string
     Failure/Error: expect(lorem_string.to_binary).to eq "xxxxxxxx"  # Note this is fake for now

       expected: "xxxxxxxx"
            got: "01010011 01100001 01110000 01101001 01100101 01101110 01110100 01100101 0100000 01100011 01101111 01101110 01110011 01100101 01110001 01110101 01100001 01110100 01110101 01110010 0100000 01100001 01110000 01100101 01110010 01101001 01100001 01101101 0100000 01100101 01101001 01110101 01110011 0101110"

       (compared using ==)
     # ./spec/binary_ipsum_spec.rb:30:in `block (3 levels) in <top (required)>'

Finished in 0.01908 seconds (files took 0.2207 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/binary_ipsum_spec.rb:28 # BinaryIpsum converts a string of Lorem Ipsum to binary returns binary representation for a lorem ipsum string

➜  binary_ipsum git:(master) ✗
```


If I am correct, that value will show up three times. Anyone know what a binary
value of 01000000 represents?

That binary value is the character code for a space.  What is the decimal equivalent?


Yes, it is:  32

[Resource: https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=ascii+code+for+space]


Feel free to verify the values for the 'got' part of the test.  I'm confident
that they are correct so I'm going to update my test to use that data in the 
interest of saving some time.

```
  describe "converts a string of Lorem Ipsum to binary" do
    it "returns binary representation for a lorem ipsum string" do
      lorem_string = BinaryIpsum.new("Sapiente consequatur aperiam eius.")
      expect(lorem_string.to_binary).to eq "01010011 01100001 01110000 01101001 01100101 01101110 01110100 01100101 0100000 01100011 01101111 01101110 01110011 01100101 01110001 01110101 01100001 01110100 01110101 01110010 0100000 01100001 01110000 01100101 01110010 01101001 01100001 01101101 0100000 01100101 01101001 01110101 01110011 0101110"
    end
  end
```

Run the tests again:

```
BinaryIpsum
  string convert to character codes
    returns the character code for a given character
    returns an array of character codes for the word Ruby
  converts a string to binary
    returns binary representation for a submitted string
  converts a string of Lorem Ipsum to binary
    returns binary representation for a lorem ipsum string

Finished in 0.00164 seconds (files took 0.13018 seconds to load)
4 examples, 0 failures

➜  binary_ipsum git:(master) ✗
```


Things are looking good.  The last thing that I would like for this application
to do is allow the user to request a random Lorem sentence so that it will be
converted to Binary.

For example, right now our initialize our object using:
my_string = BinaryIpsum.new("Ruby")

But I would like to add some flexibility so that we can do the following:

```
random_string = BinaryIpsum.new(random: true, sentences: 5)
```


For the sake of saving some time, I'm going to craft the following tests quickly:

```
  describe "allows user to create a random lorem ipsum sentence and convert to binary" do
    xit "returns the binary representation of a random lorem ipsum string when using random true attribute" do
      lorem_string = BinaryIpsum.new(random: true)
    end

    xit "returns the binary representation of a random lorem ipsum string when using random true attribute and specifying number of sentences" do
      lorem_string = BinaryIpsum.new(random: true, sentences: 5)
    end

    xit "returns the binary representation of the string Ruby if no parameters are passed " do
      lorem_string = BinaryIpsum.new()
    end
  end
```

As you can see, I have the 'x' prepended to each 'it' line.  I've roughed out what
I think will be good tests to cover our requirement of being able to do:

```
random_string = BinaryIpsum.new(random: true, sentences: 5)
```


Ok, let's start with the easy one.  We have already tested what the output 
should look like for 'Ruby' so update the third 'xit' test as follows:

```
 it "returns the binary representation of the string Ruby if no parameters are passed " do
   lorem_string = BinaryIpsum.new()
   expect(lorem_string.to_binary).to eq "01010010 01110101 01100010 01111001"
 end
```

You know the drill by now, run the test. 

```
bundle exec rspec spec/binary_ipsum_spec.rb:34
```

Unless you jumped ahead, you should be staring at a failure:

```
Failures:

  1) BinaryIpsum allows user to create a random lorem ipsum sentence and convert to binary returns the binary representation of the string Ruby if no parameters are passed
     Failure/Error: lorem_string = BinaryIpsum.new()

     ArgumentError:
       wrong number of arguments (0 for 1)
     # ./binary_ipsum.rb:6:in `initialize'
     # ./spec/binary_ipsum_spec.rb:46:in `new'
     # ./spec/binary_ipsum_spec.rb:46:in `block (3 levels) in <top (required)>'

Finished in 0.00077 seconds (files took 0.12384 seconds to load)
3 examples, 1 failure, 2 pending
```

*NOTE:  I grabbed only the Failure part of the output in this example to save some space.*


To make this test pass, we need to make some changes in our class file.  From the
error message, do you see where we could make the needed change?

Exactly!  In the initialize method.


But before we jump into editting the binary_ipsum.rb file, I want to take a quick
detour and check something out in irb.

```
➜  binary_ipsum git:(master) ✗ irb
 :001 > require 'faker'
true
 :002 > Faker::Lorem.sentences(4).join(' ')
"Quia architecto incidunt reprehenderit. Eos similique amet praesentium odit distinctio pariatur iste. Aut magni quia. Sunt et nesciunt molestiae aut commodi."
 :003 > exit
➜  binary_ipsum git:(master) ✗
```


Ok, now you can go edit the initialize method in the binary_ipsum.rb file:

```
  def initialize(string: 'Ruby', random: false, sentences: 5)
    return @lorem_string = Faker::Lorem.sentences(sentences).join(' ') if random
    @lorem_string = string
  end
```

I know you are itching to do it - go ahead, re-run the tests:


```
bundle exec rspec spec/binary_ipsum_spec.rb:34

➜  binary_ipsum git:(master) ✗ bundle exec rspec spec/binary_ipsum_spec.rb:34
Run options: include {:locations=>{"./spec/binary_ipsum_spec.rb"=>[34]}}

BinaryIpsum
  allows user to create a random lorem ipsum sentence and convert to binary
    returns the binary representation of a random lorem ipsum string when using random true attribute (PENDING: Temporarily skipped with xit)
    returns the binary representation of a random lorem ipsum string when using random true attribute and specifying number of sentences (PENDING: Temporarily skipped with xit)
    returns the binary representation of the string Ruby if no parameters are passed

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) BinaryIpsum allows user to create a random lorem ipsum sentence and convert to binary returns the binary representation of a random lorem ipsum string when using random true attribute
     # Temporarily skipped with xit
     # ./spec/binary_ipsum_spec.rb:35

  2) BinaryIpsum allows user to create a random lorem ipsum sentence and convert to binary returns the binary representation of a random lorem ipsum string when using random true attribute and specifying number of sentences
     # Temporarily skipped with xit
     # ./spec/binary_ipsum_spec.rb:40


Finished in 0.00126 seconds (files took 0.12035 seconds to load)
3 examples, 0 failures, 2 pending

➜  binary_ipsum git:(master) ✗
```

Nicely done!  Now all we need to do is tackle those last two tests.  Update your 
spec file with the following changes:

```
  describe "allows user to create a random lorem ipsum sentence and convert to binary" do
    it "returns the binary representation of a random lorem ipsum string when using random true attribute" do
      lorem_string = BinaryIpsum.new(random: true)
      expect(lorem_string.to_binary).to include("0100000") 
    end

    it "returns the binary representation of a random lorem ipsum string when using random true attribute and specifying number of sentences" do
      lorem_string = BinaryIpsum.new(random: true, sentences: 5)
      expect(lorem_string.to_binary).to include("0100000")  
    end

 end

```

NOTE:  You may recall what 01000000 represents - a space.  Because we are generating
       random sentence(s) it is a bit difficult to predict what the output will be.
       But we do know that there will be spaces between words so we will hone in
       on that information to help us out for now.

       I would like to have a better test for the above two items, but at this
       time, I am not sure how to do something better.  Any suggestions?


Save your changes, and run the tests:

```
➜  binary_ipsum git:(master) ✗ bundle exec rspec spec/binary_ipsum_spec.rb:34
Run options: include {:locations=>{"./spec/binary_ipsum_spec.rb"=>[34]}}

BinaryIpsum
  allows user to create a random lorem ipsum sentence and convert to binary
    returns the binary representation of a random lorem ipsum string when using random true attribute
    returns the binary representation of a random lorem ipsum string when using random true attribute and specifying number of sentences
    returns the binary representation of the string Ruby if no parameters are passed

Finished in 0.43669 seconds (files took 0.12584 seconds to load)
3 examples, 0 failures

➜  binary_ipsum git:(master) ✗
```

**NICE!**



Now while we tackled this problem in a nice programatic manner, there is, of course,
another way. 

As a quick test, fire up irb and try out the following:

```
"Ruby".unpack("C*")
2.2.3 :003 > "Ruby".unpack("C*")
[
    [0] 82,
    [1] 117,
    [2] 98,
    [3] 121
]
2.2.3 :004 >


"R".unpack("B*")
2.2.3 :002 > "R".unpack("B*")
[
    [0] "01010010"
]
2.2.3 :003 >


"Ruby".unpack("B*")
2.2.3 :001 > "Ruby".unpack("B*")
[
    [0] "01010010011101010110001001111001"
]
2.2.3 :002 >
```

Resource:  http://blog.anidear.com/2011/11/convert-string-to-binary-in-ruby.html


# What's Next?

Here is my challenge to you.  There are two things that I noticed while we were
working on our BinaryIpsum solution.

  -  1.  Convert the binary for a 'space' to a colon (:) or something similar
  -  2.  Make a command line tool based off of our solution, with text based help (--h)



# MISC
  -  Twitter/GitHub:  HoGiHung
  -  Blog:            http://ognt.io  -OR- http://oldguynewtrick.com/
  -  Asciinema:       https://asciinema.org


# EXTRA - A Example Via Irb

```
➜  binary_ipsum git:(master) ✗ irb
 :001 > require './binary_ipsum'
true
 :002 > three_sent = BinaryIpsum.new(random: true, sentences: 3)
#<BinaryIpsum:0x007fb1918c1c30 @lorem_string="Architecto pariatur accusamus rem. Hic eum autem corporis assumenda corrupti inventore placeat. Commodi nostrum est ipsa suscipit dolores earum nobis.">
 :003 > four_sent = BinaryIpsum.new(random: true, sentences: 4)
#<BinaryIpsum:0x007fb192288f48 @lorem_string="Odio perspiciatis molestiae. Natus repellendus corporis. Quia commodi quos quia excepturi rerum in. Eum quisquam modi quae neque consequuntur cumque.">
 :004 >
 :005 >
 :006 >   three_sent.to_binary
"01000001 01110010 01100011 01101000 01101001 01110100 01100101 01100011 01110100 01101111 0100000 01110000 01100001 01110010 01101001 01100001 01110100 01110101 01110010 0100000 01100001 01100011 01100011 01110101 01110011 01100001 01101101 01110101 01110011 0100000 01110010 01100101 01101101 0101110 0100000 01001000 01101001 01100011 0100000 01100101 01110101 01101101 0100000 01100001 01110101 01110100 01100101 01101101 0100000 01100011 01101111 01110010 01110000 01101111 01110010 01101001 01110011 0100000 01100001 01110011 01110011 01110101 01101101 01100101 01101110 01100100 01100001 0100000 01100011 01101111 01110010 01110010 01110101 01110000 01110100 01101001 0100000 01101001 01101110 01110110 01100101 01101110 01110100 01101111 01110010 01100101 0100000 01110000 01101100 01100001 01100011 01100101 01100001 01110100 0101110 0100000 01000011 01101111 01101101 01101101 01101111 01100100 01101001 0100000 01101110 01101111 01110011 01110100 01110010 01110101 01101101 0100000 01100101 01110011 01110100 0100000 01101001 01110000 01110011 01100001 0100000 01110011 01110101 01110011 01100011 01101001 01110000 01101001 01110100 0100000 01100100 01101111 01101100 01101111 01110010 01100101 01110011 0100000 01100101 01100001 01110010 01110101 01101101 0100000 01101110 01101111 01100010 01101001 01110011 0101110"
 :007 >
 :008 >
 :009 >   four_sent.to_binary
"01001111 01100100 01101001 01101111 0100000 01110000 01100101 01110010 01110011 01110000 01101001 01100011 01101001 01100001 01110100 01101001 01110011 0100000 01101101 01101111 01101100 01100101 01110011 01110100 01101001 01100001 01100101 0101110 0100000 01001110 01100001 01110100 01110101 01110011 0100000 01110010 01100101 01110000 01100101 01101100 01101100 01100101 01101110 01100100 01110101 01110011 0100000 01100011 01101111 01110010 01110000 01101111 01110010 01101001 01110011 0101110 0100000 01010001 01110101 01101001 01100001 0100000 01100011 01101111 01101101 01101101 01101111 01100100 01101001 0100000 01110001 01110101 01101111 01110011 0100000 01110001 01110101 01101001 01100001 0100000 01100101 01111000 01100011 01100101 01110000 01110100 01110101 01110010 01101001 0100000 01110010 01100101 01110010 01110101 01101101 0100000 01101001 01101110 0101110 0100000 01000101 01110101 01101101 0100000 01110001 01110101 01101001 01110011 01110001 01110101 01100001 01101101 0100000 01101101 01101111 01100100 01101001 0100000 01110001 01110101 01100001 01100101 0100000 01101110 01100101 01110001 01110101 01100101 0100000 01100011 01101111 01101110 01110011 01100101 01110001 01110101 01110101 01101110 01110100 01110101 01110010 0100000 01100011 01110101 01101101 01110001 01110101 01100101 0101110"
 :010 > exit
➜  binary_ipsum git:(master) ✗
```

**THE END**

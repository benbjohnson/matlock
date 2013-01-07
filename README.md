Matlock
=======

## Overview

Matlock is a simple name extraction utility.
It's useful for pulling out all the full names from a string.
For example, pass in the HTML for a web page and it will return an array of full names mentioned.

It's premise is pretty simple and it is geared toward names in the United States.
Matlock extracts all bigrams (first name, surname) from the string where either the first name or surname is in the US Census list of common names.
The US Census data has been cleaned so that common words and US cities and states have been removed.
You can see the full list of name data in the `lib/matlock/data` directory.


## Getting Started

To use Matlock, simply install the gem:

```bash
$ gem install matlock
```

Then in your script simply require the gem and extract names from a string:

```ruby
require "matlock"
require 'open-uri'

html = open("http://cnn.com").read

matlock = Matlock.new()
names = matlock.extract_names(html)

#=> ["Lance Armstrong", "Anderson Cooper", ...]
```

Matlock will get some false positives and some true negatives.
It's not meant to be an "end all, be all" name extraction tool.
It's mainly meant to be quick and dirty but that's effective for many use cases.
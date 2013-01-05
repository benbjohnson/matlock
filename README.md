Matlock
=======

## Overview

Matlock is an intelligent web scraper.
It's useful for pulling specific types of information such as contact info from a list of web sites.


## Getting Started

To use Matlock, simply install the gem:

```bash
$ gem install matlock
```

Then in your script simply require the gem and add a list of web sites:

```ruby
require "matlock"
matlock = Matlock.new()
matlock.url = "http://www.foo.com/people.html"
contacts = matlock.extract_contacts()
```
# Estreet

[![Gem Version](https://badge.fury.io/rb/estreet.svg)](http://badge.fury.io/rb/estreet)

Create simple estree-type abstract syntax trees (ASTs) from Ruby. You could use it in the code generation part of a Ruby-based transpiler, if you're so inclined. See [the estree specs](https://github.com/estree/estree/blob/master/spec.md) for information on the different node types.

## Limitations

This gem was created to support a project I'm working on, so it's missing many features that I didn't personally need. For example, it:

* only intends to support ES5 for now
* only creates trees for output, doesn't parse them or anything
* is a very early release -- API is subject to change!
* has no tests to speak of and not much documentation

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'estreet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install estreet

## Usage

```ruby
include Estreet
to_log = [1, 2, 3, "and to the", 4]

# Retrieve the "log" property of the "console" object
console_log = MemberExpression.new(Identifier['console'], Identifier['log'], false)

# Call console.log with a series of literals
log_message = CallExpression.new(console_log, to_log.map do |l|
  Literal.from_ruby(l)
end)

# Wrap it in a program and get the JSON version
Program.new(log_message).as_json
```

This will produce the following nested Ruby hash, which can be translated directly to JSON:

```ruby
{:type=>"Program",
 :body=>
  [{:type=>"ExpressionStatement",
    :expression=>
     {:type=>"CallExpression",
      :callee=>
       {:type=>"MemberExpression",
        :object=>{:type=>"Identifier", :name=>"console"},
        :property=>{:type=>"Identifier", :name=>"log"},
        :computed=>false},
      :arguments=>
       [{:type=>"Literal", :value=>1},
        {:type=>"Literal", :value=>2},
        {:type=>"Literal", :value=>3},
        {:type=>"Literal", :value=>"and to the"},
    {:type=>"Literal", :value=>4}]}}]}
```

This is equivalent to the following real actual JavaScript:

```javascript
console.log(1, 2, 3, 'and to the', 4);
```

### Shortcuts

Generally you won't be building these ASTs by hand, but all the same there are a few shortcuts to make things a bit more Rubular. This code produces the same AST as above:

```ruby
to_log = [1, 2, 3, "and to the", 4]

Program.new(
  Identifier['console'].property('log')
    .call(*to_log.map {|l| Literal[l] })
).as_json
```

### Okay, I've got my AST. Now what?

Well, you could export it as JSON and then use [escodegen](http://github.com/estools/escodegen) to turn it into real JavaScript code. Before you could do that, you could also run the JSON through [esmangle](http://github.com/estools/esmangle) to make your AST more good.

If you want to get fancier still, you could avoid leaving Ruby entirely by using [therubyracer](http://github.com/cowboyd/therubyracer) to run escodegen (packaging up the estools is left as an exercise for the reader -- I used browserify):

```ruby
cxt.load("estools.js")

escodegen = cxt[:escodegen]
cxt[:ast] = ast.as_json

begin
  escodegen[:generate].call(cxt[:ast], generate_opts)
rescue V8::Error => e
  # in case there's a bug in Estreet and the AST wasn't valid
  $stderr.puts e.message.red
  $stderr.puts e.backtrace.join("\n").yellow
  raise e
end
```

## Credits

&copy; 2015 Alex Michaud / Bucket O' Software

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contributing

I can't promise quick turnaround on pull requests, but feel free to contribute!

1. Fork it ( https://github.com/BucketOSoftware/estreet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

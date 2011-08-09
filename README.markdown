Gives the more-readable `foo.in?(some_list)` and `foo.not_in?(some_list)`
rather than having to revert to the more backward `some_list.include?(foo)` and
`!some_list.include?(foo)`. This leads to more-readable conditions, like: `if
foo.is_awesome? and foo.in?(allowed_values)`.

## Examples

    "abc".in?("abcdef")         # true
    "abc".not_in?("abcdef")     # false
    "ABC".in?("abcdef")         # false
    "ABC".not_in?("abcdef")     # true
    "a".in(%w(a b c d e))       # true
    "a".not_in(%w(a b c d e))   # false
    1.in?(0..10)                # true
    1.not_in?(0..10)            # false
    1.in?(10..20)               # false
    1.not_in?(10..20)           # true
    1.in?(10)                   # nil, as 10 doesn't respond to :include?
    1.not_in?(10)               # nil, as 10 doesn't respond to :include?

## Install

    # From the command line
    gem install object-in-enumerable

    # In your Gemfile
    gem "object-in-enumerable"

    # In your Rails 2 project's environment.rb
    config.gem "object-in-enumerable"


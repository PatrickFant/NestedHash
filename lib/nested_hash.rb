require 'forwardable'

# Public: A class useful for constructing hash tables of arbitrary dimension.
#
# Examples
#
#   example_hash = NestedHash.new
#   example_hash[:foo][:bar] = 'foobar'
#   p example_hash[:foo][:bar]
#   # => "foobar"
class NestedHash
  extend Forwardable
  include Enumerable
  
  def_delegators :@outer, :[], :[]=, :keys, :values, :each
  
  # Public: Initialize a NestedHash.
  def initialize
    @outer = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
  end
end

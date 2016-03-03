require 'forwardable'

class NestedHash
  extend Forwardable
  include Enumerable
  
  def_delegators :@outer, :[], :[]=, :keys, :values, :each
  
  def initialize
    @outer = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
  end
end

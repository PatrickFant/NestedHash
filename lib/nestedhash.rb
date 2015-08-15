class NestedHash
  include Enumerable

  def initialize
    @outer = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
  end
  
  def keys
    @outer.keys
  end
  
  def values
    @outer.values
  end
  
  def [](key)
    @outer[key]
  end
  
  def []=(key, value)
    @outer[key] = value
  end
  
  def each
    @outer.each { |key, value| yield(key, value) }
  end
end

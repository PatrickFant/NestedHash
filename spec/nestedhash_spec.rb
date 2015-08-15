require_relative "../lib/nestedhash"

RSpec.describe NestedHash do

  before :each do
    @nested_hash = NestedHash.new
  end
  
  # Instance Members ==========================================================
  
  # describe "#outer" do
  #   it "is a Hash" do
  #     expect(@nested_hash.outer).to be_an_instance_of(Hash)
  #   end
  # 
  #   it "initializes all its subscripts to Hashes" do
  #     expect(@nested_hash.outer[:f][:o][:o]).to be_an_instance_of(Hash)
  #   end
  # end
  
  # Instance Methods ==========================================================
  
  # describe "#keys" do
  #   it "forwards to NestedHash#outer#keys" do
  #     expect(@nested_hash.keys).to eq(@nested_hash.outer.keys)
  #   end
  # end
  
  # describe "#values" do
  #   it "forwards to NestedHash#outer#values" do
  #     expect(@nested_hash.values).to eq(@nested_hash.outer.values)
  #   end
  # end

  describe "#[]" do
    context "before assignment" do
      it "returns {}" do
        expect(@nested_hash[:foo][:bar]).to eq({})
      end
    end
    
    context "after assignment" do
      it "returns assigned value" do
        @nested_hash[:foo][:bar] = "foobar"
        expect(@nested_hash[:foo][:bar]).to eq("foobar")
      end
    end
  end
  
  describe "#each" do
    it "makes NestedHash compatible with Enumerable methods" do
      @nested_hash[:foo] = 0
      @nested_hash[:bar] = 1
      expect(@nested_hash.inject([]) { |result, keyval|
        result << keyval
      }).to eq([[:foo, 0], [:bar, 1]])
    end
  end
  
end
    

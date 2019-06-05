require_relative '../gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "does not remove the sell_in value" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to be_an_instance_of(Integer)
    end
    it "does not remove the quality value" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be_an_instance_of(Integer)
    end
    it "lowers both quality and sell_in values for every item" do
      items = [Item.new("foo", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(4)
      expect(items[0].quality).to eq(4)
    end
    it "degrades quality value twice as fast when sell_in is less than 0" do
      items = [Item.new("foo", -1, 6)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(4)
    end
    it "does not set quality to less than 0" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it "increases the quality of 'Aged Brie' by 2 as it gets older" do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(2)
    end
  end
end

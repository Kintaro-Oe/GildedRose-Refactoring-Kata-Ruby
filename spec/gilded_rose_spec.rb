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
    it "does not set quality to higher than 50" do
      items = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it "does not alters the sell_in or quality of 'Sulfuras, Hand of Ragnaros'" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(0)
      expect(items[0].quality).to eq(50)
    end
    context "called on ‘Backstage passes’" do
      it "increases quality by 2 when there are 10 days or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(2)
      end
      it "increases quality by 3 when there are 5 days or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(3)
      end
      it "drops quality to 0 when sell_in is 0 or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end
    end
  end
end

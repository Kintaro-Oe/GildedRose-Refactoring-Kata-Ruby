class GildedRose
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decrease_sell_in(item)
      decrease_quality(item)
      decrease_quality(item) if item.sell_in < 0

      if aged_brie?(item)
        increase_quality(item)
        increase_quality(item) if item.sell_in < 0
      end

      if backstage_pass?(item)
        increase_quality(item)
        increase_quality(item) if item.sell_in < 10
        increase_quality(item) if item.sell_in < 5
        item.quality = 0 if item.sell_in < 0
      end
    end
  end

  private

  def increase_quality(item)
    item.quality += 1 if below_max_quality?(item)
  end

  def decrease_quality(item)
    if item.quality > 0
      item.quality -= 1 unless sulfuras?(item)
    end
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless sulfuras?(item)
  end

  def below_max_quality?(item)
    item.quality < MAX_QUALITY
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def aged_brie?(item)
    item.name == "Aged Brie"
  end

  def backstage_pass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end
end



class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

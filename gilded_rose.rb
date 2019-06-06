class GildedRose
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if not_aged_brie?(item) && not_backstage_pass?(item)
        decrease_quality(item)
      else
        if below_max_quality?(item)
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              item.quality += 1 if below_max_quality?(item)
            end
            if item.sell_in < 6
              item.quality += 1 if below_max_quality?(item)
            end
          end
        end
      end

      decrease_sell_in(item)

      if item.sell_in < 0
        if not_aged_brie?(item)
          if not_backstage_pass?(item)
            decrease_quality(item)
          else
            item.quality = 0
          end
        else
          item.quality += 1 if below_max_quality?(item)
        end
      end
    end
  end

  def decrease_quality(item)
    item.quality -= 1 if not_sulfuras?(item) && item.quality > 0
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 if not_sulfuras?(item)
  end

  def below_max_quality?(item)
    item.quality < MAX_QUALITY
  end

  def not_sulfuras?(item)
    item.name != "Sulfuras, Hand of Ragnaros"
  end

  def not_aged_brie?(item)
    item.name != "Aged Brie"
  end

  def not_backstage_pass?(item)
    item.name != "Backstage passes to a TAFKAL80ETC concert"
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

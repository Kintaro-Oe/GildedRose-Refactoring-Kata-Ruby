An exercise to refactor and extend some legacy code.

### Approach

* Identify what the program currently does
* Identify what I am permitted to change
* Make sure tests are in place to ensure that refactoring doesn't effect behaviour
* Refactor in stages
* Extend the code


### Current functionality

* All items have a SellIn value. _This denotes the number of days we have to sell the item._

* All items have a Quality value. _This denotes how valuable the item is._

* At the end of each day the system lowers both values for every item.

* Once the sell by date has passed, Quality degrades twice as fast

* The Quality of an item is never negative

* The Quality of an item is never more than 50

* “Sulfuras” never has to be sold or decreases in Quality

* “Aged Brie” increases in Quality the older it gets

* “Backstage passes” increases in Quality as it’s SellIn value approaches;
  * Quality increases by 2 when there are 10 days or less
  * Quality increases by 3 when there are 5 days or less
  * Quality drops to 0 after the concert


### Change limitations
"Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property [...] you can make the UpdateQuality method and Items property static if you like."


### Extended functionality

* “Conjured” items degrade in Quality twice as fast as normal items

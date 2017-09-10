# gilded-rose-kata-ruby

A two day tech test to attempt the Gilded Rose kata in Ruby. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

## Approach to the challenge

I began by writing RSpec tests to capture the existing functionality of the code before attempting to change anything.

My first attempt to change the conditionals quickly broke all the tests so I changed my approach and refactored out very small chunks of code into separate methods, testing all the time to keep on green.

I noticed some duplication in the reduction of the sell in date and increasing/decreasing quality so I wrote separate methods for those.

I was able to reduce the main conditional to a couple of lines using this approach and got to a point where it would be easy to implement the conjured items code. However, I was not confident that the code as refactored was open for extension but closed for modification so I viewed [Sandi Metz's](https://www.youtube.com/watch?v=8bZh5LMaSmE) approach to the challenge.

I refactored my code in the same way but I did not implement Sandi's approach of creating new classes for each item as the rules state that you cannot touch the item class.

I am now moving on to my next project but I will consider revisiting this challenge in the future and attempt to refactor it further and implement it in an object oriented way.


======================================
Gilded Rose Requirements Specification
======================================

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

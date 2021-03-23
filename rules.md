# Conveyor Belt Item Movement

<br />

This is a list of ideas for coding a convey belt item movement system. This will only apply to belts that have one side.

<br />
<br />
<br />

- in this system, there is a separate list for items that need to be updated. items that follow other items will be updated when the leading item updates

- - this means when an item is moved, items behind it are moved as well

- - in the previous rule set, only items directly behind the updated item would move, but you'd actually have to move items merging too, so here's how this would actually work:

- - - if there is a belt behind the current item, and that belt has an item on it, move that item forwards

- - - if either of those conditions are false, check for belts on the side.

- - - - if there is only one side belt, and if there is an item on that belt, move that item

- - - - if there are two belts, check for items on each belt

- - - - - if there is an item on only one belt, move that item and set that belt's priority bit to prioritize the other belt

- - - - - if there are two items, move the item on the prioritized belt and flip the bit (that's a lot of 2s)

<br />
<br />
<br />

- certain actions will cause items to be added / removed from the list of items to be updated (which I will refer to as the update list)

- both placing items on belts and removing items from belts could cause both additions and removals to and form the update list

- - after placing an item, you need to check if there are items in front and behind the placed item

- - - if there is an item in front of the placed item, it doesn't need to be put in the update list

- - - if there's no item in front of the placed item it does need to be put in the update list

- - also after placing an item, you need to check if there are items behind / to the side of the placed item. any and all items behind / to the side need to be removed from the update list

- when an item reaches the end of a trail of items (and that item cannot move until the other items move), the item needs to be removed from the update list

- please note that the rules in this section are not complete, and essential changes may be made

<br />
<br />
<br />

- thankfully, multithreading should still be possible with these updated rules

- there's not too much to say here; it's basically the same as before

- there needs to be another 2 lists, one for additions to the update list and one for removals

- each thread needs to start in the update list at its thread id and skip ahead by the number of threads so that the communication between threads in minimal
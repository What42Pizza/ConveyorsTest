# Conveyor Belt Item Movement

<br />

This is a list of ideas for coding a convey belt item movement system. This will only apply to belts that have one side.

<br />
<br />
<br />

- in this system, there is a separate list for items that need to be updated, which I will refer to as the update list

- items that are directly behind other items will be updated when the leading item updates

- - this means when an item is moved, items behind it are moved as well

- - in the previous rule set, only items directly behind the updated item would move, but you'd actually have to move items merging and turning too, so here's how this would actually work:

- - - if there is a belt behind the current item, and that belt has an item on it, move that item forwards

- - - if either of those conditions are false, check for belts on the side.

- - - - if there is only one side belt, and if there is an item on that belt, move that item

- - - - if there are two belts, check for items on each belt

- - - - - if there is an item on only one belt, move that item and set that belt's priority bit to prioritize the other belt

- - - - - if there are two items, move the item on the prioritized belt and flip the priority bit

<br />
<br />
<br />

- certain actions will cause items to be added / removed from the list of items to be updated

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

- there will be a single 2-dimensional array which holds every item

- - you could have a buffer array that it written to each update that is swapped for the current array at the end, but that would be inefficient because you'd have to move over items that are completely still

- having every item on a single array could cause problems, though

- - if there is a line of items that are spaced out (one on every other belt), you could have a situation where the the very last item is moved, then the second last (which would pull the very last), then the thrid-to-last (which would pull the last two), and so on until every item has been moved, and the later items move way too much

- - to fix this, you'd have to have each item store the last time it was updated (the update number), which could just be a single byte (it's fine if it overlfows. in fact, it could even be a single bit. the only important part is that the items need to know if other items have been updated yet)

- - whenever an item meets the end of another item trail, it's only removed from the update list if the end item has already been updated

- - you could, however, have a situation where the item comes up to a trail of static items that are updated after the currently updated item, and in this case the item would never be removed from the update list (this wouldn't cause problems, but it's inefficient)

- - to fix this, each item would also need to store whether or not it moved in the last update. now, an item that reaches the end of a trail of items is removed if either the item has already been updated or if it didn't move on the last update

- - - you might think there'd be a problem if a trail of items didn't move on the last update but can this update, and another trail of items reaches that trail of items

- - - there shouldn't be any problems, though, because either a: the leading trail is updated first and moved far enough from the trailing trail that they don't rough, or b: the trailing trail is update first, sees that the first trail hasn't been updated, and doesn't remove itself

<br />
<br />
<br />

- thankfully, multithreading should still be possible with these updated rules

- there's not too much to say here; it's basically the same as before

- there needs to be another 2 lists, one for additions to the update list and one for removals

- each thread needs to start in the update list at its thread id and skip ahead by the number of threads so that the communication between threads in minimal
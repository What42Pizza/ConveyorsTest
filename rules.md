# Conveyor Belt Item Movement

<br />

This is a list of ideas for coding a convey belt item movement system. This will only apply to belts that have one side.

<br />
<br />
<br />

1.0: there is a separate list for items that need to be updated. Items that follow other items will be updated when the leading item updates

1.1: this means when an item is moved, items behind it are moved as well

<br />
<br />
<br />

2.0: when an item moves to a belt that faces in a different direction than the previous belt, it needs to do checks to make sure it can actually merge

2.1: if the belt is facing the opposite direction, it doesn't move at all

2.1.1: assuming you have 0=up, 1=down, 2=left, 3=right (or something similar), you can test if belts are opposites if (belt1 bit& 0b10) == (belt2 bit& 0b10)

2.2: else (the belt is perpendicular), the item first checks if an item is already on the belt

2.3: if empty, the item then checks the belt behind the one being merged onto. This gives priority to items already on the belt

2.4: if that is also empty, the item then checks the belt opposite to the one being merged onto

2.5: if that one is also empty, the item is finally allowed to merge

2.6: each belt will need to store a single bit (the 'priority bit') for the next point

2.7: if there is no item already on the belt (that is already there), no item about to get on the belt (going straight), but there is an item also trying to merge onto the belt from the other side, the priority bit determines whether the item is allowed onto the belt (one side requires 1, the other requires 0)

2.8: every time the priority bit is used to allow an item onto a belt (NOT every time it is checked), the bit is flipped to give priority to the other belt

<br />
<br />
<br />

3.0: Every time an item is removed from a belt, checks need to be done to determine whether the list of items to update needs to be updated

3.1: I'm too tired to think this through right now but you can figure it out

3.2: this is also true for items being put onto a belt

<br />
<br />
<br />

4.0: Due to the nature of this system, multithreading would be relatively easy

4.1: Each thread could just pull an item from the list, do the logic for it, then skip ahead by the number of threads to the next item

4.2: When using a single thread, you can add and remove items from the list willy milly, but that won't do here

4.2.1: For this, you'd have to have a list of items to update this cycle, a list of new items to be updated, and a list of indicies of items to be remove

4.2.2: Instead of adding and removing items to and from the list directly, these lists would be used in order to make sure that the right items are being updated

4.2.3: Once all the threads are done, the list can be updated

4.3: You might think there'd be problems when two belts are merging onto a belt from the side, but the priority bit will already prevent any problems from occuring (and this goes for all types of mergings)

4.3.1: One nice thing about this system is that it's already set up so that only one thread will write to the priority bit, again preventing any possible problems

4.3.2: You might think there'd be a problem with two side-merging belts if the prioritized belt is updated first because this would allow the other side to merge when updated, but this won't be a problem as long as the item is moved (blocking the other belt) before the priority bit is flipped
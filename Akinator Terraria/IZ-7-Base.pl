:- dynamic hardmode/2.
:- dynamic boss/2.
:- dynamic rare/2.
:- dynamic callable/2.
:- dynamic timeSpan/2.
:- dynamic event/2.
:- dynamic classic/2.

:- assert(hardmode("Zombie", 0)).
:- assert(boss("Zombie", 0)).
:- assert(rare("Zombie", 0)).
:- assert(callable("Zombie", 0)).
:- assert(timeSpan("Zombie", 2)). % Появляется в любое время на кладбище.
:- assert(event("Zombie", 0)).
:- assert(classic("Zombie", 1)).

:- assert(hardmode("Green slime", 0)).
:- assert(boss("Green slime", 0)).
:- assert(rare("Green slime", 0)).
:- assert(callable("Green slime", 0)).
:- assert(timeSpan("Green slime", 1)).
:- assert(event("Green slime", 1)).
:- assert(classic("Green slime", 1)).

:- assert(hardmode("Pinky", 0)).
:- assert(boss("Pinky", 0)).
:- assert(rare("Pinky", 1)).
:- assert(callable("Pinky", 0)).
:- assert(timeSpan("Pinky", 1)).
:- assert(event("Pinky", 1)).
:- assert(classic("Pinky", 1)).

:- assert(hardmode("Wandering Eye", 1)).
:- assert(boss("Wandering Eye", 0)).
:- assert(rare("Wandering Eye", 0)).
:- assert(callable("Wandering Eye", 0)).
:- assert(timeSpan("Wandering Eye", 1)).
:- assert(event("Wandering Eye", 0)).
:- assert(classic("Wandering Eye", 0)). % В 1.1 появился

:- assert(hardmode("Hellbat", 0)).
:- assert(boss("Hellbat", 0)).
:- assert(rare("Hellbat", 0)).
:- assert(callable("Hellbat", 0)).
:- assert(timeSpan("Hellbat", 0)).
:- assert(event("Hellbat", 0)).
:- assert(classic("Hellbat", 1)).

:- assert(hardmode("Lava Bat", 1)).
:- assert(boss("Lava Bat", 0)).
:- assert(rare("Lava Bat", 0)).
:- assert(callable("Lava Bat", 0)).
:- assert(timeSpan("Lava Bat", 0)).
:- assert(event("Lava Bat", 0)).
:- assert(classic("Lava Bat", 1)).

:- assert(hardmode("Goblin Warrior", 0)).
:- assert(boss("Goblin Warrior", 0)).
:- assert(rare("Goblin Warrior", 0)).
:- assert(callable("Goblin Warrior", 1)).
:- assert(timeSpan("Goblin Warrior", 0)).
:- assert(event("Goblin Warrior", 1)).
:- assert(classic("Goblin Warrior", 1)).

:- assert(hardmode("Goblin Summoner", 1)).
:- assert(boss("Goblin Summoner", 0)).
:- assert(rare("Goblin Summoner", 1)).
:- assert(callable("Goblin Summoner", 1)).
:- assert(timeSpan("Goblin Summoner", 0)).
:- assert(event("Goblin Summoner", 1)).
:- assert(classic("Goblin Summoner", 1)).

:- assert(hardmode("Eye of Cthulhu", 0)).
:- assert(boss("Eye of Cthulhu", 1)).
:- assert(rare("Eye of Cthulhu", 1)).
:- assert(callable("Eye of Cthulhu", 1)).
:- assert(timeSpan("Eye of Cthulhu", 1)).
:- assert(event("Eye of Cthulhu", 1)).
:- assert(classic("Eye of Cthulhu", 1)).

:- assert(hardmode("Demon", 0)).
:- assert(boss("Demon", 0)).
:- assert(rare("Demon", 0)).
:- assert(callable("Demon", 0)).
:- assert(timeSpan("Demon", 0)).
:- assert(event("Demon", 0)).
:- assert(classic("Demon", 1)).

:- assert(hardmode("Martian Drone", 1)).
:- assert(boss("Martian Drone", 0)).
:- assert(rare("Martian Drone", 0)).
:- assert(callable("Martian Drone", 1)).
:- assert(timeSpan("Martian Drone", 0)).
:- assert(event("Martian Drone", 1)).
:- assert(classic("Martian Drone", 0)).

:- assert(hardmode("Moth", 1)).
:- assert(boss("Moth", 0)).
:- assert(rare("Moth", 1)).
:- assert(callable("Moth", 1)).
:- assert(timeSpan("Moth", 0)).
:- assert(event("Moth", 0)).
:- assert(classic("Moth", 0)).

:- assert(hardmode("Mothron", 1)).
:- assert(boss("Mothron", 1)).
:- assert(rare("Mothron", 1)).
:- assert(callable("Mothron", 1)).
:- assert(timeSpan("Mothron", 1)).
:- assert(event("Mothron", 1)).
:- assert(classic("Mothron", 0)).

:- assert(hardmode("Eater of Worlds", 0)).
:- assert(boss("Eater of Worlds", 1)).
:- assert(rare("Eater of Worlds", 1)).
:- assert(callable("Eater of Worlds", 1)).
:- assert(timeSpan("Eater of Worlds", 0)).
:- assert(event("Eater of Worlds", 0)).
:- assert(classic("Eater of Worlds", 1)).

:- assert(hardmode("The Destroyer", 1)).
:- assert(boss("The Destroyer", 1)).
:- assert(rare("The Destroyer", 1)).
:- assert(callable("The Destroyer", 1)).
:- assert(timeSpan("The Destroyer", 1)).
:- assert(event("The Destroyer", 0)).
:- assert(classic("The Destroyer", 0)).

:- assert(hardmode("Armored Skeleton", 1)).
:- assert(boss("Armored Skeleton", 0)).
:- assert(rare("Armored Skeleton", 0)).
:- assert(callable("Armored Skeleton", 0)).
:- assert(timeSpan("Armored Skeleton", 0)).
:- assert(event("Armored Skeleton", 0)).
:- assert(classic("Armored Skeleton", 0)).

:- assert(hardmode("King Slime", 0)).
:- assert(boss("King Slime", 1)).
:- assert(rare("King Slime", 1)).
:- assert(callable("King Slime", 1)).
:- assert(timeSpan("King Slime", 0)).
:- assert(event("King Slime", 1)).
:- assert(classic("King Slime", 1)).

:- assert(hardmode("Everscream", 1)).
:- assert(boss("Everscream", 1)).
:- assert(rare("Everscream", 1)).
:- assert(callable("Everscream", 1)).
:- assert(timeSpan("Everscream", 1)).
:- assert(event("Everscream", 1)).
:- assert(classic("Everscream", 0)).

:- assert(hardmode("Mourning Wood", 1)).
:- assert(boss("Mourning Wood", 1)).
:- assert(rare("Mourning Wood", 1)).
:- assert(callable("Mourning Wood", 1)).
:- assert(timeSpan("Mourning Wood", 1)).
:- assert(event("Mourning Wood", 1)).
:- assert(classic("Mourning Wood", 0)).

:- assert(hardmode("Scarecrow", 1)).
:- assert(boss("Scarecrow", 0)).
:- assert(rare("Scarecrow", 0)).
:- assert(callable("Scarecrow", 1)).
:- assert(timeSpan("Scarecrow", 1)).
:- assert(event("Scarecrow", 1)).
:- assert(classic("Scarecrow", 0)).

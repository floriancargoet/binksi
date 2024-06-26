demo ==binksi== game #TITLE

-> init

=== init
+ [auto: start game]
    -> front_desk("start")

=== front_desk(from)
SPAWN_AT(desk-from-{from})
{CUTSCENE(receptionist, entry)|}

-(opts)

+[tag: reception_talk]
    ->talk_to_receptionist->

+ [tag: desk-to-salon]
    {Let's see where this goes|Maybe there's something new over there|}
    ->salon("desk")
+ [tag: exit-west]
    You cannot leave west yet

-
-> opts

=== talk_to_receptionist
Welcome to Binksi Hotel.
Do you have a room here ?
+ [yes]
    + + [101]
        -> has_key("101")
    + + [303]
        -> has_key("303")
    + + [I don't remember actually]
        ->no_key
+ [no]
    ->no_key

= has_key(key)
Here's your key to room {key}
->->

= no_key
Then why bother me ?
->->

=== salon(from)
SPAWN_AT(salon-from-{from})

{Hmmm, there's nothing here...|Still nothing, I wonder why I keep coming here|I should really stop hoping|}

+ [tag: salon-to-desk]
    ->front_desk("salon")

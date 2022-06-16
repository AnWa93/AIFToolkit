AIF Toolkit Recipe Book by Another Wannabe begins here.

AIF Toolkit Recipe Book ends here.

---- DOCUMENTATION ----

Chapter: Introduction

This is not an extension, but pure documentation that's intended for use with the AIF Toolkit. I had, once, planned on making a print-out version of the documentation. I don't think this is necessarily practical, for a variety of reasons. And yet, there were things I wanted to address that didn't really fit anywhere. This "recipe" book, something of a companion to the Inform Recipe Book, is an attempt to rectify that. The examples contained herein are written to illustrate ideas, solutions to common problems, common AIF stuff that didn't deserve their own extensions, time-saving tricks, and just outright porn.

Feel free to paste and modify any of the examples into your own game.

Section: Templates

At the end of this document, there are "examples". This is a lie. These are templates that can act as starting points for your projects. Simply read the instructions then copy-paste them into your project, writing what you want.

Chapter: Basic Stuff

This chapter goes over very basic things that would be useful to all AIF writers. It's recommended you take a glance at all the examples in this section before writing your first game.

Section: Basic Sex Scene

The Simpler AIF documentation already goes in depth how to write a sex scene, and does a little to illustrate what you can do with it. This is just additional food for thought. At a minimum, players generally expect at least two responses: one for the first time, and a second for every other time they try an action. The more variations you have, the better, but that isn't always the most practical.

At a bare minimum, a sex action might look like this:

*:
	After fucking Lilah's pussy with your cock:
		say "[one of]'Oh, that feels amazing,' you say as you come inside Lilah's pussy[or]That was great but now it's time to move on[stopping]."

You might not want something quite this simple, but this is generally a good place to start. In fact, you can use the nifty BASIC SEX SCENE TEMPLATE to give you a skeletal scene just like this.

However, if you have the inclination, it's nice to elaborate on this formula. Some ideas. You can use the ACTION REPEAT COUNT variable to simulate an arousal system without having to include a full-fledged one.

*:
	After fucking Lilah's pussy with your cock:
		if the action repeat count is:
			-- 1: say "You start fucking Lilah.";
			-- 2: say "You continue fucking Lilah.";
			-- 3: say "You are pretty close to blowing a load.";
			-- 4: say "Yep. You go off.";
			-- otherwise: say "OK you just keep doing it."

The weakness of the action repeat count is that it only works for actions initiated by the player. For an in-depth system, you need the Penetration extension.

Section: Generalized Rules

On occasion, especially when you have several characters that are quite similar to one another, you'll want to make sex rules that effect a class of people rather than one individual. These can be tricky if you don't know what you're doing, but are easy once you know the trick.

Let's make a pair of blond twins who are basically the same.

	A blond twin is a kind of woman. Stacey is a blond twin in the bedroom. Tiffany is a blond twin in the bedroom.
	
You can make them dudes if you want. We don't want to write rules for each blond twin, we want them to use the same rules. It's easy to make such a rule.

	After rubbing a breast enclosed by a blond twin:
		say "You rub [the noun][']s awesome tits."

Fucking is a little trickier, because I7 tends to get confused by qualifiers for the first noun. Luckily, we can get around this.

	After fucking a pussy with a cock when the noun is enclosed by a blond twin:
		say "You do her deep and hard."

Writing a rule when the blond twins are the actors is even easier.

	After a blond twin licking your cock:
		say "They give you a blowjob."

Section: The Basics of Clothing

Some people have told me that Advanced Layered Clothing is easier to understand than the clothing system in SAIF. I think that's probably true, but SAIF's clothing system is not labor intensive at all. Since clothes come off as layers instead of pieces, it's only necessary to write a couple of rubbing descriptions and examining descriptions for each worn layer. ALC is easier to understand as it's the traditional system of layered clothing we all know and love.

Of course, it's possible to achieve an effect like SAIF's clothing system in ALC. We just need to make one garment that represents an entire clothing set.

	Jane's clothes are a garment. The covered areas {feet area, legs area, crotch area, ass area, chest area}. The layer is 2.

ALC is designed so that, at a minimum, you just need to provide a garment a pdesc and have everything else handled for you. You'll need to have appropriate descriptions for rubbing through things, but you can design a modular description using the "materials" section.

If you're using SAIF, you'll just need to change the description according to the number of worn layers.

	Instead of examining Jane:
		if the worn layers of Jane are 0:
			say "Jane is naked.";
		else if the worn layers of Jane are 1:
			say "Jane is down to her underwear.";
		else:
			say "Jane is fully dressed."

Section: Acts, Scenes and Nested Scenes

Scenes are one of the most powerful and attractive features of Inform 7, and, wisely used, can make complex games a cinch to write. And yet, too often, I see authors not using scenes to their full potential.

In my opinion, scenes should be used in all but the most trivial projects, and there should always be a scene going on at all times. Many authors don't know that scenes can actually be nested within each other, so that you can define the flow of an entire game by scenes.

I call a large scene that contains a lot of smaller scenes an "act", and I call a trivial scene that lasts only for a few turns a "nested scene". Acts largely define the trunk and main branches of the story. The example outline below illustrates this.

	Act1-- Player delivers a pizza.
		Scene1-- Player picks up pizza.
		Scene2-- Player drives to location
		Scene3-- Player stands outside door. They can:
			ring doorbell -- go to act 2, scene 1.
			drop off pizza -- end game.
	Act2-- Player gets invited in by MILF.
		Scene1-- MILF invites in player. Player can:
			refuse and take money -- end game
			accept and enter -- go to Scene2
		Scene2-- MILF offer player wine. Player can:
			drink too much wine -- end game
			drink a little -- loses inhibitions, go to act3, scene1
			don't drink -- go to act2, scene3
		Scene3-- MILF snuggles up to player. Player can:
			run away -- end game
			snuggle back, hard -- go to act3, scene1
			be awkward about it -- go to act2, scene4
		Scene4-- MILF says she wants sex Player can:
			accept -- go to act3, scene1
			reject -- end game
	Act3-- Player gets FUCKED.
		Scene1 -- Player and MILF go to bedroom, have sex. Player can:
			get caught by the husband coming home -- go to act4, scene1.
			hear the door opening -- go to act5, scene1.
	Act4-- Player and MILF confronted by husband
		scene 1 -- Husband stands shocked. Player can:
			try to explain himself -- go to act4, scene2
			run away -- end game
			fight him -- go to act4, scene3
		scene 2 -- Husband pulls out a gun. Player can:
			wait to get shot -- end game
			run away and get shot -- end game.
			fight him -- go to act4, scene3
		scene3 -- Player and husband fight.
			50% chance of winning -- Husband dies! game ends.
			50% chance of losing -- Player dies! game ends.
	Act5-- Player senses husband coming.
		scene1 -- Player hears footsteps. Player can:
			ignore it -- go to act4, scene1
			hide -- go to act5,  scene2
			run away -- end game
			prepare ambush -- go to act 4, scene3 but with 75% chance of winning.
		scene2 -- Husband fucks wife with player hidden. player can:
			emerge -- go to act 4, scene 1.
			continue hiding -- go to act5, scene3.
		scene3 -- Husband falls asleep. Player can:
			sneak away -- end game
			kill husband -- end game
			fuck wife next to sleeping husband -- go to act6, scene1
	Act6-- Player fucks wife, with sleeping husband next to her.
		scene1 -- husband sleeps.
		scene2 -- husband awaken accidentally, but is so turned on he joins in. Game ends in a threesome.

The trick to nesting scenes is to make sure that the start of the act triggers the first scene of the act. A simple example on how to nest scenes is as follows:

	act1 is a scene.
		act1 begins when play begins.
		act2 ends when scene2 ends.
	
	scene1 is a scene.
		scene1 begins when act1 begins.
		scene1 ends when...
	
	scene2 is a scene.
		scene2 begins when scene1 ends.
		scene2 ends when....
		
	act2 is a scene.
		act2 begins when act1 ends.
		act2 ends when....
		
The primary advantage of using this method is that, by grouping scenes like this, you can write rules about scenes a lot easier. If Act2 is where the PC gets really piss drunk, instead of writing:

	Instead of going somewhere when scene1 is happening or scene2 is happening or scene3 is happening or scene4 is happening:
		say "You're so drunk you fall where you are."

You can write:

	Instead of going somewhere when act2 is happening:
		....
			
Chapter: Naming & Descriptions

This section covers doing interesting things with naming and descriptions.

Section: Creating Background and Partially Interactive NPCs

I have occasionally recieved requests to make a background NPC class that doesn't have body parts, or NPC classes that don't have a full set of body parts. I've been resistant to this for two reasons:

1) I don't want to define for the author what I consider "important" and "unimportant" body parts.

2) There is already a suitable way to do this without me bloating the AIF Toolkit with more features.

If you want a pure background NPC, simply do this:

*:
	The bouncer is a person. He is male.
	
The operative word here is "person". In Simpler AIF, a person is a basically a blank slate -- they are given no body parts. Then simply define them as male/female. There. Job done.

Something that might be useful is to make a "dummy" body part, just in case someone wants to check out the bouncer's junk. Then you can give the player a response like, "You don't want to check out the bouncer too closer... he looks ready to thwomp you for looking at him weird." but not have to complicate things by making a full set of body parts. You can also set up responses to trying to interact with the body parts.

*:
	A dummybp is a kind of thing.
	Understand "cock/breasts/chest/penis/ass/butt/pussy/legs/groin" as a dummybp.
	
	The bouncer's body is a dummybp. It is part of the bouncer.
	The description is "You don't want to check out the bouncer too closer... he looks ready to thwomp you for looking at him weird."

A partially interactive npc, however, is a little different. Some people want major npcs to have things nipples, clits, testes, and a host of other parts, but things that another NPC might not have. Perhaps the easiest way to do this is just make a new kind.

*:
	A half-woman is a kind of person. A half-woman is always female.
	Some breasts are a part of every half-woman. A pussy is a part of every half-woman.

It's a little cruel to call these assless women "half-women", but you get the general idea. I hope. 

Section: NPCs Notice You Checking Them Out

Some people like it when NPCs comment on being checked out. This is pretty simple to implement.

*:
	Report examining Lilah's breasts:
		say "[one of]Lilah raises an eyebrow. 'Like what you see?'[or]'Seriously... haven't you stared at them enough?'[stopping]".

The actual printing of the description occurs in the Carry Out stage, which means as long as you don't fuck with that this piece of prose always prints after the description.

Section: Body Parts with Interesting Names

Simpler AIF already provides support for renaming body parts in the plugins, but some games include very elaborate naming conventions. For example, instead of "Jane's breasts" you'd have "Jane's big juicy knockers", and Sara's breasts would be "Sara's petite little breasts".

The easiest way to accomplish this would be simply to change the printed name of something. For example:

	The printed name of Jane's breasts are "Jane's big juicy knockers".
	
Let's say, however, you want the game to vary the names somewhat throughout descriptions, to give body parts a little more variety as they're printed. There are a couple of ways to accomplish this. This is slightly more involved, but still pretty simple.

	Rule for printing the name of Jane's breasts:
		say "Jane's [one of]big[or]juicy[or]pendulous[or]melon[at random] [one of]jugs[or]tits[or]boobs[or]knockers[at random]".

Another thing. It can get pretty repetitive to constantly have it say "You touch Jane's breasts", "You fondle Jane's breasts", "You put your cock between Jane's breasts" and so on and on. It's sometimes less obnoxious to say "her breasts" instead, when it's obvious they belong to Jane. We can do this fairly simply, since Simpler AIF already tracks the last person specified. 

*:
	Before printing the name of a body part (called the z):
		if z is enclosed by a person (called X):
			if X is the last partner specified:
				if X is male:
					say "his ";
				else:
					say "her ";
			else:
				"[printed name of X]'s "

	Rule for printing the name of Jane's breasts:
		say "[one of]big[or]juicy[or]pendulous[or]melon[at random] [one of]jugs[or]tits[or]boobs[or]knockers[at random]".

You'll notice that this breaks the name into two parts: before the name is printed, where the possessive is printed, and another where the object's name is printed. We can further elaborate this by seperating out the adjectives from the the noun parts.

*:
	First before printing the name of a body part (called the z):
		if z is enclosed by a person (called X):
			if X is the last partner specified:
				if X is male:
					say "his ";
				else:
					say "her ";
			else:
				say "[printed name of X]'s ".
	
	Before printing the name of Jane's breasts:
		if a random chance of 2 in 3 succeeds:
			say "[one of]big[or]juicy[or]pendulous[or]melon[at random] ".

	Rule for printing the name of Jane's breasts:
		say "[one of]jugs[or]tits[or]boobs[or]knockers[at random]".

This will very nicely mix up what various things are called. But remember, no matter what you eventually go with, it's always a good idea to add the terminology you use as synonyms in the game. Which leads to the next topic...

Section: Guidelines for Writing Understanding Clauses

The eternal question: is it better to write

	Understand "big/juicy/pendulous/melon jugs/tits/boobs/knockers" as Jane's breasts.
	
or

	Understand "big/juicy/pendulous/melon", "jugs/tits/boobs/knockers" as Jane's breasts.

In my opinion, the second option is slightly better. It is important to note that the I7 take things pretty literally. Take this as an example. Say the player writes "big juicy knockers". In the first example, I7 would match "juicy knockers" correctly to Jane's breasts. It would be confused by "big", however, because it isn't followed by one of the words for tits, and I7 expects that. However, the second example would match correctly, "big" and "juicy" match independently to Jane's breasts.

In this case, both examples are bad. Simpler AIF already defines tits and boobs as synonyms for breasts. We really just need to add the adjectives and some of the more colorful nouns.

	Understand "big/juicy/pendulous/melon" as Jane's breasts. Understand "jugs" and "knockers" as Jane's breasts.

Here, the game understands that if the player want to touch "jugs", they mean Jane's, not Sara's petite breasts. This can be nice, depending on how you describe your characters.

Section: Clothing & Character Descriptions

If you plan on using descriptions that change depending on what a character is wearing, Advanced Layered Clothing is pretty much required. That out of the way, you have pretty much one consideration: either you expect each piece of garment to be worn by only one character, or it's a free-for-all where any character can wear anything they want.

If the former is true, making good use of clothing sets will be very helpful for you. This keeps the player from picking up other people's clothes, reducing the number of descriptions you need to write. This also makes writing descriptions pretty easy: just write a pdesc for the garment and you're done.

On the other hand, if the latter is true, clothing sets are less important, but you really need to consider what happens if your male PC picks up his girlfriend's bra and wears it. The portrait description is written expressly for this purpose.

*:
	The pdesc of the girlfriend's bra is "[if the person described is male]The bra doesn't fit across [their] chest very well[else]The bra is a perfect fit for [the person described][end if]."

More complex descriptions than this can be constructed using the PRINTING A PORTRAIT DESCRIPTION activity.

*:
	The pdesc of the girlfriend's bra is "XXX".
	For printing a portrait description of the girlfriend's bra:
		if the person described is the player:
			say "The bra doesn't fit your chest too well, it is too tight around the back and sags in the front.[run paragraph on]";
		else if the person described is male:
			say "The bra doesn't fit him too well, it looks pretty uncomfortable and droopy.[run paragraph on]";
		else:
			say "A pretty standard bra is a good fit for [the person described].[run paragraph on]".

Unfortunately, the "run paragraph on" part is mandatory if you want the game to display the portrait description correctly as a paragraph.

You can get more complicated... you can specify all sorts of crazy stuff like cup-size, pant width, etc, but that's just a simple example.

Chapter: Clothing and Garments

Section: Cups & Measurements

When we talk about cups and measurements, we aren't talking about cooking. For the majority of games, you'll never need to know the cup size of a person or bra, but some games do get this complicated. It also poses some issues. The standard nomenclature for cup size ("A", "B", "C", "D" etc) presents some issues for the compiler as it is not the best from discerning "A" the cup size and "a" the article.

We start with an kind of object - "cup size". Normally, we might choose to make this a value, but we'll be making use of the unique properties have that values don't. It is generally good practice to make things into values instead of objects if at all possible. We'll give it a few understand tokens and printed names.

(Note that, typically of us Americans, we do everything different and so this method follows the American standard sizes.)

*:
	A cup size is a kind of value.
		A cup size has a text called a printed name.

	To say (n - cup size):
		say "[printed name of n]".

	AA-cup is a cup size.
		The printed name is "AA".
		Understand "AA" and "cup" as aa-cup.

	A-cup is a cup size.
		The printed name is "A".
		Understand "A" and "cup" as a-cup.

	B-cup is a cup size.
		The printed name is "B".
		Understand "B" and "cup" as a b-cup.

	C-cup is a cup size.
		The printed name is "C".
		Understand "C" and "cup" as a c-cup.

	D-cup is a cup size.
		The printed name is "D".
		Understand "D" and "cup" as a d-cup.

	DD-cup is a cup size.
		The printed name is "DD".
		Understand "DD" and "cup" and "double-D" as a dd-cup.

	DDD-cup is a cup size.
		The printed name is "DDD".
		Understand "DDD" and "triple-d" and "cup" as a ddd-cup.

	DDDD-cup is a cup size.
		The printed name is "DDDD".
		Understand "DDDD" and "quadruple-d" and "cup" as a ddd-cup.

Alright, now that we have sizes defined, we can tell I7 that different things have different cup sizes.

*:
	Some breasts have a cup size called the boob size. The boob size is usually C-cup.
	A chest has a cup size called the boob size. The boob size is usually AA-cup.
	A bra has a cup size called the ideal size. The ideal size is usually C-cup.
	
The reason we give chests a cup size too is it might be useful when a man tries to wear a bra. It's not necessary, though, and you can omit it if you want.

Now we can use the property in our descriptions.

*:
	After examining some breasts:
		say "They look to be [boob size of noun] cup breasts."
	After examining a bra:
		say "It looks to be a [ideal size of noun] cup."

And we can let the player refer to breasts and bras by their cup size.

*:
	Understand the boob size property as describing some breasts.
	Understand the ideal size property as describing a bra.

If you want, you can adjust who can wear what bras according to cup size.

*:
	Check an actor wearing a bra:
		let K be aa-cup;
		if the actor encloses some breasts (called N):
			now K is the boob size of N;
		if the ideal size of the noun is not K:
			say "[The noun] [don't] fit [regarding the actor][them]." instead.

Bust/waist/hip sizes are a cinch -- ever popular for games from our Japanese friends, they're just three numerical values printed in a sequence.

*:
	A person has a number called the bust size. The bust size is usually 40.
	A person has a number called the waist size. The waist size is usually 30.
	A person has a number called the hip size. The hip size is usually 35.
	
	To say the body measurements of (X - a person):
		say "[bust size of x]-[waist size of x]-[hip size of x]".
	
Now you can go all pervy and ask girls for their measurements.

	After asking a woman about "body measurements":
		say "She bows deeply. 'Senpai-san! I am [the body measurements of the noun]! YATA!'"
		
You can use similar systems to simulate all sorts of clothing sizes, not just bras. 

Section: Clothing Materials

Defining clothing materials is an excellent way of adding some variety to the "you can't do X because Y is in the way" messages without an excessive amount of work. In fact, I'd say if you're doing a big project, using clothing materials is pretty critical to managing your work load. You can also integrate it game mechanics if you so wish. Such a system provides responses like these:

	> You massage Amanda's stomach through the smooth satin.
	> You rub your cock fruitlessly over the coarse denim covering Amanda's ass, unable to fuck it.
	> You'd rather not get leather in your mouth.

*:
	A material is a kind of value. The materials are defined by the Table of Clothing Materials.

	Table of Clothing Materials
	material	printed name	feeladjs
	cloth	"cloth"	"nondescript"
	denim	"denim"	"[one of]rough[or]heavy[or]rugged[or]coarse[at random]"
	lace	"lace"	"[one of]embroidered[or]bumpy[or]textured[at random]"
	leather	"leather"	"[one of]cool[or]rugged[or]cracked[or]heavy[at random]"
	suede	"leather"	"[one of]supple[or]soft[or]velvety[or]warm[at random]"
	permanent press	"cloth"	"[one of]smooth[or]plain[or]gentle[or]mild[at random]"
	satin	"satin"	"[one of]smooth[or]silky[or]sleek[or]fluid[at random]"
	insulated	"cloth"	"[one of]thick[or]plush[or]yielding[at random]"

	Every garment has a material. The material of a garment is usually cloth.

	To say the material of (N - a garment):
		say "[printed name of material of N]".

	To say the texture of (N - a garment):
		say "[feeladjs of material of N]".

The sample game for the AIF Toolkit, The Concession Stand, uses the materials throughout the game, and so hopefully looking through that will give you plenty of ideas.

Section: Garments You Can't Rub Through

For this example, we're assuming things are either pliable enough to allow rubbing, or rigid where you can't rub through it.

*:
	A garment can be rubthru. A garment is usually rubthru.

	Last check an actor rubbing a body part (this is the see whether the garment can be rubbed through rule):
		unless the noun is exposed:
			repeat with X running through garments worn by the sex partner:
				if X could fit over the noun and X is not rubthru:
					say "[The x] [are] too thick to rub through." instead.

This is a very simple rule that stops any rubbing if there is any garment that isn't "rub thru". If you want a system where clothing mitigates rubbing, the documentation OrA will give you advice on that.

Chapter: Arousal System

The arousal system presented in Orgasms and Arousal (OrA) is very basic, for good reason. It was designed to be modified. Some have commented that it isn't that good. I understand that -- it wasn't intended to be good out of the box. Think of it as a blank slate with which you can make your own system.

OrA already includes a recipe book on modifying the arousal system. I refer you to that. However, I do have some recommendations that might be helpful.

1) Change the Orgasm Threshold to something like 100, and increase the sensitivity of most orgasmic objects to something around 5. This means it takes about 20 actions to get someone to orgasm -- slow enough for plenty of variety, but not so slow sex is tedious.

2) Handle how rubbing through clothes works. Does it cause orgasm? (see Garments You Can't Rub Through)

3) Handle how rubbing the ass works. By default, it's not certain if the ass is the fleshy area or the hole area. This becomes an important distinction in OrA, because rubbing one will cause orgasm and the other won't. The What an Ass! extension does this for you.

4) Arousal purely measures proximity to orgasm, not general lustfulness. So don't write code like "if Judy is feeling unaroused: say 'Judy doesn't look interested.'" If you want a variable that tracks lustfulness, it is better to make a new variable entirely.

Chapter: Structural Features

Section: Unlocking New Actions

Master of the House by Minterlint had a very innovative "action unlocking" system where you could discover new actions by searching the environment. I thought a little about how one might implement that in Inform 7. It isn't that difficult.

First of all, make an action as described in the various Inform 7 documentation. Then, when you write the understand tokens, add something like this instead.

*:
	Unlockfootjob is a truth state that varies.
	Understand "footjob [something]" as footjobbing when unlockfootjob is true.

Now, all you need to do is switch on footjobbing action.

	After examining the art of footjobs:
		say "You read the book and learn everything there is to know about footjobs.";
		now unlockfootjob is true.

Another note: it's important you account for all the redirect rules you've written, or else there's a good chance players will accidentally stumble upon action before it's supposed to be unlocked. 

Section: Willingness and other Variables

It's a very typical AIF trope that characters "refuse" harder actions before trying softer ones. Simpler AIF uses a sex-tracking system to simulate this, but traditionally it's been implemented through some sort of numeric value, much like arousal. Such a thing is fairly easy to implement, and you can use the same framework to simulate other things if you wish. For example, you could have a stat called "satisfaction" which measures how well a character thinks of your performance, or "annoyance" which shows how many times you've irritated the NPC by doing actions they didn't like.

The following is an example framework for such a system.

 *:
	A person has a number called satisfaction. The satisfaction is usually 0.

	The satisfier rules are an action based rulebook.
	
	Carry out an actor rubbing something:
		follow the satisfier rules.
	Carry out an actor licking something:
		follow the satisfier rules.
	Carry out an actor fucking something with something:
		follow the satisfier rules.

OK, so let's say Annette likes anal but hates giving blowjobs. Let's make some satisfier rules.

*:
	Satisfier for fucking Annette's ass with something:
		increase the satisfaction of Annette by 1.
	Satisfier for Annette licking a cock:
		decrease the satisfaction of Annette by 1.

Let's make it so Annette doesn't want to give a blowjob until she's been pleasured a little.

*:
	Willingness for Annette licking a cock:
		if the satisfaction of Annette is greater than 4:
			willing;
		else:
			say "Annette shakes her head. 'No way. I hate doing that. You have to do something for me first.'";
			unwilling.

Of course, there are multiple ways you could implement these sorts of things, this is just one idea.

Section: Achievements

Achievements are easy to implement and the only real challenge to making them work is ensuring  they don't trigger multiple times. There are many ways to skin a cat here, this is just one method you can put into practice.

We can start by defining the achievements by a table.

*:
	An achievement is a kind of value. The achievements are defined by the Table of Achievement
	
	Table of Achievement
	achievement	printed named	triggered	points award	description
	SexWithStacey	"Sex with Stacey"	false	10	"You had sex with Stacey!"
	SexWithTiffany	"Sex with Tiffany"	false	10	"You had sex with Tiffany!"
	
Now we make phrases to award achievements.

*:
	To award (X - an achievement):
		unless the triggered of X is true:
			now the triggered of X is true;
			say "[printed name of x]: [description of x] You gained [points award of X]!"

And it's not an achievement unless you can pull them out and admire them.

*:
	To print all achievements:
		repeat with X running through achievements:
			if the triggered of X is false:
				next;
			else:
				say "[printed name of x]: [description of x][line break]".
	
	Reviewing achievements is an action out of world applying to nothing. Understand "achievements" as reviewing achievements.
	
	Carry out reviewing achievements:
		print all achievements.

Chapter: Commands

Section: Give It To Me! or Situational Sex Commands

	It's been a long time for this moment, and you never quite imagined you'd find Terri on her knees before you, her ass cheeks seperated by a pair of shivering, red hands. She practically croons as she turns around and tells you, in a hoarse whisper, "Go on, give it to me!"
	
	>GIVE IT TO HER
	
	I'm not sure what 'it' refers to.

You'll occasionally run into a situation where a non-typical command really should do something entirely different. While most veterans will likely try "FUCK PUSSY", contrarians and noobs might try "GIVE IT TO HER", and it's elegant if the game responds correctly.

This neat solution makes it so I7 understands "give my cock to Stephanie" means fucking her, and then we give I7 a hint about the pronouns with the SET PRONOUNS FROM (an object) phrase. 

*:
	When play begins:
		say "It's been a long time for this moment, and you never quite imagined you'd find Terri on her knees before you, her ass cheeks seperated by a pair of shivering, red hands. She practically croons as she turns around and tells you, in a hoarse whisper, 'Go on, give it to me!'";
		set pronouns from your cock;
		set pronouns from Terri.
	
	Redirect giving your cock to Terri:
		try fucking Terri's pussy with your cock.

Okay, so that works. But let's say Terri instead says something completely bizarre that would make no sense in any other context, like, "Oh Harry, let me be your Hermione, come on, cast expecto patronum all over me!" Here, we want the game to understand "cast expecto patronum on" means "fuck", but only in the context of this scene.

*:
	The roleplaysex is a scene. The roleplaysex begins when play begins.

	When roleplaysex begins:
		say "It's been a long time for this moment, and you never quite imagined you'd find Terri on her knees before you, her ass cheeks seperated by a pair of shivering, red hands. She practically croons as she turns around and tells you, in a hoarse whisper, 'Oh Harry, let me be your Hermione, come on, cast expecto patronum all over me!'";
		set pronouns from your cock;
		set pronouns from Terri.
		
	Understand "Hermione" as Terri when roleplaysex is happening.
	Understand "Hermione's" as a thing when the item described is enclosed by Terri and roleplaysex is happening.
	Understand "cast expecto patronum on [something]" or "cast expecto patronum all over [something]" as fucking when roleplaysex is happening.

Even more situational commands are possible, such as a command that only makes sense immediately after some event (I'm sure there are examples, I can't think of one off the top of my head). This would require some sort of flag that is lowered immediately after use, and works basically with the same principles above.

To go overboard, you can make it so Terri doesn't like being called 'Terri' during this scene.

*:
	After reading a command when roleplaysex is happening:
		if the player's command includes "Terri" or the player's command includes "Terri's":
			say "'I'm not *Terri*, I'm *Hermione*. What the fuck am I paying you $50 for?'[paragraph break]'Sorry! Sorry!' you say.";
			reject the player's command.

We could go crazier, we could rename Terri "Hermione" for the remainder of the scene, but that's a bit beyond the scope of this section and would require some of the complex naming methods described above.

Section: Conversational Sex Commands

One of the big, gaping holes in Simpler AIF is the lack of conversational sex commands, or commands using the format:

	>ASK STEPHANIE ABOUT BLOWJOB
	
It's quite nice to have Stephanie respond neatly to this request, contextually. However, this is really dependent on the specific conversation extension you choose. There are many to pick from, each with advantages and drawbacks, and it's nearly impossible to provide a neat solution that will work with anything you pick. However, most of them allow for author-defined subjects, and this is generally where we can begin.

*:
	sbblowjob is a subject.
		The printed name is "blowjob".
		Understand "blowjob" and "blow job" as sbblowjob.

The use of the "sb" prefix is a personal thing I do to avoid namespace errors, you don't have to use it. The important thing is that we've defined a subject, "blowjob".

This is where things are very much dependent on the conversation extension you use. Many conversation extensions handle things using special rulebooks, you'll have to look at the individual extension if you want to know the specifics. Generally, these extensions will use "quizzing" as a synonym for "asking".

	After quizzing Stephanie about sbblowjob:
		if Stephanie is sex ready:
			try Stephanie licking the cock of the player;
		else:
			say "Stephanie licks her lips. 'I love giving blowjobs.'"

As a rule of thumb, these should be treated like questions outside of sex scenes, and treated like commands outside of sex scenes.

Chapter: Technical Troubleshooting

Section: Memory Issues

While I'm not big expert in the internals of I7, in my experience the two biggest drains on memory are 1) properties of objects and 2) various-to-various relations. Minimizing the use of both these things will help optimize your game, but the former is better than the latter. 

What does I7 handle well? Well, buckets and buckets of rules, apparently. You have to have a tremendous number of rules to begin to drain on the game, so use those instead wherever possible.

As a rule of thumb, you should use a property or relation if:

1) If you expect a property to be used frequently (i.e. every turn or nearly every turn).

2) If you expect a value property to be unpredictable and incalculable at any given moment. For example, the arousal property for people is unpredictable and is based on a series of prior events, but clothing coverage can be implied by what sort of clothing they're wearing.

3) If you expect to arbitrarily change of the value of a property or relation. For example, the orgasm threshold is mostly static but it's concievable that an author might want to make it very low or very high for whatever reason.

This is why, for example, the sensitivity of a body part in OrA is generated by a rulebook, while the orgasm threshold is not. However, for simple or small games, it's pretty unlikely you'll run into memory issues, so you have a lot more flexibility to use whatever systems you're most comfortable with.

Section: Namespace Issues

If you have a lot of similar-named objects, you are likely to run into namespace issues sooner rather than later. After all, if you have a big map, you might have something like a dozen generic tables, and it may seem odd to keep using conventions like "walnut table", "redwood table", "oak table", "plastic table" etc when you just need them as background decoration.

Perhaps the simplest method is to simply give each object internal, numbered names.

	The table1 is a supporter.
		Understand "table" as table1.
		The printed name is "table".

There are other methods that are highly individual to the author. For example, when I make a new variable, I give it a prefix: "#" for number variables, "%" for true/false variables, and "$" for object variables, so a number variable tracking awesomeness would be "#awesomeness". Whatever you use, you just need to remember you gave it an internal name. If we were really anal, we could also include:

	Table1 is privately-named.
	
Which ensures that the player can't type "table1" and have it refer to that table. As you can imagine, it's rarely going to crop up but the feature is occasionally useful.

Complications arise, however, if there's a possibility of a disambiguation loop, which is especially problematic if you're using a conversation extension. Take this an example:

	>ASK MASAMI ABOUT TABLE
	
	Which do you mean, the table, the table, the table, the table or the table?

The easiest way to fix this issue is to use the Numbered Disambiguation Choices by Aaron Reed. That will allow us to at least break out of the loop, but it doesn't help clarify which table we are talking about. Luckily, there's things we can do about this too.

	After printing the name of a supporter (called N) while asking which do you mean:
		say " in [the location of N]".
	
Which should result in:

	>ASK MASAMI ABOUT TABLE
	
	Which do you mean, 1) the table in the drawing room, 2) the table in the kitchen, 3) the table in the living room, 4) the table in the S&M dungeon, or 5) the table in your ass?

Which is at least a lot more understandable. Of course, it's even neater if we can use Disambiguation Control to provide the parser with the most likely choice.

	>ASK MASAMI ABOUT TABLE
	(The only visible table, of course)
	
	"Ah yes," Masami replies, "that's where my husband used to tie me up and fuck my brains out."
	
These example illustrates the principles I've just laid out.

*:
	"Pervert Action: Table" by Another Wannabe
	
	Include Numbered Disambiguation Choices by Aaron Reed.

	A table is a kind of supporter.
	Understand "table" as a table.

	The green room is a room.

	The drawing room is a room.
	Here is a table called the table1.
		The printed name of table1 is "table".

	The kitchen is a room.
	Here is a table called the table2.
		The printed name of table2 is "table".

	The living room is a room.
	Here is a table called the table3.
		The printed name of table3 is "table".

	The S&M dungeon is a room.
	Here is a table called the table4.
		The printed name of table4 is "table".

	your anus is a room.
	Here is a table called the table5.
		The printed name of table5 is "table".

	Masami is a woman in the green room.

	table-asking it about is an action applying to two visible things.

	Understand "ask [Masami] about [table]" as table-asking it about.

	After deciding the scope of the player when table-asking:
		repeat with x running through all tables:
			place x in scope.

	After printing the name of a supporter (called N) while asking which do you mean:
		say " in [the location of N]".

	After table-asking Masami about table1:
		say "'Ah yes,' Masami replies, 'that's where my husband used to tie me up and fuck my brains out.'"
	After table-asking Masami about table5:
		say "'That is an impressive feat,' Masami nods."

	Report table-asking Masami about something:
		say "'Oh, that table is quite boring and has never been used for fucking, I assure you.'"



Example: * Project Template - A template you can use to organize your AIF projects.

Every person has their own methods to organizing source code. Provided is a template of how I organize my own.

If you click the Index tab and then Contents, you'll see a comprehensive list of all your headings, and the objects that are defined under those headings. Sometimes I7 guesses wrong, and puts things under the wrong headings. This method of organizing will ensure that every object is listed under the correct heading for easy access. It also reduces the chances of compiler issues.

This template also tries to make thing visually more identifiable during quick browsing by making more distinctive headings. This template uses the following format:

	VOLUME VII - TITLE
	BOOK 7 - TITLE
	PART VII - Title
	Chapter 7 - Title
	section f - title
	
When a new object is defined, the properties are given seperate tabs for easy identification.

	The gizmo is a thing.
		The description is "It's a gizmo."
		The velocity is 6.
		The mood is angry.

When you start a new project, simply paste this in, and remove the paranthetical notes (the examples don't allow for comments, so this is a necessary evil for clarity's sake).

*:
	"A Superbly Well-Organized Project" by Your Name Here
	
	Include Basic Screen Effects by Emily Short.
	Include Disambiguation Control by Jon Ingold.
	Include Simpler AIF by Another Wannabe.

	(Put all your use options here.)

	The story headline is "A Fucking Awesome Story".
	The story genre is "Fiction".
	The release number is 1.
	The story description is "Ok, it's about a teenager who finds out he's a wizard."

	VOLUME I - RULES

	BOOK 1 - PRESENTATION

	PART I - Multimedia

	Chapter 1 - Figures

	(If we have figures we declare them here.)

	Chapter 2 - Sound

	(If we have sounds we declare them here.)

	PART II - Typography

	Chapter 1 - Typographic Shorthand

	section a - paragraph control shorthand

	To say lb -- running on
		(documented at phs_linebreak):
		(- new_line; -).
	To say nlb -- running on
		(documented at phs_nolinebreak): do nothing.
	To say cpb -- running on
		(documented at phs_condparabreak):
		(- DivideParagraphPoint(); -).
	To say ccb -- running on
		(documented at phs_clarifbreak):
		(- CommandClarificationBreak(); -).
	To say pb -- running on
		(documented at phs_parabreak):
		(- DivideParagraphPoint(); new_line; -).
	To say rpo -- running on
		(documented at phs_runparaon):
		(- RunParagraphOn(); -).

	section b - typographical shorthand

	To say bt -- running on
		(documented at phs_bold):
		(- style bold; -).
	To say lt -- running on
		(documented at phs_italic):
		(- style underline; -).
	To say rt -- running on
		(documented at phs_roman):
		(- style roman; -).
	To say fls -- running on
		(documented at phs_fixedspacing):
		(- font off; -).
	To say vls -- running on
		(documented at phs_varspacing):
		(- font on; -).

	Chapter 2 - Addition Typographic Functions

	section a - pause game

	To prompt for keypress:
		say "[lt]Press any key...[rt][pb]";
		wait for any key.

	section b - additional things

	(Put addition typographic functions here, including custom fonts and such.)

	PART III - Screen

	Chapter 1 - Status Line

	(If we want to customize the status line, here is where we put it.)

	Chapter 2 - Windows

	(If we want additional windows, here is where we declare them.)

	BOOK 2 - WORLD MODELING

	(Here we put all the world modeling specific to the game. For example, if we want to customize how sex works, we might write it here, in addition to any other physics we want. We also write any new actions we might have right here.)

	BOOK 3 - LIBRARY MESSAGES

	(Here we input custom library messages.)

	BOOK 4 - HELP

	(If we have a help file or function, we put it here.)

	VOLUME II - GAME WORLD

	BOOK 1 - OBJECTS

	(Here we define especially complex objects in-game, not ones which are merely scenery, but those that will be held and used extensively within the game. An example might be a laptop that is used to feed the player information throughout.

	One note. If we want these to show up properly in the index, we should only place them in the game world once the containing object is defined, whether than be person, room, or other thing.

	If we have a lot of complex objects, it might be useful put similar ones under a Part heading)

	Chapter X - Complex Object

	The complex thing is a thing.

	Chapter Y - Complicated Object

	The complicated thing is a thing.

	BOOK 2 - CHARACTERS

	(Major characters are placed under their "part" heading (mostly ones involved in sex scenes), while minor ones get a chapter heading.

	Again, we DO NOT place them in the world just yet.)

	PART I - The Player Character

	The player is male. The player is heterosexual.

	Chapter 1 - Our Body Parts

	(Here we place any rules and descriptions of any body parts we might have.)
	The description of your cock is "Really, really big."

	Chapter 2 - Our Clothes

	(Here we go over any clothes the player might have. If we have ALC, we define our clothes here, else, we'll just write descriptions depending on our layer number.)

	Chapter 3 - Our Inventory

	(If we defined any complex objects, we can now place them into our inventory, as well as any minor objects we have.)

	The player is carrying the complex thing.

	PART II - Major Character

	(Here we define a major NPC. An NPC we can sleep with qualifies as a major character, in addition to any others that may or may not have a role within the game.)
	Lilah is a woman.
		She is bisexual.

	Chapter 1 - Lilah's Body Parts

	Chapter 2 - Lilah's Clothes

	Chapter 3 - Lilah's Conversation

	(Here, we place Lilah's conversation responses.)

	PART III - Minor Characters

	(All minor characters go under the same heading.)

	Chapter 1 - Sam

	Sam is a person. Sam is male.

	BOOK 3 - ROOMS

	(Finally, we place all our rooms. If we have a small map, we can put each room under its own chapter heading. Otherwise, we'll group them into regions.)

	PART I - Our House

	Chapter 1 - Big Room

	(Once we define a room, we can finally start placing people into them.)
	The big room is a room.
		Lilah is in the big room.
		The player is in the big room.

	Chapter 2 - Small Room

	(When defining map connections, it is good practice to define the connection after the connecting room is created. This ensures the room is placed correctly in the index.)
	The small room is a room.
		It is north of the big room.
		Sam is in the small room.
		The complicated thing is in the small room.

	Chapter 3 - Region

	(If we have regions, we define them after we've defined the rooms.)
	The game map is a region.
		The big room and the small room are in the game map.

	VOLUME III - SCENES

	(Finally, we define the game's scenes. Here is where we will use all of the people, objects and rooms we've defined earlier in the text.

	I7 allows you to have nested scenes. For example, you can have a "beginning" that starts with Scene A goes to Scene B and ends Scene C. We can use these to organize scenes into broad "acts" and also organize non-linear stories. Each Act goes under its own Book heading, and individual scenes go into Part.)

	BOOK 1 - FIRST ACT


	When play begins:
		say "HAY GUYZ THANKS 4 PLAYING MY 1ST GAME!!!!1!"

	The first act is a scene.
		The first act begins when play begins.
		
	PART I - Scene A

	SceneA is a scene.
		SceneA begins when the first act begins.
		SceneA ends when the player is in the small room.

	PART II - Scene B

	When SceneB begins:
		say "This is such a great scene!"

	SceneB is a scene.
		SceneB begins when SceneA ends.
		SceneB ends when Lilah is sex ready.
		
	After asking Lilah about "sex" during SceneB:
		now Lilah is sex ready.
		
	PART III - Scene C

	When SceneC begins:
		say "Lilah says, 'I'm ready for you.'"

	SceneC is a scene.
		SceneC begins when SceneB ends.
		SceneC ends when the player is in the small room.
		
	Chapter 1 - Sex Prose

	(If we happen to run into a sex scene, this is where we write the prose for it. We could also paste a template here.)

	PART IV - First Act End

	The first act ends when SceneC ends.

	When first act ends:
		say "Life ends eventually as does yours.";
		end the story.

Example: ** Basic Sex Scene Template - A template you can use as the basis for sex scenes that only use the Simpler AIF extension.

It's really annoying to have to write out rules constantly. This is a sex scene template you can drop into your projects. With just a little bit of work, you've already got the bones of a sex scene that just needs to be fleshed out.

To use the template:

1) Paste the sections that you want/need.

2) Find & Replace (using CTRL+H) all instances of NPC1 with the name of a character. If your scene includes more than one NPC, you'll also need to CTRL+H NPC2 with a second name.

3) Delete any actions that don't make sense in the context of your game. For example, your game might not have certain body parts, or the NPC might be male and not have breasts, for example. If you have a penile- or orificial-focused plugin, you'll want to delete all fucking actions where the actor is fucking with that thing. It should be pretty obvious what you don't need at this point.

4) Replace all capitalized text. You can also add more variations if you feel inclined.

5) If this is scene-specific sex, you'll want to add "during SCENE" to the end of each rule.

Before you start writing your first scene, I'd highly recommend taking this template, changing it so it's useful for you, and then use it as the template for all of your other scenes.

Player self-actions.

*:
	section a - self player actions

	After stripping yourself:
		say "YOU STRIP YOURSELF."
	After rubbing your ass:
		say "YOU RUB YOUR ASS."
	After rubbing your face:
		say "YOU RUB YOUR FACE."
	After rubbing your tummy:
		say "YOU RUB YOUR TUMMY."
	After rubbing your legs:
		say "YOU RUB YOUR TUMMY."

	After rubbing your pussy:
		say "YOU RUB YOUR PUSSY."
	After rubbing your breasts:
		say "YOU RUB YOUR BREASTS."
	After licking your breasts:
		say "YOU LICK YOUR BREASTS."
		
	After rubbing your cock:
		say "YOU RUB YOUR COCK."
	After rubbing your chest:
		say "YOU RUB YOUR CHEST."

NPC self actions

*:
	section b - npc self actions

	After NPC1 stripping NPC1:
		say "NPC1 STRIPS HERSELF."
	After NPC1 rubbing NPC1'S ass:
		say "[one of]NPC1 RUBS HER ASS[or]NPC1 RUBS HER ASS AGAIN[stopping]."
	After NPC1 rubbing NPC1'S face:
		say "[one of]NPC1 RUBS HER FACE[or]NPC1 RUBS HER FACE AGAIN[stopping]."
	After NPC1 rubbing NPC1'S tummy:
		say "[one of]NPC1 RUBS HER TUMMY[or]NPC1 RUBS HER TUMMY AGAIN[stopping]."
	After NPC1 rubbing NPC1'S legs:
		say "[one of]NPC1 RUBS HER LEGS[or]NPC1 RUBS HER LEGS AGAIN[stopping]."

	After NPC1 rubbing NPC1'S breasts:
		say "[one of]NPC1 RUBS HER BREASTS[or]NPC1 RUBS HER BREASTS AGAIN[stopping]."
	After NPC1 rubbing NPC1'S pussy:
		say "[one of]NPC1 RUBS HER PUSSY[or]NPC1 RUBS HER PUSSY AGAIN[stopping]."
	After NPC1 licking NPC1'S breasts:
		say "[one of]NPC1 LICKS HER BREASTS[or]NPC1 LICKS HER BREASTS AGAIN[stopping]."
		
	After NPC1 rubbing NPC1'S cock:
		say "[one of]NPC1 RUBS HIS COCK[or]NPC1 RUBS HIS COCK AGAIN[stopping]."
	After NPC1 rubbing NPC1'S chest:
		say "[one of]NPC1 RUBS HIS CHEST[or]NPC1 RUBS HIS CHEST AGAIN[stopping]."

PCs doing stuff to NPCs.

*:
	section c - interacting with npcs

	After stripping NPC1:
		say "YOU STRIP NPC1."
	After kissing NPC1:
		say "YOU KISS NPC1."
	After rubbing NPC1's ass:
		say "[one of]YOU RUB NPC1's ASS[or]YOU RUB NPC1's ASS AGAIN[stopping]."
	After rubbing NPC1's face:
		say "[one of]YOU RUB NPC1's FACE[or]YOU RUB NPC1's FACE AGAIN[stopping]."
	After rubbing NPC1's tummy:
		say "[one of]YOU RUB NPC1's TUMMY[or]YOU RUB NPC1's TUMMY AGAIN[stopping]."
	After rubbing NPC1's legs:
		say "[one of]YOU RUB NPC1's LEGS[or]YOU RUB NPC1's LEGS AGAIN[stopping]."
	After licking NPC1's ass:
		say "[one of]YOU LICK NPC1's ASS[or]YOU LICK NPC1's ASS AGAIN[stopping]."
	After licking NPC1's legs:
		say "[one of]YOU LICK NPC1's LEGS[or]YOU LICK NPC1's LEGS AGAIN[stopping]."
	After licking NPC1's tummy:
		say "[one of]YOU LICK NPC1's TUMMY[or]YOU LICK NPC1's TUMMY AGAIN[stopping]."

	After rubbing NPC1's breasts:
		say "[one of]YOU LICK NPC1's BREASTS[or]YOU RUB NPC1's BREASTS AGAIN[stopping]."
	After rubbing NPC1's pussy:
		say "[one of]YOU RUB NPC1's PUSSY[or]YOU RUB NPC1's PUSSY AGAIN[stopping]."
	After licking NPC1's breasts:
		say "[one of]YOU LICK NPC1's BREASTS[or]YOU LICK NPC1's BREASTS AGAIN[stopping]."
	After licking NPC1's pussy:
		say "[one of]YOU LICK NPC1's PUSSY[or]YOU LICK NPC1's PUSSY AGAIN[stopping]."

	After fucking NPC1's face with your cock:
		say "[one of]YOU FUCK NPC1's FACE[or]YOU FUCK NPC1's FACE AGAIN[stopping]."
	After fucking NPC1's breasts with your cock:
		say "[one of]YOU FUCK NPC1's BREASTS[or]YOU FUCK NPC1's BREASTS AGAIN[stopping]."
	After fucking NPC1's ass with your cock:
		say "[one of]YOU FUCK NPC1's ASS[or]YOU FUCK NPC1's ASS AGAIN[stopping]."
	After fucking NPC1's pussy with your cock:
		say "[one of]YOU FUCK NPC1's PUSSY[or]YOU FUCK NPC1's PUSSY AGAIN[stopping]."
		
	After fucking NPC1's face with your pussy:
		say "[one of]YOU FUCK NPC1's FACE[or]YOU FUCK NPC1's FACE AGAIN[stopping]."
	After fucking NPC1's pussy with your pussy:
		say "[one of]YOU FUCK NPC1's PUSSY[or]YOU FUCK NPC1's PUSSY AGAIN[stopping]."

	After rubbing NPC1's cock:
		say "[one of]YOU RUB NPC1's COCK[or]YOU RUB NPC1's COCK AGAIN[stopping]."
	After rubbing NPC1's chest:
		say "[one of]YOU RUB NPC1's CHEST[or]YOU RUB NPC1's CHEST AGAIN[stopping]."
	After licking NPC1's cock:
		say "[one of]YOU LICK NPC1's COCK[or]YOU LICK NPC1's COCK AGAIN[stopping]."
	After licking NPC1's chest:
		say "[one of]YOU LICK NPC1's CHEST[or]YOU LICK NPC1's CHEST AGAIN[stopping]."

	After fucking NPC1's cock with your cock:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."
	After fucking NPC1's ass with your cock:
		say "[one of]YOU FUCK NPC1's ASS[or]YOU FUCK NPC1's ASS AGAIN[stopping]."
	After fucking NPC1's cock with your ass:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."

	After fucking NPC1's cock with your pussy:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."
	After fucking NPC1's ass with your breasts:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."

NPCs interacting with you.

*:
	section d - npcs interacting with you

	After NPC1 stripping the player:
		say "NPC1 STRIPS YOU."
	After NPC1 kissing the player:
		say "NPC1 KISSES YOU."
	After NPC1 rubbing your ass:
		say "[one of]NPC1 RUBS YOUR ASS[or]NPC1 RUBS YOUR ASS AGAIN[stopping]."
	After NPC1 rubbing your face:
		say "[one of]NPC1 RUBS YOUR FACE[or]NPC1 RUBS YOUR FACE AGAIN[stopping]."
	After NPC1 rubbing your tummy:
		say "[one of]NPC1 RUBS YOUR TUMMY[or]NPC1 RUBS YOUR TUMMY AGAIN[stopping]."
	After NPC1 rubbing your legs:
		say "[one of]NPC1 RUBS YOUR LEGS[or]NPC1 RUBS YOUR LEGS AGAIN[stopping]."
	After NPC1 licking your ass:
		say "[one of]NPC1 LICKS YOUR ASS[or]NPC1 LICKS YOUR ASS AGAIN[stopping]."
	After NPC1 licking your legs:
		say "[one of]NPC1 LICKS YOUR LEGS[or]NPC1 LICKS YOUR LEGS AGAIN[stopping]."
	After NPC1 licking your tummy:
		say "[one of]NPC1 LICKS YOUR TUMMY[or]NPC1 LICKS YOUR TUMMY AGAIN[stopping]."

	After NPC1 rubbing your breasts:
		say "[one of]NPC1 LICKS YOUR BREASTS[or]NPC1 RUBS YOUR BREASTS AGAIN[stopping]."
	After NPC1 rubbing your pussy:
		say "[one of]NPC1 RUBS YOUR PUSSY[or]NPC1 RUBS YOUR PUSSY AGAIN[stopping]."
	After NPC1 licking your breasts:
		say "[one of]NPC1 LICKS YOUR BREASTS[or]NPC1 LICKS YOUR BREASTS AGAIN[stopping]."
	After NPC1 licking your pussy:
		say "[one of]NPC1 LICKS YOUR PUSSY[or]NPC1 LICKS YOUR PUSSY AGAIN[stopping]."

	After NPC1 fucking your face with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR FACE[or]NPC1 FUCKS YOUR FACE AGAIN[stopping]."
	After NPC1 fucking your breasts with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR BREASTS[or]NPC1 FUCKS YOUR BREASTS AGAIN[stopping]."
	After NPC1 fucking your ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR ASS[or]NPC1 FUCKS YOUR ASS AGAIN[stopping]."
	After NPC1 fucking your pussy with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR PUSSY[or]NPC1 FUCKS YOUR PUSSY AGAIN[stopping]."
		
	After NPC1 fucking your face with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR FACE[or]NPC1 FUCKS YOUR FACE AGAIN[stopping]."
	After NPC1 fucking your pussy with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR PUSSY[or]NPC1 FUCKS YOUR PUSSY AGAIN[stopping]."

	After NPC1 rubbing your cock:
		say "[one of]NPC1 RUBS YOUR COCK[or]NPC1 RUBS YOUR COCK AGAIN[stopping]."
	After NPC1 rubbing your chest:
		say "[one of]NPC1 RUBS YOUR CHEST[or]NPC1 RUBS YOUR CHEST AGAIN[stopping]."
	After NPC1 licking your cock:
		say "[one of]NPC1 LICKS YOUR COCK[or]NPC1 LICKS YOUR COCK AGAIN[stopping]."
	After NPC1 licking your chest:
		say "[one of]NPC1 LICKS YOUR CHEST[or]NPC1 LICKS YOUR CHEST AGAIN[stopping]."

	After NPC1 fucking your cock with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."
	After NPC1 fucking your ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR ASS[or]NPC1 FUCKS YOUR ASS AGAIN[stopping]."
	After NPC1 fucking your cock with NPC1'S ass:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."

	After NPC1 fucking your cock with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."
	After NPC1 fucking your ass with NPC1'S breasts:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."

NPCs interacting with each other. If you have a threesome, you'll need two of these.

*:
	section e - npcs interacting with each other

	After NPC1 stripping NPC2:
		say "NPC1 STRIPS NPC2."
	After NPC1 kissing NPC2:
		say "NPC1 KISSES NPC2."
	After NPC1 rubbing NPC2's ass:
		say "[one of]NPC1 RUBS NPC2's ASS[or]NPC1 RUBS NPC2's ASS AGAIN[stopping]."
	After NPC1 rubbing NPC2's face:
		say "[one of]NPC1 RUBS NPC2's FACE[or]NPC1 RUBS NPC2's FACE AGAIN[stopping]."
	After NPC1 rubbing NPC2's tummy:
		say "[one of]NPC1 RUBS NPC2's TUMMY[or]NPC1 RUBS NPC2's TUMMY AGAIN[stopping]."
	After NPC1 rubbing NPC2's legs:
		say "[one of]NPC1 RUBS NPC2's LEGS[or]NPC1 RUBS NPC2's LEGS AGAIN[stopping]."
	After NPC1 licking NPC2's ass:
		say "[one of]NPC1 LICKS NPC2's ASS[or]NPC1 LICKS NPC2's ASS AGAIN[stopping]."
	After NPC1 licking NPC2's legs:
		say "[one of]NPC1 LICKS NPC2's LEGS[or]NPC1 LICKS NPC2's LEGS AGAIN[stopping]."
	After NPC1 licking NPC2's tummy:
		say "[one of]NPC1 LICKS NPC2's TUMMY[or]NPC1 LICKS NPC2's TUMMY AGAIN[stopping]."

	After NPC1 rubbing NPC2's breasts:
		say "[one of]NPC1 LICKS NPC2's BREASTS[or]NPC1 RUBS NPC2's BREASTS AGAIN[stopping]."
	After NPC1 rubbing NPC2's pussy:
		say "[one of]NPC1 RUBS NPC2's PUSSY[or]NPC1 RUBS NPC2's PUSSY AGAIN[stopping]."
	After NPC1 licking NPC2's breasts:
		say "[one of]NPC1 LICKS NPC2's BREASTS[or]NPC1 LICKS NPC2's BREASTS AGAIN[stopping]."
	After NPC1 licking NPC2's pussy:
		say "[one of]NPC1 LICKS NPC2's PUSSY[or]NPC1 LICKS NPC2's PUSSY AGAIN[stopping]."

	After NPC1 fucking NPC2's face with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's FACE[or]NPC1 FUCKS NPC2's FACE AGAIN[stopping]."
	After NPC1 fucking NPC2's breasts with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's BREASTS[or]NPC1 FUCKS NPC2's BREASTS AGAIN[stopping]."
	After NPC1 fucking NPC2's ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's ASS[or]NPC1 FUCKS NPC2's ASS AGAIN[stopping]."
	After NPC1 fucking NPC2's pussy with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's PUSSY[or]NPC1 FUCKS NPC2's PUSSY AGAIN[stopping]."
		
	After NPC1 fucking NPC2's face with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's FACE[or]NPC1 FUCKS NPC2's FACE AGAIN[stopping]."
	After NPC1 fucking NPC2's pussy with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's PUSSY[or]NPC1 FUCKS NPC2's PUSSY AGAIN[stopping]."

	After NPC1 rubbing NPC2's cock:
		say "[one of]NPC1 RUBS NPC2's COCK[or]NPC1 RUBS NPC2's COCK AGAIN[stopping]."
	After NPC1 rubbing NPC2's chest:
		say "[one of]NPC1 RUBS NPC2's CHEST[or]NPC1 RUBS NPC2's CHEST AGAIN[stopping]."
	After NPC1 licking NPC2's cock:
		say "[one of]NPC1 LICKS NPC2's COCK[or]NPC1 LICKS NPC2's COCK AGAIN[stopping]."
	After NPC1 licking NPC2's chest:
		say "[one of]NPC1 LICKS NPC2's CHEST[or]NPC1 LICKS NPC2's CHEST AGAIN[stopping]."

	After NPC1 fucking NPC2's cock with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."
	After NPC1 fucking NPC2's ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's ASS[or]NPC1 FUCKS NPC2's ASS AGAIN[stopping]."
	After NPC1 fucking NPC2's cock with NPC1'S ass:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."

	After NPC1 fucking NPC2's cock with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."
	After NPC1 fucking NPC2's ass with NPC1'S breasts:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."


Example: *** Arousal Sex Scene Template - A template you can use as the basis for sex scenes that only use the Arousal and Orgasm extension.

*:
	section a - self player actions

	Sex prose for stripping yourself:
		say "YOU STRIP YOURSELF."
	Sex prose for rubbing your ass:
		say "YOU RUB YOUR ASS."
	Sex prose for rubbing your face:
		say "YOU RUB YOUR FACE."
	Sex prose for rubbing your tummy:
		say "YOU RUB YOUR TUMMY."
	Sex prose for rubbing your legs:
		say "YOU RUB YOUR TUMMY."

	Sex prose for rubbing your pussy:
		say "YOU RUB YOUR PUSSY."
	Sex prose for rubbing your breasts:
		say "YOU RUB YOUR BREASTS."
	Sex prose for licking your breasts:
		say "YOU LICK YOUR BREASTS."
		
	Sex prose for rubbing your cock:
		say "YOU RUB YOUR COCK."
	Sex prose for rubbing your chest:
		say "YOU RUB YOUR CHEST."
		
	Orgasm prose for rubbing your ass:
		say "YOU ORGASM."
	Orgasm prose for rubbing your pussy:
		say "YOU ORGASM."
	Orgasm prose for rubbing your cock:
		say "YOU ORGASM."

	section b - npc self actions

	Sex prose for NPC1 stripping NPC1:
		say "NPC1 STRIPS HERSELF."
	Sex prose for NPC1 rubbing NPC1'S ass:
		say "[one of]NPC1 RUBS HER ASS[or]NPC1 RUBS HER ASS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S face:
		say "[one of]NPC1 RUBS HER FACE[or]NPC1 RUBS HER FACE AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S tummy:
		say "[one of]NPC1 RUBS HER TUMMY[or]NPC1 RUBS HER TUMMY AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S legs:
		say "[one of]NPC1 RUBS HER LEGS[or]NPC1 RUBS HER LEGS AGAIN[stopping]."

	Sex prose for NPC1 rubbing NPC1'S breasts:
		say "[one of]NPC1 RUBS HER BREASTS[or]NPC1 RUBS HER BREASTS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S pussy:
		say "[one of]NPC1 RUBS HER PUSSY[or]NPC1 RUBS HER PUSSY AGAIN[stopping]."
	Sex prose for NPC1 licking NPC1'S breasts:
		say "[one of]NPC1 LICKS HER BREASTS[or]NPC1 LICKS HER BREASTS AGAIN[stopping]."
		
	Sex prose for NPC1 rubbing NPC1'S cock:
		say "[one of]NPC1 RUBS HIS COCK[or]NPC1 RUBS HIS COCK AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S chest:
		say "[one of]NPC1 RUBS HIS CHEST[or]NPC1 RUBS HIS CHEST AGAIN[stopping]."

	Orgasm prose for NPC1 rubbing NPC1's ass:
		say "NPC1 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC1's pussy:
		say "NPC1 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC1's cock:
		say "NPC1 ORGASMS."

	section c - interacting with npcs

	Sex prose for stripping NPC1:
		say "YOU STRIP NPC1."
	Sex prose for kissing NPC1:
		say "YOU KISS NPC1."
	Sex prose for rubbing NPC1's ass:
		say "[one of]YOU RUB NPC1's ASS[or]YOU RUB NPC1's ASS AGAIN[stopping]."
	Sex prose for rubbing NPC1's face:
		say "[one of]YOU RUB NPC1's FACE[or]YOU RUB NPC1's FACE AGAIN[stopping]."
	Sex prose for rubbing NPC1's tummy:
		say "[one of]YOU RUB NPC1's TUMMY[or]YOU RUB NPC1's TUMMY AGAIN[stopping]."
	Sex prose for rubbing NPC1's legs:
		say "[one of]YOU RUB NPC1's LEGS[or]YOU RUB NPC1's LEGS AGAIN[stopping]."
	Sex prose for licking NPC1's ass:
		say "[one of]YOU LICK NPC1's ASS[or]YOU LICK NPC1's ASS AGAIN[stopping]."
	Sex prose for licking NPC1's legs:
		say "[one of]YOU LICK NPC1's LEGS[or]YOU LICK NPC1's LEGS AGAIN[stopping]."
	Sex prose for licking NPC1's tummy:
		say "[one of]YOU LICK NPC1's TUMMY[or]YOU LICK NPC1's TUMMY AGAIN[stopping]."

	Sex prose for rubbing NPC1's breasts:
		say "[one of]YOU LICK NPC1's BREASTS[or]YOU RUB NPC1's BREASTS AGAIN[stopping]."
	Sex prose for rubbing NPC1's pussy:
		say "[one of]YOU RUB NPC1's PUSSY[or]YOU RUB NPC1's PUSSY AGAIN[stopping]."
	Sex prose for licking NPC1's breasts:
		say "[one of]YOU LICK NPC1's BREASTS[or]YOU LICK NPC1's BREASTS AGAIN[stopping]."
	Sex prose for licking NPC1's pussy:
		say "[one of]YOU LICK NPC1's PUSSY[or]YOU LICK NPC1's PUSSY AGAIN[stopping]."

	Sex prose for fucking NPC1's face with your cock:
		say "[one of]YOU FUCK NPC1's FACE[or]YOU FUCK NPC1's FACE AGAIN[stopping]."
	Sex prose for fucking NPC1's breasts with your cock:
		say "[one of]YOU FUCK NPC1's BREASTS[or]YOU FUCK NPC1's BREASTS AGAIN[stopping]."
	Sex prose for fucking NPC1's ass with your cock:
		say "[one of]YOU FUCK NPC1's ASS[or]YOU FUCK NPC1's ASS AGAIN[stopping]."
	Sex prose for fucking NPC1's pussy with your cock:
		say "[one of]YOU FUCK NPC1's PUSSY[or]YOU FUCK NPC1's PUSSY AGAIN[stopping]."
		
	Sex prose for fucking NPC1's face with your pussy:
		say "[one of]YOU FUCK NPC1's FACE[or]YOU FUCK NPC1's FACE AGAIN[stopping]."
	Sex prose for fucking NPC1's pussy with your pussy:
		say "[one of]YOU FUCK NPC1's PUSSY[or]YOU FUCK NPC1's PUSSY AGAIN[stopping]."

	Sex prose for rubbing NPC1's cock:
		say "[one of]YOU RUB NPC1's COCK[or]YOU RUB NPC1's COCK AGAIN[stopping]."
	Sex prose for rubbing NPC1's chest:
		say "[one of]YOU RUB NPC1's CHEST[or]YOU RUB NPC1's CHEST AGAIN[stopping]."
	Sex prose for licking NPC1's cock:
		say "[one of]YOU LICK NPC1's COCK[or]YOU LICK NPC1's COCK AGAIN[stopping]."
	Sex prose for licking NPC1's chest:
		say "[one of]YOU LICK NPC1's CHEST[or]YOU LICK NPC1's CHEST AGAIN[stopping]."

	Sex prose for fucking NPC1's cock with your cock:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."
	Sex prose for fucking NPC1's ass with your cock:
		say "[one of]YOU FUCK NPC1's ASS[or]YOU FUCK NPC1's ASS AGAIN[stopping]."
	Sex prose for fucking NPC1's cock with your ass:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."

	Sex prose for fucking NPC1's cock with your pussy:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."
	Sex prose for fucking NPC1's ass with your breasts:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."

	Orgasm prose for rubbing NPC1's ass:
		say "NPC1 ORGASMS."
	Orgasm prose for rubbing NPC1's pussy:
		say "NPC1 ORGASMS."
	Orgasm prose for rubbing NPC1's cock:
		say "NPC1 ORGASMS."

	Orgasm prose for licking NPC1's ass:
		say "NPC1 ORGASMS."
	Orgasm prose for licking NPC1's pussy:
		say "NPC1 ORGASMS."
	Orgasm prose for licking NPC1's cock:
		say "NPC1 ORGASMS."

	Orgasm prose for fucking NPC1's cock with your cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for fucking NPC1's ass with your cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for fucking NPC1's cock with your ass:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
			
	Orgasm prose for fucking NPC1's cock with your pussy:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for fucking NPC1's cock with your breasts:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."

	Simultaneous orgasm prose for fucking NPC1's cock with your cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for fucking NPC1's ass with your cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for fucking NPC1's cock with your ass:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for fucking NPC1's cock with your pussy:
		say "YOU BOTH ORGASM."


	section d - npcs interacting with you

	Sex prose for NPC1 stripping the player:
		say "NPC1 STRIPS YOU."
	Sex prose for NPC1 kissing the player:
		say "NPC1 KISSES YOU."
	Sex prose for NPC1 rubbing your ass:
		say "[one of]NPC1 RUBS YOUR ASS[or]NPC1 RUBS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 rubbing your face:
		say "[one of]NPC1 RUBS YOUR FACE[or]NPC1 RUBS YOUR FACE AGAIN[stopping]."
	Sex prose for NPC1 rubbing your tummy:
		say "[one of]NPC1 RUBS YOUR TUMMY[or]NPC1 RUBS YOUR TUMMY AGAIN[stopping]."
	Sex prose for NPC1 rubbing your legs:
		say "[one of]NPC1 RUBS YOUR LEGS[or]NPC1 RUBS YOUR LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking your ass:
		say "[one of]NPC1 LICKS YOUR ASS[or]NPC1 LICKS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 licking your legs:
		say "[one of]NPC1 LICKS YOUR LEGS[or]NPC1 LICKS YOUR LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking your tummy:
		say "[one of]NPC1 LICKS YOUR TUMMY[or]NPC1 LICKS YOUR TUMMY AGAIN[stopping]."

	Sex prose for NPC1 rubbing your breasts:
		say "[one of]NPC1 LICKS YOUR BREASTS[or]NPC1 RUBS YOUR BREASTS AGAIN[stopping]."
	Sex prose for NPC1 rubbing your pussy:
		say "[one of]NPC1 RUBS YOUR PUSSY[or]NPC1 RUBS YOUR PUSSY AGAIN[stopping]."
	Sex prose for NPC1 licking your breasts:
		say "[one of]NPC1 LICKS YOUR BREASTS[or]NPC1 LICKS YOUR BREASTS AGAIN[stopping]."
	Sex prose for NPC1 licking your pussy:
		say "[one of]NPC1 LICKS YOUR PUSSY[or]NPC1 LICKS YOUR PUSSY AGAIN[stopping]."

	Sex prose for NPC1 fucking your face with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR FACE[or]NPC1 FUCKS YOUR FACE AGAIN[stopping]."
	Sex prose for NPC1 fucking your breasts with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR BREASTS[or]NPC1 FUCKS YOUR BREASTS AGAIN[stopping]."
	Sex prose for NPC1 fucking your ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR ASS[or]NPC1 FUCKS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking your pussy with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR PUSSY[or]NPC1 FUCKS YOUR PUSSY AGAIN[stopping]."
		
	Sex prose for NPC1 fucking your face with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR FACE[or]NPC1 FUCKS YOUR FACE AGAIN[stopping]."
	Sex prose for NPC1 fucking your pussy with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR PUSSY[or]NPC1 FUCKS YOUR PUSSY AGAIN[stopping]."

	Sex prose for NPC1 rubbing your cock:
		say "[one of]NPC1 RUBS YOUR COCK[or]NPC1 RUBS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 rubbing your chest:
		say "[one of]NPC1 RUBS YOUR CHEST[or]NPC1 RUBS YOUR CHEST AGAIN[stopping]."
	Sex prose for NPC1 licking your cock:
		say "[one of]NPC1 LICKS YOUR COCK[or]NPC1 LICKS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 licking your chest:
		say "[one of]NPC1 LICKS YOUR CHEST[or]NPC1 LICKS YOUR CHEST AGAIN[stopping]."

	Sex prose for NPC1 fucking your cock with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking your ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR ASS[or]NPC1 FUCKS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking your cock with NPC1'S ass:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."

	Sex prose for NPC1 fucking your cock with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking your ass with NPC1'S breasts:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."

	Orgasm prose for NPC1 rubbing your ass:
		say "YOU ORGASM."
	Orgasm prose for NPC1 rubbing your pussy:
		say "YOU ORGASM."
	Orgasm prose for NPC1 rubbing your cock:
		say "YOU ORGASM."

	Orgasm prose for NPC1 licking your ass:
		say "YOU ORGASM."
	Orgasm prose for NPC1 licking your pussy:
		say "YOU ORGASM."
	Orgasm prose for NPC1 licking your cock:
		say "YOU ORGASM."

	Orgasm prose for NPC1 fucking your cock with NPC1's cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking your ass with NPC1's cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking your cock with NPC1's ass:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
			
	Orgasm prose for NPC1 fucking your cock with NPC1's pussy:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking your cock with NPC1's breasts:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."

	Simultaneous orgasm prose for NPC1 fucking your cock with NPC1's cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your ass with NPC1's cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your cock with NPC1's ass:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your cock with NPC1's pussy:
		say "YOU BOTH ORGASM."

	section e - npcs interacting with each other

	Sex prose for NPC1 stripping NPC2:
		say "NPC1 STRIPS NPC2."
	Sex prose for NPC1 kissing NPC2:
		say "NPC1 KISSES NPC2."
	Sex prose for NPC1 rubbing NPC2's ass:
		say "[one of]NPC1 RUBS NPC2's ASS[or]NPC1 RUBS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's face:
		say "[one of]NPC1 RUBS NPC2's FACE[or]NPC1 RUBS NPC2's FACE AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's tummy:
		say "[one of]NPC1 RUBS NPC2's TUMMY[or]NPC1 RUBS NPC2's TUMMY AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's legs:
		say "[one of]NPC1 RUBS NPC2's LEGS[or]NPC1 RUBS NPC2's LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's ass:
		say "[one of]NPC1 LICKS NPC2's ASS[or]NPC1 LICKS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's legs:
		say "[one of]NPC1 LICKS NPC2's LEGS[or]NPC1 LICKS NPC2's LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's tummy:
		say "[one of]NPC1 LICKS NPC2's TUMMY[or]NPC1 LICKS NPC2's TUMMY AGAIN[stopping]."

	Sex prose for NPC1 rubbing NPC2's breasts:
		say "[one of]NPC1 LICKS NPC2's BREASTS[or]NPC1 RUBS NPC2's BREASTS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's pussy:
		say "[one of]NPC1 RUBS NPC2's PUSSY[or]NPC1 RUBS NPC2's PUSSY AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's breasts:
		say "[one of]NPC1 LICKS NPC2's BREASTS[or]NPC1 LICKS NPC2's BREASTS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's pussy:
		say "[one of]NPC1 LICKS NPC2's PUSSY[or]NPC1 LICKS NPC2's PUSSY AGAIN[stopping]."

	After NPC1 fucking NPC2's face with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's FACE[or]NPC1 FUCKS NPC2's FACE AGAIN[stopping]."
	After NPC1 fucking NPC2's breasts with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's BREASTS[or]NPC1 FUCKS NPC2's BREASTS AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's ASS[or]NPC1 FUCKS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's pussy with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's PUSSY[or]NPC1 FUCKS NPC2's PUSSY AGAIN[stopping]."
		
	Sex prose for NPC1 fucking NPC2's face with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's FACE[or]NPC1 FUCKS NPC2's FACE AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's pussy with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's PUSSY[or]NPC1 FUCKS NPC2's PUSSY AGAIN[stopping]."

	Sex prose for NPC1 rubbing NPC2's cock:
		say "[one of]NPC1 RUBS NPC2's COCK[or]NPC1 RUBS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's chest:
		say "[one of]NPC1 RUBS NPC2's CHEST[or]NPC1 RUBS NPC2's CHEST AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's cock:
		say "[one of]NPC1 LICKS NPC2's COCK[or]NPC1 LICKS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's chest:
		say "[one of]NPC1 LICKS NPC2's CHEST[or]NPC1 LICKS NPC2's CHEST AGAIN[stopping]."

	Sex prose for NPC1 fucking NPC2's cock with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's ASS[or]NPC1 FUCKS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's cock with NPC1'S ass:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."

	Sex prose for NPC1 fucking NPC2's cock with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's ass with NPC1'S breasts:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."

	Orgasm prose for NPC1 rubbing NPC2's ass:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC2's pussy:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC2's cock:
		say "NPC2 ORGASMS."

	Orgasm prose for NPC1 licking NPC2's ass:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 licking NPC2's pussy:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 licking NPC2's cock:
		say "NPC2 ORGASMS."

	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's cock:
		if the primary orgasmer is NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking NPC2's ass with NPC1's cock:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's ass:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
			
	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's pussy:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's breasts:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."

	Simultaneous orgasm prose for NPC1 fucking NPC2's cock with NPC1's cock:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's ass with NPC1's cock:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's cock with NPC1's ass:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's cock with NPC1's pussy:
		say "THEY BOTH ORGASM."

Example: **** Penetrative Sex Scene Template - A template you can use if you are using Penetration extension.

This template gives you a good start into a penetrative sex scene. I assume you are not using combined actions or multiple penetrations, as things should get messy. Besides, if you're confident enough to use those use options, you are probably confident enough to know what you are doing even without the use of this template.

Another assumption we're making is that you'll be using hands and faces to track penetration. Of course, if you aren't using these options, -->simply delete the penetration rules that refer to them<--.

You'll also notice I started writing "[the second noun]" instead the objects name in full. I got lazy, so sue me.

Finally, you'll probably find this the most intimidating template in this documentation. It's not nearly as scary as it looks. For one thing, very few players expect responses when they stop doing actions, let alone unique ones for every single action. They are included in the interests of completeness, but you can safely delete most of them and replace them with more genralized rules that covers more actions. Having a penetrating actions means you don't really need to write variations in the Sex Prose rules as much.

*:
	section a - self player actions

	After penetrating your ass with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your face with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your tummy with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your legs with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your pussy with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your breasts with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your cock with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating your breasts with your face:
		say "YOU START LICKING [the noun]."

	After withdrawing your hands exiting your ass:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting your face:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting your tummy:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting your legs:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting your pussy:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting your breasts:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting your cock:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your face exiting your breasts:
		say "YOU STOP LICKING [the original receptacle]."

	Sex prose for stripping yourself:
		say "YOU STRIP YOURSELF."
	Sex prose for rubbing your ass:
		say "YOU RUB YOUR ASS."
	Sex prose for rubbing your face:
		say "YOU RUB YOUR FACE."
	Sex prose for rubbing your tummy:
		say "YOU RUB YOUR TUMMY."
	Sex prose for rubbing your legs:
		say "YOU RUB YOUR TUMMY."

	Sex prose for rubbing your pussy:
		say "YOU RUB YOUR PUSSY."
	Sex prose for rubbing your breasts:
		say "YOU RUB YOUR BREASTS."
	Sex prose for licking your breasts:
		say "YOU LICK YOUR BREASTS."
		
	Sex prose for rubbing your cock:
		say "YOU RUB YOUR COCK."
	Sex prose for rubbing your chest:
		say "YOU RUB YOUR CHEST."
		
	Orgasm prose for rubbing your ass:
		say "YOU ORGASM."
	Orgasm prose for rubbing your pussy:
		say "YOU ORGASM."
	Orgasm prose for rubbing your cock:
		say "YOU ORGASM."

	section b - npc self actions

	After NPC1 penetrating NPC1's ass with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's face with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's tummy with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's legs with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's pussy with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's breasts with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's cock with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC1's breasts with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."

	After NPC1 withdrawing NPC1's hands exiting NPC1's ass:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC1's face:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC1's tummy:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC1's legs:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC1's pussy:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC1's breasts:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC1's cock:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting NPC1's breasts:
		say "NPC1 STOPS LICKING [the original receptacle]."

	Sex prose for NPC1 stripping NPC1:
		say "NPC1 STRIPS HERSELF."
	Sex prose for NPC1 rubbing NPC1'S ass:
		say "[one of]NPC1 RUBS HER ASS[or]NPC1 RUBS HER ASS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S face:
		say "[one of]NPC1 RUBS HER FACE[or]NPC1 RUBS HER FACE AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S tummy:
		say "[one of]NPC1 RUBS HER TUMMY[or]NPC1 RUBS HER TUMMY AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S legs:
		say "[one of]NPC1 RUBS HER LEGS[or]NPC1 RUBS HER LEGS AGAIN[stopping]."

	Sex prose for NPC1 rubbing NPC1'S breasts:
		say "[one of]NPC1 RUBS HER BREASTS[or]NPC1 RUBS HER BREASTS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S pussy:
		say "[one of]NPC1 RUBS HER PUSSY[or]NPC1 RUBS HER PUSSY AGAIN[stopping]."
	Sex prose for NPC1 licking NPC1'S breasts:
		say "[one of]NPC1 LICKS HER BREASTS[or]NPC1 LICKS HER BREASTS AGAIN[stopping]."
		
	Sex prose for NPC1 rubbing NPC1'S cock:
		say "[one of]NPC1 RUBS HIS COCK[or]NPC1 RUBS HIS COCK AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC1'S chest:
		say "[one of]NPC1 RUBS HIS CHEST[or]NPC1 RUBS HIS CHEST AGAIN[stopping]."

	Orgasm prose for NPC1 rubbing NPC1's ass:
		say "NPC1 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC1's pussy:
		say "NPC1 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC1's cock:
		say "NPC1 ORGASMS."

	section c - interacting with npcs

	After penetrating NPC1's ass with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating NPC1's face with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating NPC1's tummy with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating NPC1's legs with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating NPC1's pussy with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating NPC1's breasts with your hands:
		say "YOU START RUBBING [the noun]."
	After penetrating NPC1's cock with your hands:
		say "YOU START RUBBING [the noun]."
		
	After penetrating NPC1's ass with your face:
		say "YOU START LICKING [the noun]."
	After penetrating NPC1's tummy with your face:
		say "YOU START LICKING [the noun]."
	After penetrating NPC1's legs with your face:
		say "YOU START LICKING [the noun]."
	After penetrating NPC1's pussy with your face:
		say "YOU START LICKING [the noun]."
	After penetrating NPC1's breasts with your face:
		say "YOU START LICKING [the noun]."
	After penetrating NPC1's cock with your face:
		say "YOU START LICKING [the noun]."

	After penetrating NPC1's ass with your cock:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's face with your cock:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's pussy with your cock:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's breasts with your cock:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's cock with your ass:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's cock with your cock:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's cock with your pussy:
		say "YOU START FUCKING [the noun]."
	After penetrating NPC1's pussy with your pussy:
		say "YOU START FUCKING [the noun]."

	After withdrawing your hands exiting NPC1's ass:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting NPC1's face:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting NPC1's tummy:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting NPC1's legs:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting NPC1's pussy:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting NPC1's breasts:
		say "YOU STOP RUBBING [the original receptacle]."
	After withdrawing your hands exiting NPC1's cock:
		say "YOU STOP RUBBING [the original receptacle]."
		
	After withdrawing your face exiting NPC1's ass:
		say "YOU STOP LICKING [the original receptacle]."
	After withdrawing your face exiting NPC1's tummy:
		say "YOU STOP LICKING [the original receptacle]."
	After withdrawing your face exiting NPC1's legs:
		say "YOU STOP LICKING [the original receptacle]."
	After withdrawing your face exiting NPC1's pussy:
		say "YOU STOP LICKING [the original receptacle]."
	After withdrawing your face exiting NPC1's breasts:
		say "YOU STOP LICKING [the original receptacle]."
	After withdrawing your face exiting NPC1's cock:
		say "YOU STOP LICKING [the original receptacle]."

	After withdrawing your cock exiting NPC1's ass:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your cock exiting NPC1's face:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your cock exiting NPC1's pussy:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your cock exiting NPC1's breasts:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your ass exiting NPC1's cock:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your cock exiting NPC1's cock:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your pussy exiting NPC1's cock:
		say "YOU STOP FUCKING [the original receptacle]."
	After withdrawing your pussy exiting NPC1's pussy:
		say "YOU STOP FUCKING [the original receptacle]."

	Sex prose for stripping NPC1:
		say "YOU STRIP NPC1."
	Sex prose for kissing NPC1:
		say "YOU KISS NPC1."
	Sex prose for rubbing NPC1's ass:
		say "[one of]YOU RUB NPC1's ASS[or]YOU RUB NPC1's ASS AGAIN[stopping]."
	Sex prose for rubbing NPC1's face:
		say "[one of]YOU RUB NPC1's FACE[or]YOU RUB NPC1's FACE AGAIN[stopping]."
	Sex prose for rubbing NPC1's tummy:
		say "[one of]YOU RUB NPC1's TUMMY[or]YOU RUB NPC1's TUMMY AGAIN[stopping]."
	Sex prose for rubbing NPC1's legs:
		say "[one of]YOU RUB NPC1's LEGS[or]YOU RUB NPC1's LEGS AGAIN[stopping]."
	Sex prose for licking NPC1's ass:
		say "[one of]YOU LICK NPC1's ASS[or]YOU LICK NPC1's ASS AGAIN[stopping]."
	Sex prose for licking NPC1's legs:
		say "[one of]YOU LICK NPC1's LEGS[or]YOU LICK NPC1's LEGS AGAIN[stopping]."
	Sex prose for licking NPC1's tummy:
		say "[one of]YOU LICK NPC1's TUMMY[or]YOU LICK NPC1's TUMMY AGAIN[stopping]."

	Sex prose for rubbing NPC1's breasts:
		say "[one of]YOU LICK NPC1's BREASTS[or]YOU RUB NPC1's BREASTS AGAIN[stopping]."
	Sex prose for rubbing NPC1's pussy:
		say "[one of]YOU RUB NPC1's PUSSY[or]YOU RUB NPC1's PUSSY AGAIN[stopping]."
	Sex prose for licking NPC1's breasts:
		say "[one of]YOU LICK NPC1's BREASTS[or]YOU LICK NPC1's BREASTS AGAIN[stopping]."
	Sex prose for licking NPC1's pussy:
		say "[one of]YOU LICK NPC1's PUSSY[or]YOU LICK NPC1's PUSSY AGAIN[stopping]."

	Sex prose for fucking NPC1's face with your cock:
		say "[one of]YOU FUCK NPC1's FACE[or]YOU FUCK NPC1's FACE AGAIN[stopping]."
	Sex prose for fucking NPC1's breasts with your cock:
		say "[one of]YOU FUCK NPC1's BREASTS[or]YOU FUCK NPC1's BREASTS AGAIN[stopping]."
	Sex prose for fucking NPC1's ass with your cock:
		say "[one of]YOU FUCK NPC1's ASS[or]YOU FUCK NPC1's ASS AGAIN[stopping]."
	Sex prose for fucking NPC1's pussy with your cock:
		say "[one of]YOU FUCK NPC1's PUSSY[or]YOU FUCK NPC1's PUSSY AGAIN[stopping]."
		
	Sex prose for fucking NPC1's face with your pussy:
		say "[one of]YOU FUCK NPC1's FACE[or]YOU FUCK NPC1's FACE AGAIN[stopping]."
	Sex prose for fucking NPC1's pussy with your pussy:
		say "[one of]YOU FUCK NPC1's PUSSY[or]YOU FUCK NPC1's PUSSY AGAIN[stopping]."

	Sex prose for rubbing NPC1's cock:
		say "[one of]YOU RUB NPC1's COCK[or]YOU RUB NPC1's COCK AGAIN[stopping]."
	Sex prose for rubbing NPC1's chest:
		say "[one of]YOU RUB NPC1's CHEST[or]YOU RUB NPC1's CHEST AGAIN[stopping]."
	Sex prose for licking NPC1's cock:
		say "[one of]YOU LICK NPC1's COCK[or]YOU LICK NPC1's COCK AGAIN[stopping]."
	Sex prose for licking NPC1's chest:
		say "[one of]YOU LICK NPC1's CHEST[or]YOU LICK NPC1's CHEST AGAIN[stopping]."

	Sex prose for fucking NPC1's cock with your cock:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."
	Sex prose for fucking NPC1's ass with your cock:
		say "[one of]YOU FUCK NPC1's ASS[or]YOU FUCK NPC1's ASS AGAIN[stopping]."
	Sex prose for fucking NPC1's cock with your ass:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."

	Sex prose for fucking NPC1's cock with your pussy:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."
	Sex prose for fucking NPC1's cock with your breasts:
		say "[one of]YOU FUCK NPC1's COCK[or]YOU FUCK NPC1's COCK AGAIN[stopping]."

	Orgasm prose for rubbing NPC1's ass:
		say "NPC1 ORGASMS."
	Orgasm prose for rubbing NPC1's pussy:
		say "NPC1 ORGASMS."
	Orgasm prose for rubbing NPC1's cock:
		say "NPC1 ORGASMS."

	Orgasm prose for licking NPC1's ass:
		say "NPC1 ORGASMS."
	Orgasm prose for licking NPC1's pussy:
		say "NPC1 ORGASMS."
	Orgasm prose for licking NPC1's cock:
		say "NPC1 ORGASMS."

	Orgasm prose for fucking NPC1's cock with your cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for fucking NPC1's ass with your cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for fucking NPC1's cock with your ass:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
			
	Orgasm prose for fucking NPC1's cock with your pussy:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for fucking NPC1's cock with your breasts:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."

	Simultaneous orgasm prose for fucking NPC1's cock with your cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for fucking NPC1's ass with your cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for fucking NPC1's pussy with your cock:
		say "YOU BOTH ORGASM."	
	Simultaneous orgasm prose for fucking NPC1's cock with your ass:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for fucking NPC1's cock with your pussy:
		say "YOU BOTH ORGASM."


	section d - npcs interacting with you

	After NPC1 penetrating your ass with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating your face with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating your tummy with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating your legs with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating your pussy with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating your breasts with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating your cock with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
		
	After NPC1 penetrating your ass with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating your tummy with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating your legs with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating your pussy with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating your breasts with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating your cock with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."

	After NPC1 penetrating your ass with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your face with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your pussy with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your breasts with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your cock with NPC1's ass:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your cock with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your cock with NPC1's pussy:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating your pussy with NPC1's pussy:
		say "NPC1 STARTS FUCKING [the noun]."

	After NPC1 withdrawing NPC1's hands exiting your ass:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting your face:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting your tummy:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting your legs:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting your pussy:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting your breasts:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting your cock:
		say "NPC1 STOPS RUBBING [the original receptacle]."
		
	After NPC1 withdrawing NPC1's face exiting your ass:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting your tummy:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting your legs:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting your pussy:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting your breasts:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting your cock:
		say "NPC1 STOPS LICKING [the original receptacle]."

	After NPC1 withdrawing NPC1's cock exiting your ass:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting your face:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting your pussy:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting your breasts:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's ass exiting your cock:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting your cock:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's pussy exiting your cock:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's pussy exiting your pussy:
		say "NPC1 STOPS FUCKING [the original receptacle]."

	Sex prose for NPC1 stripping the player:
		say "NPC1 STRIPS YOU."
	Sex prose for NPC1 kissing the player:
		say "NPC1 KISSES YOU."
	Sex prose for NPC1 rubbing your ass:
		say "[one of]NPC1 RUBS YOUR ASS[or]NPC1 RUBS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 rubbing your face:
		say "[one of]NPC1 RUBS YOUR FACE[or]NPC1 RUBS YOUR FACE AGAIN[stopping]."
	Sex prose for NPC1 rubbing your tummy:
		say "[one of]NPC1 RUBS YOUR TUMMY[or]NPC1 RUBS YOUR TUMMY AGAIN[stopping]."
	Sex prose for NPC1 rubbing your legs:
		say "[one of]NPC1 RUBS YOUR LEGS[or]NPC1 RUBS YOUR LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking your ass:
		say "[one of]NPC1 LICKS YOUR ASS[or]NPC1 LICKS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 licking your legs:
		say "[one of]NPC1 LICKS YOUR LEGS[or]NPC1 LICKS YOUR LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking your tummy:
		say "[one of]NPC1 LICKS YOUR TUMMY[or]NPC1 LICKS YOUR TUMMY AGAIN[stopping]."

	Sex prose for NPC1 rubbing your breasts:
		say "[one of]NPC1 LICKS YOUR BREASTS[or]NPC1 RUBS YOUR BREASTS AGAIN[stopping]."
	Sex prose for NPC1 rubbing your pussy:
		say "[one of]NPC1 RUBS YOUR PUSSY[or]NPC1 RUBS YOUR PUSSY AGAIN[stopping]."
	Sex prose for NPC1 licking your breasts:
		say "[one of]NPC1 LICKS YOUR BREASTS[or]NPC1 LICKS YOUR BREASTS AGAIN[stopping]."
	Sex prose for NPC1 licking your pussy:
		say "[one of]NPC1 LICKS YOUR PUSSY[or]NPC1 LICKS YOUR PUSSY AGAIN[stopping]."

	Sex prose for NPC1 fucking your face with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR FACE[or]NPC1 FUCKS YOUR FACE AGAIN[stopping]."
	Sex prose for NPC1 fucking your breasts with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR BREASTS[or]NPC1 FUCKS YOUR BREASTS AGAIN[stopping]."
	Sex prose for NPC1 fucking your ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR ASS[or]NPC1 FUCKS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking your pussy with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR PUSSY[or]NPC1 FUCKS YOUR PUSSY AGAIN[stopping]."
		
	Sex prose for NPC1 fucking your face with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR FACE[or]NPC1 FUCKS YOUR FACE AGAIN[stopping]."
	Sex prose for NPC1 fucking your pussy with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR PUSSY[or]NPC1 FUCKS YOUR PUSSY AGAIN[stopping]."

	Sex prose for NPC1 rubbing your cock:
		say "[one of]NPC1 RUBS YOUR COCK[or]NPC1 RUBS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 rubbing your chest:
		say "[one of]NPC1 RUBS YOUR CHEST[or]NPC1 RUBS YOUR CHEST AGAIN[stopping]."
	Sex prose for NPC1 licking your cock:
		say "[one of]NPC1 LICKS YOUR COCK[or]NPC1 LICKS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 licking your chest:
		say "[one of]NPC1 LICKS YOUR CHEST[or]NPC1 LICKS YOUR CHEST AGAIN[stopping]."

	Sex prose for NPC1 fucking your cock with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking your ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS YOUR ASS[or]NPC1 FUCKS YOUR ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking your cock with NPC1'S ass:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."

	Sex prose for NPC1 fucking your cock with NPC1'S pussy:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking your cock with NPC1'S breasts:
		say "[one of]NPC1 FUCKS YOUR COCK[or]NPC1 FUCKS YOUR COCK AGAIN[stopping]."

	Orgasm prose for NPC1 rubbing your ass:
		say "YOU ORGASM."
	Orgasm prose for NPC1 rubbing your pussy:
		say "YOU ORGASM."
	Orgasm prose for NPC1 rubbing your cock:
		say "YOU ORGASM."

	Orgasm prose for NPC1 licking your ass:
		say "YOU ORGASM."
	Orgasm prose for NPC1 licking your pussy:
		say "YOU ORGASM."
	Orgasm prose for NPC1 licking your cock:
		say "YOU ORGASM."

	Orgasm prose for NPC1 fucking your cock with NPC1's cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking your ass with NPC1's cock:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking your cock with NPC1's ass:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
			
	Orgasm prose for NPC1 fucking your cock with NPC1's pussy:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking your cock with NPC1's breasts:
		if the primary orgasmer is the player:
			say "YOU ORGASM.";
		else:
			say "NPC1 ORGASMS."

	Simultaneous orgasm prose for NPC1 fucking your cock with NPC1's cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your ass with NPC1's cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your pussy with NPC1's cock:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your cock with NPC1's ass:
		say "YOU BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking your cock with NPC1's pussy:
		say "YOU BOTH ORGASM."

	section e - npcs interacting with each other

	After NPC1 penetrating NPC2's ass with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC2's face with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC2's tummy with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC2's legs with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC2's pussy with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC2's breasts with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
	After NPC1 penetrating NPC2's cock with NPC1's hands:
		say "NPC1 STARTS RUBBING [the noun]."
		
	After NPC1 penetrating NPC2's ass with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating NPC2's tummy with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating NPC2's legs with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating NPC2's pussy with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating NPC2's breasts with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."
	After NPC1 penetrating NPC2's cock with NPC1's face:
		say "NPC1 STARTS LICKING [the noun]."

	After NPC1 penetrating NPC2's ass with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's face with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's pussy with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's breasts with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's cock with NPC1's ass:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's cock with NPC1's cock:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's cock with NPC1's pussy:
		say "NPC1 STARTS FUCKING [the noun]."
	After NPC1 penetrating NPC2's pussy with NPC1's pussy:
		say "NPC1 STARTS FUCKING [the noun]."

	After NPC1 withdrawing NPC1's hands exiting NPC2's ass:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC2's face:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC2's tummy:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC2's legs:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC2's pussy:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC2's breasts:
		say "NPC1 STOPS RUBBING [the original receptacle]."
	After NPC1 withdrawing NPC1's hands exiting NPC2's cock:
		say "NPC1 STOPS RUBBING [the original receptacle]."
		
	After NPC1 withdrawing NPC1's face exiting NPC2's ass:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting NPC2's tummy:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting NPC2's legs:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting NPC2's pussy:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting NPC2's breasts:
		say "NPC1 STOPS LICKING [the original receptacle]."
	After NPC1 withdrawing NPC1's face exiting NPC2's cock:
		say "NPC1 STOPS LICKING [the original receptacle]."

	After NPC1 withdrawing NPC1's cock exiting NPC2's ass:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting NPC2's face:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting NPC2's pussy:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting NPC2's breasts:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's ass exiting NPC2's cock:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's cock exiting NPC2's cock:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's pussy exiting NPC2's cock:
		say "NPC1 STOPS FUCKING [the original receptacle]."
	After NPC1 withdrawing NPC1's pussy exiting NPC2's pussy:
		say "NPC1 STOPS FUCKING [the original receptacle]."

	Sex prose for NPC1 stripping NPC2:
		say "NPC1 STRIPS NPC2."
	Sex prose for NPC1 kissing NPC2:
		say "NPC1 KISSES NPC2."
	Sex prose for NPC1 rubbing NPC2's ass:
		say "[one of]NPC1 RUBS NPC2's ASS[or]NPC1 RUBS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's face:
		say "[one of]NPC1 RUBS NPC2's FACE[or]NPC1 RUBS NPC2's FACE AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's tummy:
		say "[one of]NPC1 RUBS NPC2's TUMMY[or]NPC1 RUBS NPC2's TUMMY AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's legs:
		say "[one of]NPC1 RUBS NPC2's LEGS[or]NPC1 RUBS NPC2's LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's ass:
		say "[one of]NPC1 LICKS NPC2's ASS[or]NPC1 LICKS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's legs:
		say "[one of]NPC1 LICKS NPC2's LEGS[or]NPC1 LICKS NPC2's LEGS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's tummy:
		say "[one of]NPC1 LICKS NPC2's TUMMY[or]NPC1 LICKS NPC2's TUMMY AGAIN[stopping]."

	Sex prose for NPC1 rubbing NPC2's breasts:
		say "[one of]NPC1 LICKS NPC2's BREASTS[or]NPC1 RUBS NPC2's BREASTS AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's pussy:
		say "[one of]NPC1 RUBS NPC2's PUSSY[or]NPC1 RUBS NPC2's PUSSY AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's breasts:
		say "[one of]NPC1 LICKS NPC2's BREASTS[or]NPC1 LICKS NPC2's BREASTS AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's pussy:
		say "[one of]NPC1 LICKS NPC2's PUSSY[or]NPC1 LICKS NPC2's PUSSY AGAIN[stopping]."

	After NPC1 fucking NPC2's face with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's FACE[or]NPC1 FUCKS NPC2's FACE AGAIN[stopping]."
	After NPC1 fucking NPC2's breasts with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's BREASTS[or]NPC1 FUCKS NPC2's BREASTS AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's ASS[or]NPC1 FUCKS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's pussy with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's PUSSY[or]NPC1 FUCKS NPC2's PUSSY AGAIN[stopping]."
		
	Sex prose for NPC1 fucking NPC2's face with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's FACE[or]NPC1 FUCKS NPC2's FACE AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's pussy with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's PUSSY[or]NPC1 FUCKS NPC2's PUSSY AGAIN[stopping]."

	Sex prose for NPC1 rubbing NPC2's cock:
		say "[one of]NPC1 RUBS NPC2's COCK[or]NPC1 RUBS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 rubbing NPC2's chest:
		say "[one of]NPC1 RUBS NPC2's CHEST[or]NPC1 RUBS NPC2's CHEST AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's cock:
		say "[one of]NPC1 LICKS NPC2's COCK[or]NPC1 LICKS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 licking NPC2's chest:
		say "[one of]NPC1 LICKS NPC2's CHEST[or]NPC1 LICKS NPC2's CHEST AGAIN[stopping]."

	Sex prose for NPC1 fucking NPC2's cock with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's ass with NPC1'S cock:
		say "[one of]NPC1 FUCKS NPC2's ASS[or]NPC1 FUCKS NPC2's ASS AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's cock with NPC1'S ass:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."

	Sex prose for NPC1 fucking NPC2's cock with NPC1'S pussy:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."
	Sex prose for NPC1 fucking NPC2's ass with NPC1'S breasts:
		say "[one of]NPC1 FUCKS NPC2's COCK[or]NPC1 FUCKS NPC2's COCK AGAIN[stopping]."

	Orgasm prose for NPC1 rubbing NPC2's ass:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC2's pussy:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 rubbing NPC2's cock:
		say "NPC2 ORGASMS."

	Orgasm prose for NPC1 licking NPC2's ass:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 licking NPC2's pussy:
		say "NPC2 ORGASMS."
	Orgasm prose for NPC1 licking NPC2's cock:
		say "NPC2 ORGASMS."

	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's cock:
		if the primary orgasmer is NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking NPC2's ass with NPC1's cock:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's ass:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
			
	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's pussy:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."
	Orgasm prose for NPC1 fucking NPC2's cock with NPC1's breasts:
		if the primary orgasmer is the NPC2:
			say "NPC2 ORGASMS.";
		else:
			say "NPC1 ORGASMS."

	Simultaneous orgasm prose for NPC1 fucking NPC2's cock with NPC1's cock:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's ass with NPC1's cock:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's pussy with NPC1's cock:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's cock with NPC1's ass:
		say "THEY BOTH ORGASM."
	Simultaneous orgasm prose for NPC1 fucking NPC2's cock with NPC1's pussy:
		say "THEY BOTH ORGASM."

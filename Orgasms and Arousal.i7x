Version 5 of Orgasms and Arousal by Another Wannabe begins here.

"Adds an orgasm and arousal system for Simpler AIF by Another Wannabe."

Use no simultaneous orgasms translates as (- Constant NO_SIMULTANEOUS_ORGASMS; -).
Use no sex prose whilst orgasming translates as (- Constant NO_SEX_PROSE_WHILE_ORGASMING; -).


Part - Orgasms

Chapter - Set Up

Orgasm-tracking relates one person to various things. The verb to previously-orgasm-upon (he previously-orgasms-upon, they previously-orgasm-upon, he previously-orgasmed-upon, it is previously-orgasmed-upon, he is previously-orgasming-upon) implies the orgasm-tracking relation.

The primary orgasmer is an object that varies. The secondary orgasmer is an object that varies.
The object cummed with is an object that varies. The object cummed on is an object that varies.

The orgasm prose rules are a rulebook. The orgasm prose rules have default success.
The simultaneous orgasm prose rules are rulebook. The simultaneous orgasm prose rules have default success.

Chapter - Phrases to Cause Orgasms

To have (the partner - a person) orgasm:
	now primary orgasmer is the partner;
	if the noun is enclosed by the partner:
		now the object cummed with is the noun;
	else if the second noun is enclosed by the partner:
		now the object cummed with is the second noun;
	carry out the handling an orgasm activity with the primary orgasmer.
	
To have (the partner - a person) orgasm on/in (the item - a thing), simultaneously:
	now the primary orgasmer is the partner;
	if the noun is enclosed by the partner:
		now the object cummed with is the noun;
	else if the second noun is enclosed by the partner:
		now the object cummed with is the second noun;
	now the object cummed on is the item;
	if simultaneously:
		if a person (called the secondary partner) encloses the item:
			now secondary orgasmer is the secondary partner;
			now the simultaneous orgasm boolean is true;
	carry out the handling an orgasm activity with the primary orgasmer.
	

Chapter - The Handling an Orgasm Activity

The simultaneous orgasm boolean is a truth state that varies.

Handling an orgasm of something is an activity on objects.

Rule for handling an orgasm (this is the default orgasm handling rule):
	unless the simultaneous orgasm boolean is true:
		follow the orgasm prose rules;
	else:
		follow the simultaneous orgasm prose rules.

After handling an orgasm (this is the track orgasms rule):
	if the object cummed on is not nothing:
		now the primary orgasmer previously-orgasms-upon the object cummed on;
	if the simultaneous orgasm boolean is true and the object cummed with is not nothing:
		now the secondary orgasmer previously-orgasms-upon the object cummed with.

After handling an orgasm (this is the reset the primary orgasmer's arousal rule):
	clear arousal of the primary orgasmer.

After handling an orgasm (this is the reset the secondary orgasmer's arousal rule):
	if the secondary orgasmer is a person:
		clear arousal of the secondary orgasmer.

Last after handling an orgasm (this is the clear orgasm variables rule):
	now the primary orgasmer is nothing;
	now the secondary orgasmer is nothing;
	now the object cummed with is nothing;
	now the object cummed on is nothing;
	now the simultaneous orgasm boolean is false.

Chapter - Integration with Erotic Scenes

When an erotic scene (called Y) begins (this is the reset orgasm-tracking rule):
	repeat with X running through the involved partners of Y:
		now X previously-orgasms-upon nothing;
	now the player previously-orgasms-upon nothing.

Part - Arousal

Chapter - Properties

A person has a number called the arousal. The arousal is usually 0.
A person has a number called the orgasm threshold. The orgasm threshold is usually 10.
A body part can be potentially orgasmic. A body part is usually not potentially orgasmic.
A pussy is potentially orgasmic. A cock is potentially orgasmic. An ass is potentially orgasmic.
A sex toy can be potentially orgasmic. A sex toy is usually not potentially orgasmic.

Chapter - Arouse

To arouse (the partner - a person) by (N - a number):
	increase the arousal of the partner by N;
	if the debug arousal boolean is true:
		say "([partner]: +[N] arousal to [arousal of partner])[line break]".
To unarouse (the partner - a person) by (N - a number):
	decrease the arousal of the partner by N;
	if the debug arousal boolean is true:
		say "([partner]: -[N] arousal to [arousal of partner])[line break]".
To clear arousal of (the partner - a person):
	now the arousal of the partner is 0;
	if the debug arousal boolean is true:
		say "([partner]'s arousal set to 0)[line break]".

Chapter - Sensitivity Rules

The sensitivity rules are an object based rulebook producing a number. 

Last sensitivity rule for something (called the item) (this is the use a default value rule):
	if the item is a cock or the item is an ass or the item is a pussy:
		rule succeeds with result 2;
	else:
		rule succeeds with result 0.

Chapter - Sexually Active List

The sexually active list is a list of people that varies.

To mark (X - a person) as sexually active:
	add X to the sexually active list. 

Chapter - Arousal Increase

The debug arousal boolean is a truth state that varies.
[Carry out an actor kissing a person (this is the increase arousal for kissing rule):
	increase the arousal of the actor by 1;
	increase the arousal of the noun by 1.]

Carry out an actor rubbing something (this is the increase arousal for rubbing rule):
	if the noun is enclosed by a person (called the partner):
		let N be the number produced by the sensitivity rules for the noun;
		arouse the partner by N;
		mark the actor as sexually active;
		mark the partner as sexually active;
		now the actor's arousal state is the arousal state of the actor;
		now the partner's arousal state is the arousal state of the partner.
	
Carry out an actor licking something (this is the increase arousal for licking rule):
	if the noun is enclosed by a person (called the partner):
		let N be the number produced by the sensitivity rules for the noun;
		arouse the partner by N;
		mark the actor as sexually active;
		mark the partner as sexually active;
		now the actor's arousal state is the arousal state of the actor;
		now the partner's arousal state is the arousal state of the partner.

Carry out an actor fucking something with something (this is the increase arousal for fucking rule):
	if the noun is enclosed by a person (called the partner):
		let N be the number produced by the sensitivity rules for the noun;
		arouse the partner by N;
		let X be the number produced by the sensitivity rules for the second noun;
		arouse the actor by X;
		mark the actor as sexually active;
		mark the partner as sexually active;
		now the actor's arousal state is the arousal state of the actor;
		now the partner's arousal state is the arousal state of the partner.
				
		
Chapter - Arousal Decay

Every turn (this is the arousal decay rule):
	repeat with partner running through people:
		unless the arousal of the partner is less than 1 or the partner is listed in the sexually active list:
			unarouse the partner by 1.

Last every turn rule (this is the reset the sexually active list rule):
	now the sexually active list is { }.

To clear all arousal:
	repeat with partner running through people:
		clear arousal of the partner.

Chapter - Detect Orgasm

A person can be orgasm-locked. A person is usually not orgasm-locked.

To decide if (the partner - a person) will orgasm with (the item - a thing):
	if the item is not potentially orgasmic:
		decide no;
	if the partner is orgasm-locked:
		decide no;
	if the arousal of the partner is at least the orgasm threshold of the partner:
		decide yes;
	decide no.

Part - Sex and Orgasm Prose

Chapter - Sex Prose Rules

The sex prose rules are an action based rulebook. The sex prose rules have default success.

Last sex prose rule for an actor fucking something with something (this is the standard fucking prose rule):
	say "[The actor] [fuck] [the noun] with [the second noun]." (A).

Last sex prose rule for an actor licking something (this is the standard licking prose rule):
	say "[The actor] [lick] [the noun]." (A).

Last sex prose rule for an actor rubbing something (this is the standard rubbing prose rule):
	say "[The actor] [rub] [the noun]." (A).
	
Chapter - Default Orgasm Prose

To orgasm is a verb.

Last simultaneous orgasm prose (this is the default simultaneous orgasm prose rule):
	say "[The primary orgasmer] and [the secondary orgasmer] orgasm." (A).

Last orgasm prose (this is the default orgasm prose rule):
	say "[The primary orgasmer] [orgasm]." (A).

Chapter - Report Rules

The report rubbing rule is not listed in the report rubbing rulebook.
The standard report licking rule is not listed in the report licking rulebook.
The standard report fucking it with rule is not listed in the report fucking it with rulebook.

Report an actor fucking something with something when the no sex prose whilst orgasming option is active (this is the standard orgasmic fucking rule):
	if the noun is enclosed by a person (called the partner):
		if the actor will orgasm with the second noun and the partner will orgasm with the noun:
			if the no simultaneous orgasms option is active:
				have the actor orgasm on the noun;
				have the partner orgasm on the second noun;
			else:
				have the actor orgasm on the noun, simultaneously;
		else if the actor will orgasm with the second noun:
			have the actor orgasm on the noun;
		else if the partner will orgasm with the noun:
			have the partner orgasm on the second noun;
		else:
			follow the sex prose rules;
	else:
		follow the sex prose rules.

Report an actor licking something when the no sex prose whilst orgasming option is active (this is the standard orgasmic licking rule):
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses a face (called the face):
				have the partner orgasm on the face;
			else:
				have the partner orgasm;
		else:
			follow the sex prose rules;
	else:
		follow the sex prose rules.

Report an actor rubbing something when the no sex prose whilst orgasming option is active (this is the standard orgasmic rubbing rule):
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses some hands (called the hands):
				have the partner orgasm on the hands;
			else:
				have the partner orgasm;
		else:
			follow the sex prose rules;
	else:
		follow the sex prose rules.

Report an actor fucking something with something when the no sex prose whilst orgasming option is not active (this is the alternative orgasmic fucking rule):
	follow the sex prose rules;
	if the noun is enclosed by a person (called the partner):
		if the actor will orgasm with the second noun and the partner will orgasm with the noun:
			if the no simultaneous orgasms option is active:
				have the actor orgasm on the noun;
				have the partner orgasm on the second noun;
			else:
				have the actor orgasm on the noun, simultaneously;
		else if the actor will orgasm with the second noun:
			have the actor orgasm on the noun;
		else if the partner will orgasm with the noun:
			have the partner orgasm on the second noun.

Report an actor licking something when the no sex prose whilst orgasming option is not active (this is the alternative orgasmic licking rule):
	follow the sex prose rules;
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses a face (called the face):
				have the partner orgasm on the face;
			else:
				have the partner orgasm.

Report an actor rubbing something when the no sex prose whilst orgasming option is not active (this is the alternative orgasmic rubbing rule):
	follow the sex prose rules;
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses some hands (called the hands):
				have the partner orgasm on the hands;
			else:
				have the partner orgasm.

Part - Percentage-Based Erection and Arousal States

To decide which number is the percent form of (X - a real number) over (Y - a real number):
	if Y is 0:
		decide on 0;
	let Z be X divided by Y;
	let Zr be Z times 100;
	decide on Zr to the nearest whole number.

Chapter - New Arousal States 

An arousal state is a kind of value. The arousal states are defined by the Table of Arousal States.

To decide which arousal state is the arousal state at (x - a number):
	repeat with current state running through arousal states:
		if the minarouse of the current state is -1:
			if X is at most maxarouse of the current state:
				decide on current state;
		else if the maxarouse of the current state is -1:
			if X is at least minarouse of current state:
				decide on current state;
		else:
			if X is at most maxarouse of the current state and X is at least minarouse of current state:
				decide on current state;
	decide on unaroused.

To decide which arousal state is the arousal state of (the partner - a person):
	let X be the percent form of the arousal of the partner over the orgasm threshold of the partner;
	decide on the arousal state at X.

To decide if (the partner - a person) is/are feeling (the current state - an arousal state): 
	if the arousal state of the partner is the current state:
		decide yes;
	decide no.
	
The actor's arousal state is an arousal state that varies.
The partner's arousal state is an arousal state that varies.

Section - Table of Arousal States

Table of Arousal States
arousal state	minarouse	maxarouse
unaroused	-1	0
aroused	1	99
orgasmic	100	-1

Chapter - New Erections States

Use permanent hardness translates as (- Constant PERMANENT HARDNESS; -).

An erection state is a kind of value. The erection states are defined by the Table of Erection States.

To decide which erection state is the erection state of (the partner - a person):
	if the permanent hardness option is active:
		decide on erect;
	let X be the percent form of arousal of the partner over the orgasm threshold of the partner;
	repeat with current state running through erection states:
		if the minarouse of the current state is -1:
			if X is at most maxarouse of the current state:
				decide on current state;
		else if the maxarouse of the current state is -1:
			if X is at least minarouse of current state:
				decide on current state;
		else:
			if X is at most maxarouse of the current state and X is at least minarouse of current state:
				decide on current state;
	decide on erect.

Check an actor fucking something with something (this is the must be erect to fuck rule):
	if the second noun is a cock:
		if the sexsuitable of the erection state of the actor is false:
			issue failure message for the actor not hard enough to fuck rule;
			rule succeeds;
	if the noun is a cock:
		if the noun is enclosed by a person (called the partner):
			if the sexsuitable of the erection state of the partner is false:
				issue failure message for the partner not hard enough to fuck rule;
				rule succeeds.
This is the actor not hard enough to fuck rule:
	do nothing.
This is the partner not hard enough to fuck rule:
	do nothing.
	
Table of Failure Responses (continued)
rule name	message
the actor not hard enough to fuck rule	"[The person asked] [are] not hard enough to fuck."
the partner not hard enough to fuck rule	"[The sex partner] [are] not hard enough to fuck."


Section - Table of Erection States

Table of Erection States
erection state	minarouse	maxarouse	sexsuitable
flaccid	-1	0	false
semi-erect	1	10	false
erect	11	-1	true

Chapter - Debugging (not for release)

Toggling arousal debug is an action out of world applying to nothing. Understand "debug arousal" as toggling arousal debug.

Carry out toggling arousal debug:
	if the debug arousal boolean is false:
		now the debug arousal boolean is true;
	else:
		now the debug arousal boolean is false.

Report toggling arousal debug:
	if the debug arousal boolean is true:
		say "Alright changes in arousal will be displayed.";
	else:
		say "Alright changes in arousal will not be displayed."

Orgasms and Arousal ends here.

---- DOCUMENTATION ----

Chapter: Introduction

Section: Foreword

Orgasms and Arousal (henceforth referred to as OrA) is an extension for use with Simpler AIF that adds arousal and orgasm mechanics found in a lot of AIF. AIF veterans will need little further explanation than that. However, if you are new to AIF, it works a little like this: during sex actions, a character builds up a certain value called "arousal". Past a certain point, they will orgasm. It really is as simple as that. OrA also throws in erection mechanics.

On a personal note, I feel that the value of arousal is a little dubious as it promotes spamming of the "g" command until orgasm occurs, and unless the author has put a lot of effort into a scene, the prose will be repetitive. OrA tries to make certain things easier to write for the author, but basically lots of elbow grease is needed until the arousal system really starts to pay dividends. It is better, in my opinion, to have small amounts of really great prose rather than a vast amount of little snippets. If you use this extension, snippets are inevitably what you'll get.

More than any other extension, the exact desired effect depends a lot on the personal taste of the author, and so this is built with customizability in mind. You should feel welcome to change things from their default values.

Section: Adding to Existing Projects

PLEASE READ THIS IF YOU ARE ADDING OrA TO AN EXISTING SIMPLER AIF PROJECT.

OrA changes Simpler AIF in some fairly fundamental ways. For each of the basic sex actions there is a new report rule that OrA MUST go through in order to function properly. This means that all AFTER rules which apply to sex actions could potentially circumvent orgasms. In order to prevent this, you should convert all of your AFTER RUBBING, AFTER LICKING and AFTER FUCKING rules to the new SEX PROSE rulebook. So, a rule that reads like this:

	After Bob fucking Jane's pussy with Bob's cock....

should now read like this:

	Sex prose rule for Bob fucking Jane's pussy with Bob's cock...
	
It is a pain in the ass, I know, but it was absolutely the simplest way to implement the arousal system.

Section: Other Extensions

OrA requires Simpler AIF but is not dependent on any other extensions. It can be used freely with any other extension from the AIF Toolkit.

Previously, OrA could use Fixed Point Maths by Michael Callaghan. Fixed Point Maths is obsolete and its functionality is made the default.

Section: Version History

	Version 5, September 17th, 2022
	- IT IS THE FUTURE EVERYONE.
	- Compatibility update to Inform version 10.
	- Changed the relation "previously orgasm upon" to "previously-orgasm-upon".

	Version 4, July 18th, 2014
	- Fixed a bug where female characters trying to fuck a cock are always told it isn't hard enough.
	- Allow erection states other than "erect" to be fuckable.
	- Implemented new message system.

	Version 3, June 18th, 2014
	- Fixed Point Maths is obsolete, and now all arousal systems are percentage based.

	Version 2, March 22nd, 2014
	- Arousal and erection states are now based on a percentage rather than a specific range of value when using Fixed Point Maths by Michael Callaghan.

	Version 1, March 10th 2014
	- Initial release.

Chapter: Basics

Section: Sex Prose Rules

Even if you plan on using no other features of OrA, it is critical to understand the new sex prose rules.

The SEX PROSE RULES, in essence, replace the AFTER rules for all sex actions except the kissing action. Where you would normally write an AFTER rule, you should write a SEX PROSE rule. It is VERY important you remember this, because an after rule will prevent orgasms. If things don't seem to be working right in that regard, you should first check to see if you accidentally made an AFTER rule instead of a SEX PROSE rule.

SEX PROSE rules are written identically to any other action-based rule.

	Sex prose for Bob fucking Jane's pussy with Bob's cock:
		say "That was really great."

Section: Arousal and Sensitivity

Every character has a number called the "orgasm threshold". By default, this threshold is set to 10, although it can be changed to whatever you want.

	The orgasm threshold of a person is usually 666.

As the name implies, if this threshold is exceeded, an orgasm will happen. What needs to break this threshold, praytell? Well, the arousal property, of course!

	if the arousal of Bob is greater than 666...

OrA provides two basic phrases of modifying the arousal of character.

	arouse A PERSON by A NUMBER...
	unarouse A PERSON by A NUMBER...
	
While these are functionally identical to "increase/decrease the arousal of A PERSON by A NUMBER", this method is preferable because it is not only more concise but it also displays these changes in debug mode, which can be useful.

	clear all arousal...

This phrase sets everyone's arousal to 0, useful if you want to reset everything after a day has passed, for example.

Arousal for everyone begins at 0 and never falls below that number without programmer intervention. It increases or stays the same when that individual does something sexual. It also decays slowly over time if the character isn't doing anything sexual.

The amount of arousal gained depends, mostly, on the most heavily involved body part. If it is a cock, ass or pussy, the owner of that body part gains 2 arousal, otherwise, it stays the same. That means, on average, it will take five repetitions of fucking to orgasm.

However, the amount of arousal gained can be customized using the sensitivity rules. A sensitivity rule can look like this:

	Sensitivity for a g-spot: rule succeeds with result 10.

Many authors over a long period of time have come up with many different ways of dealing with arousal. OrA's default method is pretty much as basic as arousal systems get. In the Recipe Book chapter we'll provide a few interesting ways you can configure arousal.

Section: Orgasm Prose

When a character orgasms, something like this might be printed:

	Dallas fucks Debbie's pussy.
	
	Dallas orgasms.

The second line is printed using the ORGASM PROSE rules. These are written like any action-based rule except that it's very important to indicate who is orgasming. The individual orgasming is known as the PRIMARY ORGASMER.
 
	Orgasm prose rule for Dallas fucking Debbie's pussy with Dallas's cock when the primary orgasmer is Dallas:
		say "Dallas orgasms."
		
	Orgasm prose rule for Dallas fucking Debbie's pussy with Dallas's cock when the primary orgasmer is Debbie:
		say "Debbie orgasms."

What happens when Dallas and Debbie both orgasm at the same time? Good question. Instead of the orgasm prose rules, Debbie and Dallas both stop to follow the SIMULTANEOUS ORGASM PROSE rules. In this case, the actor is always the primary orgasmer, and the partner is the secondary orgasmer.

	Simultaneous orgasm prose rule for Dallas fucking Debbie's pussy with Dallas's cock:
		say "Both Dallas and Debbie orgasm."[In this case Dallas is the primary orgasmer and Debbie is the secondary.]

Two use options provide some fine tuning when it comes to how exactly you want orgasms handled in your game.

*:
	Use no sex prose whilst orgasming.

This use option prevents sex prose from printing when the orgasm prose rules are called. So instead of:

	Dallas fucks Debbie's pussy.
	
	Dallas orgasms.
	
You'd just get:

	Dallas orgasms.

*:
	Use no simultaneous orgasms.

This use option will circumvent the simultaneous prose rules, and simply print separate paragraphs of orgasm prose for each character.

Section: Controlling Orgasms

I can't help you in real life, but OrA provides a couple methods for finer control over orgasms in your game.

The first method is to orgasm-lock somebody. A person who is orgasm-locked cannot have orgasms.

	Kenji is a man in the space station. "Standing in front of you is a pervert, probably from the future, ready for some kind of action." Kenji is orgasm-locked.

You can make or undo orgasm-locks simply by declaring it so.

	After Minami injecting Kenji with the syringe:
		say "She laughs uncontrollably as she stabs the syringe into Kenji.";
		now Kenji is orgasm-locked.
	
	Orgasm prose rule when Kenji is the primary orgasmer:
		now Kenji is not orgasm-locked;
		say "'I'm cured!' Kenji bellows into the sky, lightning bolts zapping from his dick."

The second rule alludes that we can manually make people orgasm... which is true and bypasses the normal restrictions on orgasming.

	have Kenji orgasm...
	have Kenji orgasm on Minami's breasts...

Using the second phrase is only important if you care about orgasm-tracking (explained later) but either will cause Kenji to cum, even if his arousal is too low, he is orgasm-locked or he is doing something where orgasming is inconcievable, such as gardening. As such, you should take care not to abuse these phrases. To make someone orgasm simultaneously, you can use this phrase.

	have Kenji orgasm in Minami's pussy, simultaneously...

You can test if someone is ready to blast off by using this phrase.

	if Kenji will orgasm with Kenji's cock...
	
This segues nicely into the third and final method. In order for this test to pass, the body part specified must be POTENTIALLY ORGASMIC. The only three body parts which, by default, are potentially orgasmic are the pussy, the cock and the ass, though more are easily made.

	A clit is a kind of body part. A clit is potentially orgasmic.
	
You can even make things not potentially orgasmic.

	After Kenji exposing Kenji's cock to the vacuum of space:
		now Kenji's cock is not potentially orgasmic;
		say "Kenji's face fills with despair. 'Noooo! I just got it baaaacck....'"

Section: Orgasm Tracking

Like in Simpler AIF, OrA provides a method of tracking who has orgasmed where. This is done through the "previously-orgasms-upon" relation.

	if the player previously-orgasms-upon Annette's breasts...
	
There is, unfortunately, no way around the awkward wording of things like this:

	if the player previously-orgasms-upon Taylor's pussy...
	
In most cases, this relation is fairly straightforward, but when a simultaneous orgasm occurs, the secondary orgasmer will be considered to have orgasmed upon whatever the actor had just orgasmed with. So in the case of the player fucking Taylor's pussy with your cock, Taylor will have considered to have cummed on your cock as well.

Like all the sex tracking relations, they are reset for all involved partners and the player at the beginning of a scene.

Section: Erection States

Some consider erections a pain in the ass, others a hard issue, but the community remains stiffly divided. By default, OrA handles this prominent problem, but for those who don't want a sticky mess, they may disable it.

*:
	Use permanent hardness.

This option, to the delight of AIF characters everywhere, ensures that rods remain turgid even after repeated use. Unrealistic? Probably. Easy? Yes. Fortunately, priapism is simply not a concern for most AIF characters so there is no drawback.

Basically: erection states prevent fucking with a cock unless it is erect. This functionality works straight out of the box. A character is considered to be erect if they have an arousal of 2 or more, they are semi-erect if they have an arousal of 1 or 2, and are flaccid at 0 or less. This behavior can be altered (see Customizing Erection States in the next chapter).

You can determine what erection state a person is at using this phrase:

	the erection state of A PERSON...
	
Bear in mind -- a person doesn't have to be MALE to test for their erection states, they don't even have to have a cock! You can test the erection states of natural biological females-- but the result is useless since it isn't used for anything. If you have a use for it, go ahead.

Section: Arousal States

Arousal states are what I consider to be one of the important core features of OrA, but they are fairly complicated. Essentially, they are categories that characterize what a person is like at a certain level of arousal. As they gain or lose arousal, they will move into different arousal states.

There are three default arousal states: unaroused, aroused and orgasmic. These depend on how close the character is to exceeding their orgasm threshold in a percentage form. By default, unaroused applies to characters who are 0% aroused, aroused between 1% and 99% and orgasmic characters with over 100%. It is recommended that you entirely replace these with arousal states of your own (see Customizing Arousal States in the next chapter). For now, it is enough to illustrate what arousal states do.

Take this example:

	Sex prose for rubbing Kirsty's pussy:
		if Kirsty is feeling unaroused:
			say "She looks into your eyes with anticipation as you begin to stroke her.";
		else if Kirsty is feeling aroused:
			say "Beads of sweat begin to form on Kirsty's brow. Her pussy becomes slick.";
		else if Kirsty is feeling orgasmic:
			say "Kirsty bites her lower lip, she trembles with repressed energy."

This is much more readable than "if the arousal of Kirsty is greater than 5 and the arousal of Kirsty is less than 9...", and it's easier to write too.  The phrase "if A PERSON is feeling AN AROUSAL STATE" detects whether a person is at a particular arousal state. "If A PERSON is AN AROUSAL STATE" will not work, but "If the arousal state of A PERSON is AN AROUSAL STATE" will.

Because the arousal state is recalculated every time it is tested, the game could potentially slow down if it's used too much. There are two ways around this. The easier way to just to avoid using it in the preamble of a rule. It is better to have this:

	Sex prose for rubbing Kirsty's pussy:
		if Kirsty is feeling...
		else if Kirsty is feeling...
		else if Kirsty is feeling...

Than this:

	Sex prose for rubbing Kirsty's pussy when Kirsty is feeling...
	
	Sex prose for rubbing Kirsty's pussy when Kirsty is feeling...
	
	Sex prose for rubbing Kirsty's pussy when Kirsty is feeling...
	
This principle is true of I7 in general.

The second method involves using the two variables ACTOR'S AROUSAL STATE and PARTNER'S AROUSAL STATE. They are, pretty much, exactly what they seem like and are populated in the CARRY OUT phase of an action. Bear in mind they are only updated for sex actions, thus they won't function as intended if you use them outside of a sex action.

Chapter: Customizability

Section: Customizing Arousal States

OrA makes use of a table known as the "Table of Arousal States" to define its arousal states. It looks like this:

*:
	Section - Table of Arousal States

	Table of Arousal States
	arousal state	minarouse	maxarouse
	unaroused	-1	0
	aroused	1	99
	orgasmic	100	-1

To customize it, you'll need to replace the table with one of your own design with the following code:

*:
	Section - New  Table of Arousal States (in place of Section - Table of Arousal States in Orgasms and Arousal by Another Wannabe)
	
	Table of Arousal States
	arousal state	minarouse	maxarouse
	unaroused	-1	0
	tepid	1	40
	excited	41	80
	super aroused	81	100
	explosive	101	-1

These tables reflect the ratio of arousal over the orgasm threshold of the person tested. So... a person with an arousal of 10 with an orgasm threshold of 20 will be "excited" according to the table above, since they are at 50% of their maximum arousal. 

The "minarouse" column indicates what the minimum amount of arousal needed to enter that arousal state. The "maxarouse" column indicates what the ceiling is for that particular arousal state. "-1" is a special token that indicates "no limit". So when something has a minarouse of "-1", it means "this arousal state applies to anything under the maxarouse", conversely, a maxarouse of "-1" means "this arousal state applies to anything over the minarouse".

When drafting your own table of arousal states, you should try to make sure that no gaps are left in terms of arousal, so that, no matter what value it is, it is always covered by something.

In the end, you should be able to write things like this:

	if Bob is feeling excited...
	if Annie is feeling tepid...
	
Section: Customizing Erection States

Erection states are handled almost identically to arousal states.

*:
	Section - Table of Erection States

	Table of Erection States
	erection state	minarouse	maxarouse
	flaccid	-1	0
	semi-erect	1	20
	erect	21	-1

Changing it is as simple as replacing the table.

*:
	Section - New Table of Erection States (in place of Section - Table of Erection States in Orgasms and Arousal by Another Wannabe)

	Table of Erection States
	erection state	minarouse	maxarouse	sexsuitable
	floppy	-1	0	false
	laughable	1	20	false
	waxing gibbous	21	60	false
	almost hard	61	80	false
	erect	81	100	true
	throbbing	101	120	true
	explosive	121	-1	true
	
In prior versions of this extension, only the "erect" erection state could be used to fuck. Now the "sexsuitable" property controls this behavior, so you can make crazy descriptions of absurdly hard dicks.

Section: Doing Complicated Things with Orgasms

Orgasms are handled through an activity called, appropriately, the HANDLING AN ORGASM activity. You can use this to add whatever new things you'd like.

One very simple thing you could do is track the number of orgasms the player has had.

*:
	The orgasm count is a number that varies.
	
	After handling an orgasm:
		if the primary orgasmer is the player or the secondary orgasmer is the player:
			increment the orgasm count.

One thing I'm planning on but did not implement in this version is cum as something that covers objects. This is because I haven't quite figured out how to handle this. For example, if person A give person B a handjob and cums, where does it go? Also true for anal... if person A is getting anally fucked and cums, does it go anywhere? Should it?

In any case, a very basic implementation is very possible. The activity does attempt to identify what thing has been cummed on (called the object cummed on).

*:
	A thing can be cum-covered.

	After handling an orgasm:
		if the object cummed on is not nothing:
			now the object cummed on is cum-covered.
			
This is rather inadequate but it illustrates what the activity can do.

Here is a list of all the variables the handling an orgasm activity uses:

	Primary Orgasmer -- the actor who called the orgasm.
	Secondary Orgasmer -- if there is a simultaneous orgasm, the second person orgasming.
	Object Cummed With -- the object the actor was using when they came.
	Object Cummed On -- this is identified as X when the HAVE Y ORGASM ON X phrase is called.

Section: Integrating New Actions into OrA

New actions can fairly simply be added. We'll continue using the footjobbing action as an example, but this could be adapted to any action. Just modify the following code.

This rule is for increasing arousal.

*:
	Carry out an actor footjobbing something (this is the increase arousal for footjobbing rule):
		if the noun is enclosed by a person (called the partner):
			let N be the number produced by the sensitivity rules for the noun;
			arouse the partner by N;
			mark the actor as sexually active;
			mark the partner as sexually active;
			now the actor's arousal state is the arousal state of the actor;
			now the partner's arousal state is the arousal state of the partner.
			
Each action has two report rules, used depending on which use option is used. Technically, you'll only need one, but both are provided.

*:
	Report an actor footjobbing something when the no sex prose whilst orgasming option is active (this is the standard orgasmic footjobbing rule):
		if the noun is enclosed by a person (called the partner):
			if the partner will orgasm with the noun:
				if the actor encloses some feet (called the feet):
					have the partner orgasm on the feet;
				else:
					have the partner orgasm;
			else:
				follow the sex prose rules;
		else:
			follow the sex prose rules.

	Report an actor footjobbing something when the no sex prose whilst orgasming option is not active (this is the alternative orgasmic footjobbing rule):
		follow the sex prose rules;
		if the noun is enclosed by a person (called the partner):
			if the partner will orgasm with the noun:
				if the actor encloses some feet (called the feet):
					have the partner orgasm on the feet;
				else:
					have the partner orgasm.

It is useful but not strictly necessary to provide default prose for the footjobbing action.

*:
	To footjob is a verb.
	Last sex prose rule for an actor footjobbing something:
		say "[The actor] [footjob] [the noun]."

Section: Intergrating New Body Parts into OrA

New body parts are very easy to add. You'll have to decide whether your body part is potentially orgasmic or not.

	The clit is a kind of body part. It is potentially orgasmic.

Now all that is necessary is to provide the appropriate sensitivity rules.

	Sensitivity for a clit: rule succeeds with result 4.

Section: Arousal Debug

OrA has a debug mode that displays arousal increases and decreases. To activate it, type this command.

	>arousal debug

Chapter: A Quick Recipe Book

There are many different implementations of arousal systems. This is a very quick guide on how you might go about implementing some common ones.

Section: Randomized Arousal Gains

This is an extremely simple one. Simply alter the sensitivity rules to reflect some level of randomness.

*:
	A body part has a number called the max sensitivity. The max sensitivity is usually 0. The max sensitivity of a cock is usually 4. The max sensitivity of a pussy is usually 4. The max sensitivity of an ass is usually 4.
	
	Sensitivity rule for a body part (called the item):
		let X be a random number between 1 and the max sensitivity of the item;
		rule succeeds with result X.

Section: Lowered Sensitivity Post-Orgasm

Some systems make it harder to orgasm after every subsequent orgasm to simulate fatigue. All you need to do is set the orgasm threshold higher than it was before. That's it.

*:
	After handling an orgasm:
		now the orgasm threshold of the primary orgasmer is the orgasm threshold of the primary orgasmer + 5.

Section: Certain Actions Can't Cause Orgasms

Let's say you want to prevent orgasms from occuring by rubbing. This is relatively simple. We can do this by orgasm-locking someone, then lifting the orgasm-lock when the action is done.

*:
	Mid-action bookkeeping rule for an actor rubbing something:
		if the noun is enclosed by a person (called the partner):
			now the partner is orgasm-locked.
	
	Post-action bookkeeping rule for an actor rubbing something:
		if the noun is enclosed by a person (called the partner):
			now the partner is not orgasm-locked.

By the time the mid-action bookkeeping rule fires, the post-action bookkeeping rule is virtually guaranteed to fire, thus we can be relatively confident that we won't accidentally orgasm-lock someone permanently. Changing the noun might mess things up, but you probably shouldn't be doing that anyway.

Section: Varying Sensitivity by Actions

If we think of "rubbing an ass" as simply fondling it rather than, say, fingering, it can seem a little odd that a character can cum from that. Unfortunately, OrA doesn't provide a very elegant means of varying sensitivity by actions. The best way to do this is to raise a flag just before the sensitivity rules fire.

*:
	The rubbed noun is a truth state that varies.
	
	Mid-action bookkeeping rule for an actor rubbing something:
		now the rubbed noun is true.
		
	Sensitivity rule for an ass:
		if the rubbed noun is true:
			rule succeeds with result 0;
		else:
			rule succeeds with result 2.
	
	Post-action bookkeeping rule:
		now the rubbed noun is false.

Section: Limited Orgasms per Scene

Some games simulate fatigue by only allowing a few orgasms per scene. We can use some of the code from previous examples to help us.

*:
	A person has a number called times orgasmed. The times orgasmed is 0.
	
	After handling an orgasm:
		increment the times orgasmed of the primary orgasmer;
		if the secondary orgasmer is a person:
			increment the times orgasmed of the secondary orgasmer.

Now, all we need to do is to define a scene that ends with the times orgasmed of the player is more than 1.

*:
	The tiring scene is an erotic scene. The tiring scene begins when play begins. The tiring scene ends when the times orgasmed of the player is greater than 1.
	
It would be prudent to reset this number for future scenes.

*:
	When an erotic scene ends:
		now the times orgasmed of the player is 0.

Section: Arousal Ceiling

Some games like to have arousal gains for all body parts, but don't allow a player to go beyond a certain point if it's a body part that isn't orgasmic. This is something fairly easy to simulate.

*:
	Sensitivity of a sexually interactive body part (called the item):
		if the item is enclosed by a person (called the partner):
			if the arousal of the partner is greater than 4:
				rule succeeds with result 0;
			else:
				rule succeeds with result 1;
		rule succeeds with result 1.

Section: Variety

Some arousal systems try to promote variety by having one action decrease in effectiveness the more it is tried. An advanced implementation of this is possible with tables. However, a very simple system is also possible using the ACTION REPEAT COUNT variable. This variable increments every time the same action is repeated.

*:
	Sensitivity rule for a potentially orgasmic body part:
		let X be 5 - the action repeat count;
		if X is less than 1:
			rule succeeds with result 1;
		else:
			rule succeeds with result X.

Section: Altering Arousal Decay

By default, the arousal decay rules are very simple. 1 arousal is deducted per turn if the arousal of a person is over 0 and they have not done a sex action that turn. It looks like this:

*:
	Every turn (this is the arousal decay rule):
		repeat with partner running through people:
			unless the arousal of the partner is less than 1 or the partner is listed in the sexually active list:
				decrement the arousal of the partner.

However, you can replace it with a rule of your own creation.

*:
	The arousal decay rule is not listed in the every turn rulebook.
	Every turn (this is the custom arousal decay rule):
		repeat with partner running through people:
			unless the arousal of the partner is less than 1 or the partner is listed in the sexually active list:
				let N be a random number between 1 and 2;
				unarouse the partner by N.

The sexually active list is populated with everyone who has done a sex action or has been the subject of a sex action that turn. It might be useful to you.

Section: The Cumming Action

(In a future release of OrA, a much more sophisticated implementation of this might be made available. The one below is very quick and just for demonstration purposes.)

It's not common in AIF, but some games allow us to manually orgasm over a body part. An advanced implementation might include a distinction between voluntary and involuntary orgasms, a warning system and some other features, but this is a basic implementation that will allow us to manually orgasm just before the orgasm threshold. We'll assume the player is a heterosexual male.

*:
	Cumming upon is an action applying to one thing. Understand "cum on/in/upon [something]" as cumming upon.
	
	Check cumming upon something:
		if the arousal of the actor is less than 8:
			say "You aren't aroused enough to manually come." instead.
	Check cumming upon something:
		if the noun is not a body part:
			say "What's the point of that?" instead.
	Check cumming upon something:
		if the noun is enclosed by a not sex ready person (called the partner):
			say "[regarding the partner][They] [don't] appear to be willing." instead.
	Check cumming upon something:
		if the noun is enclosed by a male person:
			say "You wouldn't want to waste your spunk like that." instead.
	Check cumming upon something:
		if the noun is enclosed by a not androphilic person (called the partner):
			say "[regarding the partner][They] [are]n't attracted to men." instead.

Now, since a phrase handles everything else, all we need is a report rule.

*:
	Report cumming upon something:
		have the player orgasm on the noun.
		
Chapter: Reference

Section: Phrase Reference

	AROUSAL STATE AT (A NUMBER)... returns an arousal state corresponding to the number given.
	AROUSAL STATE OF (A PERSON)... returns an arousal state of the person at their arousal.
	AROUSE (A PERSON) BY (A NUMBER)... increases the arousal of the person by number amount.
	CLEAR ALL AROUSAL... sets the arousal of everyone to 0.
	CLEAR AROUSAL OF (A PERSON)... sets the arousal of someone to 0.
	HAVE (A PERSON) ORGASM... causes I7 to undergo the HANDLING AN ORGASM activity.
	HAVE (A PERSON) ORGASM ON/IN (A THING): causes i7 to undergo the HANDLING AN ORGASM activity but with tracking active.
	MARK (A PERSON) AS SEXUALLY ACTIVE: adds the person to the sexually active list.
	PERCENT FORM OF (A NUMBER) OVER (A NUMBER)... returns the ratio first number and the second number as a percentage.
	if (A PERSON) IS/ARE FEELING (AROUSAL STATE)... returns true if the arousal state of the person is the arousal state specified. 
	if (A PERSON) WILL ORGASM WITH (A THING)... returns true if the person's arousal is higher than their orgasm threshold, if the person is not orgasm-locked, and the thing is potentially orgasmic.
	UNAROUSE (A PERSON) BY (A NUMBER)... decreases the arousal of the person by a number amount.

Section: Rulebook Reference

	HANDLING AN ORGASM activity... activity on people, processes orgasms.
	ORGASM PROSE rules... prints prose when orgasms occur.
	SENSITIVITY rules... object based rulebook producing a number, returns the arousal gained from interacting with the body part.
	SEX PROSE rules... prints prose when sex occurs.
	SIMULTANEOUS ORGASM rules... prints prose when a simultaneous orgasm occurs.

Section: Kinds Reference

	AROUSAL STATE... a qualitative characterization of a character's arousal.
	ERECTION STATE... another qualitative characterization of a character's arousal, but specific to penises.
	
Section: Variables Reference

	ACTOR'S AROUSAL STATE... the saved arousal state of the actor, when an action is processed.
	DEBUG AROUSAL BOOLEAN... determines whether arousal debug mode is on or off.
	PARTNER'S AROUSAL STATE... the saved arousal state of the partner, when an action is processed.
	PRIMARY ORGASMER... defined as a person who has orgasmed. In the case of simultaneous orgasms, this is almost always the actor.
	OBJECT CUMMED ON... defined, usually, as either the first or second noun that isn't a part of the primary orgasmer's body. Can be defined as "nothing".
	OBJECT CUMMED WITH... defined as the first or second noun, whichever was part of the primary orgasmer.
	SECONDARY ORGASMER... defined as a person who also orgasmed in the case of a simultaneous orgasm.
	SIMULTANEOUS ORGASM BOOLEAN... indicates to the Handling an Orgasm activity that a simultaneous orgasm is about to take place.
	SEXUALLY ACTIVE LIST... a list of people who have done sexual activity this turn.

Section: Relations Reference

	TO PREVIOUSLY-ORGASM-UPON... thing-to-thing, tracks who has orgasmed where.

Section: Adjectives Reference

	ORGASM-LOCKED... assignable to people, defines a character who cannot orgasm.
	POTENTIALLY ORGASMIC... assignable to body parts and sex toys, defines a thing that can cause an orgasm to those using it.

Section: Properties Reference

	AROUSAL... number property of people, measures the arousal of someone.
	ORGASM THRESHOLD... number property of people, indicates an orgasm when a character exceeds orgasm threshold.
	MAXAROUSE... number property of erection states and arousal states, indicates at what arousal a character leaves an erection or arousal state.
	MINAROUSE... number property of erection states and arousal states, indicates at what arousal a character leaves and erection or arousal state.
	SEXSUITABLE... truth state property of erection states, indicating whether something can be fucked with.

Section: Use Options Reference

	NO SEX PROSE WHILST ORGASMING... when an orgasm is called, prevents sex prose from being printed.
	NO SIMULTANEOUS ORGASMS... causes two orgasms to be processed individually rather than together.
	PERMANENT HARDNESS... essentially disables erection states, making everyone permanently erect.
	

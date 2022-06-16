Version 1 of Posturing by Another Wannabe begins here.

"Adds furniture and postures to Simpler AIF."

Part - Postures

A posture is a kind of value. The postures are standing, sitting, kneeling, lying upward, lying downward and noposture.

Chapter - People have a Posture

A person has a posture called the current posture. The current posture is usually standing.

Chapter - Producing Prose

To stand is a verb.
To sit is a verb.
To kneel is a verb.
To lie is a verb.
To stay is a verb.

To say (the position - a posture) as verb:
	if the position is:
		-- standing:
			say "[stand]";
		-- sitting:
			say "[sit]";
		-- kneeling:
			say "[kneel]";
		-- lying upward:
			say "[lie]";
		-- lying downward:
			say "[lie]";
		-- noposture:
			say "[stay] still".

Part - Furniture

Chapter - Kind of Furniture

Some furniture is a kind of supporter. The plural of furniture is pieces of furniture. Furniture is always enterable.

Some furniture has a list of postures called the allowed postures. The allowed postures are usually { }.

Section - Beds

A bed is a kind of furniture. The allowed postures are {lying upward, lying downward, sitting}.
Understand "bed" as a bed.

Section - Chairs

A chair is a kind of furniture. The allowed postures are {sitting}.
Understand "chair" as a chair.

To sit is a verb.
Check an actor entering a chair (this is the chairs can only fit one rule):
	if the chair encloses a person (called the individual):
		issue failure message for the chairs can only fit one rule;
		rule succeeds.

Section - Sofas

A sofa is a kind of furniture. The allowed postures are {sitting, lying upward, lying downward}.
Understand "sofa" and "couch" as a sofa.

Chapter - What's Happening on the Furniture?

To decide whether someone is currently (the position - a posture) on (the item - a thing):
	if the item is not enterable:
		decide no;
	repeat with individual running through people enclosed by the item:
		if the current posture of the individual is the position:
			decide yes;
	decide no.

To decide whether (the individual - a person) is currently (the position - a posture) on (the item - a thing):
	if the current posture of the individual is the position and the individual is on the item:
		decide yes;
	decide no.

To decide which object is the person currently (the position - a posture) on (the item - a thing):
	if the item is enterable:
		decide on nothing;
	repeat with individual running through people enclosed by the item:
		if the current posture of the individual is the position:
			decide on the individual;
	decide on nothing.

Chapter - Entering and Leaving Furniture

Section - Preferred Postures

To decide which posture is the preferred posture of (the item - a thing):
	if the item is not furniture:
		decide on standing;
	else if the allowed postures of the item is { }:
		decide on standing;
	else:
		decide on entry 1 of the allowed postures of the item.
		
Section - Target Posture

The target posture is a posture that varies. The target posture is noposture.

The entering action has a posture called the posture targeted (matched as "postured").

Setting action variables for entering some furniture (this is the default to preferred posture rule):
	if the target posture is noposture and the allowed postures of the noun is not {}:
		now the posture targeted is the preferred posture of the noun;
	else:
		now the posture targeted is the target posture.

Post-action bookkeeping rule for entering (this is the reset target posture rule):
	now the target posture is noposture.

Section - Entering Furniture

Check an actor entering furniture (this is the can't enter furniture in the wrong posture rule):
	if the posture targeted is not listed in the allowed postures of the noun:
		issue failure message for the can't enter furniture in the wrong posture rule;
		rule succeeds.

Carry out an actor entering furniture (this is the shift positions upon entering furniture rule):
	now the current posture of the actor is the posture targeted.

Report an actor entering furniture (this is the report entering furniture rule):
	say  "[The actor] [posture targeted as verb] on [the noun]." (A);
	rule succeeds.

Section - Exiting Furniture

Carry out an actor getting off furniture (this is the shift positions upon exiting furniture rule):
	now the current posture of the actor is standing.

Part - Actions

Chapter - Entering Furniture

Section - Standing on Furniture

Understand the command "stand" as something new.

Standing on is an action applying to one thing. Understand "stand on [something]" as standing on.

Redirect an actor standing on something (this is the redirect standing to entering rule):
	if the actor is not on the noun:
		now the target posture is standing;
		try the actor entering the noun;
	else:
		try the actor standing.

Section - Sitting on Furniture

Understand the command "sit" as something new.

Sitting on is an action applying to one thing. Understand "sit on [something]" as sitting on.

Redirect an actor sitting on something (this is the redirect sitting to entering rule):
	if the actor is not on the noun:
		now the target posture is sitting;
		try the actor entering the noun;
	else:
		try the actor sitting.

Section - Kneeling on Furniture

Understand the command "kneel" as something new.

Kneeling on is an action applying to one thing. Understand "kneel on [something]" as kneeling on.

Redirect an actor kneeling on something (this is the redirect kneeling to entering rule):
	if the actor is not on the noun:
		now the target posture is kneeling;
		try the actor entering the noun;
	else:
		try the actor kneeling.
	
Section - Lying

Understand the commands "lay" and "lie" as something new.

Lying on is an action applying to one thing. Understand "lay on [something]" and "lay down on [something]" as lying on.
Understand the command "lie" as "lay".

Redirect an actor lying on something (this is the redirect lying to entering rule):
	if the actor is not on the noun:
		now the target posture is lying upward;
		try the actor entering the noun;
	else:
		try the actor lying.

Chapter - Shifting Postures

Section - Standing

Standing is an action applying to nothing. Understand "stand" as standing.

Redirect an actor standing (this is the guess that player means to get off rule):
	if the actor is on furniture (called the item):
		if standing is not listed in the allowed postures of the item:
			try the actor getting off the item;
		else:
			continue the action;
	else:
		continue the action.

Check an actor standing (this is the can't stand when already standing rule):
	if the current posture of the actor is standing:
		issue failure message for the can't stand when already standing rule;
		rule succeeds.

Check an actor standing (this is the can't stand on incompatible furniture rule):
	if the actor is on furniture (called the item):
		if standing is not listed in the allowed postures of the item:
			issue failure message for the can't stand on incompatible furniture rule;
			rule succeeds.

Carry out an actor standing (this is the change posture when standing rule):
	now the current posture of the actor is standing.

Report an actor standing (this is the report standing rule):
	say "[The actor] [stand]";
	if the actor is on furniture (called the item):
		say "on [the item]";
	else:
		say "."

Unsuccessful attempt by someone standing:
	rule succeeds.

Section - Kneeling

Kneeling is an action applying to nothing. Understand "kneel" as kneeling.

Check an actor kneeling (this is the can't kneel when already kneeling rule):
	if the current posture of the actor is kneeling:
		issue failure message for the can't kneel when already kneeling rule;
		rule succeeds.

Check an actor kneeling (this is the can't kneel on incompatible furniture rule):
	if the actor is on furniture (called the item):
		if kneeling is not listed in the allowed postures of the item:
			issue failure message for the can't kneel on incompatible furniture rule;
			rule succeeds.

Carry out an actor kneeling (this is the change posture when kneeling rule):
	now the current posture of the actor is kneeling.

Report an actor kneeling (this is the report kneeling rule):
	say "[The actor] [kneel]";
	if the actor is on furniture (called the item):
		say "on [the item]";
	else:
		say "."

Unsuccessful attempt by someone kneeling:
	rule succeeds.

Section - Sitting

Sitting is an action applying to nothing. Understand "sit" as sitting.

Check an actor sitting (this is the can't sit when already sitting rule):
	if the current posture of the actor is sitting:
		issue failure message for the can't sit when already sitting rule;
		rule succeeds.

Check an actor sitting (this is the can't sit on incompatible furniture rule):
	if the actor is on furniture (called the item):
		if sitting is not listed in the allowed postures of the item:
			issue failure message for the can't sit on incompatible furniture rule;
			rule succeeds.

Carry out an actor sitting (this is the change posture when sitting rule):
	now the current posture of the actor is sitting.

Report an actor sitting (this is the report sitting rule):
	say "[The actor] [sit]";
	if the actor is on furniture (called the item):
		say "on [the item]";
	else:
		say "."

Unsuccessful attempt by someone sitting:
	rule succeeds.

Section - Lying

Lying is an action applying to nothing. Understand "lay" and "lay down" as lying.

Check an actor lying (this is the can't lay when already lying rule):
	if the current posture of the actor is lying upward:
		issue failure message for the can't lay when already lying rule;
		rule succeeds.

Check an actor lying (this is the can't lay on incompatible furniture rule):
	if the actor is on furniture (called the item):
		if lying upward is not listed in the allowed postures of the item:
			issue failure message for the can't lay on incompatible furniture rule;
			rule succeeds.

Carry out an actor lying (this is the change posture when lying rule):
	now the current posture of the actor is lying upward.

Report an actor lying (this is the report lying rule):
	say "[The actor] [lie] down ";
	if the actor is on furniture (called the item):
		say "on [the item].";
	else:
		say "."
		
Unsuccessful attempt by someone lying:
	rule succeeds.

Chapter - Disambiguation (for use with Disambiguation Control by Jon Ingold)

Should the game suggest standing on furniture (this is the usually stand on furniture rule): it is a good suggestion.
Should the game suggest sitting on furniture (this is the usually sit on furniture rule): it is a good suggestion.
Should the game suggest lying on furniture (this is the usually lay on furniture rule): it is a good suggestion.
Should the game suggest kneeling on furniture (this is the usually kneel on furniture rule): it is a good suggestion.

Chapter - Failure Messages

Table of Failure Responses (continued)
rule name	message
the chairs can only fit one rule	"[The person asked] [can't sit] there, [the random person on the noun] [are] already on [regarding the noun][them]!"
the can't enter furniture in the wrong posture rule	"[The person asked] [can't] [target posture as verb] on [the noun], [they] [aren't] shaped to handle that."
the can't stand when already standing rule	"[The person asked] [are] already standing."
the can't stand on incompatible furniture rule	"[The person asked] [can't stand], [the holder of the person asked] [can't support] that."
the can't kneel when already kneeling rule	"[The person asked] [are] already kneeling."
the can't kneel on incompatible furniture rule	"[The person asked] [can't kneel], [the holder of the person asked] [can't support] that."
the can't sit when already sitting rule	"[The person asked] [are] already sitting."
the can't sit on incompatible furniture rule	"[The person asked] [can't sit], [the holder of the person asked] [can't support] that."
the can't lay when already lying rule	"[The person asked] [are] already lying."
the can't lay on incompatible furniture rule	"[The person asked] [can't lie], [the holder of the person asked] [can't support] that."


Part - Body Areas

Chapter - Defining Body Areas (for use without Advanced Layered Clothing by Another Wannabe)

A body area is a kind of value. The body areas are the featureless area, feet area, the legs area, the crotch area, the ass area, the tummy area, the chest area, the arms area, the hands area, the face area, the eyes area and the hair area.

A person has a list of body areas called the compatible areas. The compatible areas are usually {the feet area, the legs area, the crotch area, the ass area, the tummy area, the chest area, the arms area, the hands area, the face area, the eyes area, the hair area}.

A body part has a body area called the body location.
The body location of the hair is the hair area. The body location of the face is the face area. The body location of the eyes is the eyes area. The body location of arms is the arms area. The body location of legs is the legs area. The body location of the tummy is the tummy area. The body location of the chest is the chest area. The body location of the feet is the feet area. The body location of the hands is the hands area. The body location of the pussy is the crotch area. The body location of the cock is the crotch area. The body location of the ass is the ass area. The body location of the breasts is the chest area.

A body area can be lower body, upper body or an extremity (this is its coronal descriptor property).
A body area can be anterior, posterior or transversive (this is its transverse descriptor property).

The featureless area is upper body and anterior. The feet area is lower body and transversive. The legs area is lower body and transversive. The crotch area is lower body and anterior. The ass area is lower body and posterior. The tummy area is upper body and anterior. The chest area is upper body and anterior. The arms area is upper body and transversive. The hands area is an extremity and transversive. The face area is upper body and anterior. The eyes area is upper body and anterior. The hair area is upper body and transversive.



Chapter - Body Area Accessibility

Section - The Posture Accessibility Rules

The posture accessibility rules are an object based rulebook.
The tested posture is a posture that varies.
The tested area is a body area that varies.

To decide if (x - a thing) is/are accessible by posture:
	if X is enclosed by a person (called Z):
		now the tested posture is the current posture of Z;
	if X is a body part:
		now the tested area is the body location of X;
	else:
		decide yes;
	follow the posture accessibility rules for X;
	if the rule failed:
		decide no;
	decide yes.

To reach is a verb.
Posture accessibility for something (called the item) (this is the can't get to posterior body parts while sitting rule):
	if the tested area is posterior:
		if the tested posture is sitting:
			if the item is enclosed by a person (called N):
				say "[The person asked] [can't reach] [the noun], not while [the N] [are] [current posture of N]." (A);
				rule fails.

Posture accessibility for something (called the item) (this is the can't get to anterior body parts while lying downward rule):
	if the tested area is anterior:
		if the tested posture is lying downward:
			if the item is enclosed by a person (called N):
				say "[The person asked] [can't reach] [the noun], not while [the N] [are] [current posture of N]." (A);
				rule fails.

Section - Checking for Posture Accessibility

Check an actor rubbing a body part (this is the check for posture accessibility for rubbing rule):
	unless the noun is accessible by posture:
		rule succeeds.

Check an actor licking a body part (this is the check for posture accessibility for licking rule):
	unless the noun is accessible by posture:
		rule succeeds.

Check an actor fucking a body part with something (this is the check for posture accessibility for fucking rule):
	unless the noun is accessible by posture:
		rule succeeds.
		
[Chapter - Posture Shifting During Sex

Use posture changing during sex translates as (- Constant CHANGE_POSITIONS; -).

[This is a bullshit feature, in that it makes sense theoretically but probably is totally unnecessary for most games. Basically, while two characters are  doing it, they will change positions to best take advantage of each other, but only outside of furniture (furniture is generally to restrictive to make this work properly.) For example, when person A gives person B a blowjob, person A will kneel first.]

First carry out an actor licking a body part when the posture changing during sex option is active (this is the reaching to lick body parts rule):
	unless the actor is on furniture or the sex partner is the actor:
		if the body location of the noun is upper body and the current posture of the actor is kneeling:
			now the target posture is standing;
			carry out the implicitly changing position activity with the actor;
		if the body location of the noun is lower body and the current posture of the actor is standing:
			now the target posture is kneeling;
			carry out the implicitly changing position activity with the actor.


[Licking strap-ons is common enough where we must consider it, but for the sake of sanity we'll assume this is sort of strap on is affixed in the usual area.]
			
First carry out an actor licking a strap-on when the posture changing during sex option is active (this is the reaching to lick strap-ons rule):
	unless the actor is on furniture or the sex partner is the actor:
		if the current posture of the actor is standing:
			now the target posture is kneeling;
			carry out the implicitly changing position activity with the actor.

			
[These are for fucking.]

First carry out an actor fucking something with something (this is the shifting to fuck rule):
	unless the actor is on furniture or the sex partner is the actor:
		[identify the areas we are working with first]
		let X be a body area;
		let Y be a body area;
		if the second noun is a strap-on:
			now X is the crotch area;
		else if the second noun is a sex toy:
			now X is the hands area;
		else if the second noun is a body part:
			now X is the body location of the second noun;
		if the noun is a strap-on:
			now X is the crotch area;
		else if the second noun is a sex toy:
			now X is the hands area;
		else if the noun is a body part:
			now X is the body location of the noun;
		[then we look to see if shifting is necessary]
		let Z be a truth state; [Z tracks whether the postures need to be the same or different]
		if X is lower body and Y is lower body:
			now Z is true;
		else if X is upper body and Y is upper body:
			now Z is true; [if both body areas are the same level, both characters should have the same posture. Otherwise, they should be different.]
		if Z is false: [this handles the case when both characters are on different levels]
			if X is upper body: [at this point, we know the actor needs to be standing and the partner should be kneeling]
				if the current posture of the actor is not standing:
					now the target posture is standing;
					carry out the implicitly changing position activity with the actor;
				if the current posture of sex partner is not kneeling:
					now the target posture is kneeling;
					carry out the implicitly changing position activity with the sex partner;
			else: [same as above, but other way around]
				if the current posture of the actor is not kneeling:
					now the target posture is kneeling;
					carry out the implicitly changing position activity with the actor;
				if the current posture of sex partner is not standing:
					now the target posture is standing;
					carry out the implicitly changing position activity with the sex partner;
		else: [this handles the case when both characters are on the same level]
			let the saved posture be a posture;
			now the saved posture is the current posture of the sex partner;
			if the current posture of the actor is the saved posture: [in this case, nothing need happen]
				do nothing;
			else if the saved posture is kneeling:
				now the target posture is kneeling;
				carry out the implicitly changing position activity with the actor;
			else if the saved posture is standing:
				now the target posture is standing;
				carry out the implicitly changing position activity with the actor.

		
Implicitly changing position of something is an activity on objects.

Before implicitly changing position for a person (called the individual) (this is the print prose before changing positions rule):
	let the t1 be a text;
	if the individual is the player:
		now t1 is "[we]";
	else:
		now t1 is "[the individual]";
	say "([t1] [run paragraph on]";
	if the target posture is:
		-- standing: say "standing ";
		-- sitting: say "sitting ";
		-- kneeling: say "kneeling ";
		-- lying upward: say "lying ";
		-- lying downward: say "lying ";
		-- otherwise: say "standing ";
	say "first)[line break]".
	
Rule for implicitly changing position for a person (called the individual) (this is the implicitly change positions rule):
	now the current posture of the individual is the target posture.]
	
		


Part - Room Descriptions

Before printing the name of furniture when looking (this is the custom printing of furniture contents rule):
	omit contents in listing.

After printing the name of furniture (called the item) when looking (this is the print people on furniture rule):
	let N1 be the list of things on the item;
	let N2 be a list of objects;
	if the number of entries in N1 is at least 1:
		let N3 be N1;
		repeat with X running through N3:
			if X is a person:
				add X to N2;
				remove X from N1;
			unless X is not mentioned or X is not undescribed or X is not scenery:
				remove X from N1;
		if the number of entries in N1 is at least 1 or the number of entries in N2 is at least 1:
			say " (";
			if the number of entries in N2 is at least 1:
				let the individual be entry 1 of N2;
				say "on which [regarding the individual][current posture of the individual as verb] [the N2 with definite articles]";
			if the number of entries in N2 is at least 1 and the number of entries in N1 is at least 1:
				say " and also";
			else if the number of entries in N1 is at least 1:
				say " on which [regarding entry 1 of N1][are]";
			if the number of entries in N1 is at least 1:
				say " [the N1 with indefinite articles]";
			say ")".

Rule for printing room description details of a person (called the individual) (this is the print posture rule):
	if the current posture of the individual is not standing:
		say " ([current posture of the individual])".

Posturing ends here.

---- DOCUMENTATION ----

Chapter: Introduction

Section: Foreword

Posturing adds furniture and postures (sit, lie, standing, kneeling) to projects using the AIF Toolkit. It provides some functions for the use of furniture in sex actions, and can be used as the basis for a complex sex position system. Such a system is not provided.

For most projects, Posturing merely adds some flavor to the game world as people sit, lie, kneel and stand around. In this respect, adding Posturing will not add much complexity. It is only when posturing influences how sex actions work when things start to get dicey. And annoying. For example, it is possible to write different descriptions depending on the angle at which you look at a body part. Most people, however, want to leave the house occasionally. For the purposes of most projects you can just leave everything as default.

Section: Other Extensions

When including the extension, it needs to be listed after both Simpler AIF and Advanced Layered clothing (if used).

Section: Version History

	Version 1, August 21st
	-- Initial Release

Chapter: Basic Usage

Section: Postures

Five postures come packaged with Posturing, but only four of these can be entered by in-game commands. These are: standing, sitting, kneeling, lying upward and lying downward. The posture "noposture" is an absence of posture, and is only really used internally.

Standing is the default posture, the one characters will begin the game with unless stated otherwise. Kneeling, sitting, and lying upward all occur on different kinds of furniture. Lying downward doesn't occur by default and is included for the sake of completeness and for people who want to take a crack at writing very complicated position systems.

The posture a character is currently in is called its "current posture". Thus, you can test if someone is standing through the following command:

	if the current posture of Bob is standing...
	
You can also change someone's posture by declaring it to be something different.

	now the current posture of Bob is standing...
	
Generally, changing someone's posture on the fly will not cause problems.

The different postures can be entered into by various commands, named (obviously) standing, sitting, kneeling and lying. As mentioned before, lying only enters in the "lying upward" posture.

If you have conflicting grammar where "lying" is an action which means to tell a falsehood, then it is safe to CTRL+H all instances of "lying" with "laying" in the extension. Strictly speaking, "lying" is more grammatically correct than "laying" when referring to a reclining position.

The standing action also throws a special exception, because it can also mean to get off a piece of furniture. In this case, Posturing attempts to figure out what the intentions of the player are by looking at the piece of furniture itself. If it seems like a piece of furniture that was meant to be stood on, the game will assume the player means to stand on it rather than get off it.

Section: Furniture

Furniture is a new type of enterable supporter. Unlike normal enterable supporters, furniture only accepts someone entering it with a certain set of postures. These are called the allowed postures.

	The stool is a kind of furniture. The allowed postures of the stool are {standing, sitting, kneeling}.
	
Here, the first entry is very important. This is what Posturing assumes is the "normal" way to be on the furniture. We would mostly expect people to stand on stools. People can also sit and kneel on stools, which we might expect at a bar. This is called its "preferred posture".

	if the preferred posture of the stool is...
	
The preferred posture of an object can't be changed directly. Instead, the allowed postures property must be resorted so that some other posture is first in the list.

Some default pieces of furniture are included with Posturing, which you might expect. These are:

	Beds (lying upward, lying downward, sitting)
	Chairs (sitting)
	Sofas (sitting, lying upward, lying downward)
	
Chairs deserve a bit of a special mention. By default, they allow only on person to sit on them at a time.

Now, other postures are concievable on each of these pieces of furnitures. It's entirely possible to stand on a chair. However, we generally wouldn't expect it. If we need a chair that the player needs to stand on, to solve a puzzle perhaps, then we can change the allowed postures for that particular object.

	The allowed postures of the kitchen chair are {sitting, standing}.

This will allow people to stand on the kitchen chair.

Section: Entering Furniture

Entering a piece of furniture is controlled through the entering action, but with some alterations. First, four new actions redirect to entering. These are: standing on, sitting on, kneeling on and lying on. They do NOTHING but redirect to the entering action, lifting a flag that indicates which action was used. This is flag is called the "target posture". Upon moving to the redirect action, this is immediately converted to the "targeted posture".

We can add, as a clause, "postured", and then the posture we are entering by.

	After entering the rocking chair postured sitting:
		say "You sit on the creaky rocking chair."

It sounds awkward, I know, but we have few choices here.

Again, you can use "target posture" instead.

	After entering the rocking chair when the target posture is sitting:
		say "You sit on the creaky rocking chair."
		
When writing generic rules where a character could be in any particular position, we can use the phrase, "POSTURE as verb" to produce a text that corresponds to the posture. For example:

	"[Bob] [current posture of Bob as verb] on the chair."
	
would produce "Bob sits on the chair" if the current posture of Bob is sitting.

Section: Room Descriptions

Posturing changes room descriptions to describe who is sitting on what, and what position a person is currently in. If you don't like this behavior, you can unlist these rules:

*:
	The custom printing of furniture contents rule is not listed in any rulebook.
	The print people on furniture rule is not listed in any rulebook.
	The print posture rule is not listed in any rulebook.

Section: Postures and Sex

Posturing provides some basic support for having sex on furniture in different postures. Each body area is assigned two new descriptors: the coronal descriptor and the transverse descriptor. The coronal descriptor defines body areas by how high they are on the body. The transverse descriptors describe where a body area is relation to back to front.

The coronal descriptors are upper body, lower body and an extremity. An extremity describes a body part that is flexible to reach the upper body or the lower body. A good example of this are arms and hands, though tentacles are perfectly sensible too. Feet, while technically an extremity, are considered lower body. If you're wondering why that is, perhaps you should try scratching your head with your feet.

Similarly, the tranvese descriptors are anterior, posterior and transversive. Anterior is on the front of the body (i.e. one's chest) and posterior are on the behind (i.e. one's ass). Transversive body parts are one that can be described as being either front or back. For example, legs and arms occupy both realms.

The point of this whole exercise is to classify what body parts can be touched, given the NPC is in a certain position. As of right now, Posturing is very, very flexible with what can be touched. The only real restrictions are that the posterior can't be reach when then the character is sitting, and that the anterior can't be reached when the character is lying downward.

You, however, can craft new restrictions fairly easily.
	
	Posture accessibility for something (called the item) (this is the can't get to posterior body parts while laying upward rule):
		if the tested area is posterior:
			if the tested posture is laying upward:
				if the item is enclosed by a person (called N):
					say "[The person asked] [can't reach] [the noun], not while [the N] [are] [current posture of N]." (A);
					rule fails.

This will stop anyone from touching the ass while a person is laying upward. As might be expected, this is probably much more annoying to the player than it's worth.

Section: Kneeling to Give Head

(This feature is buggy and of dubious use, so it has been commented out in the source code. You are welcome to try and write it back in.)

Posturing has a special feature which makes people kneel before giving head, and then to stand to kiss them in the mouth. It's a pretty silly feature, honestly, and isn't activated by default. However, if you must have it, you can include this use option:

*:
	Use posture changing during sex.
	
It doesn't work while the characters on furniture, and it only works for standing and kneeling. But you are welcome to it.

Chapter: Advanced Use

Section: Creating New Postures

Creating new postures is reasonably easy but does require some modification of the internal code. Let's make a headstand posture.

	Headstanding is a posture.

There's a couple of internals we need to change.

	To say (the position - headstanding) as verb:
		say "[stand] on [their] head".

Now, we need to make the actions that allow us to assume the new posture. This will allow us to make a headstand.

	Headstanding is an action applying to nothing. Understand "headstand" and "stand on head" as headstanding.

	Check an actor headstanding (this is the can't headstand when already headstanding rule):
		if the current posture of the actor is headstanding:
			say "[The actor] [are] already standing on [their] head.";
			rule succeeds.

	Check an actor headstanding (this is the can't headstand on incompatible furniture rule):
		if the actor is on furniture (called the item):
			if headstanding is not listed in the allowed postures of the item:
				say "[The actor] cannot headstand on [the item].";
				rule succeeds.

	Carry out an actor headstanding (this is the change posture when headstanding rule):
		now the current posture of the actor is headstanding.

	Report an actor headstanding (this is the report headstanding rule):
		say "[The actor] [do] a headstand ";
		if the actor is on furniture (called the item):
			say "on [the item]";
		else:
			say "."

	Unsuccessful attempt by someone headstanding:
		rule succeeds.
	
Finally, this will allow us to enter furniture by headstanding on it.

	Headstanding on is an action applying to one thing. Understand "headstand on [something]" as headstanding on.

	Redirect an actor headstanding on something (this is the redirect headstanding to entering rule):
		if the actor is not on the noun:
			now the target posture is headstanding;
			try the actor entering the noun;
		else:
			try the actor headstanding.



Chapter: Reference

Section: New Kinds Index

Section: Phrase Index

Section: Rulebook Index


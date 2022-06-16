Version 11 of Advanced Layered Clothing by Another Wannabe begins here.

"An add-on for Simpler AIF that adds layered clothing."

Include version 12 of Simpler AIF by Another Wannabe.

Part - No Simple Clothing (in place of Part - Simpler Clothing in Simpler AIF by Another Wannabe) 

Part - Set Up
	

Part - New Clothing System

Use discard clothes after stripping translates as (- Constant DROP_CLOTHES = 1; -).
Use NPCs discard clothes after stripping translates as (- Constant DROP_CLOTHES = 2; -).

Use no implicit stripping translates as (- Constant NO_IMPLICIT_STRIPPING; -).

Chapter - Garments and Body Areas

A garment is a kind of thing. A garment is always wearable. A garment can be opaque or transparent. A garment is usually opaque.
A garment has a number called a layer. The layer is usually 1.

A body area is a kind of value. The body areas are the featureless area, feet area, the legs area, the crotch area, the ass area, the tummy area, the chest area, the arms area, the hands area, the face area, the eyes area and the hair area.

A garment has a list of body areas called the covered areas.

A person has a list of body areas called the compatible areas. The compatible areas are usually {the feet area, the legs area, the crotch area, the ass area, the tummy area, the chest area, the arms area, the hands area, the face area, the eyes area, the hair area}.

Section - Body Area Descriptors

A body area can be lower body, upper body or an extremity (this is its coronal descriptor property).
A body area can be anterior, posterior or transversive (this is its transverse descriptor property).

The featureless area is upper body and anterior. The feet area is lower body and transversive. The legs area is lower body and transversive. The crotch area is lower body and anterior. The ass area is lower body and posterior. The tummy area is upper body and anterior. The chest area is upper body and anterior. The arms area is upper body and transversive. The hands area is an extremity and transversive. The face area is upper body and anterior. The eyes area is upper body and anterior. The hair area is upper body and transversive.

Chapter - Garments List

[Fit over socks and stockings, block feet.]
The shoes are a kind of garment. The plural of shoes is pairs of shoes. The layer is 2. They are plural-named. Understand "shoe/shoes/footwear" as shoes. The covered areas are {feet area}.
[Blocks feet]
Some socks are a kind of garment. The plural of socks is pairs of socks. The layer is 1. They are plural-named. Understand "sock/socks" as socks. The covered areas are {feet area}.
[Blocks feet and legs]
Some stockings are a kind of garment. The plural of stockings is pairs of stockings. The layer is 1. They are plural-named. Understand "stocking/stockings/hose" as stockings. The covered areas are {feet area, legs area}.
[Blocks asses, pussies, cocks]
Some underwear is a kind of garment. The plural of underwear is pairs of underwear. The layer is 1. They are plural-named. Understand "underwear/underpants" as underwear. The covered areas are {crotch area, ass area}.
[Blocks asses, pussies, cocks, legs. Fits over underwear and stockings]
Some pants are a kind of garment. The plural of pants is pairs of pants. The layer is 2. They are plural-named. Understand "pants/trousers" as pants. The covered areas are {crotch area, ass area, legs area}.
[Blocks asses, pussies, cocks.]
Some shorts are a kind of garment. The plural of shorts is pairs of shorts. The layer is 2. They are plural-named. Understand "pants/shorts" as shorts. The covered areas are {crotch area, ass area}.
[Blocks chest, breasts and tummy.]
An undershirt is a kind of garment. The layer is 1. Understand "shirt/undershirt" as an undershirt. The covered areas are {chest area, tummy area, arms area}.
[Blocks breasts and chests.]
A bra is a kind of garment. The layer is 1. Understand "bra" as a bra. The covered areas are {chest area}.
[Blocks chest, breasts, arms and tummy. Fits over bras and undershirts]
A shirt is a kind of garment. The layer is 2. Understand "shirt" as a shirt. The covered areas are {chest area, tummy area, arms area}.
[Blocks chest, breasts, arms and tummy. Fits over the shirt.]
A coat is a kind of garment. The layer is 3. Understand "coat/jacket" as a coat. The covered areas are {chest area, tummy area, arms area}.
[Blocks hands.]
Some gloves are a kind of garment. The plural of gloves is pairs of gloves. They are plural-named. The layer is 1. Understand "glove/gloves" as gloves. The covered areas are {hands area}.
[Blocks hair.]
A hat is a kind of garment. The layer is 1. Understand "hat/headwear" as a hat. The covered areas are {hair area}.
[Blocks eyes.]
Some eyewear is a kind of garment. The plural of eyewear is sets of eyewear. They are plural-named and transparent. The layer is 1. Understand "eyewear" as eyewear. The covered areas are {eyes area}.
[Blocks the face.]
A mask is a kind of garment. The layer is 1. Understand "mask" as a mask. The covered areas are {face area}.
A bodysuit is a kind of garment. The layer is 1. Understand "bodysuit" as a bodysuit. The covered areas are {feet area, legs area, crotch area, ass area, tummy area, chest area, arms area, hands area}.

A body part has a body area called the body location.
The body location of the hair is the hair area. The body location of the face is the face area. The body location of the eyes is the eyes area. The body location of arms is the arms area. The body location of legs is the legs area. The body location of the tummy is the tummy area. The body location of the chest is the chest area. The body location of the feet is the feet area. The body location of the hands is the hands area. The body location of the pussy is the crotch area. The body location of the cock is the crotch area. The body location of the ass is the ass area. The body location of the breasts is the chest area.

Chapter - Phrases to Choose Garments

To decide if (x - a garment) could fit over (y - a body area):
	if y is listed in the covered areas of x:
		decide yes;
	else:
		decide no.

To decide if (x - a garment) could fit over (y - a body part):
	if the body location of y is listed in the covered areas of x:
		decide yes;
	else:
		decide no.

To decide if (x - a garment) couldn't fit over (y - a body area):
	if y is listed in the covered areas of x:
		decide no;
	else:
		decide yes.

To decide if (x - a garment) couldn't fit over (y - a body part):
	if the body location of y is listed in the covered areas of x:
		decide no;
	else:
		decide yes.

[These phrases are not sensitive to open garments.]
To decide which object is the/-- garment covering (X - a body area) of (Y - a person):
	let the possible garments be a list of garments;
	repeat with current garment running through garments worn by Y:
		add current garment to possible garments;
	sort possible garments in reverse layer order;
	repeat with current garment running through possible garments:
		if the current garment could fit over X:
			decide on current garment;
	decide on nothing.

To decide which object is the/-- garment covering (X - a body part):
	if X tests like a body part (called Y):
		now X is Y;
	let the possible garments be a list of garments;
	let Z be an object;
	if X is worn by a person (called the wearer):
		now Z is the wearer;
	else:
		decide on nothing;
	repeat with current garment running through garments worn by Z:
		add current garment to possible garments;
	sort possible garments in reverse layer order;
	repeat with current garment running through possible garments:
		if the current garment could fit over X:
			decide on current garment;
	decide on nothing.

To decide which object is the/-- garment covering layer (X - a number) of (the item - a body part):
	if the item is part of a person (called the individual):
		repeat with current garment running through garments worn by the individual:
			if the layer of the current garment is X and the current garment could fit over the item:
				decide on current garment;
	decide on nothing.

To decide which object is the/-- garment covering layer (X - a number) of (the current area - a body area) of (the individual - a person):
	repeat with current garment running through garments worn by the individual:
		if the layer of the current garment is X and the current garment could fit over the current area:
			decide on current garment;
	decide on nothing.

To decide which object is the/-- garment under (the current garment - a garment) covering (the current part - a body part):
	if the current garment is worn by a person (called the individual):
		let X be the layer of the current garment;
		decrement X;
		while X is greater than 0:
			let the possible garment be the garment covering layer X of the current part;
			unless the possible garment is nothing:
				decide on the possible garment;
			decrement X;
	decide on nothing.

To decide which object is the/-- garment under (the current garment - a garment) covering (the current area - a body area):
	if the current garment is worn by a person (called the individual):
		let X be the layer of the current garment;
		decrement X;
		while X is greater than 0:
			let the possible garment be the garment covering layer X of the current area of the individual;
			unless the possible garment is nothing:
				decide on the possible garment;
			decrement X;
	decide on nothing.

[These phrases are sensitive to open garments]
To decide which object is the/-- obstruction to (X - a body part):
	if X tests like a body part (called Z):
		now the tested part is Z;
	else:
		now the tested part is X;
	let the bwner be an object;
	if X is enclosed by a person (called Y):
		now the bwner is Y;
	else:
		decide on nothing;
	let the processed garments be a list of garments;
	repeat with K running through garments worn by the bwner:
		add K to the processed garments;
	sort the processed garments in reverse layer order;
	repeat with current garment running through processed garments:
		follow the clothing accessibility rules for the current garment;
		if the rule failed:
			decide on the current garment;
			break;
	decide on nothing.

To decide which object is the/-- obstruction to (X - a body area) of (Z - a person):
	let the processed garments be a list of garments;
	repeat with K running through garments worn by Z:
		add K to the processed garments;
	sort the processed garments in reverse layer order;
	repeat with current garment running through processed garments:
		if X is listed in the opened areas of the current garment:
			next;
		if the current garment could fit over X:
			decide on the current garment;
			break;
	decide on nothing.

The obstructing garment list is a list of garments that varies.

To find the garments covering (X - a body area) of (Z - a person):
	now the obstructing garment list is {};
	let the processed garments be a list of garments;
	repeat with K running through garments worn by Z:
		if K could fit over X:
			add K to processed garments;
	sort the processed garments in reverse layer order;
	now the obstructing garment list is the processed garments.

To find the garments covering (X - a body part):
	now the obstructing garment list is {};
	let the processed garments be a list of garments;
	let Y be the body location of X;
	let Z be a person;
	if X is enclosed by a person (called K):
		now Z is K;
	repeat with J running through garments worn by Z:
		if J could fit over Y:
			add J to processed garments;
	sort the processed garments in reverse layer order;
	now the obstructing garment list is the processed garments.

Section - Shorthand Phrases for Garments

To decide which object is the/-- feet garment of (X - a person):
	decide on the garment covering the feet area of X.
To decide which object is the/-- legs garment of (X - a person):
	decide on the garment covering the legs area of X.
To decide which object is the/-- crotch garment of (X - a person):
	decide on the garment covering the crotch area of X.
To decide which object is the/-- ass garment of (X - a person):
	decide on the garment covering the ass area of X.
To decide which object is the/-- tummy garment of (X - a person):
	decide on the garment covering the tummy area of X.
To decide which object is the/-- chest garment of (X - a person):
	decide on the garment covering the chest area of X.
To decide which object is the/-- face garment of (X - a person):
	decide on the garment covering the face area of X.
To decide which object is the/-- hair garment of (X - a person):
	decide on the garment covering the hair area of X.
To decide which object is the/-- eyes garment of (X - a person):
	decide on the garment covering the eyes area of X.
To decide which object is the/-- arms garment of (X - a person):
	decide on the garment covering the arms area of X.
To decide which object is the/-- hands garment of (X - a person):
	decide on the garment covering the hands area of X.

Chapter - Phrases to Determine Body Accessibility

The tested part is an object that varies.
The particular part is an object that varies.
The obstructing garment is an object that varies.

Substitute testing relates one body part to one body part. The verb to test like (it tests like, they test like, he tested like, it is tested like, it is testing like) implies the substitute testing relation.

To decide whether (x - a body part) is/are accessible:
	now the obstructing garment is nothing;
	let Y be the obstruction to X;
	if Y is nothing:
		decide yes;
	else:
		now the obstructing garment is Y;
		decide no.

To decide whether (x - a body part) is/are not accessible:
	now the obstructing garment is nothing;
	let Y be the obstruction to X;
	if Y is nothing:
		decide no;
	else:
		now the obstructing garment is Y;
		decide yes.

To decide whether (x - a body area) of (z - a person) is/are accessible:
	now the obstructing garment is nothing;
	let Y be the obstruction to X of Z;
	if Y is nothing:
		decide yes;
	else:
		now the obstructing garment is Y;
		decide no.

To decide whether (x - a body area) of (z - a person) is/are not accessible:
	now the obstructing garment is nothing;
	let Y be the obstruction to X of Z;
	if Y is nothing:
		decide no;
	else:
		now the obstructing garment is Y;
		decide yes.

To decide whether (x - a garment) is/are not under clothing:
	if X is not worn by a person:
		decide yes;
	else if X is worn by a person (called the wearer):
		repeat with current area running through the covered areas of X:
			let N be the obstruction to the current area of the wearer;
			if the N is X:
				decide yes;
		decide no.

Definition: a garment is outermost if it is not under clothing.

Definition: a body part is exposed if it is accessible.
Definition: a body part is covered if it is not accessible.

The clothing accessibility rules are a garment based rulebook. The clothing accessibility rules have outcomes unobstructed (success) and obstructed (failure).

Last clothing accessibility rule for a garment (called the tested garment) (this is the default clothing accessibility rule):
	if the body location of the tested part is listed in the opened areas of the tested garment:
		unobstructed;
	if the body location of the tested part is listed in the covered areas of the tested garment:
		obstructed;
	else:
		unobstructed.

Chapter - Wearing Clothes

Check an actor wearing a garment (this is the can't wear things with incompatible anatomy rule):
	unless the the actor is anatomically compatible with the noun:
		issue failure message for the can't wear things with incompatible anatomy rule;
		rule succeeds.

Last check an actor wearing a garment (this is the can't wear a garment over clothes rule):
[	if the actor is wearing the noun:
		say "[The actor] [is-are] already wearing [the noun]." instead;]
	let the intervening garments be a list of garments;
	repeat with the current garment running through garments worn by the actor:
		if the current garment overlaps the noun and the layer of the current garment is at least the layer of the noun:
			add the current garment to the intervening garments;
	sort the intervening garments in reverse layer order;
	unless the number of entries in the intervening garments is 0:
		repeat with Z running through the intervening garments:
			unless the no implicit stripping option is active:
				carry out the implicitly stripping off activity with the Z;
			if the actor is wearing Z:
				now the blocking garment is Z;
				issue failure message for the can't wear a garment over clothes rule;
				rule succeeds.
				

implicitly stripping off something is an activity on objects.

Rule for implicitly stripping off a garment (called Z) (this is the default implicit stripping rule):
	say "(removing [the Z])[line break]";
	silently try the person asked stripping off Z.


Persuasion rule for asking a person to try wearing something (this is the sex ready NPCs can be ordered to wear clothing rule):
	if the person asked is sex ready:
		persuasion succeeds.

Table of Failure Responses (continued)
rule name	message
the can't wear a garment over clothes rule	"[The person asked] [can't wear] [the noun] over [the blocking garment]."
the can't wear things with incompatible anatomy rule	"[The person asked] [can't wear] [the noun], [regarding the person asked][they] [don't] have the right anatomy."

Section - Phrases to Determine Wearing Logic

To decide if (x - a garment) overlaps (y - a garment):
	repeat with current area running through the covered areas of X:
		if Y could fit over the current area:
			decide yes;
	decide no.
To decide if (x - a person) is/are anatomically compatible with (y - a garment):
	repeat with current area running through the covered areas of y:
		if the current area is not listed in the compatible areas of X:
			decide no;
	decide yes.

Chapter - Stripping Off

Stripping off is an action applying to one thing. Understand "take off [a garment]", "take [a garment] off", "remove [a garment]", "strip off [a garment]", "strip [a garment]" and "shed [a garment]" as stripping off.
Understand the command "disrobe/undress/doff" as "strip"

To strip is a verb.

The person stripped is an object that varies.

Setting action variables for stripping off (this is the set variables for stripping rule):
	if the noun is enclosed by a person (called Z):
		now the person stripped is Z.

Redirect an actor taking off a garment (this is the redirect taking off a garment to stripping off rule):
	try the actor stripping off the noun.

Check an actor stripping off something (this is the can't strip things that aren't being worn rule):
	if the noun is not worn by a person:
		issue failure message for the can't strip things that aren't being worn rule;
		rule succeeds.
Last check an actor stripping off a garment (this is the can't strip off a garment over clothes rule):
	let the intervening garments be a list of garments;
	repeat with the current garment running through garments worn by the person stripped:
		if the current garment overlaps the noun and the layer of the current garment is greater than the layer of the noun:
			add the current garment to the intervening garments;
	sort the intervening garments in reverse layer order;
	unless the number of entries in the intervening garments is 0:
		repeat with Z running through the intervening garments:
			unless the no implicit stripping option is active:
				carry out the implicitly stripping off activity with the Z;
			if the person stripped is wearing Z:
				now the blocking garment is Z;
				issue failure message for the can't strip off a garment over clothes rule;
				rule succeeds.

First carry out stripping off a garment (this is the mark the wearer of the garment as the last partner specified when stripping off rule):
	if the garment is worn by a person (called the person):
		if the person is not the player:
			now the last partner specified is the person.
Carry out an actor stripping off a garment (this is the standard carry out stripping off rule):
	if the discard clothes after stripping option is active:
		now the noun is in the location of the actor;
	else if NPCs discard clothes after stripping option is active:
		if the person stripped is the player:
			now the noun is carried by the person stripped;
		else:
			now the noun is in the location of the actor;
	else:
		now the noun is carried by the person stripped.

Report an actor stripping off a garment (this is the standard report stripping off rule):
	say "[The actor] [strip] off [the noun]." (A).

Table of Failure Responses (continued)
rule name	message
the can't strip things that aren't being worn rule	"[The person asked] [can't strip] [the noun], [they] [aren't] being worn."
the can't strip off a garment over clothes rule	"[The person asked] [can't strip] [the noun] over [the blocking garment]."

Section - Self-stripping only

Use self-stripping only translates as (- Constant SELF_STRIPPING_ONLY; -).

Redirect an actor stripping off a garment worn by a person (called the partner) when the self-stripping only option is active:
	unless the actor is the partner:
		try the partner stripping off the noun;
	else:
		continue the action.
		

Section - Auto Stripping

Self-stripping is an action applying to nothing. Understand "strip" as self-stripping.
Self-stripping is sexual behavior.
Redirect an actor self-stripping (this is the try stripping yourself whilst self-stripping rule):
	try the actor stripping the actor.
Unsuccessful attempt by someone self-stripping:
	do nothing.


Stripping is an action applying to one thing. Understand "strip off [a person]" and "strip [a person]" as stripping.

Rule for supplying a missing noun while stripping (this is the default to stripping yourself rule):
	if the person asked is not the player:
		now the noun is the person asked;
	else:
		now the noun is the player.

Redirect an actor stripping a garment (this is the redirect stripping garments to stripping off garments rule):
	try the actor stripping off the noun instead.

Check an actor stripping something (this is the can't strip things that aren't people rule):
	if the noun is not a person:
		say "[The actor] [can't strip] [the noun], [they] [aren't] [if the noun is plural-named]people[else]a person[end if]." (A) instead.
Check an actor stripping a person (this is the can't strip people who aren't wearing anything rule):
	if the noun is not wearing a garment:
		say "[The actor] [can't strip] [the noun], [they] [are] already naked." (A) instead.

Carry out an actor stripping (this is the standard carry out stripping rule):
	let stripped garments be a list of garments;
	repeat with current garment running through garments worn by the noun:
		add the current garment to stripped garments;
	sort the stripped garments in reverse layer order;
	repeat with current garment running through stripped garments:
		carry out the implicitly stripping off activity with the current garment;
		if the actor is wearing the current garment:
			break.

Report an actor stripping (this is the standard report stripping rule):
	if the noun wears a garment:
		say "[The noun] [wear] [the list of outermost garments worn by the noun]." (A);
	else:
		say "[The noun] [are] now nude." (B).

Table of Failure Responses (continued)
rule name	message
the can't strip things that aren't people rule	"[The person asked] [can't strip] [the noun], [they] [aren't] [if the noun is plural-named]people[else]a person[end if]."
can't strip people who aren't wearing anything rule	"[The person asked] [can't strip] [the noun], [they] [are] already naked."

Section - Stripping as Sexual Behavior

Stripping a person is sexual behavior. Stripping off underwear is sexual behavior. Stripping off a bra is sexual behavior. Stripping off a shirt is sexual behavior. Stripping off pants is sexual behavior. Stripping off an undershirt is sexual behavior.
To appear is a verb.

First check someone stripping off a garment (this is the can't get a person to strip off a garment who is not sex ready rule):
	if the actor is not sex ready:
		say "[Generic sex refusal message of the actor][paragraph break]" (A) instead.
First check an actor stripping off a garment (this is the can't strip off a garment worn by a person who is not sex ready rule):
	if the noun is worn by a person (called the individual) who is not sex ready:
		say "[Generic sex refusal message of the individual][paragraph break]" (A) instead.

Check an actor stripping off a garment (this is the can't strip off with incompatible sexuality rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.

First check someone stripping a person (this is the can't get a person to strip a person who is not sex ready rule):
	if the actor is not sex ready:
		say "[Generic sex refusal message of the actor][paragraph break]" (A) instead.
First check an actor stripping a person (this is the can't strip a person who is not sex ready rule):
	if the noun is not sex ready:
		say "[Generic sex refusal message of the noun][paragraph break]" (A) instead.

Check an actor stripping a person (this is the can't strip a person with incompatible sexuality rule):
	unless the noun is the actor:
		follow the sexual orientation rules;
		if the rule failed:
			rule succeeds.
			
Chapter - Disambiguation for Basic Garments (for use without Disambiguation Control by Jon Ingold)

Does the player mean wearing something which is not wearable (this is the assume the player doesn't mean to wear things that aren't wearable rule): it is very unlikely.

Part - Openable Garments

Use no openable clothing translates as (- Constant NO_OPENABLE_CLOTHING; -).

The modest boolean is a truth state that varies.

To adjust (the current garment - a garment) over (the revealed areas - a list of body areas):
	if the modest boolean is true:
		remove the revealed areas from the opened areas of the current garment;
	else:
		add the revealed areas to the opened areas of the current garment.

A garment can be shifted or unshifted. A garment is usually unshifted.
A garment can be shiftable. A garment is usually not shiftable.
A garment can be buttoned or unbuttoned. A garment is usually buttoned.
A garment can be unbuttonable. A garment is usually not unbuttonable.
A garment can be unzipped or zipped. A garment is usually zipped.
A garment can be unzippable. A garment is usually not unzippable.

Definition: a garment is openable if it is shiftable or it is unzippable or it is unbuttonable.
Definition: a garment is open if (it is unzipped or it is unbuttoned or it is shifted).
Definition: a garment is closed if (it is zipped and it is buttoned and it is unshifted).

A garment has a list of body areas called the opened areas. The opened areas are usually { }.

Chapter - Shifting

Shifting is an action applying to one thing. Understand "shift [a garment]", "move [a garment]" and "lift [a garment]" as shifting when the no openable clothing option is not active. Understand "push aside [a garment]" as shifting when the no openable clothing option is not active.
To shift is a verb.
To readjust is a verb.

First check an actor shifting something (this is the can't shift things that aren't garments rule):
	if the noun is not a garment:
		issue failure message for the can't shift things that aren't garments rule;
		rule succeeds.
Check an actor shifting a garment (this is the can't shift things that aren't shiftable rule):
	if the noun is not shiftable:
		issue failure message for the can't shift things that aren't shiftable rule;
		rule succeeds.
Check an actor shifting a garment (this is the can't shift things that are already shifted rule):
	if the noun is shifted:
		issue failure message for the can't shift things that are already shifted rule;
		rule succeeds.


Carry out an actor shifting a garment (this is the standard carry out shifting garments rule):
	now the modest boolean is false;
	follow the shifting behavior rules for the noun;
	now the noun is shifted.
Carry out shifting a garment (this is the mark NPC as last partner specified when shifting rule):
	if the noun is worn by a person (called the person):
		if the person is not the player:
			now the last partner specified is the person.

Report an actor shifting a garment (this is the standard report shifting rule):
	say "[The actor] [shift] [the noun]." (A).

Unshifting is an action applying to one thing. Understand "unshift [something]" and "lower [a garment]" as unshifting when the no openable clothing option is not active.
To unshift is a verb.

First check an actor unshifting something (this is the can't unshift things that aren't garments rule):
	if the noun is not a garment:
		issue failure message for the can't unshift things that aren't garments rule;
		rule succeeds.
Check an actor unshifting a garment (this is the can't unshift things that aren't shiftable rule):
	if the noun is not shiftable:
		issue failure message for the can't unshift things that aren't shiftable rule;
		rule succeeds.
Check an actor unshifting a garment (this is the can't unshift things that are already shifted rule):
	if the noun is unshifted:
		issue failure message for the can't unshift things that are already shifted rule;
		rule succeeds.

Carry out an actor unshifting a garment (this is the standard carry out unshifting garments rule):
	now the modest boolean is true;
	follow the shifting behavior rules for the noun;
	now the noun is unshifted.

Report an actor unshifting a garment (this is the standard report unshifting rule):
	say "[The actor] [readjust] [the noun]." (A).

The shifting behavior is a garment based rulebook. The shifting behavior rules have default success.
shifting a garment is sexual behavior.



Table of Failure Responses (continued)
rule name	message
the can't shift things that aren't garments rule	"[The noun] [can't shift]."
the can't shift things that aren't shiftable rule	"[The noun] [can't shift]."
the can't shift things that are already shifted rule	"[The noun] [are] already shifted."
the can't unshift things that aren't garments rule	"[The noun] [aren't] something that [can] be shifted in the first place."
the can't unshift things that aren't shiftable rule	"[The noun] [can't unshift]."
the can't unshift things that are already shifted rule	"[The noun] [can't unshift] any more."


Chapter - Unbuttoning

Unbuttoning is an action applying to one thing. Understand "unbutton [something]" as unbuttoning when the no openable clothing option is not active.
To unbutton is a verb.

First check an actor unbuttoning something (this is the can't unbutton things that aren't garments rule):
	if the noun is not a garment:
		issue failure message for the can't unbutton things that aren't garments rule;
		rule succeeds.
Check an actor unbuttoning a garment (this is the can't unbutton things that aren't unbuttonable rule):
	if the noun is not unbuttonable:
		issue failure message for the can't unbutton things that aren't unbuttonable rule;
		rule succeeds.
Check an actor unbuttoning a garment (this is the can't unbutton things that are already unbuttoned rule):
	if the noun is unbuttoned:
		issue failure message for the can't unbutton things that are already unbuttoned rule;
		rule succeeds.

Carry out an actor unbuttoning a garment (this is the standard carry out unbuttoning garments rule):
	now the modest boolean is false;
	follow the unbuttoning behavior rules for the noun;
	now the noun is unbuttoned.
Carry out unbuttoning a garment (this is the mark NPC as last partner specified when unbuttoning rule):
	if the noun is worn by a person (called the person):
		if the person is not the player:
			now the last partner specified is the person.

Report an actor unbuttoning a garment (this is the standard report unbuttoning rule):
	say "[The actor] [unbutton] [the noun]." (A).

buttoning is an action applying to one thing. Understand "button [something]" as buttoning when the no openable clothing option is not active.
To button is a verb.

First check an actor buttoning something (this is the can't button things that aren't garments rule):
	if the noun is not a garment:
		issue failure message for the can't button things that aren't garments rule;
		rule succeeds.
Check an actor buttoning a garment (this is the can't button things that aren't unbuttonable rule):
	if the noun is not unbuttonable:
		issue failure message for the can't button things that aren't unbuttonable rule;
		rule succeeds.
Check an actor buttoning a garment (this is the can't button things that are already buttoned rule):
	if the noun is buttoned:
		issue failure message for the can't button things that are already buttoned rule;
		rule succeeds.

Carry out an actor buttoning a garment (this is the standard carry out buttoning garments rule):
	now the modest boolean is true;
	follow the unbuttoning behavior rules for the noun;
	now the noun is buttoned.

Report an actor buttoning a garment (this is the standard report buttoning rule):
	say "[The actor] [button] [the noun]." (A).

The unbuttoning behavior is a garment based rulebook. The unbuttoning behavior rules have default success.


	
Table of Failure Responses (continued)
rule name	message
the can't unbutton things that aren't garments rule	"[The noun] [can't unbutton]."
the can't unbutton things that aren't unbuttonable rule	"[The noun] [can't unbutton]."
the can't unbutton things that are already unbuttoned rule	"[The noun] [can't unbutton]."
the can't button things that aren't garments rule	"[The noun] [can't button]."
the can't button things that aren't unbuttonable rule	"[The noun] [can't button]."
the can't button things that are already buttoned rule	"[The noun] [are] already buttoned."

Chapter - Unzipping

Unzipping is an action applying to one thing. Understand "unzip [something]" as unzipping when the no openable clothing option is not active.
To unzip is a verb

First check an actor unzipping something (this is the can't unzip things that aren't garments rule):
	if the noun is not a garment:
		issue failure message for the can't unzip things that aren't garments rule;
		rule succeeds.
Check an actor unzipping a garment (this is the can't unzip things that aren't unzippable rule):
	if the noun is not unzippable:
		issue failure message for the can't unzip things that aren't unzippable rule;
		rule succeeds.
Check an actor unzipping a garment (this is the can't unzip things that are already unzipped rule):
	if the noun is unzipped:
		issue failure message for the can't unzip things that are already unzipped rule;
		rule succeeds.

Carry out an actor unzipping a garment (this is the standard carry out unzipping garments rule):
	now the modest boolean is false;
	follow the unzipping behavior rules for the noun;
	now the noun is unzipped.
Carry out unzipping a garment (this is the mark NPC as last partner specified when unzipping rule):
	if the noun is worn by a person (called the person):
		if the person is not the player:
			now the last partner specified is the person.

Report an actor unzipping a garment (this is the standard report unzipping rule):
	say "[The actor] [unzip] [the noun]." (A).

Zipping is an action applying to one thing. Understand "zip [something]" as zipping when the no openable clothing option is not active.
To zip is a verb.

First check an actor zipping something (this is the can't zip things that aren't garments rule):
	if the noun is not a garment:
		issue failure message for the can't zip things that aren't garments rule;
		rule succeeds.
Check an actor zipping a garment (this is the can't zip things that aren't unzippable rule):
	if the noun is not unzippable:
		issue failure message for the can't zip things that aren't unzippable rule;
		rule succeeds.
Check an actor zipping a garment (this is the can't zip things that are already unzipped rule):
	if the noun is zipped:
		issue failure message for the can't zip things that are already unzipped rule;
		rule succeeds.

Carry out an actor zipping a garment (this is the standard carry out zipping garments rule):
	now the modest boolean is true;
	follow the unzipping behavior rules for the noun;
	now the noun is zipped.

Report an actor zipping a garment (this is the standard report zipping rule):
	say "[The actor] [zip] [the noun]." (A).

The unzipping behavior is a garment based rulebook. The unzipping behavior rules have default success.
Unzipping a garment is sexual behavior.



Table of Failure Responses (continued)
rule name	message
the can't unzip things that aren't garments rule	"[The noun] [can't unzip]."
the can't unzip things that aren't unzippable rule	"[The noun] [can't unzip]."
the can't unzip things that are already unzipped rule	"[The noun] [are] already unzipped."
the can't zip things that aren't garments rule	"[The noun] [can't zip]."
the can't zip things that aren't unzippable rule	"[The noun] [can't zip]."
the can't zip things that are already unzipped rule	"[The noun] [are] already zipped."

Chapter - Wearing a Garment Makes it Modest

Carry out an actor wearing a garment (this is the make clothes modest as they are worn rule):
	make modest the noun.

Chapter - Integrating Opening Garments With Sexual Behavior

[Opening garments]
First check an actor shifting a garment (this is the can't shift a garment worn by a person who is not sex ready rule):
	unless the actor is the player and the noun is worn by the player:
		if the actor is not sex ready and the actor is not the player:
			say "[generic sex refusal message of actor][paragraph break]" (A) instead;
		else if the noun is worn by a person (called the individual) who is not sex ready:
			say "[generic sex refusal message of individual][paragraph break]" (B) instead.

Check an actor shifting a garment (this is the can't shift a person whose sexuality is not compatible rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.

First check an actor unbuttoning a garment (this is the can't unbutton a garment worn by a person who is not sex ready rule):
	unless the actor is the player and the noun is worn by the player:
		if the actor is not sex ready and the actor is not the player:
			say "[generic sex refusal message of actor][paragraph break]" (A) instead;
		else if the noun is worn by a person (called the individual) who is not sex ready:
			say "[generic sex refusal message of individual][paragraph break]" (B) instead.

Check an actor unbuttoning a garment (this is the can't unbutton a person whose sexuality is not compatible rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.


First check an actor unzipping a garment (this is the can't unzip a garment worn by a person who is not sex ready rule):
	unless the actor is the player and the noun is worn by the player:
		if the actor is not sex ready and the actor is not the player:
			say "[generic sex refusal message of actor][paragraph break]" (A) instead;
		else if the noun is worn by a person (called the individual) who is not sex ready:
			say "[generic sex refusal message of individual][paragraph break]" (B) instead.

Check an actor unzipping a garment (this is the can't unzip a person whose sexuality is not compatible rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.

[Closing]
First check an actor unshifting a garment (this is the can't unshift a garment worn by a person who is not sex ready rule):
	unless the actor is the player and the noun is worn by the player:
		if the actor is not sex ready and the actor is not the player:
			say "[generic sex refusal message of actor][paragraph break]" (A) instead;
		else if the noun is worn by a person (called the individual) who is not sex ready:
			say "[generic sex refusal message of individual][paragraph break]" (B) instead.

Check an actor unshifting a garment (this is the can't unshift a person whose sexuality is not compatible rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.

First check an actor buttoning a garment (this is the can't button a garment worn by a person who is not sex ready rule):
	unless the actor is the player and the noun is worn by the player:
		if the actor is not sex ready and the actor is not the player:
			say "[generic sex refusal message of actor][paragraph break]" (A) instead;
		else if the noun is worn by a person (called the individual) who is not sex ready:
			say "[generic sex refusal message of individual][paragraph break]" (B) instead.

Check an actor buttoning a garment (this is the can't button a person whose sexuality is not compatible rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.

First check an actor zipping a garment (this is the can't zip a garment worn by a person who is not sex ready rule):
	unless the actor is the player and the noun is worn by the player:
		if the actor is not sex ready and the actor is not the player:
			say "[generic sex refusal message of actor][paragraph break]" (A) instead;
		else if the noun is worn by a person (called the individual) who is not sex ready:
			say "[generic sex refusal message of individual][paragraph break]" (B) instead.

Check an actor zipping a garment (this is the can't zip a person whose sexuality is not compatible rule):
	unless the noun is worn by the actor:
		if the noun is worn by a person (called the individual):
			follow the sexual orientation rules;
			if the rule failed:
				rule succeeds.

Persuasion rule for asking a person to try zipping (this is the NPCs comply with zipping rule):
	persuasion succeeds.
Persuasion rule for asking a person to try buttoning (this is the NPCs comply with buttoning rule):
	persuasion succeeds.
Persuasion rule for asking a person to try unshifting (this is the NPCs comply with unshifting rule):
	persuasion succeeds.

Chapter - Phrases Involving Openable Clothing

The garments reached through is a list of garments that varies.

To find the/-- garments reached through to (X - a body part):
	now the garments reached through is { };
	if X tests like a body part (called Z):
		now the tested part is Z;
	else:
		now the tested part is X;
	let the bwner be an object;
	if X is enclosed by a person (called Y):
		now the bwner is Y;
	let the processed garments be a list of garments;
	repeat with K running through garments worn by the bwner:
		add K to the processed garments;
	sort the processed garments in reverse layer order;
	repeat with current garment running through processed garments:
		follow the clothing accessibility rules for the current garment;
		if the rule succeeded:
			if the body location of the tested part is listed in the opened areas of the current garment:
				add current garment to the garments reached through; 
		if the rule failed:
			now the obstructing garment is the current garment;
			break.

To find the/-- garments reached through to (X - a body area) of (Y - a person):
	now the garments reached through is { };
	let the processed garments be a list of garments;
	repeat with K running through garments worn by Y:
		add K to the processed garments;
	sort the processed garments in reverse layer order;
	repeat with current garment running through processed garments:
		follow the clothing accessibility rules for the current garment;
		if the rule succeeded:
			if the body location of the tested part is listed in the opened areas of the current garment:
				add current garment to the garments reached through; 
		if the rule failed:
			now the obstructing garment is the current garment;
			break.
			
To decide if a/-- garment was/were reached through to (X - a body part):
	find garments reached through to X;
	if garments reached through is { }:
		decide no;
	decide yes.

To decide if a/-- garment was/were reached through to (X - a body area) of (Y - a person):
	find garments reached through to X of Y;
	if garments reached through is { }:
		decide no;
	decide yes.

To decide if (X - a garment) was/were reached through:
	if X is listed in the garments reached through:
		decide yes;
	decide no.

Chapter  - Populating Garments Reached Through

Carry out rubbing a body part (this is the find garments reached through when rubbing rule):
	find the garments reached through to the noun.

Carry out licking a body part (this is the find garments reached through when licking rule):
	find the garments reached through to the noun.

Carry out fucking a body part (this is the find garments reached through when fucking rule):
	find the garments reached through to the noun.
	
Carry out fucking a body part with something (this is the find garments reached through when fucking it with rule):
	find the garments reached through to the noun.

Chapter - Generic Opening Garments

Before an actor opening a garment (this is the redirect attempts to open garments to other means rule):
	if the noun is shiftable:
		try the actor shifting the noun instead;
	if the noun is unbuttonable:
		try the actor unbuttoning the noun instead;
	if the noun is unzippable:
		try the actor unzipping the noun instead.

Chapter - Disambiguation for Opening Garments (for use without Disambiguation Control by Jon Ingold)

Does the player mean shifting a worn outermost shiftable garment which is unshifted (this is the assume the player means to shift a shiftable unshifted garment rule):
	it is very likely.
Does the player mean unshifting a worn outermost shiftable garment which is shifted (this is the assume the player means to unshift a shiftable shifted garment rule):
	it is very likely.
Does the player mean unbuttoning a worn outermost unbuttonable garment which is buttoned (this is the assume the player means to unbutton an unbuttonable buttoned garment rule):
	it is very likely.
Does the player mean buttoning a worn outermost unbuttonable garment which is unbuttoned (this is the assume the player means to button a unbuttonable buttoned garment rule):
	it is very likely.
Does the player mean unzipping a worn outermost unzippable garment which is zipped (this is the assume the player means to unzip an unzippable zipped garment rule):
	it is very likely.
Does the player mean zipping a worn outermost unzippable garment which is unzipped (this is the assume the player means to zip a unzippable zipped garment rule):
	it is very likely.

Chapter - Disambiguation for Opening Garments (for use with Disambiguation Control by Jon Ingold)

Should the game suggest shifting a worn outermost shiftable garment which is unshifted (this is the assume the player means to shift a shiftable unshifted garment rule):
	it is a good suggestion.
Should the game suggest unshifting a worn outermost shiftable garment which is shifted (this is the assume the player means to unshift a shiftable shifted garment rule):
	it is a good suggestion.
Should the game suggest unbuttoning a worn outermost unbuttonable garment which is buttoned (this is the assume the player means to unbutton an unbuttonable buttoned garment rule):
	it is a good suggestion.
Should the game suggest buttoning a worn outermost unbuttonable garment which is unbuttoned (this is the assume the player means to button a unbuttonable buttoned garment rule):
	it is a good suggestion.
Should the game suggest unzipping a worn outermost unzippable garment which is zipped (this is the assume the player means to unzip an unzippable zipped garment rule):
	it is a good suggestion.
Should the game suggest zipping a worn outermost unzippable garment which is unzipped (this is the assume the player means to zip a unzippable zipped garment rule):
	it is a good suggestion.

Part - Accessories

[A thing can be a accessory.

Rule for deciding the concealed possessions of a body part (called the particular part) (this is the conceal accessories on body parts rule):
	if the particular possession is an accessory:
		if the particular part is accessible:
			yes;
		else:
			no.

Rule for deciding the concealed possessions of a garment (called the particular garment) (this is the conceal accessories on garments rule):
	if the particular possession is an accessory:
		if the particular garment is not under clothing:
			yes;
		else:
			no.]

Part - Garments and Sex

Chapter - Blocking Sex Acts

The blocking garment is an object that varies.

The obstructed sex act rules are an action based rulebook. The obstructed sex act rules have default success.

Last check an actor rubbing a body part (this is the note the blocking garment rule):
	if the noun is not accessible:
		now the blocking garment is the obstructing garment;
	else:
		now the blocking garment is nothing.

Last check an actor licking a body part (this is the can't lick covered areas rule):
	unless the noun is accessible:
		now the blocking garment is the obstructing garment;
		follow the obstructed sex act rules;
		stop the action;
	else:
		now the blocking garment is nothing.
Last obstructed sex act rule for an actor licking a body part (this is the standard obstructed licking rule):
	say "[The actor] [can't lick] [the noun]... [the blocking garment] [are] in the way." (A).

Last check an actor fucking a body part with a sex toy (this is the can't fuck something with a sex toy when the body part is covered rule):
	unless the noun is accessible:
		now the blocking garment is the obstructing garment;
		follow the obstructed sex act rules;
		stop the action;
	else:
		now the blocking garment is nothing.
Last obstructed sex act rule for an actor fucking a body part with a sex toy (this is the standard obstructed fucking with a sex toy rule):
	say "[The actor] [can't fuck] [the noun] with [the second noun]... [the blocking garment] [are] in the way." (A).

Last check an actor fucking a body part with a body part (this is the can't fuck a body part with a body part when the either is covered rule):
	unless the noun is accessible and the second noun is accessible:
		now the blocking garment is the obstructing garment;
		follow the obstructed sex act rules;
		stop the action;
	else:
		now the blocking garment is nothing.
Last obstructed sex act rule for an actor fucking a body part with a body part (this is the standard obstructed fucking with another body part rule):
	if the noun is not exposed:
		say "[The actor] [can't fuck] [the noun] with [the second noun]... [the obstructing garment] is in the way." (A);
	else if the second noun is not exposed:
		say "[The actor] [can't fuck] [the noun] with [the second noun]... [the obstructing garment] is in the way." (B).

Part - Clothing Sets

A clothing set is a kind of object. A clothing set can be privately-named or publicly-named. A clothing set is usually publicly-named. The empty clothing set is a clothing set. A clothing set has list of garments called the ensemble. The ensemble is usually { }.

The empty clothing set is a clothing set.

A person has a clothing set called an outfit. The outfit is usually the empty clothing set.

Section - Phrase to Compare Lists

To decide if (K - a list of values) matches (L - a list of values) in any order:
	repeat with Y running through K:
		if Y is not listed in L:
			decide no;
	repeat with X running through L:
		if X is not listed in K:
			decide no;
	decide yes.

Chapter - Cannot Pick Up Outfit Components 

Check an actor taking a garment (this is the can't pick up an outfit component of someone else rule):
	let the possible owner be the outfit owner of the noun;
	unless the possible owner is the actor or the possible owner is nothing:
		issue failure message for the can't pick up an outfit component of someone else rule;
		rule succeeds.
Check someone taking a garment (this is the NPCs can't take garments not in their clothing set rule):
	unless the outfit of the actor is the empty clothing set:
		if the noun is not listed in the ensemble of the outfit of the actor:
			issue failure message for the can't pick up an outfit component of someone else rule;
			rule succeeds.

Persuasion rule for asking a person to try taking a garment (this is the people agree to take garments rule):
	persuasion succeeds.

Table of Failure Responses (continued)
rule name	message
the can't pick up an outfit component of someone else rule	"[The person asked] [can't pick] up [the noun], [they] [seem] to belong to [the outfit owner of the noun]."
the NPCs can't take garments not in their clothing set rule	"[The person asked] [can't wear] [the noun], [they] [aren't] part of [regarding the person asked][possessive] outfit."


Section - Scope with Epistemology (for use with Epistemology by Eric Eve)

Definition: A clothing set is known:
	repeat with current garment running through the ensemble of it:
		if the current garment is seen or the current garment is familiar:
			decide yes;
	decide no.
Definition: A clothing set is unknown if it is not known.

After deciding the scope while dressing into (this is the allow the player to select only known clothing sets rule):
	repeat with N running through clothing sets:
		if N is known:
			place N in scope.

Section - Scope without Epistemology (for use without Epistemology by Eric Eve)

After deciding the scope while dressing into (this is the allow the player to select any clothing set rule):
	repeat with N running through clothing sets:
		place N in scope.

Chapter  - Dressing

Use simple dressing translates as (- Constant SIMPLE_DRESSING; -).



Section - Complex Dressing

Dressing into is an action applying to one visible thing. Understand "dress into/in [clothing set]", "wear [clothing set]" and "put on [clothing set]" as dressing into when the simple dressing option is not active.


Does the player mean dressing into the outfit of the person asked when the simple dressing option is not active: it is very likely.
Does the player mean dressing into the outfit of the player when the simple dressing option is not active: it is likely.

[After deciding the scope of the player while dressing into (this is the allow the player to select any clothing set rule):
	repeat with N running through clothing sets:
		place N in scope.]

The dressing into action has a list of garments called missing outfit components. The dressing into action has a list of garments called the clothes put on. The dressing into action has a list of garments called the newly worn clothes.

Check an actor dressing into the empty clothing set (this is the prevent the actor from dressing into nothing rule):
	issue failure message for the prevent the actor from dressing into nothing rule;
	rule succeeds.

Check an actor dressing into a clothing set (this is the check outfit ownership rule):
	if the outfit of actor is not the noun:
		repeat with K running through people:
			if the outfit of K is the noun:
				issue failure message for the check outfit ownership rule;
				rule succeeds.

Check an actor dressing into a clothing set (this is the identify elements of the clothing set rule):
	repeat with K running through the ensemble of the noun:
		if the K is not enclosed by the location of the actor:[suboptimal, we really want to test for visibility, but I7 won't let us do this quite yet.]
			add K to the missing outfit components;
		else if K is not worn by the actor:
			add K to the clothes put on;
	if the clothes put on is { }:
		issue failure message for the identify elements of the clothing set rule;
		rule succeeds.

Last check an actor dressing into a clothing set (this is the strip down to what is necessary to wear the new clothes rule):
	let the intervening garments be a list of garments;
	repeat with the current garment running through garments worn by the actor:
		repeat with X running through clothes put on:
			if the current garment overlaps X and the layer of the current garment is greater than the layer of the X:
				add the current garment to the intervening garments;
				break;
	sort the intervening garments in reverse layer order;
	repeat with current garment running through the intervening garments:
		carry out the implicitly stripping off activity with the current garment;
		if the actor is wearing the current garment:
			let Z be a list of garments;
			repeat with K running through clothes put on:
				if the current garment overlaps K and the layer of the current garment is greater than the layer of the K:
					add K to Z;
					remove K from the clothes put on;
			say "(cannot remove [the current garment], abandoning wearing [z with definite articles])[line break]" (A);
			next;
		if the current garment is listed in the ensemble of the noun:
			add the current garment to the clothes put on.


Carry out an actor dressing into a clothing set (this is the standard carry out changing a clothing set rule):
	now the outfit of the actor is the noun;
	sort clothes put on in layer order;
	repeat with current garment running through the clothes put on:
		carry out the implicitly wearing activity with the current garment;
		if the current garment is worn by the actor:
			add the current garment to the newly worn clothes.
		
Report an actor dressing into a clothing set (this is the standard report dressing into rule):
	say "[The actor] [are] now dressed in [a list of garments worn by the actor]" (A);
	if the number of entries in the missing outfit components is greater than 0:
		say ". [The actor] [don't have] [missing outfit components with indefinite articles]." (B);
	else:
		say "."

Implicitly wearing something is an activity on objects.

Rule for implicitly wearing something (called the item) (this is the standard implicitly wearing something rule):
	say "(putting on [the item])[line break]";
	try silently the person asked wearing the item.

Table of Failure Responses (continued)
rule name	message
the prevent the actor from dressing into nothing rule	"[The person asked] [have] no obvious outfit[if the person asked is plural-named]s[end if] to wear."
the check outfit ownership rule	"[The noun] [seem] to belong [the outfit owner of the noun], not [the person asked]."
the identify elements of the clothing set rule	"[The person asked] [can't see] any additional parts of [their] outfit to wear."

Section - Simple Dressing

Dressing is an action applying to nothing. Understand "dress" and "wear clothes"  as dressing.
To finish is a verb.

Redirect an actor dressing when the simple dressing option is not active (this is the redirect dressing to dressing into the outfit of the actor rule):
	try the actor dressing into the outfit of the actor instead.

Check an actor dressing (this is the must be carrying something to dress into for simple dressing rule):
	if the actor is not carrying a garment:
		issue failure message for the must be carrying something to dress into for simple dressing rule;
		rule succeeds.

Carry out an actor dressing (this is the standard carry out dressing rule):
	let the clothes to wear be a list of garments;
	repeat with garment running through garments carried by the actor:
		add garment to clothes to wear;
	sort clothes to wear in layer order;
	repeat with current garment running through clothes to wear:
		let wearing failed be a truth state;
		say "(putting on [the current garment])[line break]" (A);
		repeat with tested garment running through garments worn by the actor:
			if the tested garment overlaps the current garment and the layer of the tested garment is at least the layer of the current garment:
				say "[line break](can't fit [the current garment] over [the tested garment])" (B);
				now wearing failed is true;
				break;
		if wearing failed is true:
			next;
		else:
			try silently the actor wearing the current garment.

Report an actor dressing (this is the standard report dressing rule):
	say "[The actor] [finish] dressing."

Table of Failure Responses (continued)
rule name	message
the must be carrying something to dress into for simple dressing rule	"[The person asked] [have] no clothes to dress into."



Chapter - Phrases Involving Clothing

To decide which object is the outfit owner of (x - a garment):
	repeat with K running through people:
		if X is listed in the ensemble of the outfit of K:
			decide on K;
	decide on nothing.
To decide which object is the outfit owner of (x - a clothing set):
	repeat with K running through people:
		if X is the outfit of K:
			decide on K;
	decide on nothing.

To force strip (x - a person), into inventory, into location, into off-stage:
	if into inventory:
		now all garments worn by the X are carried by the X;
	else if into location:
		now all garments worn by the X are in the location of the X;
	else if into off-stage:
		now all garments worn by X are off-stage;
	else if the discard clothes after stripping option is active:
		now all garments worn by the X are in the location of the X;
	else if the NPCs discard clothes after stripping option is active:
		if X is the player:
			now all garments worn by the X are carried by the X;
		else:
			now all garments worn by the X are in the location of the X;
	else:
		now all garments worn by X are carried by X. 

To force dress (x - a person), into inventory, into location, into off-stage:
	if into inventory:
		force strip X, into inventory;
	else if into location:
		force strip X, into location;
	else if into off-stage:
		force strip X, into off-stage;
	else:
		force strip X;
	repeat with K running through the ensemble of the outfit of X:
		make modest K;
		now X is wearing K.

To force dress (x - a person) into (y - a clothing set), into inventory, into location, into off-stage:
	if into inventory:
		force strip X, into inventory;
	else if into location:
		force strip X, into location;
	else if into off-stage:
		force strip X, into off-stage;
	else:
		force strip X;
	now the outfit of X is Y;
	repeat with K running through the ensemble of the outfit of X:
		make modest K;
		now X is wearing K.

To make modest (x - a garment):
	now x is buttoned;
	now x is unshifted;
	now x is zipped;
	now the opened areas of X is { }.


Part - Automated Descriptions for People

Use no automatic descriptions translates as (- Constant SIMPLE_DESCRIPTIONS; -).

The person described is an object that varies.

A thing has a text called a pdesc.

Carry out examining a person when the no automatic descriptions option is not active (this is the print a textual portrait of an examined person rule):
	carry out the printing a textual portrait activity with the noun;
	rule succeeds.

Chapter - Portrait Scope

Deciding the portrait scope of something is an activity on objects.

To paint (x - a thing) to the/-- portrait:
	choose a blank row in the Table of Portrait Priorities;
	now the portrait object entry is X;
	now X is unmentioned.
To paint over (x - a thing):
	if X is a portrait object listed in the Table of Portrait Priorities:
		blank out the whole row.

Before deciding the portrait scope of something (this is the clear table of portrait priorities rule):
	blank out the whole of the Table of Portrait Priorities.

Rule for deciding the portrait scope of a person (called the individual) (this is the default portrait scope rule):
	repeat with X running through exposed body parts incorporated by the individual:
		paint X to portrait;
	repeat with X running through outermost garments worn by the individual:
		paint X to portrait.

Rule for deciding the portrait scope of a person (called the individual) when the examined body area is not the featureless area (this is the default examining body parts scope rule):
	repeat with X running through exposed body parts incorporated by the individual:
		if the body location of X is the examined body area:
			paint X to portrait;
	repeat with X running through outermost garments worn by the individual:
		if the X could fit over the examined body area:
			paint X to portrait.

Rule for deciding the portrait scope of a person (called the individual) when the examined garment is not nothing (this is the default examining garments scope rule):
	repeat with X running through exposed body parts incorporated by the individual:
		if the body location of X is the examined body area:
			paint X to portrait;
	repeat with X running through outermost garments worn by the individual:
		if X is the examined garment:
			paint X to portrait;
		else if X overlaps the examined garment:
			paint X to portrait.

Chapter - Portrait Priorities

Choosing a portrait priority of something is an activity on objects.

To set the/-- portrait priority of (the item - a thing) to (X - a number):
	if the item is a portrait object listed in the Table of Portrait Priorities:
		now the portrait priority entry is X.

Rule for choosing a portrait priority of a body part (called the item) (this is the standard choose a priority for a body part rule):
	let X be the body location of the item;
	if X is the face area or the X is the eyes area or X is the hair area:
		set the portrait priority of the item to 50;
	else if X is the chest area:
		set the portrait priority of the item to 100;
	else if X is the tummy area:
		set the portrait priority of the item to 150;
	else if X is the crotch area:
		set the portrait priority of the item to 200;
	else if X is the ass area:
		set the portrait priority of the item to 250;
	else if X is the legs area or X is the arms area:
		set the portrait priority of the item to 300;
	else:
		set the portrait priority of the item to 350.

Rule for choosing a portrait priority of a garment (called the item) (this is the standard choose a priority for garments rule):
	let X be the covered areas of the item;
	let N be a number;
	now N is 10 - the layer of the item;
	if the face area is listed in X or the eyes area is listed in X or the hair area is listed in X:
		now N is N + 50;
	else if the chest area is listed in X:
		now N is N + 100;
	else if the tummy area is listed in X:
		now N is N + 150;
	else if the crotch area is listed in X:
		now N is N + 200;
	else if the ass area is listed in X:
		now N is N + 250;
	else if the legs area is listed in X or arms area is listed in X:
		now N is N + 300;
	else:
		now N is N + 350;
	set the portrait priority of the item to N.

Rule for choosing a portrait priority of something (called the item) (this is the choose a priority for everything else rule):
	set the portrait priority of the item to 400.

Table of Portrait Priorities
Portrait Priority	Portrait Object
(a number)	(an object)
with 50 blank rows


Chapter - Writing a Portrait Paragraph

Writing a portrait paragraph about something is an activity on objects.

Chapter - Listing Notable Portrait Objects Activity

Listing notable portrait objects is an activity.

The listing notable portrait objects activity has a list of things called the listed portrait parts. The listing notable portrait objects activity has an list of things called the listed portrait garments. The listing notable portrait objects activity has a list of things called the listed portrait miscellany.

Before listing notable portrait objects (this is the organize portrait objects rule):
	repeat through the Table of Portrait Priorities:
		if the portrait object entry is mentioned:
			next;
		if the portrait object entry is a body part:
			add the portrait object entry to listed portrait parts;
		else if the portrait object entry is a garment:
			add the portrait object entry to listed portrait garments;
		else:
			add the portrait object entry to listed portrait miscellany.

Rule for listing notable portrait objects (this is the standard listing notable portrait objects rule):
	if the number of entries in the listed portrait garments is at least 1:
		say "[The person described] [wear] [listed portrait garments with indefinite articles]." (A);
	if the number of entries in the listed portrait parts is at least 1:
		say "[The player] [could see] [listed portrait parts with definite articles]." (B);
	if the number of entries in the listed portrait miscellany is at least 1:
		say "[The player] also [could see] [listed portrait miscellany with definite articles]." (C).

Chapter - Printing the Portrait Description

Describing portrait objects is an activity.

[The describing portrait objects activity has a list called the described portrait objects.]

Rule for describing portrait objects (this is the standard describe portrait objects rule):
	let X be a truth state;
	repeat through the Table of Portrait Priorities:
		if portrait object entry is unmentioned and the pdesc of the portrait object entry is not "":
			if a paragraph break is pending:
				say "[run paragraph on]";
			carry out the printing the portrait description activity with the portrait object entry;
			if a paragraph break is pending:
				now X is true;
				now the portrait object entry is mentioned;
				say " [run paragraph on]";
	if X is true:
		say "[paragraph break]".

Printing the portrait description of something is an activity on things.

Rule for printing the portrait description of something (called the item) (this is the standard print portrait description of something rule):
	say "[pdesc of item]".
After printing the portrait description of something:
	say "[no line break]".

Chapter - Printing a Textual Portrait

Printing a textual portrait of something is an activity on people.

Before printing a textual portrait of a person (called the individual) (this is the set up a textual portrait rule):
	now the person described is the individual;
	carry out the deciding the portrait scope activity with the individual;
	repeat through the Table of Portrait Priorities:
		carry out the choosing a portrait priority activity with the portrait object entry;
	sort the Table of Portrait Priorities in portrait priority order.
	
Rule for printing a textual portrait of a person (called the individual) (this is the standard print textual portrait rule):
	if the description of the individual is not "":
		say "[description of individual][paragraph break]";
	repeat through the Table of Portrait Priorities:
		if the portrait object entry is unmentioned:
			if a paragraph break is pending:
				say "[conditional paragraph break]";
			carry out the writing a portrait paragraph about activity with the portrait object entry;
			if a paragraph break is pending:
				now the portrait object entry is mentioned;
				say "[command clarification break]";
	carry out the describing portrait objects activity;
	carry out the listing notable portrait objects activity.
		
After printing the name of something (called the item) while printing a textual portrait (this is the mark things as mentioned in a textual portrait rule):
	now the item is mentioned.

Chapter - Examining Body Parts

Use automated examining translates as (- Constant AUTOMATED_EXAMINING; -).

Section - Examining Body Parts

The examined body area is a body area that varies. The examined body area is the featureless area.

Carry out examining a body part when the automated examining option is active:
	now the examined body area is the body location of the noun;
	if the noun is enclosed by a person (called the individual):
		carry out the printing a textual portrait activity with the individual;
	now the examined body area is the featureless area;
	rule succeeds.

Section - Examining Garments

The examined garment is an object that varies. The examined garment is nothing.

Carry out examining a garment worn by a person when the automated examining option is active:
	now the examined garment is the noun;
	if the noun is enclosed by a person (called the individual):
		carry out the printing a textual portrait activity with the individual;
	now the examined garment is nothing;
	rule succeeds.
		

Part - Debugging (not for release)

Chapter - Clothes Diagramming

Clothes diagramming is an action out of world applying to one thing. Understand "diagram [a person]" as clothes diagramming.

Carry out clothes diagramming:
	let the cycled garments be a list of garments;
	repeat with current garment running through garments worn by the noun:
		add the current garment to the cycled garments;
	sort the cycled garments in layer order;
	repeat with current area running through the compatible areas of the noun:
		say "[Current area]:[no line break]";
		repeat with current garment running through cycled garments:
			if the current garment could fit over current area:
				say " [current garment] ([layer of current garment])[no line break]";
				if the current area is listed in the opened areas of the current garment:
					say " (open)[no line break]";
				say ";[no line break]";
		say " no more garments over [current area]; obstruction: [the obstruction to the current area of the noun];[line break]";
	say "outermost garments: [the list of outermost garments worn by the noun]."
	
[Chapter - Clothes Validation

Clothes validating is an action out of world applying to nothing. Understand "validate clothing" as clothes validating.

Definition: a clothing set is utlzed if the outfit owner of it is not nothing.

Carry out clothes validating:
	let the calculated list be a list of utlzd clothing sets;
	repeat with X running through the calculated list: [Check to see if there are overlapping garments]
		repeat with N running through the ensemble of X:
			]

Chapter - Additional Object Response Tests (for use with Object Response Tests by Juhana Leinonen)

This is the test stripping off rule:
	announce tests for "stripping off [the noun]";
	try the test-actor stripping off the noun.

This is the test unzipping rule:
	announce tests for "unzipping [the noun]";
	try the test-actor unzipping the noun.

This is the test zipping rule:
	announce tests for "zipping [the noun]";
	try the test-actor zipping the noun.
	
This is the test unbuttoning rule:
	announce tests for "unbuttoning [the noun]";
	try the test-actor unbuttoning the noun.

This is the test buttoning rule:
	announce tests for "buttoning [the noun]";
	try the test-actor buttoning the noun.

This is the test unshifting rule:
	announce tests for "unshifting [the noun]";
	try the test-actor unshifting the noun.

This is the test shifting rule:
	announce tests for "shifting [the noun]";
	try the test-actor shifting the noun.

Table of Analyzing Actions (continued)
topic	testing rule
"stripping off"	test stripping off rule
"unzipping"	test unzipping rule
"zipping"	test zipping rule
"unbuttoning"	test unbuttoning rule
"buttoning"	test buttoning rule
"unshifting"	test unshifting rule
"shifting"	test shifting rule

Part - Threaded Conversations Compatibility (for use with Threaded Conversation by Chris Conley)

The quip scope handling rule is not listed in the after deciding the scope rulebook.

After deciding the scope of the player while discussing, discussing something with (this is the ALC quip scope handling rule):
	repeat with X running through quips in the quip-repository:
		place X in scope.

Advanced Layered Clothing ends here.

---- DOCUMENTATION ----

Chapter: Introduction

Section: Installation

Advanced Layered Clothing requires Simpler AIF version 12 and above to compile. Please read Simpler AIF's documentation before reading this one.

This extension is incompatible with the Clothing Sets plug-in and the Default Clothing Behavior plug-in.

I imagine that installing Advanced Layered Clothing in a pre-existing Simpler AIF project would be simpler than you think. That said, Advanced Layered Clothing is does not use the same vocabulary as Simpler AIF's default layered clothing system and you may find your project unable to compile.

Section: Acknowledgments and Contact Information

Thanks to Hanon Ondricek, who provided suggestions.

Please sent comments, suggestions and bug reports to AnotherWannabe93@gmail.com.

Please check out my website at awaifgames.blogspot.com

Section: Foreword

So, you were expecting Simper Layered Clothing, were you?

WRONG! This extension is nowhere close to being simple, simpler or anything, on the account of Simpler AIF already having the simplest layered clothing systems imaginable. No. Advanced Layered Clothing is *advanced*. It's what your grandfather said what extensions were like in the good old days.

Advanced Layered Clothing is a part of the AIF Toolkit family of extensions. But whereas Simpler AIF was the football hooligan older brother easily titillated by some T&A, Advanced Layered Clothing is the dreamy, logical younger brother who gets good grades and who isn't so satisfied with easy pleasures. Still, they would be pretty strange brothers if they weren't somewhat alike. As you shall soon see, they share the same genes. Advanced Layered Clothing (hereafter known as ALC) is quite simple if you stick to the most basic functions (see chapter 2). Even ALC's advanced features are designed, ultimately, to save time for the author, and to help mitigate some of the more soul-crushing aspects of writing AIF.

Competently using layered clothing is a challenge in itself, and the decision to include layered clothing in a project is not to be taken lightly, especially if you plan on using some of the more arcane features of this extension. While Simpler AIF was written to be somewhat idiot-proof (as we all are, I'm afraid) ALC is something that needs to be handled a little more delicately.

Section: Interaction with other Extensions

Simpler AIF must be included before ALC.
	
ALC has a special interactions with Disambiguation Control by Jon Ingold, Epistemology by Eric Eve and Object Response Tests by Juhana Leinonen. All three of these extensions should be included before Simpler AIF, but they are optional.

Section: Compatibility Notes with Threaded Conversations

ALC and Threaded Conversations are both large extensions and, like all of their kind, are very territorial and prone to kill each other. Version 5 of ALC and Version 2 of TC now get along a bit better, in that they now compile and function, but still eye each other leerily at the seperate ends of their cave.

Section: Version History

	Version 11, January 27th, 2015:
	-- Added functions to retrieve lists of garments covering a particular area.
	-- Fixed an erroneous error message.

	Version 10, November 18th, 2014:
	-- Moved the body area descriptors from Posturing and Penetration to ALC.

	Version 9, September 28th, 2014:
	-- Withdrew support for accessories pending a redesign.

	Version 8, July 14th, 2014:
	-- Renamed "portrait description" to "pdesc".
	-- Added automated descriptions of garments and body parts.
	-- Fixed bug when asking NPCs to strip themselves.

	Version 7, May 7th, 2014:
	-- Updated for compatibility for the new I7 update.

	Version 6, March 22nd, 2014:
	-- Added use option which prevents people from stripping each other.

	Version 5, February 16th, 2014:
	-- Added compatibility with Threaded Conversations.

	Version 4, January 20th, 2014:
	-- Updated extension for compatibility with Simpler AIF version 7.
	-- Removed the "tryer" variable from the code and updated the implicit action code.
	-- Some minor bugfixes.
	-- Updated documentation.	

	Version 3, December 25th, 2013:
	-- "Force dress A PERSON into A CLOTHING SET" works properly.
	-- Added new "into off-stage" option to the force stripping and dressing phrases.

	Version 2, November 25th, 2013:
	--Fixed bug related to stripping.

	Version 1, November 23rd, 2013:
	--Extension released.

Chapter: Basic Usage

Section: The Garment

Here we have the basic element of a layered clothing system: the garment. Embodied in this rather generic term for clothing are shoes, socks, underwear, pants, shorts, undershirts, bras, shirts, coats, gloves, hats, eyewear, masks and bodysuits. As it happens, those are the "kinds" of garment packaged with Simpler AIF.

Making a garment is a cinch:

	The gray shirt is a shirt. It is worn by the player.

That's it. You can wipe your hands and call it a day. It can be taken off and block sex actions as expected. No further work is needed to make garments work properly.

This doesn't mean you can slather clothes atop yourself with impunity. Each garment occupies what we call a "layer", which is represented by a number. In the shirt's case it will be two, which means it will fit over garments with a layer of 1 but not ones with a layer of 2 or 3. For example, bras and undershirts have a layer of 1, and coats have a layer of 3. Actors will be unable to fit, for example, a shirt over a coat, or underwear over pants.

There is one caveat. The default wearing and taking off actions prevent an actor from wearing two garments over the same body parts on the same layer (essentially preventing them from occupying the same space). If you manage to make a character wear two pieces of paradoxical clothing (such as two shirts, or some pants and some shorts) either by misusing a phrase or some bug or initializing it like that, you may run into some odd problems and unexpected behavior, but probably nothing that would kill the game.

	Coat --> Shirt --> Bra or undershirt.

So, bras and undershirts, both occupying layer 1 of the chest, would conflict with each other if worn at the same time.

Luckily, if this happens to be inconvenience, you can simply give a garment an entirely different layer.

	The layer of the gray shirt is 3.
	
This will give the gray shirt the ability to be worn over other shirts, but now conflicts with coats. If that's again a problem, we can change the layers of an entire kind.

	The layer of a coat is 4.

Section: Stripping Off Clothes

Taking off clothing is controlled by the "stripping off" action. -->*Please note the presence of "off" in the "stripping off" action*<--. When this is invoked, the actor attempts to take off the item of clothing. If there is a piece of clothing over the target, they will try to take that off too. If they can't remove intervening bits of clothing they will stop in abject failure.

	After stripping off the green bra:
		say "You unfasten the green bra and allow it to fall to the ground."

For the purposes of AIF, the standard "taking off" action simply won't do, for a very simple reason: characters are blocked from stripping each other, and this behavior is programmed so deeply into I7 that a complete rewrite of the action is necessary.

Automatically stripping off clothing is more of a convenience for the player than the author, since it can sometimes seem stupid that a character needs to be instructed to take off their pants before they take off their underwear. However, this behavior might not be desirable in your game. You can switch off implicit stripping by inserting this use option:

*:	
	Use no implicit stripping.

Using this option will cause attempts to strip to fail if there are any intervening garments at all.

By default, the actor will dump clothes into their inventory, although you can change this through the use of use options.

*:	
	Use discard clothes after stripping.

This is nice because it is realistic and allows the player to admire the piles of discarded clothes left all over the place.

*:	
	Use NPCs discard clothes after stripping.

This option will cause only NPCs to discard their clothing after stripping. Bear in mind that the two use options above are MUTUALLY EXCLUSIVE. If you use one, you cannot use the other.

Section: Wearing Clothes

Wearing is the frumpy, prudish older sister to the young, exciting, nubile stripping action. She's a total pill but at the same time she does a fair job of keeping the cold out as well as looking decent for school and work.

This action operates very similarly to vanilla I7 except that wearing clothes fails if it encounters an intervening garment. However, similar to the stripping off action, the wearing action will attempt to take off clothes until the original piece of clothing fits. So, even the wearing action has a wild side, and you might find that you are actually wearing fewer clothes *after* the wearing action is complete.

Again, that behavior can be switched off using the "no implicit stripping" option described above.

Another note, garments are considered to be "outermost" if they are the topmost garment in at least one area of the body.

Section: Stripping

"Stripping" is not to be confused with "stripping off". "Stripping off" is for singular pieces of clothing, while "stripping" takes off the entire kaboodle. When invoked, the actor will keep taking off clothing until they are naked or they encounter something it can't take off, in which case it will shrug and stop.

Unlike the two above actions, the "no implicit stripping" use option *doesn't* prevent implicit stripping because in this case the stripping of multiple clothes is desirable and intended. If you want to completely disable implicit stripping, then you need to write a rule blocking the stripping action entirely.

*:
	Instead of an actor stripping:
		say "Sorry one piece at a time."

Sometimes, going through all this isn't desirable. If you want to pull off all the clothing from someone, you can use the phrase "Force strip A PERSON", which cause all the clothes to fly off a person and deposit them according to what your use options are.

By default, characters are permitted to take off the clothing of other characters, a common feature in AIF. However, this is also lots of extra work. You can preserve some of your sanity with this option.

*:
	Use self-stripping only.
	
This makes it so characters can only strip themselves. Bear in mind you can always flavor the response as if one character is helping another out of their clothing... it just makes it so you only need to write one response.

Section: Dressing

Dressing (as in putting back on all your clothing) is easily the most complex action of the game and is discussed in the chapter on clothing sets... if you don't use this option:

*:	
	Use simple dressing.

With "simple dressing" active, the "dressing action" merely attempts to wear every garment in the inventory of the dresser. The only difference is that the actor will not take clothes off so that the new clothes will fit... the dresser will simply give up and stuff them back in their inventory.

A tiny note about something we haven't covered yet: simple dressing bypasses the new implicit wearing rules, so if you plan on filling the implicit wearing rules, you might first want to activate clothing sets.

Section: Clothing and Sex Actions

When a sex action is attempted, ALC will identify a "blocking garment", which is the garment covering the body part being interacted with. If there is no blocking garment, the game will identify "nothing" as the blocking garment. The rubbing action is not blocked by garments but identifies a blocking garment so you can refer to it in your prose. 

	After rubbing some breasts when the blocking garment is not nothing:
		say "You knead [the noun] through [the blocking garment] a little bit."

All sex acts that fail due to garments refer to the "obstructed sex act" rules. They can be written thusly:

	Obstructed sex act for licking a pussy when the blocking garment are the dirty panties:
		say "You aren't even sure you want to attempt it with that filthy underwear in the way."

The wearing action also makes use of the blocking garment variable.

Section: Body Coverage

Coverage is determined by a value called a body area. Every body area is a named after the body part it covers, for example, "the ass area" is the body area value that signifies the area of the ass. There are two notable exceptions: the crotch area signifies coverage of both male and female genitalia, and the chest area covers both male chests and female chests. The complete list of the body areas are: feet area, legs area, crotch area, ass area, tummy area, chest area, face area, eyes area, hair area, arms area and finally hands area.

The areas that a garment covers are stored directly within the garment itself in a list called the "covered areas". This list can be modified to make different kinds of garments. For example, you could make a pair of assless chaps by saying something like:

	The assless chaps are pants. The covered areas are {legs area, crotch area}.

You can go further. You can turn a pair of shoes into a hat.

	The crazy boots are shoes. The covered areas are {hair area}.
	
Please note that "body area" is not the same as "body part". A character does not need a feet part to wear shoes, for example.

You can test to see if a garment can fit over a certain area (regardless of other clothes) by using the phrase "if A GARMENT could fit over A BODY AREA", or alternatively "if A GARMENT could fit over A BODY PART". You can also use "couldn't fit over" to find the inverse.

Section: Body Parts

Much of this topic is covered in the Simpler AIF documentation, but there are a few notes that should be stipulated.

The quick and dirty way to see if a body part is naked and unclothed is to use the "exposed" adjective.

	if John's cock is exposed...
	if Lisa's pussy is not exposed...
	all exposed body parts in the location...
	now all exposed body parts are sexable...

There are some caveats to the use of this adjective, but you don't need to know them unless you stray into the advanced topics (see the chapter on Openable Clothing). In any case, use of this adjective populates an object variable called the "obstructing garment". This is a garment that caused the last test for accessibility to fail (whether or not it actually obstructed anything or not). You can make use of this variable but be warned that it changes often and the only safe way to use it is immediately after the adjective is used.

	if John's cock is not exposed, say "[The obstructing garment] is over John's cock."

Optionally, you can make use of the "clothed" adjective, which is the reverse of the "exposed" adjective.

	if John's cock is clothed, say "[The obstructing garment] is over John's cock."

The location of a body part is controlled by a stored body area called the "body location". As mentioned above, for the most part body areas are named after their body parts, so you that you can count on the body location of a pair of legs is going to be the legs area... unless you stipulate otherwise.

It is actually even simpler to put body parts in strange locations than in Simpler AIF. All you need to do is declare its body location to be some other unexpected place.

For example:

	The body location of the overly literal dick head's cock is the face area.
	
That's it. 

Section: Descriptions of Clothing and People

Advanced Layered Clothing provides some functions which streamline the writing of clothing and body part descriptions. ALC calls these things "portrait descriptions" and they provide a means to dynamically generate character descriptions based on the clothes they are wearing. It is documented in detail in the later segments of this documentation but the basics can be read here.

Whenever a character is examined, ALC constructs a portrait description based on what body parts and garments are currently visible. Each have a text variable called a "pdesc", which is short for "portrait description". It is this that gets printed in the description of the characters themselves.

	The pdesc of the ugly sweater is "An ugly sweater fits unflatteringly over Jane's torso."
	The pdesc of Joe's cock is "Joe has a massive dong."

These descriptions will be intelligently called to contruct a textual portrait of the person in question.

In addition, you can also the portrait description for use when the player examines a specific garment or body part. To use this feature, use the following use option.

*:
	Use automated examining.

This is also sensitive to coverage, which means that, if player examines a body part or garment, and that body part or garment is covered by garment X, it will print the portrait description for X. This is very easy for the author since they don't need to write a description for every state of dress the body part happens to be in, at the cost that the descriptions will be less tailored to whatever the player happens to want to look at it. So it's up to you.

Section: List of Default Garments

These are the garments that are prepackaged with Advanced AIF.

	Shoes; Layer 2; Feet.
	Socks; Layer 1; Feet.
	Stockings; Layer 1; Feet and legs.
	Underwear; Layer 1; Crotch and ass.
	Pants; Layer 2; Crotch, legs and ass.
	Shorts; Layer 2; Crotch and ass.
	Undershirt; Layer 1; Chest and tummy.
	Bra; Layer 1; Chest.
	Shirt; Layer 2; Chest, tummy and arms.
	Coat; Layer 3; Chest, tummy and arms.
	Gloves; Layer 1; Hands.
	Hat; Layer 1; Hair.
	Eyewear; Layer 1; Eyes.
	Mask; Layer 1; Face.
	Bodysuit; Layer 1; Feet, legs, crotch, ass, tummy, chest, arms, hands.

These are a list of garments that cannot fit over each other unless modifications are made.

	Sock x Stockings
	Pants x Shorts
	Undershirt x Bra
	Bodysuit x Socks & Underwear & Undershirts & Bras 

Section: Useful Basic Phrases

	The garment covering BODY AREA of A PERSON.
	The garment covering A BODY PART.

This phrase returns the garment which is the topmost layer of that particular body area. There is a special shorthand for this phrase:

	The chest garment of A PERSON.
	The crotch garment of A PERSON.
	The legs garment of A PERSON.
	... etc

Which all return the top garment of the specified area.

	The garment covering layer NUMBER of A BODY PART.
	The garment covering layer NUMBER of A BODY AREA of A PERSON.
	
This phrase returns the garment that is covering the exact layer of the specified area. If none can be found it returns nothing.

	The garment under A GARMENT covering A BODY PART.
	The garment under A GARMENT covering A BODY AREA.
	
This phrase returns the garment that is layered below a pre-existing garment, and returns nothing if no such garment can be found. This is useful, for example, if you want to describe transparent clothes.

	The obstruction to BODY PART.
	The obstruction to BODY AREA of A PERSON.

This phrase returns the garment that obstructs access to a body part. It is different from the "garment covering BODY AREA of PERSON" phrase in that it is sensitive to certain caveats, such as openable clothing which will be discussed later.

(These are new to Version 11)

	Find the garments covering BODY PART.
	Find the garments covering BODY AREA of A PERSON.
	
This populates an internal variable, called the OBSTRUCTING GARMENT LIST, which is a list of all the garments covering a specific area, in order of layer.

Chapter: Customizing Extension Behavior

Section: Customizing Default Messages

Like Simpler AIF, it is possible to customize the default messages through the use of rules, in a way identical to that of Simpler AIF (in other words, go read that). You can read all the messages that can be customized in the index at the bottom of this document.

Section: Adding New Body Parts

The Simpler AIF documentation details how you can create new body parts. There is just one more intervening step you must take: identifying the body area of the new body part. In the feet example from the Simpler AIF documentation, all we need is to designate the feet area as the body location of the feet.

	The body location of feet is the feet area.
	
Don't forget to do this, because the default body location is the feet area and I'm not sure you want your nice new nipples to be blocked by socks and shoes.

Adding a new body part that occupies an entirely new body area is a different kettle of fish and it is detailed below.

Section: Adding New Body Areas

Adding new body areas is simple but labor intensive, as we shall soon see. A common feature in AIF is a distinction between an "ass" and "asscheeks", the ass being the actual hole and the asscheeks being the fleshy round areas that surround it. If we follow the instructions for making new body parts, we will produce asscheeks, but we don't get the behavior because, for example, a thong would block access to both the ass and the asscheeks if we simply define the body location of the asscheeks as the ass.

First, we would define our new body area.

*:
	The asscheeks area is a body area.
	The body location of the asscheeks are the asscheeks area.

Unfortunately, we have a labor intensive process ahead of us as we manually go to each garment and rewrite their covered area list to acknowledge our new body part.

*:
	The covered areas of the underwear is {crotch area, ass area, asscheeks area}.
	The covered areas of the pants are {legs area, crotch area, ass area, asscheeks area}.
	The covered areas of the shorts are {crotch area, ass area, asscheeks area}.
	
Finally, we've defined what covers our new body area, but now no one knows that they can fit things onto their asscheeks. We'll need to change the compatible areas list. This is something we will talk about in depth in the Strange Anatomies area of the documentation.

*:
	The compatible areas of a person is {feet area, legs area, crotch area, ass area, tummy area, chest area, arms area, hands area, face area, eyes area, hair area, asscheeks area}.

This isn't necessary, but it is awfully useful to define this phrase:

*:
	To decide which object is the/-- asscheeks garment of (X - a person):
		decide on the garment covering the asscheeks area of X.
	
Section: Adding New Kinds of Garments

It's not difficult at all to add new garments. Moving from the example above, this is a garment that covers the groin and ass but not the asscheeks.

*:
	The thong is a kind of garment. The layer is 1. The covered areas are {crotch area, ass area}.
	
We can also make something truly bizarre.

*:
	The ass-warming methane collectors are a kind of garment. They are plural-named. The covered areas are {asscheeks area, hair area}.

Both the new garments would conflict with underwear, so just try not to have a character wearing both at the same time.

Section: Strange Anatomies

ALC provides some support for characters with non-standard anatomies, including non-humans or people with missing limbs. The "compatible areas" defines what areas a character can fit clothes over. Trying to wear a garment that fits over a body area the character doesn't have will result in failure.

	The harpy is a kind of person. The harpy is female. The compatible areas are {talons area, crotch area, ass area, breasts area, tummy area, wings area, face area, eyes area, hair area}.
	
In this example, our harpy has wings but no arms. Attempts to wear, say, long-sleeved shirts will result in abject failure.

Even if a character doesn't physically have a body part, it is occasionally handy not to remove it to represent the absence of a body part. This is especially true if you have a bald character, where the hair object can represent a bald spot.

	Instead of examining the amputee's legs: say "You shamelessly stare at the accident victim's stumps."
	
That said, it's perfectly legal to test for accessibility to a body area that a character doesn't have and possibly even useful. The compatible areas list only tests compatibility for the wearing action. You can start a headless guy with a hat... they just can't put it back on if they take it off.

Section: Customizing Accessibility Behavior

Here, we pry open the hood of the steaming wreck and I tell how everything is supposed to work... in a very abstract sort of way.

Surprisingly, ALC doesn't use relations at all to track layered clothing. I have found there to be some weaknesses inherent to the relational clothing approach in that it uses a bit more memory than I'd like, and that it can be rather clumsy and unintuitive. ALC gets around this by comparing body area lists.

	if A GARMENT overlaps A GARMENT...
	
This phrase is used to test whether two garments occupy at least one of the same body areas, irrespective of the layer. It doesn't actually test to see garments are currently overlapping each other other... only that they could. ALC uses this phrase to test whether wearing a piece of clothing over another one makes sense.

To determine whether a body part is obstructed, ALC checks, starting from the garments with the highest layer property to the lowest, whether a garment's covered areas list matches the body location of a body part. Each time it does this, it consults the clothing accessibility rules, which is a garment based rulebook. The only thing this rulebook does by default is check to see if the body part's location is listed in the covered areas of the garment (or if the garment is open) but rules can be added to create new behaviors.

The clothing accessibility rules make use of two variables that you should consider when writing a new clothing accessibility rule.

	the particular part -- This variable is defined as the part of body which the clothing accessibility rules were invoked for.
	the tested part -- This variable is defined as the part of body which the clothing accessibility rules are actually testing.

The particular part and the tested part are usually (*but not always*) the exact same. However, when writing clothing accessibility rules it's important you use the tested part for tests and the particular part for prose. In truth, there is very little need to write new clothing accessibility rules. One of the few conceivable reasons is if you have a character that has no physical presence and thus can go through clothing, or if you have piece of clothing that's heavily damaged but still wearable.

The clothing accessibility rule has two outcomes: obstructed (failure) or unobstructed (success). Here are some examples of clothing accessibility rules.

	A clothing accessibility rule:
		if the player is a ghost:
			unobstructed.
	
	A clothing accessibility rule for the white dress:
		if the white dress is torn and the tested part are breasts:
			unobstructed;
		else:
			obstructed.

Section: Implicit Actions

(In previous versions of ALC, I had believed that it was impossible in vanilla I7 to write implicit taking rules for NPCs. This is apparently not true, the "person asked" variable can stand in for an NPC actor. The variable has been removed entirely.)

ALC defines two new implicit actions: implicitly wearing and implicitly stripping off. Implicit stripping is used during the wearing, stripping, stripping off and dressing actions to take off clothes to ensure that new clothes aren't removed or that we take off the right piece of clothing. Implicit wearing is only used in the complex dressing action. This is because the simple dressing action is very careful not to remove unnecessary clothes, and it would be too awkward and burdensome to the programmer (i.e. me) to make the implicit wearing activity work properly for simple dressing. In brief: you can't use the implicit wearing action for simple dressing cause I said so. Besides, I very much doubt those who use simple dressing are interested in wading into implicit action machinery.

So, for example, you could write this:

	Rule for implicitly wearing shoes (called the item):
		if the person asked is not carrying the item:
			say "(taking and lacing up [the item])[line break]";
			silently try the person asked taking the item;
			silently try the person asked wearing the item;
		else:
			say "(lacing up [the item])[line break]";
			silently try the person asked wearing the item.
			
Or:

	Rule for implicitly stripping off something (called the item):
		if an erotic scene is happening:
			say "(removing [the item] excitedly)[line break]";
		else:
			say "(removing [the item])[line break]";
		silently try the person asked stripping off the item.

It is not documented in the official I7 documentation but it is also possible to modify the implicitly taking activity this way.

	Rule for implicitly taking something (called the item):
		say "(customly taking [the item])[line break]";
		silently try the person asked taking the item.

Section: Accessories

(Accessories have been withdrawn due to performance issues and will be reworked in some other way.)

ALC provides a very simple framework for accessories. An accessory is a property that applies to a thing... the main purpose of an accessory is to be hidden when it is attached to clothing or a body part and that garment or body part is covered by something else. So, an accessory would work well for a tattoo for example on a part of someone's body.

	The dragon tattoo is a thing. It is an accessory. It is part of Lisbeth's back.

A nice little trick is to make something not an accessory when it first seen. This way, the player can refer to it later even when it's covered up.

	After Lisbeth stripping off Lisbeth's shirt:
		say "Lisbeth peels off her shirt, revealing a dragon tattoo coursing across her back.";
		now the dragon tattoo is not an accessory.
		
	Instead of examining the dragon tattoo:
		if Lisbeth's back is clothed: say "You recall vividly the dragon tattoo resting just below the cloth of [the obstructing garment].";
		otherwise: say "The dragon winds hypnotically across her back, breathing a gout of black flame."

Section: Debugging Notes

ALC has special interactions with Juhana Leinonen's Object Response Tests extension, and can be used to test most of the new interactions.

ALC includes a special debugging action that will dump a bunch of data about someone's garments. You can invoke this with the "diagram A PERSON" command which will produce a rough map of what a person is wearing.

Chapter: Clothing Sets 

This is essentially an adaptation of the original Clothing Sets plug-in for ALC. Clothing sets are powerful, complicated, and somewhat fritzy so -- if you don't plan on using it, use the simple dressing option, which means you won't have to worry about clothing sets.

Clothing sets are groupings of different garments that make up different "outfits". The purpose of this is severalfold.

1) When using the dress command, actors will intelligently dress into their own clothes rather than someone else's.

2) By default, it prevents actors from taking clothes that belong to another character's clothing set.

3) Clothing sets can be simply switched out. For example, the player can type "dress into Sunday clothes", in which case they will remove their pajamas or informal clothes or whatever and don the new clothes.

Section: Defining Clothing Sets

A clothing set is pretty easy to define.

	The pajamas are a clothing set. The ensemble is {pajama bottoms, pajama shirt, heart pattern boxers}.
	
The "ensemble" variable represents what garments makes up a particular clothing set.

It is not enough, usually, to just define a clothing set. We also have to specify who it belongs to. That is done through the "outfit" property.

	The outfit of the player are the pajamas.

By default, the outfit of any character is the "empty clothing set", which is a clothing set with an empty ensemble (and thus represents nothing). However, every character should have an outfit defined... unless you're fine with the player nicking the NPC's clothing.

Abide by these words of caution.

1) No character shall share clothing sets with another character, unless the clothing set represents an absence of a clothing set like the empty clothing set. This will set up a situation where different characters are scrabbling for garments and may cause some errors.

2) No garment shall be in more than one active clothing set. It is just fine to have a garment in multiple inactive clothing sets, just so long as only one of those clothing sets are in use at a time.

3) No clothing sets should have conflicting clothes in their ensemble. It will cause serious unexpected behavior if you have, say two pairs of underwear in one ensemble.

We can find if a person currently uses a clothing set through the use of this phrase:

	the outfit owner of A CLOTHING SET...

which will return the person who currently has that outfit as their clothing set.

Section: Dressing Into Action

The "dressing into" (!!IMPORTANT: note the "into" after "dressing"!!) action controls dressing when the simple dressing option is off, and referring to a clothing set will have the player attempt to remove their original outfit and changing into a new one while removing as few clothes as possible. For example, if an outfit doesn't specify any underwear, the character won't bother removing the original pair. This is a boon for clothing-heavy games where the player has several possible sets they could change into.

Simply typing "dress" will now redirect the player to dressing into their own outfit.

Because internally the dressing action is so complicated, it's often difficult to know whether we've succeeded at putting on an outfit. By default, the dressing action provides a list of the garments worn by the character, but doesn't really specify whether they managed to slip on anything or not. The action provides some internal variables so you can write your own report rules:

	clothes put on -- This is a list of garments the game has surmised need to be put on to make the outfit complete.
	missing outfit components -- This is a list of garments that make up the outfit but couldn't be seen by the actor, so the dressing into action has abandoned trying to wear them.
	newly worn clothes -- This is a list of garments the action has successfully put on in this iteration of the dressing action.
	
The dressing into action is prevented only by two things -- if it doesn't find any garments to put on or if the clothing set to be worn is already the outfit of another person. You have to add further restrictions so that it makes sense in your game.

	Check dressing into something other than the outfit of the player when the player is not in the closet:
		say "None of your other outfits are here for you to wear!" instead.
		
If we are not using Epistemology by Eric Eve, we can only dress into clothing sets for whose garments we have seen or heard of. If we are not using Epistemology, the player can select any clothing set at all.

Section: Dressing by Fiat

	force dress A PERSON
	
This phrase will cause clothes to fly back onto a person, according to their current garment. Before that, they will be force stripped.

	force dress A PERSON into A CLOTHING SET
	
This phrase will cause the clothes to fly off someone and an entirely new set of clothing to fly back on. Use caution with this phrase, as it's entirely possible to force dress a person into someone else's outfit.

Section: Matching Outfits

It will occasionally be necessary to compare one set of clothes with another. There's no built in way of doing this, but ALC does provide a phrase for useful in matching garments.

	if A LIST matches A LIST in any order...
	
Normally, if you asked Inform to compare {1, 2} and {2, 1}, Inform would return false, which is not what we might want. This phrase allows the same test to return true as long as every element in a list is found in the other. So, {3, 2, 1, 4} would be the same as {2, 4, 3, 1} but not {2, 1, 3, 4, 5}.

That means you can write phrases like this:

	if the list of the garments worn by Ted matches the ensemble of Judy's outfit in any order...

This would return true if Ted is wearing Judy's outfit exactly.

Chapter: Openable Clothing

Openable clothing adds a wrinkle to our previously established and rather black and white conceptions of accessibility. They allow access to certain parts of the body without actually removing the garment in question. This means that, for example, we can unzip a jacket to allow access to a chest, but that jacket would still need to be taken off before you could put on shirt.

Openable clothing is a serious amount of work and I suggest you think seriously before deciding to include it.

To declare a garment as openable, add any number of the three adjectives to it.

	The leather jacket is unzippable.
	The white shirt is unbuttonable.
	The blue skirt is shiftable.
	The yellow ball gown is unzippable, unbuttonable and shiftable.

IMPORTANT NOTE: Several people have emailed me asking me why openable clothing doesn't seem to work.  It seems a lot of people assume that openable clothing works right out of the box, and it doesn't. You have to provide rules that define the behavior of clothes when opened (detailed below).  The reason for this is twofold: the first is that one kind of garment can potentially represent many different sorts of clothing, for example, a skirt would open up differently from shorts but cover essentially the same  areas. The second reason is that when authors provide their own rules that conflict with ALC's default behavior problems will arise, and the AIF Toolkit always strives to fit with the author rather than the other way around.

Section: Unzipping and Unbuttoning

There are three built-in methods of opening clothes: unzipping, unbuttoning, and shifting. Shifting is slightly more complicated so we will cover that in a second.

Every garment has a list of body areas called the opened areas. These list the areas that, normally being covered, have been made accessible by opening a garment, allowing the actor to "reach through" the garment. So if garment has as an opened areas list of {chest area, tummy area}, the chest and tummy area are now accessible... if the wearer isn't wearing something beneath that.

The unbuttoning and unzipping actions control opening garments. After opening a garment, the game consults the opening behavior rulebooks to decide which areas have now been opened. A typical rule might be:

	Unzipping behavior for the blue jeans:
		adjust the blue jeans over {crotch area}.
	
	Unbuttoning behavior for a shirt (called the item):
		adjust the item over {chest area, tummy area}.

The strength of using the "adjust A GARMENT over LIST OF BODY AREAS" phrase is that it's sensitive to closing garments as well. When a garment is buttoned or zipped back up, it simply reverses the process.

Again, it's perfectly acceptable to have a garment unzippable, unbuttonable and shiftable all at the same time, but it's recommended that each of these actions do not open the same areas. That will cause some weird problems.

Section: Shifting

Handling shifting properly requires a bit of finesse because shifting can represent so many different actions. When shifting a skirt, it probably means to lift the skirt to the midsection, and then to lower it means to adjust it back around the crotch area. This is totally different from, say, shifting a pair of panties, which would have the opposite set of actions.

The best way to handle this is to supply the proper understand rules.

	Understand "lift [a skirt]" as shifting. Understand "lower [a skirt]" as unshifting.
	Understand "lower [some panties]" as shifting. Understand "lift [some panties]" as unshifting.
	
Otherwise, shifting is identical to unzipping and unbuttoning, and consults the "shifting behavior" rulebook.

Section: Garments Reached Through

It's useful for writing descriptions to know which open garments we've passed through to reach something. ALC has a variable called the "garments reached through", which stores which garments were passed through in the most recent sexual action. So you can write rules like this:

	After rubbing a body part:
		say "You reach through [the garments reached through] to get to [the noun]."

However, we'll sometimes need to know what open garments cover something outside this particular context. You can reset the "garments reached through" variable using this phrase:

	find garments reached through to A BODY PART...
	find garments reached through to A BODY AREA of A PERSON...
	
This will clear the "garments reached through" variable and populate it with the garments reached through to get to the new thing. You need to be cautious when using it, though, because a rule making use of it later may use this list in the wrong context. It's best to reset the list every time you need to use it, or save it to a separate variable and use that.

Finally, we can test if a specific garment was reached through via the use of the phrase:

	if A GARMENT was reached through...
	
This detects if the particular garment was reached through when the "garments reached through" variable was most recently reset. 

Chapter: Automated Descriptions

ALC provides a tool with which to print complex descriptions of characters for use in AIF. This works in a rather similar way to location descriptions, and if you know how to manipulate those, you can probably figure out automated descriptions too. If you don't want to use this, you can toggle it off by using this option:

*:
	Use no automatic descriptions.

With automated descriptions active, examining a person invokes the Printing a Textual Portrait activity which, in this order, goes through the following activities to produce an automated description:

	Deciding the Portrait Scope
	Choosing a Portrait Priority
	Writing a Portrait Paragraph About
	Printing the Portrait Description
	Listing Notable Portrait Objects

Each time we call up an automated description, ALC identifies "the person described", which is defined as the subject of the automated description. We can use this to refer to whomever we happen to be printing a description about.

Section: Deciding the Portrait Scope

This activity chooses which objects that will be printed to our textual portrait, working very similar to the vanilla Deciding the Scope activity. This activity uses a rather quaint painting metaphor to control the activity, almost allowing us to forget we are writing an AIF game.

	After deciding the portrait scope of a person (called the person):
		if the person is wearing a tie (called the tie):
			paint tie to portrait.

Unlike the vanilla scope activity, we can also remove object from the scope.

	After deciding the portrait scope of a person (called the person):
		if the person is wearing the invisible underwear:
			paint over the invisible underwear.

Technically both the "paint A THING to portrait" and "paint over A THING" can be used outside the Deciding the Portrait Scope activity but that can be a little dangerous and I don't recommend it.

By default, the activity paints all outermost garments and all exposed body parts to the portrait. There is a slight limitation in that the maximum number of objects that can be painted to one portrait is 40, which should be more than enough.

Section: Choosing a Portrait Priority

This activity decides in what order we are to tackle each portrait object. The lower the priority, the sooner we print it.

By default, the priority is primarily determined by the body area the object occupies, giving highest priority to the head (set to a priority of 50), moving down to the chest (100), tummy (150), groin (200), and ass (250) radiating to the arms and legs (300) and finally hands and feet (350). Garments with higher layers are given more priority over garments with lower layers, and garments over body parts.

Objects with custom body areas are given a priority of 350, and objects that are neither body parts nor a garment are 400. This can easily be changed with the "set the portrait priority of AN OBJECT to A NUMBER" phrase.

	After choosing a portrait priority of wings (called the item):
		set the portrait priority of the item to 70.

Section: Writing a Portrait Paragraph

This activity operates identically to the "Writing a paragraph about" activity in that it writes an entire paragraph and nicely suppresses further mentions of the object. It takes priority over the Printing a Portrait Description and any object for which a Writing a Portrait Paragraph rule is displayed first before anything else.

This is an extremely useful activity, and allows you to write a description for a garment that will very neatly apply to a variety of situations. An example:

	Rule for writing a portrait paragraph about a shirt (called the item):
		if the item is worn by a person (called the wearer):
			say "[The wearer] wears a [material of item] shirt ";
			if the wearer is male:
				say "that strains against [the wearer]'s [size of the chest of the wearer] chest. ";
			else:
				say "which pushes nicely against [the wearer]'s [size of the breasts of the wearer] breasts. ";
			if the item is open:
				if the item is unzipped:
					say "It is unzipped to the bottom, revealing ";
				else if the item is unbuttoned:
					say "It is unbuttoned to the groin, revealing ";
				let the undergarment be the garment under the item covering the chest;
				unless the undergarment is nothing:
					say "[the undergarment].";
				else if wearer is female:
					say "[the breasts of the wearer]. [The description of the breasts of the wearer].";
				else if the wearer is male:
					say "[the chest of the wearer]. [The description of the chest of the wearer].";
			else if the item is closed and the item is openable:
				if the item is zipped and unzippable:
					say "The zipper is closed.";
				else if the item is buttoned and unbuttonable:
					say "The buttons are fastened."

Since someone tried it, bear in mind that the example above is just intended to be an example of what you could do. Your game will probably not compile if you paste this in, mostly because it has a lot of variables that aren't defined.

Section: Printing a Portrait Description

Every thing has a "pdesc" (short for "portrait description") which is what is called when some prose is printed up about a particular thing. This activity, by default, just prints this value.

	The gray shirt is a shirt. The pdesc is "[The person described] [wear] a nice gray shirt."

However, if we wanted to write a more complex portrait description, we could instead replace the portrait description activity with something of our choosing.

	Rule for printing a portrait description of the gray shirt: say "[The person described] [wear] a nice gray shirt.[no line break]".
	
The only difference between the "writing a portrait paragraph about" activity and the "printing a portrait description" activity is that this activity prints all the descriptions as one paragraph. There are two caveats. First, this activity is skipped if there is no portrait description for the object in question, which means that if you only want to use the activity to print the description you still have to put something in the portrait description, even if it's just "X". The second caveat is that if we write a custom rule a line break will be automatically inserted after printing the portrait description. The only way around this is to add "[no line break]" or "[run paragraph on]" at the end of our rule.

Section: Listing Notable Portrait Objects

If an object isn't mentioned in the "writing a paragraph about" stage or no portrait description is written up for it, it ends up mentioned as a side note at the end of the description. It usually looks something like this:

	You can see her shirt, her bra, her...
	You can also see his cock, his chest, his...
	
This is all fairly boring, but it's very unlikely you'll want to change it. It might be useful for listing off some additional notes about the character.

	After listing notable portrait objects when the person described is really aroused:
		say "[It-they of the person described] look[s] really aroused."

Chapter: Reference

Section: Rulebook Reference

	CHOOSING A PORTRAIT PRIORITY (activity): determines in what order a thing will be printed to a textual portrait.
	CLOTHING ACCESSIBILITY RULES (garment-based): determines whether a garment blocks a body part.
	DECIDING THE PORTRAIT SCOPE (activity): determines which objects will be printed to a textual portrait.
	DESCRIBING PORTRAIT OBJECTS (activity): prints a paragraph describing things for which a portrait description was written. Used internally only.
	PRINTING THE PORTRAIT DESCRIPTION (activity): prints the portrait description of an object to a line. Used during a DESCRIBING  PORTRAIT OBJECT activity.
	PRINTING A TEXTUAL PORTRAIT (activity): prints a textual portrait.
	IMPLICITLY STRIPPING OFF (activity): determines how things are stripped off as a part of a larger action.
	IMPLICITLY WEARING (activity): determines how things are worn as a part of a larger action.
	LISTING NOTABLE PORTRAIT OBJECT (activity): prints a list of objects left undescribed at the end of a texual portrait.
	SHIFTING BEHAVIOR RULES (garment-based): determines how a garment reacts when shifted or unshifted.
	UNBUTTONING BEHAVIOR RULES (garment-based): determines how a garment reacts when buttoned or unbuttoned.
	UNZIPPING BEHAVIOR RULES (garment-based): determines how a garment reacts when zipped or unzipped.
	WRITING A PORTRAIT PARAGRAPH ABOUT (activity): prints a paragraph about an object during a portrait paragraph.

Section: Variables Reference

	BLOCKING GARMENT: defined as the garment which caused the last sexual action to fail.
	BODY LOCATION: a body area property of body parts which holds the body area where the body part is typically found.
	COMPATIBLE AREAS: a list of body areas property of people which holds all the body areas the person has.
	COVERED AREAS: a list of body areas property of garments which holds the body areas the garment covers.
	ENSEMBLE: a list of garments property of clothing sets which hold which garment are part of that clothing set.
	GARMENTS REACHED THROUGH: a list of garments that is populated whenever a FIND GARMENTS REACHED THROUGH TO (A BODY PART) phrase is used.
	LAYER: a number property of garments that determines which layer a garment is typically worn.
	MODEST BOOLEAN: a truth state that determines whether  we are opening or closing a piece of clothing. Used internally only.
	OBSTRUCTING GARMENT: defined as the object which last caused an accessibility test to fail. Becomes nothing when a test succeeds.
	OBSTRUCTING GARMENT LIST: defined as a list of garments that hold all the garments covering a specific body part or body area, as populated by the FIND GARMENTS COVERING.... phrase.
	OPENED AREAS: a list of body areas property of garments which holds the body areas that the garment will not obstruct, even if they cover that area.
	PARTICULAR PART: defined as the object being tested during an accessibility test, almost always becomes the TESTED PART.
	PERSON DESCRIBED: defined as a person for whom the PRINTING A TEXTUAL PORTRAIT activity is called for.
	PERSON STRIPPED: defined as the last person who was stripped from.
	TESTED PART: defined as the object being tested during an accessibility test, in place of the PARTICULAR PART.

Section: Phrase Reference

	ADJUST (GARMENT) OVER (LIST OF BODY AREAS): opens or closes the list of body areas over the noun, depending on their current state. Should only be used in one of the opening behavior rulebooks.
	ARMS GARMENT OF (PERSON)... object: returns the topmost garment covering the arms of the person.
	ASS GARMENT OF (PERSON)... object: returns the topmost garment covering the ass of the person.
	if (BODY AREA) OF (PERSON) IS/ARE ACCESSIBLE: returns true if the body area of the person is not covered by a closed garment.
	if (BODY PART) OF (PERSON) IS/ARE NOT ACCESSIBLE: returns true if the body area of the person is covered by a closed garment.
	if (BODY PART) IS/ARE ACCESSIBLE: returns true if the body part is not covered by a closed garment.
	if (BODY PART) IS/ARE NOT ACCESSIBLE: returns true if the body part is covered by a closed garment.
	CHEST GARMENT OF (PERSON)... object: returns the topmost garment covering the chest of the person.
	CROTCH GARMENT OF (PERSON)... object: returns the topmost garment covering the crotch of the person.
	EYES GARMENT OF (PERSON)... object: returns the topmost garment covering the eyes of the person.
	FACE GARMENT OF (PERSON)... object: returns the topmost garment covering the face of the person.
	FEET GARMENT OF (PERSON)... object: returns the topmost garment covering the feet of the person.
	FIND GARMENTS REACHED THROUGH TO (BODY AREA) OF (BODY PART): populates the GARMENTS REACHED THROUGH variable.
	FIND GARMENTS REACHED THROUGH TO (BODY PART): populates the GARMENTS REACHED THROUGH variable.
	FIND THE GARMENTS COVER (BODY AREA) OF (PERSON): populates the OBSTRUCTING GARMENTS LIST.
	FIND THE GARMENTS COVER (BODY PART): populates the OBSTRUCTING GARMENTS LIST.
	FORCE DRESS (PERSON): causes the person to wear every item in their clothing set.
	FORCE DRESS (PERSON) INTO (CLOTHING SET): causes the person to switch into the clothing set.
	FORCE STRIP (PERSON): removes all clothing from the person.
	if (GARMENT) COULD FIT OVER (BODY AREA): returns true if the body area is listed in the covered areas of the garment.
	if (GARMENT) COULD FIT OVER (BODY PART): returns true if the body area of the body part is listed in the covered areas of the garment.
	if (GARMENT) COULDN'T FIT OVER (BODY AREA): returns true if the body area is not listed in the covered areas of the garment.
	if (GARMENT) COULDN'T FIT OVER (BODY PART): returns true if the body area of the body part is not listed in the covered areas of the garment.
	GARMENT COVERING (BODY AREA) OF (PERSON)...object: returns the garment that covers the body area of the person.
	GARMENT COVERING (BODY PART)...object: returns the garment covering the body part.
	GARMENT COVERING LAYER (NUMBER) OF (BODY PART)... object: returns only the garment that covers the specific layer over the body part.
	GARMENT COVERING LAYER (NUMBER) OF (BODY AREA) OF (PERSON)... object: returns only the garment that covers the specific body area of that particular person.
	if (GARMENT) IS/ARE NOT UNDER CLOTHING: returns true if there is nothing covering the garment.
	if (GARMENT) OVERLAPS (GARMENT): returns true if the garment covers the same areas as the second garment.
	if (GARMENT) WAS/WERE REACHED THROUGH: returns true if the garment is listed in the GARMENTS REACHED THROUGH variable.
	if (GARMENT) WAS/WERE REACHED THROUGH TO (BODY PART): both populates the GARMENTS REACHED THROUGH variable and returns true if the garment was reached through.
	if (GARMENT) WAS/WERE REACHED THROUGH TO (BODY AREA) OF (BODY PART): both populates the GARMENTS REACHED THROUGH variable and returns true if the garment was reached through.
	HAIR GARMENT OF (PERSON)... object: returns the topmost garment covering the hair of the person.
	HANDS GARMENT OF (PERSON)... object: returns the topmost garment covering the hands of the person.
	MAKE MODEST (GARMENT): causes the garment to return to its default state in terms of openness.
	LEGS GARMENT OF (PERSON)... object: returns the topmost garment covering the legs of the person.
	if (LIST OF VALUES) MATCHES (LIST OF VALUES) IN ANY ORDER: returns true if all the items in the first list are in the second list.
	OBSTRUCTION TO (BODY PART)... object: returns the unopened garment that covers the body part.
	OBSTRUCTION TO (BODY AREA) of (PERSON)... object: returns the unopened garment that covers the body area of the person.
	OUTFIT OWNER OF (GARMENT)... object: returns the person for whose clothing set the garment belongs to.
	OUTFIT OWNER OF (CLOTHING SET)... object: returns the person for who the clothing set belongs to.
	PAINT OVER (THING): only used in a DECIDING SCOPE OF TEXTUAL PORTRAIT activity. Causes the thing to be removed from the textual portrait.
	PAINT (THING) TO PORTRAIT: only used in a DECIDING SCOPE OF TEXTUAL PORTRAIT activity. Causes the thing to be included in the portrait.
	if (PERSON) IS/ARE ANATOMICALLY COMPATIBLE WITH (GARMENT): returns true if the person has the right body area for the garment.
	SET PORTRAIT PRIORITY OF (THING) TO (NUMBER): used on in the SETTING THE PORTRAIT PRIORITY activity. Sets the portrait priority.
	TUMMY GARMENT OF (PERSON): returns the topmost garment covering the tummy of the person.
 
 Section: Adjectives Reference
 
	ACCESSORY: assignable, defines a thing that can be hidden beneath clothing. (withdrawn pending redesign)
	COVERED: defines a body part that is not accessible.
	EXPOSED: defines a body part that is accessible.
	OPEN: defines a garment which is either unzipped or unbuttoned or shifted.
	OPENABLE: defines a garment which is either unzippable or unbuttonable or shiftable.
	OUTERMOST: defines a garment that is not under any other piece of clothing.
	SHIFTABLE: assignable, defines a garment that can be shifted.
	SHIFTED, UNSHIFTED: assignable, defines a garment that is shifted or unshifted.
	UNBUTTONABLE: assignable, defines a garment that can be unbuttoned.
	UNBUTTONED, BUTTONED: assignable, defines a garment which is either buttoned or unbuttoned.
	UNZIPPABLE: assignable, defines a garment that can be unzipped.
	UNZIPPED, ZIPPED: assignable, defines a garment which is either zipped or unzipped.

Chapter: Plug ins

Section: Updated Public/Private Areas by Dudeman Plug-in

This is an updated version of public/privates areas by Dudeman for ALC. The only significant difference is that to enter a public room an actor must be dressed decently, which is considered true when the garments covering the crotch, ass and chest are at least layer 2. 

*:
	A room is either private or public. A room is usually public.

	A person has a text called the too public message. The too public message of a person is usually "It's a little too public to be trying that.".

	to decide whether in public: if a not sex ready person is visible, decide yes; if the player is enclosed by a public room, decide yes; if the player is in a private room, decide no.
	to decide whether (x - a person) is dressed decently:
		unless the chest garment of X is nothing or the crotch garment of X is nothing or the ass garment of X is nothing:
			if the layer of chest garment of X is at least 2 and the layer of the crotch garment of X is at least 2 and the layer of the ass garment of X is at least 2:
				decide yes;
		decide no.
	to decide whether (x - a person) is dressed indecently:
		if X is dressed decently:
			decide no;
		decide yes.

	Check an actor going to a room (called the place) while the actor is dressed indecently (this is the can't walk into a public area indecent rule):
		if the place is public or a not sex ready person is in the place, say "[The actor] [shouldn't go] into public dressed like that." (A) instead.

	Check an actor rubbing a body part enclosed by a person (called the bwner) while the location of the actor is public (this is the can't rub someone in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.

	Check an actor rubbing a sex toy while the location of the actor is public (this is the can't rub sex toys in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.

	Check an actor licking a body part enclosed by a person (called the bwner) while the location of the actor is public (this is the can't lick someone in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.

	Check an actor licking a sex toy while the location of the actor is public (this is the can't lick sex toys in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.

	Check an actor fucking a body part enclosed by a person (called the bwner) while the location of the actor is public (this is the can't fuck someone in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.

	Check an actor fucking a body part enclosed by a person (called the bwner) with something while the location of the actor is public (this is the can't fuck someone with something in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.

	Check an actor stripping while the location of the actor is public (this is the can't strip in public rule):
		say "[Too public message of the actor][paragraph break]" (A) instead.


Section: Non-Descript People Plug-in

Often, you'll want to make use of automated descriptions but not for secondary, unimportant characters (i.e. men). This very simple extension provides a means of handling people you don't want to waste time writing complex descriptions for.

*:
	A person can be non-descript. A person is usually non-descript. A man is usually not non-descript. A woman is usually not non-descript.

	Some generic clothes is a kind of garment. It is plural-named. The layer is 2. The covered areas are {feet area, legs area, crotch area, ass area, tummy area, chest area, arms area}.

	Carry out examining a non-descript person (this is the don't print automated descriptions for non-descript people rule):
		say "[description of the noun][paragraph break]";
		rule succeeds.

	The don't print automated descriptions for non-descript people rule is listed before the the print a textual portrait of an examined person rule in the carry out examining rules.

Example: * ALC Library Messages Index - Not a game but an index of the customizable library messages.

*:
	Table of Failure Responses (amended)
	rule name	message
	the can't wear a garment over clothes rule	"[The person asked] [can't wear] [the noun] over [the blocking garment]."
	the can't wear things with incompatible anatomy rule	"[The person asked] [can't wear] [the noun], [regarding the person asked][they] [don't] have the right anatomy."
	the can't strip things that aren't being worn rule	"[The person asked] [can't strip] [the noun], [they] [aren't] being worn."
	the can't strip off a garment over clothes rule	"[The person asked] [can't strip] [the noun] over [the blocking garment]."
	the can't strip things that aren't people rule	"[The person asked] [can't strip] [the noun], [they] [aren't] [if the noun is plural-named]people[else]a person[end if]."
	can't strip people who aren't wearing anything rule	"[The person asked] [can't strip] [the noun], [they] [are] already naked."
	the can't shift things that aren't garments rule	"[The noun] [can't shift]."
	the can't shift things that aren't shiftable rule	"[The noun] [can't shift]."
	the can't shift things that are already shifted rule	"[The noun] [are] already shifted."
	the can't unshift things that aren't garments rule	"[The noun] [aren't] something that [can] be shifted in the first place."
	the can't unshift things that aren't shiftable rule	"[The noun] [can't unshift]."
	the can't unshift things that are already shifted rule	"[The noun] [can't unshift] any more."
	the can't unbutton things that aren't garments rule	"[The noun] [can't unbutton]."
	the can't unbutton things that aren't unbuttonable rule	"[The noun] [can't unbutton]."
	the can't unbutton things that are already unbuttoned rule	"[The noun] [can't unbutton]."
	the can't button things that aren't garments rule	"[The noun] [can't button]."
	the can't button things that aren't unbuttonable rule	"[The noun] [can't button]."
	the can't button things that are already buttoned rule	"[The noun] [are] already buttoned."
	the can't unzip things that aren't garments rule	"[The noun] [can't unzip]."
	the can't unzip things that aren't unzippable rule	"[The noun] [can't unzip]."
	the can't unzip things that are already unzipped rule	"[The noun] [are] already unzipped."
	the can't zip things that aren't garments rule	"[The noun] [can't zip]."
	the can't zip things that aren't unzippable rule	"[The noun] [can't zip]."
	the can't zip things that are already unzipped rule	"[The noun] [are] already zipped."
	the can't pick up an outfit component of someone else rule	"[The person asked] [can't pick] up [the noun], [they] [seem] to belong to [the outfit owner of the noun]."
	the NPCs can't take garments not in their clothing set rule	"[The person asked] [can't wear] [the noun], [they] [aren't] part of [regarding the person asked][possessive] outfit."
	the prevent the actor from dressing into nothing rule	"[The person asked] [have] no obvious outfit[if the person asked is plural-named]s[end if] to wear."
	the check outfit ownership rule	"[The noun] [seem] to belong [the outfit owner of the noun], not [the person asked]."
	the identify elements of the clothing set rule	"[The person asked] [can't see] any additional parts of [their] outfit to wear."
	the must be carrying something to dress into for simple dressing rule	"[The person asked] [have] no clothes to dress into."
	
Version 3 of Penetration by Another Wannabe begins here.

"Adds a penetration system to SAIF. Requires Simpler AIF and Orgasms and Arousal."

Part - Penetration

Chapter - Prose Generation

To say implied action of (x - an object) as a verb:
	if X are hands:
		say "[rub]";
	else if X is a face:
		say "[lick]";
	else:
		say "[fuck]".

To say implied action of (x - an object) as a gerund:
	if X are hands:
		say "rubbing";
	else if X is a face:
		say "licking";
	else:
		say "fucking".

Chapter - Penetration Relation

Penetration relates various things to one thing. The verb to penetrate means the penetration relation.
Pleasuring relates a thing (called X) to a thing (called Y) when X penetrates Y or Y penetrates X. The verb to pleasure means the pleasuring relation.

Chapter - Penetration Action

Penetrating it with is an action applying to two things.

To decide which object is the organ pleasuring (K - an object):
	if K penetrates something (called obj):
		decide on obj;
	else if K is penetrated by something (called obj2):
		decide on obj2;
	else:
		decide on nothing.
To decide if (the individual - a person) is/are being pleasured:
	repeat with X running through body parts enclosed by the individual:
		if the organ pleasuring X is not nothing:
			decide yes;
	repeat with X running through sex toys enclosed by the individual:
		if the organ pleasuring X is not nothing:
			decide yes;
	decide no.

Chapter - Penetrating a foo

Last check an actor fucking something with something (this is the penetrate whilst fucking rule):
	unless the second noun penetrates the noun:
		try the actor penetrating the noun with the second noun;
	unless the second noun penetrates the noun:
		rule succeeds.
		
Last check an actor licking something (this is the penetrate faces rule):
	if the actor encloses a face (called the item):
		unless the item penetrates the noun:
			try the actor penetrating the noun with the item;
		unless the item penetrates the noun:
			rule succeeds.

Last check an actor rubbing something (this is the penetrate hands rule):
	if the actor encloses hands (called the item):
		unless the item penetrates the noun:
			try the actor penetrating the noun with the item;
		unless the item penetrates the noun:
			rule succeeds.

Carry out an actor penetrating something with something (this is the carry out penetrating rule):
	now the noun penetrates nothing;
	now the second noun penetrates the noun.

Report an actor penetrating something with something (this is the report penetrating rule):
	say "[The actor] [begin] [implied action of the second noun as a gerund] [the noun]." (C).

To pleasure is a verb.
To begin is a verb.

Chapter - Unpenetrating

Understand the command "withdraw" as something new.
Withdrawing is an action applying to one thing. Understand "withdraw [a body part]" and "remove [a body part]" as withdrawing. Understand "remove [a sex toy]" and "withdraw [a sex toy]" as withdrawing when the item described penetrates something or the item described is penetrated by something.

Redirect an actor removing a body part from something (this is the redirect attempts to remove body parts from things rule):
	try the actor withdrawing the noun.
Redirect an actor removing a sex toy from a body part (this is the redirect attempts to remove sex toys from things rule):
	try the actor withdrawing the noun.

The withdrawing action has an object called the original receptacle (matched as "exiting").

Setting action variables for withdrawing something:
	if the noun penetrates something (called the obj1):
		now the original receptacle is obj1;
	else if the noun is penetrated by something (called the obj2):
		now the original receptacle is obj2;
	else:
		now the original receptacle is nothing.

Carry out an actor withdrawing something (this is the carry out withdrawing rule):
	unpenetrate the noun.

Report an actor withdrawing something when the original receptacle is not nothing (this is the report withdrawing rule):
	say "[The actor] [stop] [implied action of the noun as a gerund] [the original receptacle]." (A).

Last persuasion rule for asking someone to try withdrawing (this is the NPCs accept commands to withdraw rule):
	if the person asked is sex ready:
		persuasion succeeds;
	else:
		say "[generic sex refusal message of the person asked]" (A);
		persuasion fails.

To stop is a verb.
To withdraw is a verb.

Carry out an actor dropping a sex toy (this is the clear penetration for dropped sex toys rule):
	unpenetrate the noun.

To unpenetrate (the item - a thing):
	now the item penetrates nothing;
	now the item is penetrated by nothing.
To clear penetration for (the individual - a person):
	repeat with X running through body parts enclosed by the individual:
		unpenetrate X;
	repeat with X running through sex toys enclosed by the individual:
		unpenetrate X.
To clear penetration globally:
	repeat with X running through people:
		clear penetration for X.

Section - Oddly Worded Withdrawing

[For the case of "stop rubbing something"].
Stop rubbing is an action applying to one visible thing. Understand "stop rubbing/groping/massaging [something]" as stop rubbing. Understand the command "halt" as "stop".

For supplying a missing noun when stop rubbing (this is the supply noun for stop rubbing rule):
	if the person asked encloses hands (called J):
		if J are pleasured by something (called K):
			now the noun is K.

Redirect an actor stop rubbing (this is the redirect stop rubbing to withdrawing rule):
	if the person asked encloses hands (called N):
		try the person asked withdrawing N;
	else:
		issue failure message for the redirect stop rubbing to withdrawing rule.

[For the case of "stop licking something"].
Stop licking is an action applying to one visible thing. Understand "stop licking/sucking [something]" as stop licking.

For supplying a missing noun when stop licking (this is the supply noun for stop licking rule):
	if the person asked encloses a face (called J):
		if J are pleasured by something (called K):
			now the noun is K.

Redirect an actor stop licking (this is the redirect stop licking to withdrawing rule):
	if the person asked encloses a face (called N):
		try the person asked withdrawing N;
	else:
		issue failure message for the redirect stop licking to withdrawing rule.

[For the case of "stop fucking something"].
Stop fucking is an action applying to one visible thing. Understand "stop fucking [something]" as stop fucking.

For supplying a missing noun when stop fucking (this is the supply noun for stop fucking rule):
	repeat with item running through things enclosed by the person asked:
		if the item is orificial or the item is penile:
			if the item is a face:
				next;
			if the item is pleasuring something (called J):
				now the noun is J;
				break.
			

Redirect an actor stop fucking (this is the redirect stop fucking to withdrawing rule):
	let N be a truth state;
	repeat with item running through things pleasuring the noun:
		try the person asked withdrawing item;
		now N is true;
	if N is false:
		issue failure message for the redirect stop fucking to withdrawing rule.

[Mandatory persuasion rules.]

Last persuasion rule for asking someone to try stop rubbing (this is the NPCs accept commands to stop rubbing rule):
	if the person asked is sex ready:
		persuasion succeeds;
	else:
		say "[generic sex refusal message of the person asked]" (A);
		persuasion fails.
Last persuasion rule for asking someone to try stop licking (this is the NPCs accept commands to stop licking rule):
	if the person asked is sex ready:
		persuasion succeeds;
	else:
		say "[generic sex refusal message of the person asked]" (A);
		persuasion fails.
Last persuasion rule for asking someone to try stop fucking (this is the NPCs accept commands to stop fucking rule):
	if the person asked is sex ready:
		persuasion succeeds;
	else:
		say "[generic sex refusal message of the person asked]" (A);
		persuasion fails.

Table of Failure Responses (continued)
rule name	message
the redirect stop rubbing to withdrawing rule	"There is no need for that, [the person asked] [aren't] rubbing [the noun] at the moment."
the redirect stop licking to withdrawing rule	"There is no need for that, [the person asked] [aren't] licking [the noun] at the moment."
the redirect stop fucking to withdrawing rule	"There is no need for that, [the person asked] [aren't] fucking [the noun] at the moment."


Section - Withdrawing More Generally

Withdrawing all is an action applying to nothing. Understand "withdraw" and "withdraw all" as withdrawing all.

Check an actor withdrawing all (this is the must be penetrating something in order to withdraw all rule):
	let N be a truth state;
	repeat with item running through things enclosed by the actor:
		if the item is pleasuring something:
			now N is true;
			break;
	if N is false:
		issue failure message for the must be penetrating something in order to withdraw all rule;
		rule succeeds.

Carry out an actor withdrawing all (this is the carry out withdrawing everything rule):
	repeat with the item running through things enclosed by the actor:
		if the item is pleasuring something:
			try the actor withdrawing the item.

Last persuasion rule for asking someone to try withdrawing all (this is the NPCs accept commands to withdraw all rule):
	if the person asked is sex ready:
		persuasion succeeds;
	else:
		say "[generic sex refusal message of the person asked]" (A);
		persuasion fails.

Table of Failure Responses (continued)
rule name	message
the must be penetrating something in order to withdraw all rule	"[The person asked] [aren't] doing anything at the moment."

Section - Before sex actions

Before an actor fucking something with something (this is the withdraw before fucking something different rule):
	unless the second noun penetrates the noun or the second noun penetrates nothing:
		try the actor withdrawing the second noun.

Before an actor licking something (this is the withdraw before licking something different rule):
	if the actor encloses a face (called the item):
		unless the item is pleasuring nothing or the item is pleasuring the noun:
			try the actor withdrawing the item.

Before an actor rubbing something (this is the withdraw before rubbing something different rule):
	if the actor encloses some hands (called the item):
		unless the item is pleasuring nothing or the item is pleasuring the noun:
			try the actor withdrawing the item.
			
Section - Men withdraw after orgasm

Use men don't withdraw postorgasm translates as (- Constant MEN_DONT_WITHDRAW_POST_ORGASM; -).

After handling an orgasm when the men don't withdraw postorgasm option is not active (this is the men withdraw after orgasm rule):
	if the object cummed with is a cock:
		now the object cummed with penetrates nothing;
		now the object cummed with is penetrated by nothing.
		
Section - Withdrawing Disambiguation (for use with Disambiguation Control by Jon Ingold)

Should the game suggest the player withdrawing something enclosed by the player (this is the assume the player means to withdraw their own body part rule): it is an excellent suggestion.
Should the game suggest asking someone to try withdrawing something enclosed by the person asked (this is the assume the player means to ask someone to withdraw their own body part rule): it is an excellent suggestion.


Chapter - Implicitly withdrawing

Implicitly withdrawing something is an activity on objects.

Rule for implicitly withdrawing something (called the item2) (this is the default withdrawing rule):
	let the item be an object;
	now the item is the organ pleasuring item2;
	if the person asked is the player:
		if the item2 is orificial and the item is penile:
			say "(First taking [the item2] off [the item])[line break]" (A);
		else if the item2 is penile and the item is orificial:
			say "(First taking [the item2] out of [the item])[line break]" (B);
		else:
			say "(First removing [the item2] from [the item])" (C);
	silently try the person asked withdrawing item2.

To implicitly unpenetrate (the individual - a person):
	repeat with the item running through body part incorporated by the individual:
		unless the organ pleasuring the item is nothing:
			carry out the implicitly withdrawing activity with the item.
	
Section - Sexually disruptive actions

Going is sexually disrupting. Entering is sexually disrupting. Exiting is sexually disrupting. Getting off is sexually disrupting.[ Locking something fixed in place with something is sexually disruptive. Unlocking something fixed in place with something is sexually disruptive. Switching on something fixed in place is sexually disruptive. Switching off something fixed in place is sexually disruptive.] [Wearing is sexually disruptive.]

To move is a verb.

Before an actor sexually disrupting (this is the unpenetrate the actor whilst moving rule):
	implicitly unpenetrate the actor;
	repeat with X running through body parts enclosed by the actor:
		if the organ pleasuring X is not nothing:
			say "[The actor] [can't move], [the x] [are] [if X is orificial]on[else]in[end if] [the organ pleasuring x]." (A) instead;
	repeat with X running through sex toys enclosed by the actor:
		if the organ pleasuring X is not nothing:
			say "[The actor] [can't move], [the x] [are] [if X is orificial]on[else]in[end if] [the organ pleasuring x]." (B) instead.

Section - Withdrawing and penetrating with clothing (for use with Advanced Layered Clothing by Another Wannabe)

Before an actor wearing a garment (this is the unpenetrate the actor whilst wearing rule):
	implicitly unpenetrate the actor;
	repeat with X running through body parts enclosed by the actor:
		if the organ pleasuring X is not nothing:
			say "[The actor] [can't wear] [the noun], [the x] [are] [if X is orificial]on[else]in[end if] [the organ pleasuring x]." (A) instead;
	repeat with X running through sex toys enclosed by the actor:
		if the organ pleasuring X is not nothing:
			say "[The actor] [can't wear] [the noun], [the x] [are] [if X is orificial]on[else]in[end if] [the organ pleasuring x]." (B) instead.


Section - Withdrawing with simple clothing (for use without Advanced Layered Clothing by Another Wannabe)

Before an actor dressing (this is the unpenetrate the actor whilst dressing rule):
	implicitly unpenetrate the actor;
	repeat with X running through body parts enclosed by the actor:
		if the organ pleasuring X is not nothing:
			say "[The actor] [can't dress], [the x] [are] [if X is orificial]on[else]in[end if] [the organ pleasuring x]." (A) instead;
	repeat with X running through sex toys enclosed by the actor:
		if the organ pleasuring X is not nothing:
			say "[The actor] [can't dress], [the x] [are] [if X is orificial]on[else]in[end if] [the organ pleasuring x]." (B) instead.


Chapter - New Report Rules

Section - Record New Penetrations

The penetration occurred is a truth state that varies.

Mid-action bookkeeping rule for an actor penetrating something with something (this is the record new penetrations rule):
	now the penetration occurred is true.

Post-action bookkeeping rule for an actor doing something other than penetrating (this is the throw out penetration records rule):
	now the penetration occurred is false.

Section - The Rules

The alternative orgasmic licking rule is not listed in the report licking rulebook.
The standard orgasmic licking rule is not listed in the report licking rulebook.
The alternative orgasmic rubbing rule is not listed in the report rubbing rulebook.
The standard orgasmic rubbing rule is not listed in the report rubbing rulebook.
The alternative orgasmic fucking rule is not listed in the report fucking it with rulebook.
The standard orgasmic fucking rule is not listed in the report fucking it with rulebook.

Report an actor fucking something with something when the no sex prose whilst orgasming option is active (this is the penetrative standard orgasmic fucking rule):
	if the noun is enclosed by a person (called the partner):
		if the actor will orgasm with the second noun and the partner will orgasm with the noun:
			if the no simultaneous orgasms option is active:
				have the actor orgasm on the noun;
				have the partner orgasm on the second noun;
			else:
				have the actor orgasm on the noun, simultaneously;
		else if the actor will orgasm with the second noun or the partner will orgasm with the noun:
			if the actor will orgasm with the second noun:
				have the actor orgasm on the noun;
			if the partner will orgasm with the noun:
				have the partner orgasm on the second noun;
		else:
			if the penetration occurred is false:
				follow the sex prose rules;
	else:
		if the penetration occurred is false:
			follow the sex prose rules;

Report an actor licking something when the no sex prose whilst orgasming option is active (this is the penetrative standard orgasmic licking rule):
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses a face (called the face):
				have the partner orgasm on the face;
			else:
				have the partner orgasm;
		else:
			if the penetration occurred is false:
				follow the sex prose rules;
	else:
		if the penetration occurred is false:
			follow the sex prose rules;

Report an actor rubbing something when the no sex prose whilst orgasming option is active (this is the penetrative standard orgasmic rubbing rule):
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses some hands (called the hands):
				have the partner orgasm on the hands;
			else:
				have the partner orgasm;
		else:
			if the penetration occurred is false:
				follow the sex prose rules;
	else:
		if the penetration occurred is false:
			follow the sex prose rules;

Report an actor fucking something with something when the no sex prose whilst orgasming option is not active (this is the penetrative alternative orgasmic fucking rule):
	if the penetration occurred is false:
		follow the sex prose rules;
	if the noun is enclosed by a person (called the partner):
		if the actor will orgasm with the second noun and the partner will orgasm with the noun:
			if the no simultaneous orgasms option is active:
				have the actor orgasm on the noun;
				have the partner orgasm on the second noun;
			else:
				have the actor orgasm on the noun, simultaneously;
		else:
			if the actor will orgasm with the second noun:
				have the actor orgasm on the noun;
			if the partner will orgasm with the noun:
				have the partner orgasm on the second noun.

Report an actor licking something when the no sex prose whilst orgasming option is not active (this is the penetrative alternative orgasmic licking rule):
	if the penetration occurred is false:
		follow the sex prose rules;
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses a face (called the face):
				have the partner orgasm on the face;
			else:
				have the partner orgasm.

Report an actor rubbing something when the no sex prose whilst orgasming option is not active (this is the penetrative alternative orgasmic rubbing rule):
	if the penetration occurred is false:
		follow the sex prose rules;
	if the noun is enclosed by a person (called the partner):
		if the partner will orgasm with the noun:
			if the actor encloses some hands (called the hands):
				have the partner orgasm on the hands;
			else:
				have the partner orgasm.



Part - Combined Actions


Chapter - Sensible Penetration

Table of Stored Penetrations
pen1	pen2	penmentioned
(thing)	(thing)	(truth state)
with 32 blank rows

To find penetrations between (X - a person) and (Y - a person), sorted by person:
	blank out the whole of the Table of Stored Penetrations;
	repeat with N running through sexable things enclosed by X:
		repeat with K running through sexable things enclosed by Y:
			if sorted by person:
				if N is pleasured by K:
					choose a blank row from the Table of Stored Penetrations;
					now pen1 entry is N;
					now pen2 entry is K;
			else if N penetrates K:
				choose a blank row from the Table of Stored Penetrations;
				now the pen1 entry is N;
				now the pen2 entry is K;
			else if K penetrates N:
				choose a blank row from the Table of Stored Penetrations;
				now the pen1 entry is K;
				now the pen2 entry is N.

				

Section - Singular Penetrations Only

Use singular penetrations only translates as (- Constant ONLY_SINGULAR_PENETRATIONS; -).

Before an actor penetrating something with something when the singular penetrations only option is active (this is the ensure there is only one penetration per actor rule):
	find penetrations between the actor and the sex partner;
	unless the Table of Stored Penetrations is empty:
		let X be a truth state;
		repeat through the Table of Stored Penetrations:
			if pen1 entry is the second noun and pen2 entry is the noun:
				next;
			else if pen1 entry is enclosed by the actor:
				try the actor withdrawing pen1 entry;
			else if pen2 entry is enclosed by the actor:
				try the actor withdrawing pen2 entry;
			if pen1 entry penetrates pen2 entry:
				say "[The actor] [can] only do one thing at a time!" (A) instead.


Section - Use Only Sensible Penetration

The penetrate check rules are an action based rulebook.

Check an actor penetrating something with something (this is the check for sensible penetration rule):
	find penetrations between the actor and the sex partner, sorted by person;
	unless the table of stored penetrations is empty:
		follow the penetrate check rules;
		if the rule failed:
			rule fails.

The insensible part is an object that varies.

Section - Penetration and Kissing

Last check an actor kissing a person (this is the can't kiss whilst the face is pleasuring something rule):
	if the noun encloses a face (called the item):
		if the item is pleasured by something (called the item2):
			say "[The actor] [can't] kiss [the noun] while [they] [are] licking [item2]." (A) instead.

Chapter - Penetration by Body Area (for use with Advanced Layered Clothing by Another Wannabe)

Section - Sensible Penetration by Body Area

Before an actor penetrating something with something (this is the try to withdraw insensible faces before penetrating rule):
	unless the second noun is a face:
		if the actor encloses a face (called the face):
			if the face is pleasured by the noun:
				try the actor withdrawing the face.

Penetrate check for an actor penetrating something with a body part when the body location of the second noun is an extremity (this is the hands are always sensible rule):
	rule succeeds.

Penetrate check for an actor penetrating a body part with a body part (this is the can't do everything whilst fucking rule):
	let N be a number;
	let ba1 be a body area;
	let ba2 be a body area;
	now ba1 is the body location of the noun;
	now ba2 is the body location of the second noun;
	if the body location of the noun is an extremity or the body location of the second noun is an extremity:
		now N is 0;
	else if ba1 is upper body and ba2 is upper body:
		now N is 1;
	else if ba1 is upper body and ba2 is lower body:
		now N is 2;
	else if ba1 is lower body and ba2 is upper body:
		now N is 3;
	else if ba1 is lower body and ba2 is lower body:
		now N is 4;
	unless N is 0:
		repeat through the table of stored penetrations:
			let X be a number;
			let ba3 be a body area;
			let ba4 be a body area;
			if the pen1 entry is a sex toy:
				if the pen1 entry is a strap-on:
					now ba3 is the crotch area;
				else:
					now the ba3 is the hands area;
			else:
				now ba3 is the body location of the pen1 entry;
			if the pen2 entry is a sex toy:
				if the pen2 entry is a strap-on:
					now ba4 is the crotch area;
				else:
					now the ba4 is the hands area;
			else:
				now ba4 is the body location of the pen2 entry;
			if the body location of the noun is an extremity or the body location of the second noun is an extremity:
				now X is 0;
			else if ba3 is upper body and ba4 is upper body:
				now X is 1;
			else if ba3 is upper body and ba4 is lower body:
				now X is 2;
			else if ba3 is lower body and ba4 is upper body:
				now X is 3;
			else if ba3 is lower body and ba4 is lower body:
				now X is 4;
			if X is 0:
				next;
			else if X is N:
				next;
			else if (X is 1 and N is 4) or (N is 4 and X is 1):
				next;
			else if (X is 2 and N is 3) or (X is 3 and N is 2):
				next;
			else:
				now the insensible part is the pen1 entry;
				say "[The actor] [can't] [implied action of the second noun as a verb] [the noun], not while [regarding the actor][they] [are] [implied action of the pen1 entry as a gerund] [the pen2 entry]!" (A);
				rule fails.

Chapter - No Action Combos

Use combined actions translates as (- Constant COMBINED_ACTIONS; -).

Last check an actor fucking something with something when the combined actions option is not active (this is the disallow combined fucking rule):
	if the noun is penetrated by something (called the item):
		unless the item is the second noun:
			if the item is enclosed by the actor:
				try the actor withdrawing the item;
			if the item penetrates the noun:
				say "[The actor] [can't fuck] [the noun] while [the holder of the item] [are] [implied action of the item as a gerund] [regarding the noun][it]." (A) instead.			

Last check an actor licking something when the combined actions option is not active (this is the disallow combined licking rule):
	if the actor encloses a face (called the face) and the noun is penetrated by something (called the item):
		unless the item is the face:
			if the item is enclosed by the actor:
				try the actor withdrawing the item;
			if the item penetrates the noun:
				say "[The actor] [can't lick] [the noun] while [the holder of the item] [are] [implied action of the item as a gerund] [regarding the noun][it]." (A) instead.

Last check an actor rubbing something when the combined actions option is not active (this is the disallow combined rubbing rule):
	if the actor encloses some hands (called the hands) and the noun is penetrated by something (called the item):
		unless the item is the hands:
			if the item is enclosed by the actor:
				try the actor withdrawing the item;
			if the item penetrates the noun:	
				say "[The actor] [can't rub] [the noun] while [the holder of the item] [are] [implied action of the item as a gerund] [regarding the noun][it]." (A) instead.

Part - Continuous Actions

Use continuous actions translates as (- Constant CONTINUOUS_ACTIONS; -).

The continuous action rule is listed before the arousal decay rule in the every turn rulebook.

Every turn when a visible NPC is sex ready and the continuous actions option is active (this is the continuous action rule):
	repeat with individual running through visible people:
		unless the individual is listed in the sexually active list:
			if the individual encloses a cock (called the penis):
				if the penis is penetrating a thing (called the thingie):
					try the individual fucking the thingie with the penis;
			if the individual encloses a pussy (called the vagina):
				if the vagina is penetrating a thing (called the thingie):
					try the individual fucking the thingie with the vagina;
			if the individual encloses a face (called the tongue):
				if the tongue is penetrating a thing (called the thingie):
					try the individual licking the thingie;
			if the individual encloses some hands (called the fingers):
				if the fingers are penetrating a thing (called the thingie):
					try the individual rubbing the thingie;
			if the individual encloses a sex toy (called the toy):
				if the toy is penetrating a thing (called the thingie):
					try the individual fucking the thingie with the toy.

Chapter - Organ Priority

To decide if (X - a thing) has/have the/-- highest organ priority:
	if X is not body part and X is not a sex toy:
		decide no;
	[else if X penetrates nothing:
		decide yes;
	else if nothing penetrates X:
		decide yes;]
	else:
		let N be the organ priority of X;
		let K be an object;
		if X penetrates something (called Y):
			now K is Y;
		repeat with Z running through thing penetrating K:
			if the organ priority of Z is greater than N:
				decide no;
		decide yes.

To decide which number is the organ priority of (X - a thing):
	decide on the number produced by the organ priority rules for X.
	
The organ priority rules is an object based rulebook producing a number.

Last organ priority rule for a thing (called the organ) (this is the priority for everything else rule):
	let N be a number;
	if the organ is enclosed by the player:
		now N is N + 10;
	if the organ is a body part or the organ is a sex toy:
		if the organ is a pussy or the organ is penile:
			now N is N + 100;
		else if the organ is orificial or the organ is penile:
			now N is N + 50;
		else if the organ is sexually interactive:
			now N is N + 25;
	rule succeeds with result N.

Chapter - Filter Sex Prose

First sex prose rule for an actor rubbing something when the combined actions option is active and the continuous actions option is active (this is the filter sex prose for rubbing rule):
	if the actor encloses hands (called the item2):
		unless the item2 has the highest organ priority:
			rule succeeds;
	continue the action.
			

First sex prose rule for an actor licking something when the combined actions option is active and the continuous actions option is active (this is the filter sex prose for licking rule):
	if the actor encloses a face (called the item2):
		unless the item2 has the highest organ priority:
			rule succeeds;
	continue the action.

First sex prose rule for an actor fucking something with something when the combined actions option is active and the continuous actions option is active (this is the filter sex prose for ucking rule):
	unless the second noun has the highest organ priority:
		rule succeeds;
	continue the action.

Chapter - Filter Orgasm Prose

The increase arousal for licking rule is not listed in the carry out licking rulebook.
The increase arousal for rubbing rule is not listed in the carry out rubbing rulebook.
The increase arousal for fucking rule is not listed in the carry out fucking it with rulebook.


Carry out an actor rubbing something (this is the penetrative increase arousal for rubbing rule):
	if the noun is enclosed by a person (called the partner):
		if combined actions option is active:
			if the actor encloses hands (called the hands):
				if the hands have the highest organ priority:
					let N be the number produced by the sensitivity rules for the noun;
					arouse the partner by N;
			else:
				let N be the number produced by the sensitivity rules for the noun;
				arouse the partner by N;
		else:
			let N be the number produced by the sensitivity rules for the noun;
			arouse the partner by N;
		mark the actor as sexually active;
		mark the partner as sexually active;
		now the actor's arousal state is the arousal state of the actor;
		now the partner's arousal state is the arousal state of the partner.
	
Carry out an actor licking something (this is the penetrative increase arousal for licking rule):
	if the noun is enclosed by a person (called the partner):
		if the combined actions option is active:
			if the actor encloses a face (called the face):
				if the face has the highest organ priority:
					let N be the number produced by the sensitivity rules for the noun;
					arouse the partner by N;
			else:
				let N be the number produced by the sensitivity rules for the noun;
				arouse the partner by N;
		else:
			let N be the number produced by the sensitivity rules for the noun;
			arouse the partner by N;
		mark the actor as sexually active;
		mark the partner as sexually active;
		now the actor's arousal state is the arousal state of the actor;
		now the partner's arousal state is the arousal state of the partner.

Carry out an actor fucking something with something (this is the penetrative increase arousal for fucking rule):
	if the noun is enclosed by a person (called the partner):
		if the combined actions option is active:
			if the noun has the highest organ priority:
				let N be the number produced by the sensitivity rules for the noun;
				arouse the partner by N;
		else:
			let N be the number produced by the sensitivity rules for the noun;
			arouse the partner by N;
		if the second noun has the highest organ priority and combined actions option is active:
			if the second noun has the highest organ priority:
				let N be the number produced by the sensitivity rules for the second noun;
				arouse the actor by N;
		else:
			let N be the number produced by the sensitivity rules for the second noun;
			arouse the actor by N;
		mark the actor as sexually active;
		mark the partner as sexually active;
		now the actor's arousal state is the arousal state of the actor;
		now the partner's arousal state is the arousal state of the partner.

[Chapter - Ending Continuous Actions

Reverse-withdrawing is an action applying to one thing. Understand "stop rubbing/groping/licking/sucking/fucking [something]" as reverse-withdrawing.

Redirect an actor reverse-withdrawing something (this is the redirect reverse withdrawals rule):
	if the noun is penetrated by something (called the thingie):
		if the thingie is enclosed by the actor:
			try the actor withdrawing the thingie;
		else:
			say "[The actor] [aren't] interacting with [the noun]!" (A).]
		

Penetration ends here.

---- DOCUMENTATION ----

Chapter: Introduction

The way this extension came out was kind of a surprise. I was originally thinking that this extension would be of pretty limited use outside of a few very dedicated authors and specialized works, and that it would add to the complexity and workload of most projects. Actually, as it turns out, this extension does a lot of logical heavy lifting, allowing the author to concentrate more on prose than programming. It *may* help you save time. If you are going to use an arousal system in your work, there is no reason not to use the penetration system (except that it might be sort of buggy).

If you are not familiar with AIF games, the purpose of this extension might require a bit of explication. Some games feature a "penetration" system, where physical relations are tracked in-game. Basically, the game keep tracks of what cock is in what orifice at any given time. This can be used in a couple of ways:

1) Allow for some text to be printed when an actor stops doing something (i.e. "Joe stops fucking Jane's pussy.").

2) Allow for some text to be printed when an actor starts fucking someone (i.e. "Joe starts fucking Jane's pussy.").

3) Allow for more logical sex actions (i.e. "You can't fuck Jane's pussy, Joe is fucking it!").

4) Allow for actions to be continued over a period of time. So if the player has his cock in Susie, the player doesn't need to keep typing "fuck Susie" over and over.

5) Allow for combined actions. (i.e. "Joe rubs Jane's pussy while he fucks it.").

Only in option 5 do things have the potential to get really nuts. Combined actions are disabled by default, but can be re-enabled for people who want it.

Section: Other Extensions

At a minimum, Penetration (or "PEN") requires Simpler AIF ("SAIF") and Orgasms and Arousal ("ORA"). PEN must be the last extension included.

*:
	Include Simpler AIF by Another Wannabe.
	Include Orgasms and Arousal by Another Wannabe.
	Include Penetration by Another Wannabe.

While PEN doesn't technically require use of Advanced Layered Clothing or Posturing, some of PEN's most advanced features utilize them. If you are using the Combined Actions option ALC is also recommended.

Section: Version History

	Version 3, January 16th, 2015:
	-- Fixed licking and rubbing when the combined actions options is disabled.

	Version 2, November 18th, 2014:
	-- Adjusted compatibility with ALC.

	Version 1, July 20th, 2014:
	--Initial Release

Chapter: Basic Usage

Section: Penetrating, Withdrawing and Sex Prose

PEN provides two new actions, both of which will probably not be explicitly used by the player. This is the PENETRATING IT WITH action and the WITHDRAWING action.

The PENETRATING IT WITH action is used when a sex action is first called in a sequence, and represents the initiation of contact between the noun and the second noun. This action is NEVER used as a explicit command by the player. It is called by PEN's interal machinery, mostly before an action, when necessary. Also note that the penetrating action does not necessarily mean literal penetration, it would be more accurate to say that an organ penetrating one body part is "acting" on that body part. So, for example, having a pussy penetrate a cock doesn't mean that the female character has her clit jammed up the guy's urethra.

This is was a penetrating rule looks like.

*:
	After penetrating Janet's pussy with your cock:
		say "You push your cock inside Janet."

Conversely, the WITHDRAWING action does the opposite, removing said organ from contact with mentioned orifice. We add the clause "EXITING" from where we are withdrawing the noun.

*:
	After withdrawing your cock exiting Janet's pussy:
		say "You slide your cock out of Janet's pussy."
		
The EXITING clause is purely optional, but fairly useful. Inside the rule, we can use the variable "Original Receptacle" instead to stand in for the thing we are exiting from.

If we combine this with the "sex prose" rule introduced in ORA, we have all the prose we need for a given action.

*:
	After penetrating Janet's pussy with your cock:
		say "You push your cock inside Janet."
		
	Sex prose for fucking Janet's pussy with your cock:
		say "You continue fucking Janet."

	After withdrawing your cock exiting Janet's pussy:
		say "You slide your cock out of Janet's pussy."

If that seems simple, it is. And that's really all you need to start using PEN.

Section: Licking and Rubbing

Penetration also works with the licking and rubbing actions, but they require the use of the "face" body part and the "hands" body part. They operate identically to the fucking action, except they use the hands and face.

	After penetrating Janet's pussy with your face:
		say "You start licking Janet's pussy."
		
	Sex prose for licking Janet's pussy:
		say "You continue eating Janet's pussy."

	After withdrawing your face exiting Janet's pussy:
		say "You stop licking Janet's pussy."

If you don't use the face and hands body parts, these actions simply operate as normal.

Section: The Penetrating Relation

The penetration relation tracks which body part is sticking where. It's important to note that a) penetration doesn't necessarily mean *literal* penetration and b) the penetration relation moves in one direction. So, Joe's cock may be penetrating Janet's pussy, but Janet's pussy is not penetrating Joe's cock.

	if Maria's ass is penetrated by something (called the thingie)...

The direction of the penetration goes from the actor who initiated the action to the passive recipient. So, if a pussy is "penetrating" a cock, it is because the female character performed the fucking action and not the male character.

Penetration can end in a few ways. First is when one of the characters moves, either by using the "go" command, or "exit" or "enter". In this case, PEN calls the IMPLICITLY WITHDRAWING activity. If, for whatever reason the character can't withdraw, moving is prevented.

The second means is when the player does the withdraw command himself.

The third way is when actor, already penetrated, chooses to fuck or interact with another body part.

The fourth way is, if an actor is penetrating an object X, and X happens to then penetrate something else, every object penetrating X will be unpenetrated without even using the "withdraw" action.

The fifth way is after a male (and only a male) orgasms. More on this later.

The final means is through code. There are several phrases useful for ending penetrations, 

	...unpenetrate (A THING)...
	
This phrase clears all penetration relations for that thing. This phrase is powerful and will not use the "withdraw" action.

	...clear penetration for (A PERSON)...

This phrase unpenetrates all of the person's body parts and sex toys. This is very helpful if you want to teleport someone.

	...clear penetration globally...

This phrase clears every character's penetrative relations. This is useful if you've ended a big scene.

Technically, multiple objects can penetrate the same thing. By default, though, PEN prevents such situations, but it supports it when it happens. We'll cover that a bit later.

Section: A Note on Penetration and Moving

PEN does its best to end penetrations when it is sensible, such as when a character moves. None of this applies when a character is moved by phrase. If you aren't careful, you can have cocks still in pussies halfway across the map. To fix this, simply make a phrase that will always clear penetrative relations.

*:
	To teleport (X - a person) to (Y - an object):
		clear penetration for X;
		now X is in Y.

If you have a particular action that would disrupt the act of sex, you can label that act as "sexually disruptive".

*:
	Jumping is sexually disruptive.
	
This will cause people to withdraw before jumping.

Section: A Note on Orgasms and Withdrawal

By default, men will automatically withdraw after orgasming. This is to prevent a very awkward situation from arising... the male character will be too soft to fuck, and yet still penetrated in the other character.

This makes sense if you are using erection states. It makes significantly less sense if you aren't. Luckily, this behavior can be toggled off via use option.

If you aren't planning on using erection states, it is highly recommended you use the following use options:

*:
	Use permanent hardness.
	Use men don't withdraw postorgasm.

Section: The Pleasuring Relation

The pleasuring relation is used to test if something is penetrating something else, but without regard to direction. So if a cock penetrates a pussy, the cock is also considered to be pleasuring the pussy as the pussy is considered to be pleasuring the cock. Ok, so that was a tongue twister. Basically, as long as one thing is penetrating another, they are alway considered to be *pleasuring* one another.

	...if your cock is pleasured by something (called X)...

This, for example, would find whatever the cock was penetrating, or whatever the cock was being penetrated by.

This is used internally mostly to prevent multiple penetrations, although I'm sure it's very useful for other things too.

Section: Continuous Actions

One special feature included in SAIF is the ability for character to act continuously without being explicitly commanded to do so. Essentially that means that, just by using the "wait" command, the PC will continue licking, fucking or whatever he was currently doing. It is no long necessary for the player to type out "fuck X" every turn. This also open the possibility that a character can perform multiple actions in a round, for example, a character can lick tits while fucking a pussy.

Because this can cause complications, is turned off by default. If you want to use it, use this option.

*:
	Use continuous actions.

Section: Combined and Multiple Actions

PEN does support combined actions (i.e. rubbing a pussy while fucking it at the same time) and multiple actions (fucking someone and rubbing their tits) it doesn't allow them by default because of the additonal workload involved and the potential for strange consequences. It is covered in another chapter.

Chapter: Advanced Topics

Section: Implicit Withdrawing

Most times, PEN will use the withdrawing action when things need to be withdrawn. However, there are occasions it will use the implicit withdrawing activity, in particular, when a character moves out of their current location.

Modifying this rule is easy.

*:
	Rule for implicitly withdrawing something (called the item2) (this is the sloppy withdrawing rule):
		if the item2 is being pleasured by something (called the thingie):
			say "(First getting [the item2] out of [the thingie], sloppily)[line break]";
			silently try the person asked withdrawing item2.

In addition, we can call on the implicit withdrawing activity for an individual by calling on this phrase:

	...implicitly unpenetrate (A PERSON)...
	
This will call the implicit withdrawing activity for each of the person's body parts.

Section: Adding New Body Parts

PEN adds no new additional wrinkles for new body part. It does, however add them for *body areas*. If you are using ALC with PEN, each body area will have two new properties.

The first is the coronal descriptor, which describes where the body area is in relation to height. A body area can be defined as upper body (everything above the waist), lower body (everything below it) or an extremity (the hands). An extremity is basically a body part which is flexible enough to reach either end of the body, which I know ISN'T the correct anatomical definition, but this is useful for the purposes of coding. For example, feet aren't an extremity because they can't reach the upper body, but tentacles would be.

The second is the transverse descriptor, which describes where the body area is in relation to the front and back. The tranverse descriptors are anterior (anything in the front of a person), posterior (anything to the back of a person) and transversive (anything that reaches the back and the front of a person). So an ass is considered posterior, the crotch is anterior, and the hands, feet and legs are transversive.

The posturing extension also includes these phrases.

So when you make a new body area, you have to define what these descriptors are.

	The wings area is a body area. It is posterior and upper body.
	The tentacle area is a body area. It is an extremity and transversive.

Right now, only the coronal descriptors are actually used, and only for combined actions. The transverse descriptors are not used at all except in an unusual circumstance with the Posturing extension.

Section: Adding New Actions

PEN is simple when it comes to body areas. It is far harder on actions. There are a lot of hardcoded behaviors that you'll need to manually change in order to fully implement new actions.

The easy part is establishing the penetration relation.

*:
	Last check an actor footjobbing a body part (this is the penetrate before footjobbing rule):
		if the actor encloses feet (called the item):
			unless the item penetrates the noun:
				try the actor penetrating the noun with the item;
			unless the item penetrates the noun:
				rule succeeds.

We don't want to provide a message here for failure... the penetration action will provide that for us.

Next we provide some flavorful text for withdrawing and penetrating.

*:
	Report an actor withdrawing some feet when the original receptacle is not nothing (this is the report withdrawing feet rule):
		say "[The actor] [stop] giving [the original receptacle] a footjob.";
		rule succeeds.
	
	Report an actor penetrating something with some feet:
		say "[The actor] [start] giving [the original receptacle] a footjob.";
		rule succeeds.

OK, now you have the labor intensive job of making and modify a LOT of code. Go through all these and adapt your new action with the code provided. If you feel overwhelmed, remember you ONLY have to change out "footjobbing" for whatever action you happen to be making.

*:
	To say implied action of (x - some feet) as a verb:
		say "[footjob]"

	To say implied action of (x - some feet) as a gerund:
		say "footjobbing".
	
	The continuous action rule is not listed in the every turn rulebook.

	Every turn when a visible NPC is sex ready and the continuous actions option is active (this is the new continuous action rule):
		repeat with individual running through visible people:
			unless the individual is listed in the sexually active list:
				if the individual encloses a cock (called the penis):
					if the penis is penetrating a thing (called the thingie):
						try the individual fucking the thingie with the penis;
				if the individual encloses a pussy (called the vagina):
					if the vagina is penetrating a thing (called the thingie):
						try the individual fucking the thingie with the vagina;
				if the individual encloses a face (called the tongue):
					if the tongue is penetrating a thing (called the thingie):
						try the individual licking the thingie;
				if the individual encloses some hands (called the fingers):
					if the fingers are penetrating a thing (called the thingie):
						try the individual rubbing the thingie;
				if the individual encloses a sex toy (called the toy):
					if the toy is penetrating a thing (called the thingie):
						try the individual fucking the thingie with the toy;
				if the individual encloses some feet (called the toes):
					if the toes are penetrating a thing (called the thingie):
						try the individual footjobbing the thingie.

	Last check an actor footjobbing something when the combined actions option is not active (this is the disallow combined footjobbing rule):
		if the noun is penetrated by something (called the item):
			unless the item is the second noun:
				if the item is enclosed by the actor:
					try the actor withdrawing the item;
				if the item penetrates the noun:
						say "[The actor] [can't footjob] [the noun] while [the holder of the item] [are] [implied action of the item as a gerund] [regarding the noun][it]." (A) instead.

	Report an actor footjobbing something when the no sex prose whilst orgasming option is active (this is the penetrative standard orgasmic footjobbing rule):
		if the noun is enclosed by a person (called the partner):
			if the partner will orgasm with the noun:
				if the actor encloses some hands (called the hands):
					have the partner orgasm on the hands;
				else:
					have the partner orgasm;/
			else:
				if the penetration occurred is false:
					follow the sex prose rules;
		else:
			if the penetration occurred is false:
				follow the sex prose rules.

	Report an actor footjobbing something when the no sex prose whilst orgasming option is not active (this is the penetrative alternative orgasmic rubbing rule):
		if the penetration occurred is false:
			follow the sex prose rules;
		if the noun is enclosed by a person (called the partner):
			if the partner will orgasm with the noun:
				if the actor encloses some hands (called the hands):
					have the partner orgasm on the hands;
				else:
					have the partner orgasm.

Chapter: Combined Actions

Combined actions are particularly complicated and labor intensive, so they have been left to last in this documentation. This will allow characters to do two things at once to one or more objects -- for instance, you can rub something while licking it. Of course, any author can simply flavor an action this way, but this is for authors that want to give players a degree more freedom. It is, however, at the expense of A LOT of work and possible bugginess.

Turn on combined actions like thus:

*:
	Use combined actions.
	
...And the fun (i.e. torture) begins.

Section: Restrictions on Combined Actions

First up, there are restrictions on which actions can be done at once. Specifically, the game tries to prevent people from licking something they're fucking, but also allow others to lick at that thing being fucked.

So here's how it works.

Previously, we discussed how body areas can be either "lower body", "upper body" or "an extremity". A very complicated rule ("the can't do everything whilst fucking rule") attempts to determine whether any given sex action makes sense. It does that by checking to see if there is another penetration that's incompatible. An "incompatible" penetration is one that crosses with the current action. This is best illustrated by example.

An action where a face (an upper body part) penetrates some breast (an upper body part) would cross an action where a chest (an upper body part) penetrates a pussy (a lower body part). Similarly a lower body part and a upper body part would cross an upper body part and a upper body part. But a lower body part and a lower body part would not cross an upper body part and an upper body part. Similarly, parallel actions (where two actions both involve lower body parts and lower body parts penetrating) do not contradict each other.

That probably doesn't cover all the absurd body part combinations possible, but it's a start. You can add your own through the use of the penetrate check rules. This rulebook is used EXCLUSIVELY to figure out which pairs of penetrations don't work together.

	A penetrate check rule for an actor penetrating a blorb with a gorb (this is the prevent blorbs from fucking gorbs rule):
		say "But it's physically impossible to fuck a blorb with a gorb!";
		rule fails.

It's important to note that the penetrate check rules only check for penetrations between two people, even if you have a long chain of people penetrating one another. This is on purpose, so that you can make truly rediculous daisy chains. I'd advise you to make a cut scene instead, but it IS supported.

Section: Writing Prose for Combined Actions for Two Partners

PEN tries to manage how much prose you need to write and is displayed by consolidating sex prose rules downward. It is HIGHLY RECOMMENDED that you use one of the Consolidated Sex Actions rules found in the SAIF documentation, or else I do not accept responsibility for your inevitable suicide.

PEN uses a thing called "organ priority" to decide which organ's prose takes precedence in a given action. Higher number are higher priority. By default, here is how PEN assigns values.

	Pussies and cocks -- 100
	Anything else penile or orificial -- 50
	Any other body part or sex toy -- 25
	Enclosed by the player -- +10

So, if a character is both fucking X with a cock and rubbing it, the fucking action (with a priority of 100) takes precedence over the rubbing action (priority of 25).

You can, of course, customize how priority works by writing new organ priority rules.

	Organ priority rule for a tentacle (this is the tentacles are friggin huge rule):
		rule succeeds with result 200.

In effect, that means that if a bunch of body parts are penetrating one, you'll still only need to write one rule. Roughly, it goes in this order.

	Rubbing with hands --> Licking with a mouth, fucking with ass or pussy --> Fucking with a cock or pussy.

 So, for example, if person X is rubbing and licking person Y's pussy, you only need provide a rule for licking.
 
	Sex prose for rubbing Rhea's pussy:
		say "You rub Rhea's pussy. She likes it."
 
	Sex prose for licking Rhea's pussy:
		if the hands of the player are penetrating the noun:
			say "You rub Rhea's pussy while you eat her out."
		else:
			say "You just lick Rhea's pussy, being super-careful not to accidentally rub it. That would be counter to this amazing sex sim."
			
Similarly if you write a fucking action, you'll have to worry about rubbing and licking, but you won't have to worry about fucking while writing rubbing prose. Because of how the penetration action works, you'll rarely have to worry about sucking and fucking at the same time.

	Sex prose for fucking Rhea's pussy with your cock:
		if the hands of the player are penetrating the noun:
			say "Your rub Rhea while you fuck her.";
		else if the face of the player is penetrating the noun:
			say "You somehow manage to lick Rhea's pussy while fucking her. You might want to see a chiropractor about that.";
		else:
			say "You just fuck in her the normal, vanilla way. DISAPPOINTED!"

Orgasms are treated in a similar way. Arousal is not gained when PEN senses that a more EXTREME body part is being used to penetrated a body part. For example, a character rubbing and fucking someone will not trigger arousal gains while rubbing but will while fucking. This is specifically to prevent a circumstance where, say, the game says "Jane gives you a handjob and you come!" when Jane is actually fucking you.

Section: Writing Prose for Combined Actions for MORE Than Two Partners

Including this sort of penetration for more than two partner is something of a nightmarish proposition. PEN's prose filtering functions work less well when more than two actors are penetrating the same thing. For one thing, there's nothing really stopping anyone from, say, putting eighteen different dicks into one pussy. Even writing a threesome with this ruleset is a task of Sisyphean proportion. No, for the most part, I strong encourage you to use just two partners with combined actions but, if thoust are undeterred, by all mean, try.

This is what one rule might look like.

	Sex prose for fucking Erin's pussy with your cock:
		if Debbie's hands are penetrating Erin's pussy:
			say "Debbie rubs Erin's pussy while you fuck it.";
		else if Debbie's face is penetrating Erin's pussy:
			say "Debbie licks Erin's pussy while you fuck it.";
		else:
			say "You fuck Erin's pussy."

Chapter: Reference

Section: Variables

	penetration occurred - a truth state that holds whether a new penetration occurred this turn.
	insensible part - an object which holds a body part that caused penetration to fail.

Section: Relations

	to penetrate - a various-to-one relation that tracks which body part is physically inside another. This is only in one direction, so if body part X penetrating body part Y, Y is not penetrating X.
	to pleasure - a conditional relation that holds true if X is penetrating Y or X is being penetrated by Y. Basically, X is pleasuring Y no matter which one is being penetrated, as long as there is a penetration involved.

Section: Rulebooks

	implicitly withdrawing - an activity which controls withdrawing after doing something sexually disruptive (i.e. leaving a room).
	organ priority rules - the organ priority rules assists in writing sex prose by deciding which body part is the focal point of a particular action. It is explained in depth in the Combined Actions section.
	penetrate check rules - this rulebooks makes sure an attempted penetration is sensible. It contains few rules but is rather complex. The first rule makes sure body parts whose body locations are extremities always pass, so that things like hands are always available. The second rule is very complex, perhaps the most complex in the AIF Toolkit. It prevents illogical penetrations. A penetration is illogical if it is not symmetrical to a previous penetration. This is explained in depth under the Combined Actions section of this documentation.

Section: Actions

	penetrating it with - this action occurs when a PC attempts to fuck something for the first time.
	stop fucking - redirects to withdrawing penises/vaginas.
	stop licking - redirects to withdrawing faces.
	stop rubbing - redirects to withdrawing hands.
	withdrawing - the action occurs when a PC stops doing something.
	withdrawing all - this pulls out all penetrated organs.

Section: Use Options

	combined actions - allows for multiple body parts to penetrate one body part, for example, rubbing and effing someone's vagina. This has the potential to be immensely complex and it's recommended you don't use this for your first game. If you use this, continuous actions must also be used.
	continuous actions - all penetrated organs repeat their associated actions every turn, so that the player doesn't need to type in the same thing over and over again. Also opens the possible of multiple penetrations.
	men don't withdraw postorgasm - prevents male characters from automatically withdrawing after an orgasm.
	singular penetrations only - prevents multiple penetrations to reduce complexity. This would prevent, for example, licking someone's tits while effing them. This is only useful if continuous actions are activated.
	
	

Example: * Penetration Library Reference - Not a game, but a list of all the built in responses.

Because many of the failure responses are so complex, only a few failure responses are built into the table system. Other ones have to modified with the standard message altering system.

*:
	Table of Failure Responses (amended)
	rule name	message
	the redirect stop rubbing to withdrawing rule	"There is no need for that, [the person asked] [aren't] rubbing [the noun] at the moment."
	the redirect stop licking to withdrawing rule	"There is no need for that, [the person asked] [aren't] licking [the noun] at the moment."
	the redirect stop fucking to withdrawing rule	"There is no need for that, [the person asked] [aren't] fucking [the noun] at the moment."
	the must be penetrating something in order to withdraw all rule	"[The person asked] [aren't] doing anything at the moment."

*:
	ensure there is only one penetration per actor rule response (A) is "New text.".
	disallow combined rubbing rule response (A) is "New text.".
	disallow combined licking rule response (A) is "New text.".
	disallow combined fucking rule response (A) is "New text.".
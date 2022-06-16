Version 1 of Improved Sex Action Tracking by Another Wannabe begins here.

"Adds a less memory intensive method to track sexual relations. Requires Simpler AIF by Another Wannabe."

Include Simpler AIF by Another Wannabe.

Part - Improved Sex Action Tracking (in place of Part - Sex Action Tracking in Simpler AIF by Another Wannabe)

A scene can be erotic. A scene is usually not erotic.
A scene has a list of people called the involved partners.

When an erotic scene (called K) ends:
	repeat with P running through the involved partners of K:
		if P is not the player:
			now P is not sex ready.

A face is a part of every man. A face is a part of every woman. A face is orificial.
A bodily construction rule:
	now your face is part of the player.

Some hands are a part of every man. Some hands are a part of every woman.
A bodily construction rule:
	now your hands are part of the player.

Sex-tracking relates things to each other. The verb to previously interact with (he previously interacts with, they previously interact with, he previously interacted with, it is previously interacting with) implies the sex-tracking relation.

Post-action bookkeeping rule for an actor rubbing a thing:
	now the hands of the actor previously interact with the noun.
Post-action bookkeeping rule for an actor licking a thing:
	now the face of the actor previously interacts with the noun.
Post-action bookkeeping rule for an actor fucking something with something:
	now the noun previously interacts with the second noun.
Post-action bookkeeping rule for an actor kissing a person:
	now the face of the actor previously interacts with the face of the noun.

When an erotic scene (called the new scene) begins:
	repeat with N running through the involved partners of the new scene:
		repeat with K running through the body parts incorporated by N:
			now K previously interacts with nothing.

To decide if (K - a person) previously rubs/rub (N - a thing):
	if the hands of K previously interact with N:
		decide yes;
	decide no.
To decide if (K - a person) previously licks/lick (N - a thing):
	if the face of K previously interacts with N:
		decide yes;
	decide no.
To decide if (K - a person) previously kisses/kiss (N - a person):
	if the face of K previously interacts with the face of N:
		decide yes;
	decide no.
To decide if (K - a person) previously fucks/fuck (N - a thing):
	repeat with L running through the body parts incorporated by K:
		if N previously interacts with L and L is not a face and (L is orificial or L is penile):
			decide yes;
	decide no.
To decide if (K - a thing) previously fucks/fuck (N - a thing):
	if K previously interacts with N, decide yes;
	decide no.

Improved Sex Action Tracking ends here.

---- DOCUMENTATION ----

Chapter: The Basics

Section: Introduction

This is a very small extension and a member of the AIF Toolkit family of extensions. ISAT doesn't do anything new. Instead, it replaces the standard sex action tracking system used in Simpler AIF, consolidating four relations into one. Theoretically, this is better for memory consumption. Unfortunately, it requires that hands and mouths be included as body parts, which is why this is an optional extension.

ISAT works by using its single relation (to previously interact with) to figure out the likeliest action action between to body parts. So, if a cock previously interacts with a vagina, it's fairly safe to assume it was fucking. Faces are assumed to be licking, and hands are assumed to be rubbing, faces and faces are assumed to be kissing.

Relations can be tested using one of five phrases:

	if A PERSON previously rubs A THING...
	
This returns true if the hands of the person previously interact with the thing.

	if A PERSON previously licks A THING...

This returns true if the face of the person previously interacts with the thing.

	if A PERSON previously kisses A PERSON...

This returns true of the face of the first person previously licks the face of the other person.

	if A PERSON previously fucks A THING...

This is a complicated case, because this covers a wide variety of actions. However, it returns true if any orificial or penile organ (that isn't a mouth) interacts with the thing.

	if A THING previously fucks A THING...
	
This is much simpler, because it returns true simply if the first thing previously interacts with the second thing.

Something to bear in mind: all relations are reciprocally tracked. That is: if person A licks the cock of person B, person B is considered to have fucked the face of person B. 

Like in Simpler AIF, at the beginning of an erotic scene all sex tracking for the involve partners are wiped.

Chapter: Advanced

Section: Past Participles

ISAT supports past participles, but they are used somewhat differently from vanilla SAIF. Because I7 does not yet support the use of past participles and variables, phrases will not work. You'll have to write it out like this:

	if SOMETHING previously interacted with SOMETHING ELSE...
	
Section: Using ISAT with New Actions

The process for using ISAT is slightly different from SAIF.

First, you'll need to make a post-action bookkeeping rule for the new action. We'll use the footjob example from the SAIF action.

	Post-action bookkeeping rule for an actor footjobbing something:
		now the feet of the actor previously interact with the noun.
		
Second, you'll need to define the phrase that tests this.

	To decide whether (N - a person) footjobs/footjob (X - a thing):
		if the feet of N previously interact with X:
			decide yes;
		decide no.

That's it. Bear in mind that, because the previously interact with relation is a reciprocal relation, that the second object is also considered to have previously interacted with the first object. So, footjobbing a cock would also result in the cock fucking the feet.
Version 1 of What an Ass by Another Wannabe begins here.

Part - Asscheeks

The buttocks are a kind of body part. The plural of buttocks is pairs of buttocks. They are plural-named. They are orificial. Understand "buttocks", "buttock", "ass", "asscheeks", "ass cheeks", "arse", "arse cheeks", "arsecheeks",  "butt", "buttcheeks", "butt cheeks", "asscheek", "ass cheek", "arse cheek", "arsecheek", "buttcheeks" and "butt cheek" as the buttocks.

The buttocks are a part of every man. The buttocks are a part of every woman.

your buttocks are buttocks.
A bodily construction rule (this is the add buttocks rule):
	now your buttocks are part of the player.
	
To decide which object is the/-- buttocks of (the individual - a person):
	if the individual incorporates some buttocks (called the item):
		decide on the item;
	decide on nothing.

Chapter - Hotdogging

Use hotdogging translates as (- Constant HOTDOGGING; -).

Sexual combination validity for an actor fucking a buttocks with something when the hotdogging option is inactive (this is the block hotdogging rule):
	issue failure message for the block hotdogging rule;
	combination invalid.
Sexual combination validity for an actor fucking something with a buttocks when the hotdogging option is inactive (this is the block someone hotdogging rule):
	issue failure message for the block someone hotdogging rule;
	combination invalid.

Table of Failure Responses (continued)
rule name	message
the block hotdogging rule	"[The person asked] [can't] fuck [the noun]."
the block someone hotdogging rule	"[The person asked] [can't] fuck with [the second noun]."

Chapter - Buttocks and Clothing (for use with Advanced Layered Clothing by Another Wannabe)

The buttocks area is a body area.

The body location of the buttocks is the buttocks area.

The covered areas of underwear is {crotch area, buttocks area, ass area}.
The covered areas of pants are {crotch area, buttocks area, ass area, legs area}.
The covered areas of shorts are {crotch area, buttocks area, ass area}.
The covered areas of a bodysuit are {feet area, legs area, crotch area, ass area, tummy area, chest area, arms area, hands area, buttocks area}.
The compatible areas of a person is usually {the feet area, the legs area, the crotch area, the buttocks area, the ass area, the tummy area, the chest area, the arms area, the hands area, the face area, the eyes area, the hair area}.

Section - Garments

A thong is a kind of garment. The layer is 1. Understand "thong" as a thong. The covered areas are {ass area, crotch area}.

Section - Buttocks Area Descriptors 1 (for use with Penetration by Another Wannabe)

The buttocks area is posterior and lower body.

Section - Buttocks Area Descriptors 2 (for use with Posturing by Another Wannabe)

The buttocks area is posterior and lower body.

Chapter - Disambiguation (for use with Disambiguation Control by Jon Ingold)

Should the game suggest rubbing the buttocks (this is the assume the player wants to rub the buttocks rule): it is an excellent suggestion.
Should the game suggest asking someone to try rubbing the buttocks (this is the assume the player wants to ask someone to try to rub the buttocks rule): it is an excellent suggestion.


Part - Men Don't Permit Assfucking

Check fucking an ass enclosed by a male person with something (this is the cannot fuck male asses rule):
	issue failure message for the cannot fuck male asses rule;
	rule succeeds.
Check fucking something with an ass enclosed by a male person (this is the cannot fuck with male asses rule):
	issue failure message for the cannot fuck male asses rule;
	rule succeeds.
	
Table of Failure Responses (continued)
rule name	message
the cannot fuck male asses rule	"[The sex partner] [don't] want to be assfucked."
the cannot fuck with male asses rule	"[The person asked] [don't] want to be assfucked."

What an Ass ends here.

---- DOCUMENTATION ----

This extension is simple and adds a few features to Simpler AIF:

1) It adds the buttocks, distinguishable from an ass. The buttocks is the fleshy area around the asshole, and the ass object now represents the hole part of the ass.

2) Adds some specialized functions for assfucking, as if the AIF Toolkit needed any more.

3) If Advanced Layered Clothing is used. The buttocks area is a new body area, and the thong is added as an object.

Section: Buttocks

The buttocks is a new body part that is added to both men and women. A buttocks represents the fleshy part, while the ass is more representative of the hole itself. It is orificial, but cannot be fucked or fucked with by default (though see "hotdogging").

The buttocks is not orgasmic and can be licked and rubbed as normal.

If you want to rename the buttocks, add the Custom Body Part Names plugin and add the following code, changing buttocks to whatever you want:

*:
	The default buttocks name is a text variable. The default buttocks name is "buttocks".

	Rule for printing the name of a buttocks (called J):
		if J is enclosed by a person (called K):
			say "[preamble for K] [default buttocks name]".

Section: Clothing

The area of the buttocks is called the "buttocks area". Obviously, it contains the buttocks. It has been fully integrated into the existing clothing system. Additionally, "thongs" have been added. Thongs cover the ass and the crotch but not the buttocks.

Section: Hotdogging

Despite the fact that the buttocks is an orificial body part, attempts to fuck it are generally blocked. This is for the sanity of the author. However, hotdogging is, indeed, an actual sex act that sometimes happens, so it can be allowed.

You can add it by pasting in this use option:

*:
	Use hotdogging.

Google Hotdogging, by the way, and find a lot of My Little Pony porn. Will someone please think of the children!

Section: Men and Assfucking

In most AIF, assfucking is blocked for men. This is so common it is the default behavior in What an Ass! You, however, can do whatever you want.

To change this behavior, simply unlist the rule:

*:
	The cannot fuck male asses rule is not listed in any rulebook.
	The cannot fuck with male asses rule is not listed in any rulebook.

Section: New Messages

Here is a brief list of all the new messages.

	Table of Failure Responses (amended)
	rule name	message
	the cannot fuck male asses rule	"[The sex partner] [don't] want to be assfucked."
	the cannot fuck with male asses rule	"[The person asked] [don't] want to be assfucked."
	the block hotdogging rule	"[The person asked] [can't] fuck [the noun]."
	the block someone hotdogging rule	"[The person asked] [can't] fuck with [the second noun]."

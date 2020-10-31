//UNCRAFTABLE (MUST BE SCAVENGED)
/datum/reagent/drug/buffout
	name = "Buffout"
	description = "A highly potent anabolic steroid popular before the war with athletes. Causes liver and heart damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/calmex
	name = "Calmex"
	description = "A light anaesthetic. Reduces inhibitions and dulls the senses."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/daddy_o
	name = "Daddy-O"
	description = "Increases brain power, but slurs speech."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/day_tripper
	name = "Day Tripper"
	description = "A mild hallucinogen. Helps take the edge off, but weakens muscles."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/smooch
	name = "Smooch"
	description = "A novel smokable from Northern Nevada. Tastes terrible, but causes mellowness and ecstacy. Prolonged use causes extreme brain damage."
	color = "#65FF00"
	overdose_threshold = 20
	addiction_threshold = 10
	taste_description = "putrid death"

/datum/reagent/drug/smooch/on_mob_metabolize(mob/living/L)
	..()
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "smooch_drug", /datum/mood_event/happiness_drug)

/datum/reagent/drug/happiness/on_mob_delete(mob/living/L)
	SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "smooch_drug")
	..()

/datum/reagent/drug/smooch/on_mob_life(mob/living/carbon/M)
	M.set_drugginess(15)
	M.jitteriness = 0
	M.confused = 0
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.2)
	if(prob(7))
		M.emote(pick("twitch","drool","moan","giggle"))
	..()
	. = 1

/datum/reagent/drug/smooch/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.5)
	M.adjustToxLoss(0.5, 0)
	M.adjust_disgust(2)
	..()
	. = 1

/datum/reagent/drug/smooch/addiction_act_stage1(mob/living/M)
	M.hallucination += 10
	if((M.mobility_flags & MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(5)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/smooch/addiction_act_stage2(mob/living/M)
	M.hallucination += 20
	if((M.mobility_flags & MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(10)
	M.Dizzy(10)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/smooch/addiction_act_stage3(mob/living/M)
	M.hallucination += 30
	if((M.mobility_flags & MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i = 0, i < 12, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/smooch/addiction_act_stage4(mob/living/carbon/human/M)
	M.hallucination += 30
	if((M.mobility_flags & MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i = 0, i < 16, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(50)
	M.Dizzy(50)
	M.adjustToxLoss(5, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(50))
		M.emote(pick("twitch","drool","moan"))
	..()
	. = 1

/datum/reagent/drug/steady
	name = "Steady"
	description = "A military grade relaxant. Reduces weapon sway and increases effective accuracy, but carries a severe risk of addiction."
	color = "#60A584" // rgb: 96, 165, 132
	addiction_threshold = 5
	overdose_threshold = 30

/datum/reagent/drug/x_cell
	name = "X-Cell"
	description = "A general purpose performance enhancer. Gives a general boost to all SPECIAL stats, but with a high risk of addiction."
	color = "#60A584" // rgb: 96, 165, 132
	addiction_threshold = 5
	overdose_threshold = 30

//CRAFTABLE DRUGS
/datum/reagent/drug/hydra
	name = "Hydra"
	description = "A curative agent that anaesthetises and restores crippled limbs. Causes heart damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/jet
	name = "Jet"
	description = "A highly addictive meta-amphetamine. Causes lung damage and addiction."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/rocket
	name = "Rocket"
	description = "A variant of jet. Has more potent combat properties, but carries a higher risk of addiction."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/mentats
	name = "Mentats"
	description = "A powerful nootropic that increases mental faculties, but increases thirst."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/psycho
	name = "Psycho"
	description = "A military grade amphetamine. Causes increased strength and endurance, but induces a powerful psychosis."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/rebound
	name = "Rebound"
	description = "A powerful mix of adrenaline and liquid Jet. Makes the user faster, but causes considerable heart damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/turbo
	name = "Turbo"
	description = "Jet mixed with cazador poison and hairspray. Results in extremely strong Jet effects."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/voodoo
	name = "Voodoo"
	description = "A potent mix of animal venoms and alcohol. Results in numbness that reduces damage."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/mutie
	name = "Mutie"
	description = "A potent mutagenic serum that enhances combat effectiveness via mutations."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/weapon_binding_ritual
	name = "Weapon Binding Ritual"
	description = "TAKE DRUGS. KILL A BEAR."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/overdrive
	name = "Overdrive"
	description = "A modified version of Psycho, designed to produce a stronger effect."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

//ANIMAL AND INSECT DRUGS

/datum/reagent/drug/ant_nectar
	name = "Ant Nectar"
	description = "A drug naturally produced by giant ants. Increases strength, but dramatically dulls mental faculties."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/fire_ant_nectar
	name = "Fire Ant Nectar"
	description = "A drug naturally produced by giant fire ants. Increases agility, but dramatically dulls mental faculties."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/ant_queen_pheromones
	name = "Ant Queen Pheromones"
	description = "Pheromones naturally produced by giant ant queens. Increases charisma, but dramatically dulls mental faculties."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

/datum/reagent/drug/nightstalker_squeezins
	name = "Nightstalker Squeezin's"
	description = "A biological drug produced by processing Nightstalker blood."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 30

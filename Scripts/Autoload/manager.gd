extends Node


var conversation = [
	{"Child": "Hello, how are you, Buddy?"},
	{"Puppy": "*(Buddy looks up, wags its tail, then suddenly flops onto its back, belly exposed.)"},
	{"Child": "(Giggling) \"Oh! You must be happy!\""},
	{"Child": "*(The child kneels down, observing Buddy’s body language closely.)"}
]
var dog_behavior_questions = [
	{
		"question": "A dog wags its tail high and stiff while staring at you. What does this likely mean?",
		"options": ["A) The dog is happy and wants to play.", 
					"B) The dog is alert and possibly feeling dominant or uncertain.", 
					"C) The dog is scared and wants to run away."],
		"answer": 1,
		"explanation": "A stiff, high wag is often a sign of alertness or possible dominance, not necessarily happiness.",
		"behavior": "alert"
	},
	{
		"question": "A dog lowers its ears and avoids eye contact when you approach. What does this suggest?",
		"options": ["A) The dog is nervous or submissive.", 
					"B) The dog is excited and wants to play.", 
					"C) The dog is aggressive and ready to attack."],
		"answer": 0,
		"explanation": "Avoiding eye contact and lowering ears usually indicate fear or submission.",
		"behavior": "anxious"
	},
	{
	"question": "You notice a dog’s tail is tucked tightly between its legs. What emotion is the dog likely experiencing?",
	"options": ["A) Happiness", 
				"B) Anxiety or fear", 
				"C) Excitement"],
	"answer": 1,
	"explanation": "A tightly tucked tail is a strong indicator of fear or anxiety.",
	"behavior": "anxious"
},
	{
		"question": "A dog’s body is stiff, its ears are up, and it is growling softly. What does this indicate?",
		"options": ["A) The dog is feeling threatened and may become aggressive.", 
					"B) The dog is playing and having fun.", 
					"C) The dog wants attention and to be petted."],
		"answer": 0,
		"explanation": "A stiff posture and growling suggest the dog feels threatened and is warning others.",
		"behavior": "alert"
	},
	{
		"question": "A dog is licking its lips and yawning while looking away. What is it trying to communicate?",
		"options": ["A) The dog is hungry and wants food.", 
					"B) The dog is feeling anxious or stressed.", 
					"C) The dog is feeling sleepy and needs a nap."],
		"answer": 1,
		"explanation": "Lip-licking and yawning can be calming signals, often used when a dog is stressed.",
		"behavior": "stress relief"
	},
	{
		"question": "A dog suddenly freezes in the middle of play. What does this behavior suggest?",
		"options": ["A) The dog is assessing the situation and deciding what to do next.", 
					"B) The dog is trying to trick you into thinking it is scared.", 
					"C) The dog is inviting you to play."],
		"answer": 0,
		"explanation": "Freezing can indicate uncertainty or overstimulation. It’s a moment where the dog is deciding its next action.",
		"behavior": "alert"
	},
	{
		"question": "A dog’s tail is held low but wagging slowly. What does this likely mean?",
		"options": ["A) The dog is excited and happy.", 
					"B) The dog is completely relaxed.", 
					"C) The dog is unsure and slightly nervous."],
		"answer": 2,
		"explanation": "A low, slow wag often signals insecurity or mild nervousness.",
		"behavior": "anxious"
	},
	{
		"question": "A dog is playfully jumping around but suddenly starts barking in a high-pitched tone. What could this mean?",
		"options": ["A) The dog is excited and inviting more play.", 
					"B) The dog is scared and trying to escape.", 
					"C) The dog is warning you to stay away."],
		"answer": 0,
		"explanation": "High-pitched barks often indicate excitement, especially when combined with playful movements.",
		"behavior": "playful"
	},
	{
		"question": "A dog keeps circling and sniffing the ground. What behavior does this suggest?",
		"options": ["A) The dog is preparing to attack.", 
					"B) The dog is trying to find a place to relieve itself or is investigating scents.", 
					"C) The dog is feeling bored and looking for attention."],
		"answer": 1,
		"explanation": "Sniffing and circling are common signs that a dog is investigating an area or preparing to relieve itself.",
		"behavior": "alert"
	},
	{
		"question": "A dog is panting heavily, even though it hasn’t been running. What does this behavior likely indicate?",
		"options": ["A) The dog is stressed or overheated.", 
					"B) The dog is very happy.", 
					"C) The dog is bored and needs a toy."],
		"answer": 0,
		"explanation": "Heavy panting without exercise can indicate stress or overheating, not happiness.",
		"behavior": "stress relief"
	},
	{
		"question": "A dog is slowly wagging its tail while keeping its body low to the ground. What could this mean?",
		"options": ["A) The dog is feeling uncertain but trying to be friendly.", 
					"B) The dog is feeling aggressive and wants to attack.", 
					"C) The dog is completely confident and relaxed."],
		"answer": 0,
		"explanation": "A low body posture combined with a slow wag often means the dog is unsure but open to interaction.",
		"behavior": "trusting"
	},
	{
		"question": "A dog keeps pawing at you gently. What does this behavior likely mean?",
		"options": ["A) The dog is warning you to stay away.", 
					"B) The dog is trying to assert dominance.", 
					"C) The dog wants attention or is seeking comfort."],
		"answer": 2,
		"explanation": "Pawing is a common way for dogs to ask for attention or reassurance.",
		"behavior": "trusting"
	},
	{
	"question": "A dog sitting calmly with its ears forward but not stiff is likely:",
	"options": ["A) Relaxed", 
				"B) Threatened", 
				"C) Nervous"],
	"answer": 0,
	"explanation": "Ears in a soft, natural position suggest the dog is relaxed.",
	"behavior": "relaxed"
},
	{
	"question": "When a dog exposes its belly while lying down, it is showing:",
	"options": ["A) Aggression", 
				"B) Trust and comfort", 
				"C) Fear"],
	"answer": 1,
	"explanation": "When a dog exposes its belly, it signals trust and feeling safe around you.",
	"behavior": "trusting"
},
	{
		"question": "A dog is stiff, staring at something with ears forward and body tense. What does this suggest?",
		"options": ["A) The dog is highly focused and possibly preparing to react.", 
					"B) The dog is tired and about to fall asleep.", 
					"C) The dog is inviting you to play."],
		"answer": 0,
		"explanation": "A stiff body and intense stare usually indicate focus, possibly on a perceived threat or prey.",
		"behavior": "alert"
	}
]

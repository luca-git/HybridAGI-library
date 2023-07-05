CREATE
(start:Control {name:"Start"}),
(clarify_objective:Program {name:"Clarify the Objective given by the User by asking questions", program:"program:clarify_objective"}),
(choose_difficulty:Decision {name:"Choose the most relevant difficulty to answer the objective", question:"Please choose the best suited difficulty level"}),
(chain_of_thought:Program {name:"Answer difficult question using a chain of thought", program:"program:chain_of_thought"}),
(direct_prompting:Program {name:"Answer simple question using direct prompting", program:"program:direct_prompting"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(clarify_objective),
(clarify_objective)-[:NEXT]->(choose_difficulty),
(choose_difficulty)-[:DIFFICULT]->(chain_of_thought),
(choose_difficulty)-[:SIMPLE]->(direct_prompting),
(chain_of_thought)-[:NEXT]->(end),
(direct_prompting)-[:NEXT]->(end)
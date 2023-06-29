CREATE
(start:Control {name:"Start"}),
(clarify_objective:Program {name:"program:clarify_objective"}),
(chain_of_thought:Program {name:"program:chain_of_thought"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(clarify_objective),
(clarify_objective)-[:NEXT]->(chain_of_thought),
(chain_of_thought)-[:NEXT]->(end)
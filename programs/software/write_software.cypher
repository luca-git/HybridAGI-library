// This program is based on https://github.com/AntonOsika/gpt-engineer
// MIT License Copyright (c) 2023 Anton Osika
CREATE
(start:Control {name:"Start"}),
(coding_philosophy:Program {name:"Learn the coding philosophy", program:"program:coding_philosophy"}),
(write_spec:Program {name:"Write the software specification", program:"program:write_spec"}),
(write_unittest:Program {name:"Write the software tests", program:"program:write_unittest"}),
(write_code:Program {name:"Write the software code", program:"program:write_code"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(coding_philosophy),
(coding_philosophy)-[:NEXT]->(write_spec),
(write_spec)-[:NEXT]->(write_unittest),
(write_unittest)-[:NEXT]->(write_code),
(write_code)-[:NEXT]->(end)
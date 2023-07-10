// This program is based on https://github.com/AntonOsika/gpt-engineer
// MIT License Copyright (c) 2023 Anton Osika
CREATE
(start:Control {name:"Start"}),
(generate_test:Action {name:"Generate the tests of the program", tool:"Predict", params:"You are a super smart developer using Test Driven Development to write tests according to a specification.\nPlease generate tests based on the above specification. The tests should be as simple as possible, but still cover all the functionality.\nTest:"}),
(write_test:Action {name:"Write test file", tool:"WriteFile", params:"The name of the test file followed by the content, both double quoted without punctuation between them.\nInput:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(generate_test),
(generate_test)-[:NEXT]->(write_test),
(write_test)-[:NEXT]->(end)
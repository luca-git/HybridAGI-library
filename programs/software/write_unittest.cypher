// This program is based on https://github.com/AntonOsika/gpt-engineer
// MIT License Copyright (c) 2023 Anton Osika
CREATE
(start:Control {name:"Start"}),
(generate_test:Action {name:"Generate the tests of the program", tool:"Predict", params:"
You are a super smart developer using Test Driven Development to write tests according to a specification.
Please generate tests based on the above specification.
The tests should be as simple as possible, but still cover all the functionality.
Test:"}),
(write_test:Action {name:"Write test file", tool:"WriteFile", params:"
The test file using the following format:
FILENAME
```LANG
CODE
```

Where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension.
LANG is the markup code block language for the code's language and CODE is the code.
Input:"}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(generate_test),
(generate_test)-[:NEXT]->(write_test),
(write_test)-[:NEXT]->(end)
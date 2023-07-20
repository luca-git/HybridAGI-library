CREATE
(start:Control {name:"Start"}),
(list_requirements:Action {name:"List the code requirements", tool:"Predict", params:"Think step by step and reason yourself to the right decisions to make sure we get it right.
You will first lay out the names of the core classes, functions, methods that will be necessary, as well as a quick comment on their purpose.
Requirements:"}),
// Implement the entrypoint file using tree of thought prompting
(implement_entrypoint_file:Action {name:"Implement the entrypoint file", tool:"Predict", params:"The entrypoint file.
Imagine three different coding experts are implementing the entrypoint file.
All experts will write down 1 step of their thinking with the corresponding code, then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
Please note that the code should be fully functional and include all implemented method and function. No placeholders.
Experts Reasoning:"}),
// Save the entrypoint file
(write_entrypoint_file:Action {name:"Write the entrypoint file", tool:"WriteFile", params:"
Based on the above conversation combine the best answers to implement the entrypoint file.
Please use the following format:

FILENAME
```LANG
CODE
```

Where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension.
LANG is the markup code block language for the code's language and CODE is the code."}),
(refine_requirements:Action {name:"Refine the code requirements", tool:"Predict", params:"
Please update the code requirements to remove already implemented ones.
Let's think this out in a step by step way to be sure we have the right answer.
Requirements:"}),
// Implement imported files using tree of thought prompting
(implement_imported_file:Action {name:"Implement imported file", tool:"Predict", params:"
Imagine three different coding experts are implementing the imported file.
All experts will write down 1 step of their thinking with the corresponding code, then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
Please note that the code should be fully functional and include all implemented method and function. No placeholders.
Experts Reasoning:"}),
// Save the imported files
(write_imported_file:Action {name:"Fix the imported file", tool:"WriteFile", params:"
The imported file using the following format:

FILENAME
```LANG
CODE
```

Where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension.
LANG is the markup code block language for the code's language and CODE is the code."}),
(is_project_finished:Decision {name:"Check if the project is finished", question:"Is the project finished? meaning that all Requirements have been implemented. Let's think this out in a step by step way to be sure we have the right answer."}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(list_requirements),
(list_requirements)-[:NEXT]->(implement_entrypoint_file),
(implement_entrypoint_file)-[:NEXT]->(write_entrypoint_file),
(write_entrypoint_file)-[:NEXT]->(refine_requirements),
(refine_requirements)-[:NEXT]->(implement_imported_file),
(implement_imported_file)-[:NEXT]->(write_imported_file),
(write_imported_file)-[:NEXT]->(is_project_finished),
(is_project_finished)-[:NO]->(refine_requirements),
(is_project_finished)-[:YES]->(end)

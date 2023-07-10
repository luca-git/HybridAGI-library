// This program is based on https://github.com/AntonOsika/gpt-engineer
// MIT License Copyright (c) 2023 Anton Osika
CREATE
(start:Control {name:"Start"}),
(list_requirements:Action {name:"List the code requirements", tool:"Predict", params:"Think step by step and reason yourself to the right decisions to make sure we get it right.
You will first lay out the names of the core classes, functions, methods that will be necessary, as well as a quick comment on their purpose.
Requirements:"}),
(write_entrypoint_file:Action {name:"Write the entrypoint file", tool:"WriteFile", params:"The name of the entrypoint file followed by its content, both double quoted without punctuation between them.\nInput:"}),
(refine_requirements:Action {name:"Refine the code requirements", tool:"Predict", params:"Think step by step and reason yourself to the right decisions to make sure we get it right.
You will first lay out the names of the core classes, functions, methods that will be necessary, as well as a quick comment on their purpose. Make sure to not include the already implemented classes, function and methods.
Requirements:"}),
(write_imported_file:Action {name:"Write imported file", tool:"WriteFile", params:"The name of the imported file followed by the content, both double quoted without punctuation between them.\nInput:"}),
(is_project_finished:Decision {name:"Check if the project is finished", question:"Is the project finished? meaning that all Requirements have been implemented."}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(list_requirements),
(list_requirements)-[:NEXT]->(write_entrypoint_file),
(write_entrypoint_file)-[:NEXT]->(refine_requirements),
(refine_requirements)-[:NEXT]->(write_imported_file),
(write_imported_file)-[:NEXT]->(is_project_finished),
(is_project_finished)-[:NO]->(refine_requirements),
(is_project_finished)-[:YES]->(end)
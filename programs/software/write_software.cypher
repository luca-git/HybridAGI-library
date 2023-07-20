CREATE
(start:Control {name:"Start"}),
(navigate_into_project_folder:Program {name:"Navigate into the project folder, create one if needed", program:"program:navigate_into_project_folder"}),
(coding_philosophy:Program {name:"Learn the coding philosophy", program:"program:coding_philosophy"}),
(write_spec:Program {name:"Write the software specification", program:"program:write_spec"}),
(write_unittest:Program {name:"Write the software tests", program:"program:write_unittest"}),
(write_code:Program {name:"Write the software code", program:"program:write_code"}),
(upload_software:Action {name:"Upload the software to the User", tool:"Upload", params:"The path of the current directory, you can use ."}),
(end:Control {name:"End"}),
(start)-[:NEXT]->(navigate_into_project_folder),
(navigate_into_project_folder)-[:NEXT]->(write_spec),
(write_spec)-[:NEXT]->(coding_philosophy),
(coding_philosophy)-[:NEXT]->(write_unittest),
(write_unittest)-[:NEXT]->(write_code),
(write_code)-[:NEXT]->(upload_software),
(upload_software)-[:NEXT]->(end)
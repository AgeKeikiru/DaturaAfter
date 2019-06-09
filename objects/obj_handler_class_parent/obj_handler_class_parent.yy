{
    "id": "0e6e2d46-3a38-4d07-807e-b6341821fb00",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_handler_class_parent",
    "eventList": [
        {
            "id": "6e91d64a-435e-40bf-99b8-ef277e16eac9",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "0e6e2d46-3a38-4d07-807e-b6341821fb00"
        },
        {
            "id": "f13616e1-3efe-ae63-4433-bdf1f12a401a",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 10,
            "eventtype": 7,
            "m_owner": "0e6e2d46-3a38-4d07-807e-b6341821fb00"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "b73f0d87-8b5e-434b-9e80-41904dcc65d2",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "\"\"",
            "varName": "name",
            "varType": 2
        },
        {
            "id": "6ae0cd6d-7b9d-4416-ae34-846e32524e4f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "\"\"",
            "varName": "desc",
            "varType": 2
        },
        {
            "id": "1e4f088e-f32f-4849-9d12-55153dc82e93",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "\"\"",
            "varName": "cName",
            "varType": 2
        },
        {
            "id": "dfcf1627-507f-4f3f-8896-3a2c1fc28ac9",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_grid_create(4,3)",
            "varName": "grd_skills",
            "varType": 4
        },
        {
            "id": "198e1986-2302-408c-8b9e-aa92819eb3f7",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_grid_create(4,3)",
            "varName": "grd_skillName",
            "varType": 4
        },
        {
            "id": "069e546e-fdeb-4de1-9930-d93cfe2c7720",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_grid_create(4,3)",
            "varName": "grd_skillDesc",
            "varType": 4
        },
        {
            "id": "22767ac0-326f-4bdd-87db-508a0dc65a5e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_grid_create(4,3)",
            "varName": "grd_skillTooltip",
            "varType": 4
        },
        {
            "id": "d1038701-f98a-45fc-893f-50c3017be440",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_grid_create(4,3)",
            "varName": "grd_skillRate",
            "varType": 4
        },
        {
            "id": "85e8d49c-a666-40ac-b2ee-1fe9e23b089f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_grid_create(4,3)",
            "varName": "grd_skillAct",
            "varType": 4
        },
        {
            "id": "80b3870f-1969-46a6-9d93-ccf60c4948cd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "src",
            "varType": 4
        },
        {
            "id": "238df9fa-1528-415e-b634-fe6ba1f0d204",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "\"\"",
            "varName": "cEvent",
            "varType": 2
        },
        {
            "id": "96356032-ec3a-49a0-ac58-823bf1ace40e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "ds_list_create()",
            "varName": "cArgs",
            "varType": 4
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": true
}
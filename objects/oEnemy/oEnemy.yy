{
  "spriteId": {
    "name": "sEnemy",
    "path": "sprites/sEnemy/sEnemy.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": {
    "name": "sEnemy",
    "path": "sprites/sEnemy/sEnemy.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "pShootable",
    "path": "objects/pShootable/pShootable.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":1,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":0,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"vsp","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0.3","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"grv","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"3.5","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"walksp","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"walksp","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"hsp","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"hitfrom","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"size","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"sEnemy","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[
        "GMSprite",
      ],"resourceVersion":"1.0","name":"sStanding","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"sEnemyR","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[
        "GMSprite",
      ],"resourceVersion":"1.0","name":"sRunning","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"sEnemyA","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[
        "GMSprite",
      ],"resourceVersion":"1.0","name":"sAirborne","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":3,"value":"True","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"afraidofheights","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":3,"value":"False","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"grounded","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":3,"value":"False","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"hasweapon","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"facingx","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"facingy","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy",
  },
  "resourceVersion": "1.0",
  "name": "oEnemy",
  "tags": [],
  "resourceType": "GMObject",
}
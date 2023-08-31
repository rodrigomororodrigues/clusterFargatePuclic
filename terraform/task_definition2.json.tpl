[
   {
      "essential": true,
      "name":"morofargate-app-web",
      "image":"191819532958.dkr.ecr.us-east-2.amazonaws.com/web:latest", 
      "portMappings":[
         {
            "containerPort":80,
            "hostPort":80,
            "protocol":"tcp"
         }
      ],
      "logConfiguration": { 
         "logDriver": "awslogs",
          "options": { 
            "awslogs-group": "${CLOUDWATCH_WEB_GROUP}",
            "awslogs-region": "${REGION}", 
            "awslogs-stream-prefix": "ecs" 
          }
        },
      "environment":[
      
         {
            "name":"morofargate_app_home",
            "value":"/opt/app/"  
         },
         {
            "name":"APP_WEB_PORT",
            "value":"80" 
         }
      
      ]
   }
]
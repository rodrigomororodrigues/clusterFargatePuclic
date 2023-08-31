[
   {
      "essential": true,
      "name":"morofargate-app-api",
      "image":"191819532958.dkr.ecr.us-east-2.amazonaws.com/api:latest", 
      "portMappings":[
         {
            "containerPort":3001,
            "hostPort":3001,
            "protocol":"tcp"
         }
      ],
      "logConfiguration": { 
          "logDriver": "awslogs",  
          "options": { 
            "awslogs-group": "${CLOUDWATCH_GROUP}",
            "awslogs-region": "${REGION}", 
            "awslogs-stream-prefix": "ecs" 
          }
        },
      "environment":[
         {
            "name":"POSTGRES_USER",
            "value":"${POSTGRES_USERNAME}"
         },
         {
            "name":"POSTGRES_PASSWORD",
            "value":"${POSTGRES_PASSWD}"
         },
         {
            "name":"POSTGRES_ENDPOINT",
            "value":"${POSTGRES_ENDPOINT}"
         },
         {
            "name":"POSTGRES_DATABASE",
            "value":"${POSTGRES_DATABASE}"
         },
         {
            "name":"morofargate_APP",
            "value":"api"
         },
         {
            "name":"morofargate_env",
            "value":"dev"
         },
         {
            "name":"APP_HOME",
            "value":"/opt/app/"
         },
         {
            "name":"APP_PORT",
            "value":"3001"
         },
         {
            "name":"APP_SECRET_KEY",
            "value":"${APP_SECRET_KEY}"
         }
      ]
   }
]
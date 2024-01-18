import { Application } from 'express'

import swaggerJSDoc from "swagger-jsdoc"
import swaggerUi from "swagger-ui-express"

export default function (app: Application) {
    //Swagger Configuration
  
    const options = {
      definition: {
        openapi: "3.1.0",
        info: {
          title: "ZSSN Swagger",
          version: "1.0.0",
          description: "Swagger documentation of ZSSN project",
        },
        servers: [
          {
            url: "http://localhost:3000"
          }
        ],
      },
      apis: [
        "./src/routes/*.ts",
        "./src/routes.ts",
      ]
    };

    const swaggerSpec = swaggerJSDoc(options);
  
    app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec, {
      swaggerOptions: {
        docExpansion: "none"
      }
    }));
  };
  
  
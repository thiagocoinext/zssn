
import dotenv from 'dotenv';
import express, { Application } from 'express';

import routes from './src/routes';
import swagger from './swagger';

//For env File 
dotenv.config();

const app: Application = express();
const port = process.env.PORT || 8000;

app.use(routes)

swagger(app)

app.listen(port, () => {
  console.log(`Server is Fire at http://localhost:${port}`);
});

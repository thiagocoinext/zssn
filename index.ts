
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import express, { Application, Request, Response } from 'express';

import swagger from './swagger';
import userRouter from './src/routes/user';
// import { pool } from './src/database';

//For env File 
dotenv.config();

const app: Application = express();
const port = process.env.PORT || 8000;

export const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_NAME,
  password: process.env.DB_PASS,
  waitForConnections: true,
  connectionLimit: 10,
  maxIdle: 10, // max idle connections, the default value is the same as `connectionLimit`
  idleTimeout: 60000, // idle connections timeout, in milliseconds, the default value 60000
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
});

app.get('/test-connection', async (req: Request, res: Response) => {
  try {
    const connection = await pool.getConnection();
    connection.release();
    res.status(200).json({ message: 'Database connection successful' });
  } catch (error) {
    console.error('Error connecting to database:', error);
    res.status(500).json({ message: 'Failed to connect to database' });
  }
});

app.use(express.json())

app.use(userRouter)

swagger(app)

app.listen(port, () => {
  console.log(`Server is Fire at http://localhost:${port}`);
});

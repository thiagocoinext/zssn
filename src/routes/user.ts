import express from 'express';
import { addUser } from '../controllers/user';

const userRouter = express.Router();

/**
 * @swagger
 * /user:
 *  post:
 *    summary: Add an User
 *    tags:
 *      - User
 *    requestBody:
 *      required: true
 *      content:
 *        application/json:
 *          schema:
 *            type: object
 *            properties:
 *              name:
 *                type: string
 *              gender:
 *                type: string
 *              age:
 *                type: number
 *              lat:
 *                type: number
 *              long:
 *                type: number
 *            required:
 *              - name
 *              - gender
 *              - age
 *              - lat
 *              - long
 *            example:
 *              name: Thiago
 *              gender: M
 *              age: 25
 *              lat: 123456
 *              long: 123456
 *    responses:
 *      "204":
 *        description: No Content
 */
userRouter.post('/user', addUser);

export default userRouter;

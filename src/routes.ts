import { Router } from "express";

const router = Router()


/**
 * @swagger
 * /:
 *  get:
 *    summary: Hello World
 *    tags:
 *      - Admin
 *    responses:
 *      '200':
 *        description: Hello World.
 *        content:
 *          application/json:
 *            schema:
 *              text: string
 */
router.get('/', (req, res) => {
    res.json({ text: 'Hello World' })
})

export default router
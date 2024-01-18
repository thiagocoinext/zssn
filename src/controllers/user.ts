import { Request, Response } from 'express';
import { User } from "../domain/User";
import { addUserDb } from '../models/user';

export const addUser = (req: Request, res: Response) => {
    if (req.body.name === undefined) return res.status(400).json({ error: 'Invalid body' });
    if (req.body === undefined) return res.status(400).json({ error: 'Invalid body' });

    const { name, age, gender, lat, long } = req.body as User;

    const newUser: User = {
        name,
        age,
        gender,
        lat,
        long,
    };

    addUserDb(newUser)
        .then(() => {
            res.status(201).json({ message: 'User added successfully' });
        })
        .catch((error) => {
            res.status(500).json({ error: 'Failed to add user' });
        });
}
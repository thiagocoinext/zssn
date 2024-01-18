import { pool } from '../..';
import { User } from '../domain/User';

export const addUserDb = async (user: User): Promise<boolean> => {
    return pool.query('INSERT INTO user SET ?', user)
        .then(() => true)
        .catch(() => { throw new Error("Error to add User") });
}

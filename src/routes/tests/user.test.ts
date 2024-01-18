import app from '../../..';
import request from 'supertest';

describe('User Controller', () => {
    describe('POST /user', () => {
        it('should add a new user', async () => {
            const userData = {
                name: 'Thiago',
                gender: 'M',
                age: 25,
                lat: 123456,
                long: 123456,
            };

            const response = await request(app)
                .post('/user')
                .send(userData);

            expect(response.status).toBe(201);
        });
    });
});

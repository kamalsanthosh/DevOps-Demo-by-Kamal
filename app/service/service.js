const express = require('express');
const { Pool } = require('pg');


const app = express();
const port = process.env.PORT || 3000;


const connectionString = process.env.DATABASE_URL || 'postgres://dev:dev@localhost:5432/demo';
const pool = new Pool({ connectionString });


app.get('/', async (req, res) => {
try {
const result = await pool.query('SELECT NOW() AS now');
res.json({ message: 'Hello from DevOps demo', time: result.rows[0].now });
} catch (e) {
res.status(500).json({ error: e.message });
}
});


app.listen(port, () => console.log(`Server listening on ${port}`));

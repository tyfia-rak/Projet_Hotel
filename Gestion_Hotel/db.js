const { Pool } = require("pg");

// Configuration du pool de connexions
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Hotel',
  password: 'root',
  port: 5432,
});

module.exports= pool;
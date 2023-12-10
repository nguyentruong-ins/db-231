import mssql from 'mssql';

const config = {
    server: "localhost",
    user: "sa",
    password: "yourStrong(!)Password",
    database: "master",
    options: {
        trustServerCertificate: true
    }
};

const pool = new mssql.ConnectionPool(config);
const poolConnect = pool.connect();

poolConnect.then(() => {
    console.log('Connected to the database');
}).catch((error) => {
    console.error('Database connection error:', error);
});

export default pool;
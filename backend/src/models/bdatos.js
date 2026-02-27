import mysql from "mysql2";


import dotenv from "dotenv";
dotenv.config();

let cnx;

try {
cnx = mysql.createPool({
    host: process.env.HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_BASE,
    port: process.env.DB_PORT,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});
console.log("conexion exitosa");
} catch (error) {
console.log(`ha occurriod un error: ${error.message}`);
}

export { cnx };

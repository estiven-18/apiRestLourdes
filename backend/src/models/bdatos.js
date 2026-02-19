import mysql from "mysql2";

let cnx;

try {
cnx = mysql.createPool({
    host: "localhost",
    user: "root",
    database: "lourdes",
    port: "3306",
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});
console.log("conexion exitosa");
} catch (error) {
console.log(`ha occurriod un error: ${error.message}`);
}

export { cnx };

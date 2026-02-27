import { cnx } from "./bdatos.js";

//* ya esta hecha con la nueva base de datos "estado"
const db = cnx.promise();

export const pacienteModel = {
  findAll: async () => {
    const sql = "SELECT * FROM pacientes WHERE estado=1";
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = "SELECT * FROM pacientes WHERE id_pacientes=? AND estado=1";
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO pacientes SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "UPDATE pacientes SET estado=2 WHERE id_pacientes=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE pacientes SET ? WHERE id_pacientes=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

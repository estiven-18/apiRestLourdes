import { cnx } from "./bdatos.js";

const db = cnx.promise();

export const pacienteModel = {
  findAll: async () => {
    const sql = "SELECT * FROM pacientes";
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = "SELECT * FROM pacientes WHERE id_pacientes=?";
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO pacientes SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "DELETE FROM pacientes WHERE id_pacientes=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE pacientes SET ? WHERE id_pacientes=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

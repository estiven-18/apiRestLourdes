import { cnx } from "./bdatos.js";

const db = cnx.promise();

export const medicamentoModel = {
  findAll: async () => {
    const sql = "SELECT * FROM medicamentos";
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = "SELECT * FROM medicamentos WHERE id_medicamentos=?";
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO medicamentos SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "DELETE FROM medicamentos WHERE id_medicamentos=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE medicamentos SET ? WHERE id_medicamentos=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

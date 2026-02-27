import { cnx } from "./bdatos.js";

//* ya esta hecha con la nueva base de datos "estado"
const db = cnx.promise();

export const usuarioModel = {
  findAll: async () => {
    const sql = "SELECT * FROM usuarios WHERE estado=1";
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = "SELECT * FROM usuarios WHERE id_usuarios=? AND estado=1";
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO usuarios SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "UPDATE usuarios SET estado=2 WHERE id_usuarios=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE usuarios SET ? WHERE id_usuarios=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

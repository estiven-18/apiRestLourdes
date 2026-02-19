import { cnx } from "./bdatos.js";

const db = cnx.promise();

export const medicoModel = {
  findAll: async () => {
    const sql = `
      SELECT 
        medicos.id_medicos,
        medicos.especialidad,
        usuarios.id_usuarios,
        usuarios.nombre,
        usuarios.documento,
        usuarios.telefono,
        usuarios.contraseña,
        usuarios.rol
      FROM medicos medicos
      JOIN usuarios usuarios ON medicos.usuarios_id_usuarios = usuarios.id_usuarios
    `;
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = `
      SELECT 
        medicos.id_medicos,
        medicos.especialidad,
        usuarios.id_usuarios,
        usuarios.nombre,
        usuarios.documento,
        usuarios.telefono,
        usuarios.contraseña,
        usuarios.rol
      FROM medicos medicos
      JOIN usuarios usuarios ON medicos.usuarios_id_usuarios = usuarios.id_usuarios
      WHERE usuarios.id_usuarios = ?
    `;
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO medicos SET ?";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id) => {
    const sql = "DELETE FROM medicos WHERE id_medicos=?";
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  update: async (id, data) => {
    const sql = "UPDATE medicos SET ? WHERE id_medicos=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  },
};

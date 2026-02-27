import { cnx } from "./bdatos.js";

//* ya esta hecha con la nueva base de datos "estado"

const db = cnx.promise();

export const horarioModel = {
  findAll: async () => {
            const sql = `SELECT 
            horarios_medicos.id_horarios_medicos, 
            horarios_medicos.dia_semana, 
            horarios_medicos.hora_inicio, 
            horarios_medicos.hora_fin, 
            usuarios.id_usuarios as id_usuario,
            medicos.id_medicos as id_medico,
            usuarios.nombre AS nombre_medico,
            usuarios.estado AS estado_usuario,
            medicos.estado AS estado_medico
            FROM horarios_medicos 
            JOIN medicos ON horarios_medicos.medicos_id_medicos = medicos.id_medicos 
            JOIN usuarios ON medicos.usuarios_id_usuarios= usuarios.id_usuarios
            WHERE horarios_medicos.estado=1;`;
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = `SELECT 
        horarios_medicos.id_horarios_medicos, 
        horarios_medicos.dia_semana, 
        horarios_medicos.hora_inicio, 
        horarios_medicos.hora_fin, 
        usuarios.id_usuarios as id_usuario,
        medicos.id_medicos as id_medico,
        usuarios.nombre AS nombre_medico,
        usuarios.estado AS estado_usuario,
        medicos.estado AS estado_medico 
        FROM horarios_medicos 
        JOIN medicos ON horarios_medicos.medicos_id_medicos = medicos.id_medicos 
        JOIN usuarios ON medicos.usuarios_id_usuarios= usuarios.id_usuarios 
        WHERE usuarios.id_usuarios = ? AND horarios_medicos.estado=1`;
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO horarios_medicos SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "UPDATE horarios_medicos SET estado=2 WHERE id_horarios_medicos=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE horarios_medicos SET ? WHERE id_horarios_medicos=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

import { cnx } from "./bdatos.js";

const db = cnx.promise();

export const citasModel = {
  findAll: async () => {
    const sql = `SELECT
    citas.id_citas,
    citas.fecha_cita,
    citas.hora_inicio,
    citas.hora_fin,
    citas.motivo,
    citas.observaciones,
    citas.fecha_creacion,
    usuarios.nombre AS nombre_medico,
    pacientes.nombre AS nombre_paciente
    FROM citas
    JOIN medicos ON citas.medicos_id_medicos = medicos.id_medicos
    JOIN usuarios ON medicos.usuarios_id_usuarios = usuarios.id_usuarios
    JOIN pacientes ON citas.pacientes_id_pacientes = pacientes.id_pacientes`;
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = `SELECT
    citas.id_citas,
    citas.fecha_cita,
    citas.hora_inicio,
    citas.hora_fin,
    citas.motivo,
    citas.observaciones,
    citas.fecha_creacion,
    usuarios.nombre AS nombre_medico,
    pacientes.nombre AS nombre_paciente
    FROM citas
    JOIN medicos ON citas.medicos_id_medicos = medicos.id_medicos
    JOIN usuarios ON medicos.usuarios_id_usuarios = usuarios.id_usuarios
    JOIN pacientes ON citas.pacientes_id_pacientes = pacientes.id_pacientes
    WHERE citas.id_citas = ?`;
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO citas SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "DELETE FROM citas WHERE id_citas=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE citas SET ? WHERE id_citas=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

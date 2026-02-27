import { cnx } from "./bdatos.js";

//* ya esta hecha con la nueva base de datos "estado"
const db = cnx.promise();

export const historiaClinicaModelo = {
  findAll: async () => {
    const sql = `SELECT
    historias_clinicas.id_historias_clinicas,
    citas.id_citas as id_cita,
    pacientes.id_pacientes as id_paciente,
    historias_clinicas.fecha_atencion,
    historias_clinicas.sintomas,
    historias_clinicas.observaciones, 
    pacientes.nombre AS nombre_paciente,
    pacientes.estado AS estado_paciente,
    citas.estado AS estado_cita
    FROM historias_clinicas 
    JOIN citas ON historias_clinicas.citas_id_citas = citas.id_citas 
    JOIN pacientes ON citas.pacientes_id_pacientes = pacientes.id_pacientes
    WHERE historias_clinicas.estado=1`;
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = `SELECT
    historias_clinicas.id_historias_clinicas,
    citas.id_citas as id_cita,
    pacientes.id_pacientes as id_paciente,
    historias_clinicas.fecha_atencion,
    historias_clinicas.sintomas,
    historias_clinicas.observaciones, 
    pacientes.nombre AS nombre_paciente,
    pacientes.estado AS estado_paciente,
    citas.estado AS estado_cita
    FROM historias_clinicas 
    JOIN citas ON historias_clinicas.citas_id_citas = citas.id_citas 
    JOIN pacientes ON citas.pacientes_id_pacientes = pacientes.id_pacientes 
     WHERE historias_clinicas.id_historias_clinicas = ? AND historias_clinicas.estado=1`;
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO historias_clinicas SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "UPDATE historias_clinicas SET estado=2 WHERE id_historias_clinicas=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE historias_clinicas SET ? WHERE id_historias_clinicas=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

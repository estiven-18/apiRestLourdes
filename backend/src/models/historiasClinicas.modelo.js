import { cnx } from "./bdatos.js";

const db = cnx.promise();

export const historiaClinicaModelo = {
  findAll: async () => {
    const sql = `SELECT
    historias_clinicas.id_historias_clinicas,
    historias_clinicas.fecha_atencion,
    historias_clinicas.sintomas,
    historias_clinicas.observaciones, 
    pacientes.nombre AS nombre_paciente 
    FROM historias_clinicas 
    JOIN citas ON historias_clinicas.citas_id_citas = citas.id_citas 
    JOIN pacientes ON citas.pacientes_id_pacientes = pacientes.id_pacientes`;
    const [rows] = await db.query(sql);
    return rows;
  },

  findById: async (id) => {
    const sql = `SELECT
    historias_clinicas.id_historias_clinicas,
    historias_clinicas.fecha_atencion,
    historias_clinicas.sintomas,
    historias_clinicas.observaciones, 
    pacientes.nombre AS nombre_paciente 
    FROM historias_clinicas 
    JOIN citas ON historias_clinicas.citas_id_citas = citas.id_citas 
    JOIN pacientes ON citas.pacientes_id_pacientes = pacientes.id_pacientes 
    WHERE id_pacientes = ?`;
    const [rows] = await db.query(sql, [id]);
    return rows;
  },

  create: async (data) => {
    const sql = "INSERT INTO historias_clinicas SET ? ";
    const [rows] = await db.query(sql, [data]);
    return rows;
  },

  delete: async (id)=>{
    const sql= "DELETE FROM historias_clinicas WHERE id_historias_clinicas=?";
    const [rows] =await db.query(sql,[id]);
    return rows;
  },

  update:async (id,data)=>{
    const sql = "UPDATE historias_clinicas SET ? WHERE id_historias_clinicas=?";
    const [rows] = await db.query(sql, [data, id]);
    return rows;
  }
};

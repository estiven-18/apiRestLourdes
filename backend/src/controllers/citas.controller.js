import { citasModel } from "../models/citas.modelo.js";

export const getCitas = async (req, res) => {
  try {
    const result = await citasModel.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar las citas: "+error.message,
    });
  }
};

export const getCitaById = async (req, res) => {
  try {
    const result = await citasModel.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar la cita: "+error.message,
    });
  }
};

export const createCita = async (req, res) => {
  const data = {
    fecha_cita: req.body.fecha_cita,
    hora_inicio: req.body.hora_inicio,
    hora_fin: req.body.hora_fin,
    motivo: req.body.motivo,
    observaciones: req.body.observaciones,
    fecha_creacion: req.body.fecha_creacion,
    medicos_id_medicos: req.body.medicos_id_medicos,
    pacientes_id_pacientes: req.body.pacientes_id_pacientes,
    creado_por: req.body.creado_por,
  };
  try {
    const result = await citasModel.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear la cita: "+error.message,
    });
  }
};

export const deleteCita = async (req, res) => {
  try {
    const result = await citasModel.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar la cita: "+error.message,
    });
  }
};

export const updateCita = async (req, res) => {
    const data = {
    fecha_cita: req.body.fecha_cita,
    hora_inicio: req.body.hora_inicio,
    hora_fin: req.body.hora_fin,
    motivo: req.body.motivo,
    observaciones: req.body.observaciones,
    fecha_creacion: req.body.fecha_creacion,
    medicos_id_medicos: req.body.medicos_id_medicos,
    pacientes_id_pacientes: req.body.pacientes_id_pacientes,
    creado_por: req.body.creado_por,
  };
  
  
  
  try {
    const result = await citasModel.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar la cita: "+error.message,
    });
  }
};
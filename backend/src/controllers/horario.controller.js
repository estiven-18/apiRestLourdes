import { horarioModel } from "../models/horarios.modelo.js";

export const getHorarios = async (req, res) => {
  try {
    const result = await horarioModel.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar los horarios: "+error.message,
    });
  }
};

export const getHorarioById = async (req, res) => {
  try {
    const result = await horarioModel.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar el horario: "+error.message,
    });
  }
};

export const createHorario = async (req, res) => {
  const data = {
    dia_semana: req.body.dia_semana,
    hora_inicio: req.body.hora_inicio,
    hora_fin: req.body.hora_fin,
    medicos_id_medicos: req.body.medicos_id_medicos
  };
  try {
    const result = await horarioModel.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear el horario: "+error.message,
    });
  }
};

export const deleteHorario = async (req, res) => {
  try {
    const result = await horarioModel.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar el horario: "+error.message,
    });
  }
};

export const updateHorario = async (req, res) => {
  const data = {
    dia_semana: req.body.dia_semana,
    hora_inicio: req.body.hora_inicio,
    hora_fin: req.body.hora_fin,
    medicos_id_medicos: req.body.medicos_id_medicos
  };
  
  
  
  try {
    const result = await horarioModel.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar el horario: "+error.message,
    });
  }
};
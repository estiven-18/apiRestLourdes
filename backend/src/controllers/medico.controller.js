import { medicoModel } from "../models/medico.modelo.js";

export const getMedicos = async (req, res) => {
  try {
    const result = await medicoModel.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar los medicos: "+error.message,
    });
  }
};

export const getMedicoById = async (req, res) => {
  try {
    const result = await medicoModel.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar el medico: "+error.message,
    });
  }
};

export const createMedico = async (req, res) => {
  const data = {
    usuarios_id_usuarios: req.body.usuarios_id_usuarios,
    especialidad: req.body.especialidad
  };
  try {
    const result = await medicoModel.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear el medico: "+error.message,
    });
  }
};

export const deleteMedico = async (req, res) => {
  try {
    const result = await medicoModel.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar el medico: "+error.message,
    });
  }
};

export const updateMedico = async (req, res) => {
  const data = {
    usuarios_id_usuarios: req.body.usuarios_id_usuarios,
    especialidad: req.body.especialidad
  };
  try {
    const result = await medicoModel.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar el medico: "+error.message,
    });
  }
};
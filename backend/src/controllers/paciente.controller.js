import { pacienteModel } from "../models/pacientes.modelo.js";

export const getPacientes = async (req, res) => {
  try {
    const result = await pacienteModel.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar los pacientes: "+error.message,
    });
  }
};

export const getPacienteById = async (req, res) => {
  try {
    const result = await pacienteModel.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar el paciente: "+error.message,
    });
  }
};

export const createPaciente = async (req, res) => {
  const data = {
    documento: req.body.documento,
    nombre: req.body.nombre,
    genero: req.body.genero,
    telefono: req.body.telefono,
    email: req.body.email,
    eps: req.body.eps,
    tipo_ingreso: req.body.tipo_ingreso,
  };
  try {
    const result = await pacienteModel.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear el paciente: "+error.message,
    });
  }
};

export const deletePaciente = async (req, res) => {
  try {
    const result = await pacienteModel.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar el paciente: "+error.message,
    });
  }
};

export const updatePaciente = async (req, res) => {
  const data = {
    documento: req.body.documento,
    nombre: req.body.nombre,
    genero: req.body.genero,
    telefono: req.body.telefono,
    email: req.body.email,
    eps: req.body.eps,
    tipo_ingreso: req.body.tipo_ingreso,
  };
  try {
    const result = await pacienteModel.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar el paciente: "+error.message,
    });
  }
};
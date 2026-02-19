import { historiaClinicaModelo } from "../models/historiasClinicas.modelo.js";

export const getHistoriasClinicas = async (req, res) => {
  try {
    const result = await historiaClinicaModelo.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar las historias clínicas: "+error.message,
    });
  }
};

export const getHistoriaClinicaById = async (req, res) => {
  try {
    const result = await historiaClinicaModelo.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar la historia clínica: "+error.message,
    });
  }
};

export const createHistoriaClinica = async (req, res) => {
  const data = {
    fecha_atencion: req.body.fecha_atencion,
    sintomas: req.body.sintomas,
    observaciones: req.body.observaciones,
    citas_id_citas: req.body.citas_id_citas,
  };
  try {
    const result = await historiaClinicaModelo.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear la historia clínica: "+error.message,
    });
  }
};

export const deleteHistoriaClinica = async (req, res) => {
  try {
    const result = await historiaClinicaModelo.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar la historia clínica: "+error.message,
    });
  }
};

export const updateHistoriaClinica = async (req, res) => {
  const data = {
    fecha_atencion: req.body.fecha_atencion,
    sintomas: req.body.sintomas,
    observaciones: req.body.observaciones,
    citas_id_citas: req.body.citas_id_citas,
  };
  
  
  
  try {
    const result = await historiaClinicaModelo.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar la historia clínica: "+error.message,
    });
  }
};
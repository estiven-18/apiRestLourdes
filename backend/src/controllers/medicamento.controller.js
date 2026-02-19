import { medicamentoModel } from "../models/medicamentos.modelo.js";

export const getMedicamentos = async (req, res) => {
  try {
    const result = await medicamentoModel.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar los medicamentos: "+error.message,
    });
  }
};

export const getMedicamentoById = async (req, res) => {
  try {
    const result = await medicamentoModel.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar el medicamento: "+error.message,
    });
  }
};

export const createMedicamento = async (req, res) => {
  const data = {
    nombre: req.body.nombre,
    laboratorio: req.body.laboratorio,
    stock: req.body.stock,
    precio: req.body.precio,
    fecha_vencimiento: req.body.fecha_vencimiento,
  };
  try {
    const result = await medicamentoModel.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear el medicamento: "+error.message,
    });
  }
};

export const deleteMedicamento = async (req, res) => {
  try {
    const result = await medicamentoModel.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar el medicamento: "+error.message,
    });
  }
};

export const updateMedicamento = async (req, res) => {
  const data = {
    nombre: req.body.nombre,
    laboratorio: req.body.laboratorio,
    stock: req.body.stock,
    precio: req.body.precio,
    fecha_vencimiento: req.body.fecha_vencimiento,
  };
  
  
  
  try {
    const result = await medicamentoModel.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar el medicamento: "+error.message,
    });
  }
};
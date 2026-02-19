import { usuarioModel } from "../models/usuario.modelo.js";

export const getUsuarios = async (req, res) => {
  try {
    const result = await usuarioModel.findAll();
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar los usuarios: "+error,
    });
  }
};

export const getUsuarioById = async (req, res) => {
  try {
    const result = await usuarioModel.findById(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al listar el usuario: "+error,
    });
  }
};

export const createUsuario = async (req, res) => {
  const data = {
    nombre: req.body.nombre,
    documento: req.body.documento,
    telefono: req.body.telefono,
    contraseña: req.body.contraseña,
    rol: req.body.rol,
  };
  try {
    const result = await usuarioModel.create(data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al crear el usuario: "+error,
    });
  }
};

export const deleteUsuario = async (req, res) => {
  //codigo protegido con try -  catch
  try {
    const result = await usuarioModel.delete(req.params.id);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al borrar el usuario: "+error,
    });
  }
};

export const updateUsuario = async (req, res) => {
  //codigo protegido con try -  catch
  const data = {
    nombre: req.body.nombre,
    documento: req.body.documento,
    telefono: req.body.telefono,
    contraseña: req.body.contraseña,
    rol: req.body.rol,
  };
  try {
    const result = await usuarioModel.update(req.params.id, data);
    res.json({ result });
  } catch (error) {
    res.status(500).json({
      error: "error al editar el usuario: "+error,
    });
  }
};
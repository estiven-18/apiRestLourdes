import { Router } from "express";

import * as usuarioCtr from '../controllers/usuario.controller.js'

const router = Router();

router.get("/usuario/listartodos",usuarioCtr.getUsuarios);
router.get("/usuario/listarporid/:id",usuarioCtr.getUsuarioById);
router.post("/usuario/crearUsuario",usuarioCtr.createUsuario);
router.delete("/usuario/borrar/:id",usuarioCtr.deleteUsuario);
router.put("/usuario/editar/:id",usuarioCtr.updateUsuario);

export default router;
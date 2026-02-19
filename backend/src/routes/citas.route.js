import { Router } from "express";

import * as citasCtr from '../controllers/citas.controller.js'

const router = Router();

router.get("/cita/listartodos", citasCtr.getCitas);
router.get("/cita/listarporid/:id", citasCtr.getCitaById);
router.post("/cita/crearCita", citasCtr.createCita);
router.delete("/cita/borrar/:id", citasCtr.deleteCita);
router.put("/cita/editar/:id", citasCtr.updateCita);

export default router;
import { Router } from "express";

import * as historiaClinicaCtr from '../controllers/historiaClinica.controller.js'

const router = Router();

router.get("/historiaclinica/listartodos", historiaClinicaCtr.getHistoriasClinicas);
router.get("/historiaclinica/listarporid/:id", historiaClinicaCtr.getHistoriaClinicaById);
router.post("/historiaclinica/crearHistoriaClinica", historiaClinicaCtr.createHistoriaClinica);
router.delete("/historiaclinica/borrar/:id", historiaClinicaCtr.deleteHistoriaClinica);
router.put("/historiaclinica/editar/:id", historiaClinicaCtr.updateHistoriaClinica);

export default router;
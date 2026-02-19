import { Router } from "express";

import * as medicoCtr from '../controllers/medico.controller.js'

const router = Router();

router.get("/medico/listartodos",medicoCtr.getMedicos);
router.get("/medico/listarporid/:id",medicoCtr.getMedicoById);
router.post("/medico/crearPaciente",medicoCtr.createMedico);
router.delete("/medico/borrar/:id",medicoCtr.deleteMedico);
router.put("/medico/editar/:id",medicoCtr.updateMedico);

export default router;
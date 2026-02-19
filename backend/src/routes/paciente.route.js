import { Router } from "express";

import * as pacienteCtr from '../controllers/paciente.controller.js'

const router = Router();

router.get("/paciente/listartodos",pacienteCtr.getPacientes);
router.get("/paciente/listarporid/:id",pacienteCtr.getPacienteById);
router.post("/paciente/crearPaciente",pacienteCtr.createPaciente);
router.delete("/paciente/borrar/:id",pacienteCtr.deletePaciente);
router.put("/paciente/editar/:id",pacienteCtr.updatePaciente);

export default router;
import { Router } from "express";

import * as horarioCtr from '../controllers/horario.controller.js'

const router = Router();

router.get("/horario/listartodos", horarioCtr.getHorarios);
router.get("/horario/listarporid/:id", horarioCtr.getHorarioById);
router.post("/horario/crearHorario", horarioCtr.createHorario);
router.delete("/horario/borrar/:id", horarioCtr.deleteHorario);
router.put("/horario/editar/:id", horarioCtr.updateHorario);

export default router;
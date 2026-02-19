import { Router } from "express";

import * as medicamentoCtr from '../controllers/medicamento.controller.js'

const router = Router();

router.get("/medicamento/listartodos", medicamentoCtr.getMedicamentos);
router.get("/medicamento/listarporid/:id", medicamentoCtr.getMedicamentoById);
router.post("/medicamento/crearMedicamento", medicamentoCtr.createMedicamento);
router.delete("/medicamento/borrar/:id", medicamentoCtr.deleteMedicamento);
router.put("/medicamento/editar/:id", medicamentoCtr.updateMedicamento);

export default router;
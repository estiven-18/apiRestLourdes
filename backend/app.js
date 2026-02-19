import express from "express";
import cors from "cors";
import usuarioRutas from './src/routes/usuario.route.js'
import pacienteRutas from './src/routes/paciente.route.js'
import medicoRutas from './src/routes/medico.route.js'
import medicamentoRutas from './src/routes/medicamento.routes.js'
import citaRutas from './src/routes/citas.route.js'


const app = express();

app.use(express.json());

app.use(cors());

//todo pregunatr si poner las relaciones en la base de datos en cascade o no, para que al borrar un usuario se borre el medico o paciente relacionado, o si se borra un paciente se borre su historia clinica relacionada, etc.
app.use("/",usuarioRutas);
app.use("/",pacienteRutas);
app.use("/",medicoRutas);
app.use("/",medicamentoRutas);
app.use("/",citaRutas);




export default app;
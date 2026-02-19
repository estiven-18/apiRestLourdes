import app from "./app.js";

const PORT = 3000 || process.env.PORT

app.listen(PORT, () => {
  console.log(`sevidor corriendo en: ${PORT} `);
});





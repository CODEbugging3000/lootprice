import express, { Express } from "express";
import gameRoutes from "./routes/gameRoutes";

const app: Express = express();
app.use(express.json());

app.use("/api", gameRoutes);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

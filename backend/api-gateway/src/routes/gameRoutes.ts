import { Router } from "express";
import { getGames, createGame } from "../controllers/gameController";

const router: Router = Router();

router.get("/games", getGames);
router.post("/games", createGame);

export default router;

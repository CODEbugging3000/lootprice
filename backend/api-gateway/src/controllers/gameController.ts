import { Request, Response } from "express";
import { prisma } from "../prisma/client";

export async function getGames(req: Request, res: Response) {
  const games = await prisma.game.findMany();
  res.json(games);
}

export async function createGame(req: Request, res: Response) {
  const { title, price } = req.body;
  const game = await prisma.game.create({
    data: { title, price: parseFloat(price) },
  });
  res.status(201).json(game);
}

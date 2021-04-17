#!/usr/bin/python3
import pygame, os, sys
from pygame.locals import *
#from gpiozero import Button

def drawButtonState(surface, button, pos):
	color = 32
	if pygame.key.get_pressed()[button]:
		color = 192
	pygame.draw.circle(surface, (color, 0, 0), pos, 35)

def drawPlayerState(surface, buttons, startx):
	x = startx
	for b in buttons:
		drawButtonState(surface, b, (x, 240))
		x = x + 80

	return x

pygame.init()
fpsClock = pygame.time.Clock()
surface = pygame.display.set_mode((640, 480))

player1 = [pygame.K_a, pygame.K_s, pygame.K_d]
player2 = [pygame.K_j, pygame.K_k, pygame.K_l]

background = (0, 0, 0) #Black

while True:
	surface.fill(background)

	for event in pygame.event.get():
		if event.type == QUIT:
			pygame.quit()
			sys.exit()

	x = 80
	x = drawPlayerState(surface, player1, x)
	x = x + 80
	drawPlayerState(surface, player2, x)

	pygame.display.update()
	fpsClock.tick(30)
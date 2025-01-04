
# Introduction
Ce dépôt contient le résultat de notre travail sur le Kata Fix Pawn Moves (mohamed yassine aloui) ,Add pawn promotion (karim el jisr ) ,Refactor piece rendering
(tarik moulel ) pour le projet d’échecs Chess. 
L’objectif principal était de déboguer et tester les déplacements spécifiques des pions, 
y compris leur mouvement initial de deux cases, la capture en diagonale et la capture en passant.

# Installation
Le code est testé sous Pharo 12. Pour l’installer :

```
Metacello new
	repository: 'github://UnivLille-Meta/Chess:main';
	baseline: 'MygChess';
	onConflictUseLoaded;
	load.
```
Utilisation
Pour lancer le jeu d’échecs :

```
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```
Une fenêtre s’ouvre alors, permettant d’interagir avec le plateau d’échecs.

#  Kata « Fix Pawn Moves » Mohamed Yassine Aloui
Objectif
Debugging & Testing : L’idée est de corriger et tester les fonctionnalités liées aux pions
 (mouvement d’une ou deux cases, capture diagonale, en passant, etc.).
Approche
Analyse & compréhension : J’ai d’abord exploré la structure du code (hiérarchie de classes, méthodes déjà existantes) 
à l’aide des outils vus en cours (par ex. commentaire de code, navigateurs de classes, etc.).
Découpage des fonctionnalités :
Déplacement en avant d’une case.
Déplacement de deux cases lorsqu’il s’agit du premier mouvement (test via isInitialPosition).
Capture en diagonale.
Gestion de la capture en passant.
Développement piloté par les tests : Pour chaque fonctionnalité, j’ai commencé par écrire ou ajuster les tests puis implémenter ou corriger le code correspondant.
Utilisation des outils :
XTDD (tests + debugger) pour itérer rapidement sur l’implémentation et la correction de bugs.
Transcript / Debugger pour analyser le déroulement des coups et déboguer la partie en passant.
Principales Méthodes (dans MyPawn et MyChessGame)
isInInitialPosition : Détermine si le pion est encore sur sa ligne de départ, pour permettre le double pas.
recordMovementOf: aPiece to: aSquare : Enregistre le mouvement dans l’historique, réinitialise l’en passant sur tous les autres pions (resetEnPassantFlags), 
puis vérifie si le pion vient de faire un double pas pour le marquer comme vulnérable à la capture en passant (canBeCapturedEnPassant: true).
moveTo: aSquare : Méthode qui effectue le déplacement effectif d’une pièce vers une case donnée (vider la case d’origine, positionner la pièce sur la case destination). Pour le pion, j’ai essayé de surcharger cette méthode afin de personnaliser la logique de l’en passant.
resetEnPassantFlags : Réinitialise l’indicateur canBeCapturedEnPassant sur tous les pions, afin de ne garder ce flag que pour le dernier pion ayant fait un double pas.
canBeCapturedEnPassant : Attribut / indicateur booléen utilisé pour marquer un pion qui vient de faire un double pas et qui peut donc être capturé en passant au coup suivant.
Avancée et Difficultés
targetsquarelegal :retourne une collection qui contienttous les square que la pion peut aller et/ou manger 
captureMoves :retourne une collection des square ou la pion peut manger 
canbeCaptureDiagonly :true si il y a une piece dans le diagonale  de couleur different (ca veut dire s'il peut manger dans le digonale)
une variable booléen pour chaque pion pour dire si elle peu etre capturé enPassant ou pas ,la valeur de cette variable est initialisé à faux ,et aprés attribué par la fonction 
recordMovementOf qui va attribué la valeur (true ou false) en calculatn si la pion est dans la position initial et a bouger de deux case alors true 

## Fonctionnalités implémentées et testées :
Mouvement d’une case en avant,
Mouvement initial de deux cases (avec test isInInitialPosition),
Capture en diagonale.
En passant :
J’ai tenté de garder la trace du dernier mouvement de pion (recordMovementOf:) et de surcharger moveTo: dans MyPawn pour gérer la capture en passant.
Problème : le retrait du pion adverse ne fonctionne pas encore correctement, et la capture en passant n’est pas finalisée.
Des essais avec l’héritage (pour spécialiser moveTo:) n’ont pas entièrement résolu la logique.
En résumé, toutes les fonctionnalités liées aux pions (hormis l’en passant) sont opérationnelles et testées.
 L’en passant reste partiellement implémenté et nécessite un débogage supplémentaire pour comprendre pourquoi je reussi pas à garder la dernier deplacement de pion dans la fonctionrecordmovementOf.
## test réalisé 
J’ai créé une classe MyPawnTest pour couvrir les principaux comportements du pion :

testCaptureDiagonly : vérifie qu’un pion peut bien capturer en diagonale.
testMoves et testfirsMoves : testent respectivement le déplacement standard d’une case et le double pas en début de partie.
testEnPassantMove : tente de s’assurer que la capture en passant fonctionne, mais le test est encore instable (jaune) car la fonctionnalité n’est pas finalisée.
# Conclusion
Grâce à ce kata, j’ai amélioré la couverture de tests pour les déplacements des pions et appliqué diverses techniques de débogage.
 Les fonctionnalités standard (déplacements avant, capture diagonale, double pas) sont abouties, tandis que l’en passant demeure à finaliser.

Merci de votre lecture. N’hésitez pas à consulter le code et les tests associés dans ce dépôt https://github.com/tarik-Moulouel/Chess-g06/tree/main. Toute contribution ou suggestion pour compléter l’en passant est la bienvenue !

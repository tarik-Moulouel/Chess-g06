
# Introduction
Ce dépôt contient le résultat de notre travail sur le Kata Fix Pawn Moves (mohamed yassine aloui) ,Add pawn promotion (karim el jisr ) ,Refactor piece rendering
(tarik moulel ) pour le projet d’échecs Chess. 
L’objectif principal était de déboguer et tester les déplacements spécifiques des pions, 
y compris leur mouvement initial de deux cases, la capture en diagonale et la capture en passant.

# Installation
Le code est testé sous Pharo 12. Pour l’installer :

```
Metacello new
	repository: 'github://tarik-Moulouel/Chess-g06:main';
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
 L’idée est de corriger et tester les fonctionnalités liées aux pions
 (mouvement d’une ou deux cases, capture diagonale, en passant, etc.).
Approche
Analyse & compréhension : J’ai d’abord exploré la structure du code (hiérarchie de classes, méthodes déjà existantes) 
à l’aide des outils vus en cours (par ex. commentaire de code, navigateurs de classes, etc.).
Découpage des fonctionnalités :
* Déplacement en avant d’une case.
* Déplacement de deux cases lorsqu’il s’agit du premier mouvement (test via isInitialPosition).
* Capture en diagonale.
* Gestion de la capture en passant.
Développement piloté par les tests : Pour chaque fonctionnalité, j’ai commencé par écrire ou ajuster les tests puis implémenter ou corriger le code correspondant.
Utilisation des outils :
* XTDD (tests + debugger) pour itérer rapidement sur l’implémentation et la correction de bugs.
* Transcript / Debugger pour analyser le déroulement des coups et déboguer la partie en passant.
Principales Méthodes (dans MyPawn et MyChessGame)
- isInInitialPosition : Détermine si le pion est encore sur sa ligne de départ, pour permettre le double pas.
- recordMovementOf: aPiece to: aSquare : Enregistre le mouvement dans l’historique, réinitialise l’en passant sur tous les autres pions (resetEnPassantFlags), 
puis vérifie si le pion vient de faire un double pas pour le marquer comme vulnérable à la capture en passant (canBeCapturedEnPassant: true).
- moveTo: aSquare : Méthode qui effectue le déplacement effectif d’une pièce vers une case donnée (vider la case d’origine, positionner la pièce sur la case destination). Pour le pion, j’ai essayé de surcharger cette méthode afin de personnaliser la logique de l’en passant.
- resetEnPassantFlags : Réinitialise l’indicateur canBeCapturedEnPassant sur tous les pions, afin de ne garder ce flag que pour le dernier pion ayant fait un double pas.
- canBeCapturedEnPassant : Attribut / indicateur booléen utilisé pour marquer un pion qui vient de faire un double pas et qui peut donc être capturé en passant au coup suivant.
Avancée et Difficultés
- targetsquarelegal :retourne une collection qui contienttous les square que la pion peut aller et/ou manger 
- captureMoves :retourne une collection des square ou la pion peut manger 
- canbeCaptureDiagonly :true si il y a une piece dans le diagonale  de couleur different (ca veut dire s'il peut manger dans le digonale)
- une variable booléen pour chaque pion pour dire si elle peu etre capturé enPassant ou pas ,la valeur de cette variable est initialisé à faux ,et aprés attribué par la fonction 
- recordMovementOf qui va attribué la valeur (true ou false) en calculatn si la pion est dans la position initial et a bouger de deux case alors true 

## Fonctionnalités implémentées et testées :
* Mouvement d’une case en avant,
* Mouvement initial de deux cases (avec test isInInitialPosition),
* Capture en diagonale.
En passant :
-J’ai tenté de garder la trace du dernier mouvement de pion (recordMovementOf:) et de surcharger moveTo: dans MyPawn pour gérer la capture en passant.
-Problème : le retrait du pion adverse ne fonctionne pas encore correctement, et la capture en passant n’est pas finalisée.
- Des essais avec l’héritage (pour spécialiser moveTo:) n’ont pas entièrement résolu la logique.
En résumé, toutes les fonctionnalités liées aux pions (hormis l’en passant) sont opérationnelles et testées.
 L’en passant reste partiellement implémenté et nécessite un débogage supplémentaire pour comprendre pourquoi je reussi pas à garder la dernier deplacement de pion dans la fonctionrecordmovementOf.
## test réalisé 
J’ai créé une classe MyPawnTest pour couvrir les principaux comportements du pion :

* testCaptureDiagonly : vérifie qu’un pion peut bien capturer en diagonale.
*testMoves et testfirsMoves : testent respectivement le déplacement standard d’une case et le double pas en début de partie.
*testEnPassantMove : tente de s’assurer que la capture en passant fonctionne, mais le test est encore instable (jaune) car la fonctionnalité n’est pas finalisée.
# Conclusion
Grâce à ce kata, j’ai amélioré la couverture de tests pour les déplacements des pions et appliqué diverses techniques de débogage.
 Les fonctionnalités standard (déplacements avant, capture diagonale, double pas) sont abouties, tandis que l’en passant demeure à finaliser.

Merci de votre lecture. N’hésitez pas à consulter le code et les tests associés dans ce dépôt https://github.com/tarik-Moulouel/Chess-g06/tree/main. Toute contribution ou suggestion pour compléter l’en passant est la bienvenue !


# Kata PawnPromotion (Karim EL JISR)

## Introduction
Dans le cadre de mon projet de jeu d’échecs développé en Pharo, j’ai choisi de travailler sur le Kata intitulé 
Pawn Promotion (Promotion du Pion). Ce Kata illustre une mécanique essentielle des échecs : lorsqu’un pion atteint la dernière rangée 
du plateau, il peut être promu en une autre pièce (dame, cavalier, fou ou tour). Ce choix de Kata m’a permis d’explorer 
plusieurs concepts fondamentaux, tels que le test-driven development (TDD), la conception orientée objet, et la gestion des 
interactions utilisateur.

## Présentation du Kata
Le Kata de la promotion du pion consiste à implémenter les étapes suivantes dans le jeu :

1-Déplacements des pions : Comprendre les règles spécifiques du déplacement des pions, y compris leur progression vers l’avant et leurs captures diagonales.
2-Détection des conditions de promotion : Déterminer le moment exact où un pion atteint la dernière rangée.
3-Différenciation des pions par couleur : Ajouter une méthode isWhite pour différencier les pions blancs des pions noirs, car leur direction de déplacement diffère.
4-Fenêtre de choix de promotion : Lorsqu’un pion atteint la dernière rangée, afficher une fenêtre permettant au joueur de choisir parmi les quatre types de promotion possibles :
- Dame (Queen)
- Cavalier (Knight)
- Fou (Bishop)
- Tour (Rook)
5-Mise à jour de la pièce : Une fois le choix effectué, remplacer le pion par la pièce choisie, fermer la fenêtre, et poursuivre le jeu.

### Étape 1 : Développement des tests initiaux
J'ai commencé par regarder les tests effectuer par mon collegue Yassine qui a fait une approche TDD pour comprendre les règles de déplacement 
des pions et vérifier leur comportement dans diverses situations: 
* Déplacement en avant.
* Capture en diagonale.
* Arrivée à la dernière rangée.
Ces tests m’ont aidé à définir les conditions nécessaires pour déclencher la promotion.

### Étape 2 : Différenciation des pions par couleur
J’ai ajouté une méthode isWhite pour permettre de différencier les pions blancs des noirs. Cela a été nécessaire pour gérer 
correctement leurs déplacements respectifs (vers le haut pour les pions blancs et vers le bas pour les noirs).

### Étape 3 : Fenêtre de promotion
Une fois qu’un pion atteint la dernière rangée, une fenêtre s’ouvre pour afficher les quatre types de pièces disponibles pour la promotion. 
La fenêtre est créée avec une logique interactive permettant au joueur de faire son choix, après quoi :

* Le pion est remplacé par la nouvelle pièce.
* La fenêtre se ferme automatiquement.

### Étape 4 : Intégration dans la méthode moveTo
J’ai modifié la méthode moveTo, définie dans la classe MyPiece, pour inclure les conditions de promotion en ajoutant :

- (self genericPromotion) ifTrue: [self choosePromotion].

### Difficultés rencontrées
Problème avec l’évaluation de genericPromotion
Lors de l’exécution du jeu, une erreur s’est produite indiquant que le receveur de la méthode doit être un booléen, 
bien que genericPromotion soit déjà censé renvoyer un booléen. Cette erreur survient probablement en raison d’une mauvaise gestion 
des retours de méthode ou d’un conflit dans le flux d’exécution.

### Les methodes cree et implémenter dans la classe MyPiece : 
- canBePromoted : retourne false car pas tout les pieces ont le droit de faire une promotion 
- choosePromotion : retourne self pour savoir quelle piece demande de choisir sa promotion
- isWhite : retourne la couleur white pour la piece
- genericPromotion : execute la methode isPromotionPossible pour savoir si c'est possible de faire une promotion de la piece
- isPromotionPossible : retourne false par default pour l'ensemble des piece
- moveTo : l'avancement des pieces

###  Les methodes cree et implémenter dans la classe MyPawn : 
- getter et setter de blockPromotion : pour savoir lequelle des block est est block(square) de promotion
- canBePromoted : donne le droit de faire une promotion
- choosePromotion : choisi la promotion du pion en une piece comme le rook, bishop, queen, knight.
- lastRowPromotion : detect la derniere ligne de qui permet de faire une promotion au pion
- promoteTo: la methode qui donne la promotion des pions

### Les tests créer pour les deux classes : 
- testIsBlack
- testIsWhite
- testBlackPawnShouldNotPromote
- testPawnIsBlack
- testPawnIsWhite
- testWhitePawnPromotion
- testWhitePawnShouldPromote

Le nom de chaque test est capable de nous faire comprendre le comportement de chaque test

## Conclusion
Ce Kata m’a permis d’approfondir mes connaissances en programmation orientée objet avec Pharo et en TDD. Bien que j’aie rencontré 
des difficultés techniques, elles m’ont offert l’opportunité d’explorer des outils comme le débogueur et de consolider mes compétences 
en gestion des erreurs.
La prochaine étape consistera à corriger l’erreur dans moveTo, tester davantage les cas limites, et optimiser l’expérience utilisateur 
lors du choix de promotion.

## GitHub du projet : 
https://github.com/tarik-Moulouel/Chess-g06




# Kata Refactor piece rendering (MOULOUEL Tarik ) :

## Introduction

- Je me suis occupé de la prtie refactoring du projet Chess en Pharo, ce kata est kata trés libre dans le sens ou le refactoring d'un code peut se faire de différentes maniéres.

## Ce que j'ai fait 

-  Dans un premier temps j'ai commencé par écrire les tests qui me permetteront de bien comprendre comment fonctionne le projet mais aussi pour appliquer le principe de TDD, j'ai notamment commencé par écrire les tests de MyChessSquare une classe fondamentale du projet, j'ai vérifié comment sont affichées les piéces comme la méthode testRenderBishop qui vérefié le bon affichage du Bishop et j'ai fait de meme pour les autres piéces.
-  Après les tests, j'ai commncé à réflichir sur comment refactoriser le code, j'ai dans un premier temps constaté que les méthodes de render dans MyChessSquare étaient pas trés longues et donc il fallait absolument trouver une solution, j'ai donc crée deux classes MyBlackChessSquare et MyWhiteChessSquare qui héritent de MyChessSquare qui est à présent abstract car les méthodes render des pieces sont abstaites vu que je les ai défénies dans les sousclasses, donc par exemple pour les render bishop, j'ai deux méthodes (renderWhiteBishop et renderBlackBishop). 
- J'ai fait la démarche précedente pour :
      - Eliminer le code répétitif;
      - Single Responsibility Principle : qui est un des principes de la POO, qui veut dire que la classe MyChessSquare devient abstraite : son rôle est de définir un corps commun  à toutes les cases. Les sous-classes concrètes se chargent d’implémenter les méthodes de rendu en fonction de la couleur. je supprime ainsi la responsabilité de « savoir comment rendre une pièce blanche/noire » de la classe générale, au profit d’une responsabilisation par type de case.
      - Open/Closed Principle : Qui est un autres principe SOLID, Si un jour je veux ajouter un nouveau type de case, je peux créer une nouvelle sous-classe et implémenter les comportements de rendu spécifiques sans modifier le code des classes existantes. Cela réduit le risque d’erreurs et de régressions.
  - Pour conclure mon Kata, j'ai également ajouté des tests pour m'assurer du bon fonctionnement de ma logique avec notamment les pieces noires et blanches.

## Difficultés rencontrées : 

- J'ai rencontré des difficultés dans l'affichage des mes piéces, En effet mes tests fonctionnent bel et bien mais j'ai toujours un affichage bizzare quand je lance le jeu, donc c'est pour ça que j'ai crée une nouvelle branche Refactoring, ou j'ai efféctué mes commits que j'ai pas ajoué à la Branche Main car j'ai pas envie d'impacter ce qu'a fait Karim et Yassine, donc mes derniers commit se trouvent uniquement dans la Branche Refactor mais pas dans La branche Main.
- Parmi les problémes que j'ai pu rencobtrer et comme l'a souligné Karim, Lors de l’exécution du jeu, une erreur s’est produite indiquant que le receveur de la méthode doit être un booléen et à chaque fois que je fais bouger une pièce l'erreur s'affiche et ainsi de suite.
- J'ai meme essayé de faire le refactoring remove Nil Checks en créant une novelle classe EmptyPiece qui hérite de Piece qui par la suite remplacera Nil mais à cause du probléme mentionné précedemment j'ai pas pu y arriver.

## Conclusion : 
- Ayant déja fait du refactroing en GL, je dois dire que le refactoring de cette année est beaucoup plus intéressant dans le sens ou on avait un jeu et donc c'était plus simple pour véréfier, et que cette année on avait vraiment touché au code, contrairement à l'année précedente ou on avait fait du refactoring sur les projet à 2000 classes et donc on faisait que changer le nom des méthodes par peur de casser tout de projet.

  ## GitHub du projet : 
	https://github.com/tarik-Moulouel/Chess-g06
.

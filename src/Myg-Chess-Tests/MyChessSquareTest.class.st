Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testBoard [ 
    | squareTest boardTest |
    squareTest := MyChessSquare new.
    boardTest := MyChessBoard empty.
    squareTest board: boardTest.
    self assert: squareTest board equals: boardTest.
]

{ #category : 'tests' }
MyChessSquareTest >> testColor [ 
[  
 |squareTest |
    squareTest := MyChessSquare new.
    
    squareTest color: Color black.
    self assert: squareTest color equals: Color black.
	
]

]

{ #category : 'tests' }
MyChessSquareTest >> testContents [
	| board square whitePiece blackPiece |
	
	board := MyChessBoard empty
		whiteColor: Color white;
		blackColor: Color black;
		yourself.

	square := MyChessSquare new
		board: board;
		color: Color white;
		yourself.

	whitePiece := MyBishop white.
	blackPiece := MyBishop black.

	"Vérifier qu'une pièce blanche peut être placée sur la case"
	square contents: whitePiece.
	self assert: square contents equals: whitePiece.

	"Changer la couleur de la case et vérifier qu'une pièce noire peut être placée"
	square color: Color black;
	       contents: blackPiece.
	self assert: square contents equals: blackPiece.
]

{ #category : 'tests' }
MyChessSquareTest >> testContentsWithNil [
	| board square result textForSquare |

	"Configuration du board"
	board := MyChessBoard empty
		whiteColor: Color white;
		blackColor: Color black;
		yourself.

	"Création de la case avec du chaînage de messages"
	square := MyChessSquare new
		board: board;
		color: Color white;
		contents: nil; "Pas de pièce sur la case"
		yourself.

	self assert: square contents isNil.

	"Définition d'un bloc local pour déterminer le texte"
	textForSquare := [ :aSquare | 
		aSquare contents 
			ifNil: [
				aSquare color isBlack
					ifTrue: [ 'x' ]
					ifFalse: [ 'z' ] ]
			ifNotNil: [ aSquare contents renderPieceOn: self ]
	].

	"Case blanche vide => 'z'"
	result := textForSquare value: square.
	self assert: result equals: 'z'.

	"Case noire vide => 'x'"
	square color: Color black; contents: nil.
	self assert: square contents isNil.

	result := textForSquare value: square.
	self assert: result equals: 'x'.
]

{ #category : 'tests' }
MyChessSquareTest >> testName [ 

    | squareTest |
    squareTest := MyChessSquare new.
	 squareTest color: Color white.
	
    squareTest name: 'a1'.
    self assert: squareTest name equals: 'a1'.
    "Test de changement si changement de nom"
    squareTest name: 'b2'.
    self assert: squareTest name equals: 'b2'.
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderBishop [ [ 
		| squareTest whiteBishop blackBishop |
	squareTest := MyChessSquare new.
	whiteBishop := MyBishop white. 
	squareTest color: Color white.
	self assert: (squareTest renderBishop: whiteBishop) equals: 'B'.
	self assert: (whiteBishop renderPieceOn: squareTest ) equals: 'B'.
	squareTest color: Color black.
	self assert: (squareTest renderBishop: whiteBishop) equals: 'b'.
	blackBishop := MyBishop black. 
	squareTest color: Color white.
	self assert: (squareTest renderBishop: blackBishop) equals: 'V'.
	squareTest color: Color black.
	self assert: (squareTest renderBishop: blackBishop) equals: 'v'. ]
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderKing [ 
	| squareTest whiteKing blackKing |
	squareTest := MyChessSquare new.
	whiteKing := MyKing white. 
	squareTest color: Color white.
	self assert: (squareTest renderKing: whiteKing) equals: 'K'.
	squareTest color: Color black.
	self assert: (squareTest renderKing: whiteKing) equals: 'k'.
	blackKing := MyBishop black. 
	squareTest color: Color white.
	self assert: (squareTest renderKing: blackKing) equals: 'L'.
	squareTest color: Color black.
	self assert: (squareTest renderKing: blackKing) equals: 'l'.

]

{ #category : 'tests' }
MyChessSquareTest >> testRenderKnight [ 

	| squareTest whiteKnight blackKnight |
	squareTest := MyChessSquare new.
	whiteKnight := MyKnight white. 
	squareTest color: Color white.
	self assert: (squareTest renderKnight: whiteKnight) equals: 'N'.
	squareTest color: Color black.
	self assert: (squareTest renderKnight: whiteKnight) equals: 'n'.
	blackKnight := MyKnight black. 
	squareTest color: Color white.
	self assert: (squareTest renderKnight: blackKnight) equals: 'M'.
	squareTest color: Color black.
	self assert: (squareTest renderKnight: blackKnight) equals: 'm'.

]

{ #category : 'tests' }
MyChessSquareTest >> testRenderQueen [ 

	| squareTest whiteQueen blackQueen |
	squareTest := MyChessSquare new.
	whiteQueen := MyQueen white. 
	squareTest color: Color white.
	self assert: (squareTest renderQueen: whiteQueen) equals: 'Q'.	
	squareTest color: Color black.
	self assert: (squareTest renderQueen: whiteQueen) equals: 'q'.
	blackQueen := MyQueen black. 
	squareTest color: Color white.
	self assert: (squareTest renderQueen: blackQueen) equals: 'W'.
	squareTest color: Color black.
	self assert: (squareTest renderQueen: blackQueen) equals: 'w'.

]

{ #category : 'tests' }
MyChessSquareTest >> testRenderRook [ 
	| squareTest whiteRook blackRook |
	squareTest := MyChessSquare new.
	whiteRook := MyRook white. 
	squareTest color: Color white.
	self assert: (squareTest renderRook: whiteRook) equals: 'R'.
	squareTest color: Color black.
	self assert: (squareTest renderRook: whiteRook) equals: 'r'.
	blackRook := MyRook black. 
	squareTest color: Color white.
	self assert: (squareTest renderRook: blackRook) equals: 'T'.
	squareTest color: Color black.
	self assert: (squareTest renderRook: blackRook) equals: 't'.

]

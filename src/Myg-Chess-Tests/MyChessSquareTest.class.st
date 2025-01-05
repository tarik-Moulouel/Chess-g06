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
MyChessSquareTest >> testRenderBlackKnightBlacksquare [ [
	self assert: ((MyChessSquare black) renderKnight: (MyKnight black)) equals: 'm'
]
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderBlackKnightWhiteSquare [ [
	self assert: ((MyChessSquare white) renderKnight: (MyKnight black)) equals: 'M'
]
]

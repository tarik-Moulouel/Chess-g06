Class {
	#name : 'MypawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MypawnTest >> testBlackPawnShouldNotPromote [ [
    | blackPawn board promotedBlack |
    
    board := MyChessBoard empty.
	 board initializeSquares. 
    blackPawn := MyPawn black.
    board at: 'd3' put: blackPawn.    
    promotedBlack := blackPawn canBePromoted .
    self deny: promotedBlack.
]
]

{ #category : ' tests' }
MypawnTest >> testCaptureDiagonly [
	| pawn board squares |
	board := MyChessBoard empty.  "Créer un échiquier vide"
	board at: 'e2' put: (pawn := MyPawn white).  "Placer un pion blanc à e2"
	board at: 'f3' put: MyPawn black. 
	board at: 'd3' put: MyPawn black. 
	squares := pawn captureMoves.
	self
		assertCollection: squares
		includesAll:
			(#( f3 d3 ) collect: [ :name |
				 board at: name ])
	
]

{ #category : 'tests' }
MypawnTest >> testEnPassantMove [
	| board whitePawn blackPawn enPassantSquare legalMoves squares game|
	
	"Créer un échiquier vide"
	board := MyChessBoard empty.

	"Placer un pion blanc à e5"
	board at: 'e5' put: (whitePawn := MyPawn white).

	"Placer un pion noir à d7 et le déplacer de deux cases à d5"
	board at: 'd7' put: (blackPawn := MyPawn initialize black).
	blackPawn moveTo: (board at: 'd5'). 
	squares := whitePawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( d6) collect: [ :name |
				 board at: name ])
]

{ #category : ' tests' }
MypawnTest >> testMoves [
	| pawn board squares |
	
	board := MyChessBoard empty.  "Créer un échiquier vide"
	board at: 'e4' put: (pawn := MyPawn white).  "Placer un pion blanc à e4"
	board at: 'e5' put: MyPawn black.    "Placer un pion blanc à e4"
	squares := pawn targetSquares.
	self deny: (squares includes: (board at: 'e5')).
]

{ #category : 'tests' }
MypawnTest >> testPawnIsBlack [ [
    | blackPawn |
    blackPawn := MyPawn black .
	self assert: blackPawn isBlack .
]
]

{ #category : 'tests' }
MypawnTest >> testPawnIsWhite [ [
    | whitePawn |  
    whitePawn := MyPawn white .
	self assert: whitePawn isWhite.
]
]

{ #category : 'tests' }
MypawnTest >> testWhitePawnPromotion [ [
	| targetedSquarePromotion whitePawn board promotedPiece |
	board := MyChessBoard empty.
	board initialize.
	whitePawn := MyPawn white.
	targetedSquarePromotion := board at: 'c8'.
	board at: 'c7' put: whitePawn.
	whitePawn moveTo: targetedSquarePromotion.
	promotedPiece := whitePawn promoteTo: MyQueen.
	self assert: (promotedPiece isKindOf: MyQueen).
	self assert: targetedSquarePromotion contents equals: promotedPiece
	]
]

{ #category : 'tests' }
MypawnTest >> testWhitePawnShouldPromote [ [
	| whitePawn board promotedWhite |
	board := MyChessBoard empty.
	board initializeSquares. 
	whitePawn := MyPawn white.
	board at: 'd8' put: whitePawn.
	promotedWhite := whitePawn canBePromoted.
	self assert: promotedWhite 
]
]

{ #category : ' tests' }
MypawnTest >> testfirsMoves [
	| pawn board squares |
	board := MyChessBoard empty.  "Créer un échiquier vide"
	board at: 'e2' put: (pawn := MyPawn white).  "Placer un pion blanc à e2"
	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e3 e4 ) collect: [ :name |
				 board at: name ])
	
]

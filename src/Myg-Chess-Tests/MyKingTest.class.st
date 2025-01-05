Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an same color rook on e column"
	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testRenderBlackKing [ [
| blackKing |
    blackKing := MyKing new color: Color black.
    self assert: (MyBlackChessSquare new renderKing: blackKing) equals: 'L'.
    self assert: (MyBlackChessSquare new renderKing: blackKing) equals: 'l'.
]
]

{ #category : 'tests' }
MyKingTest >> testRenderWhiteKing [ [
| whiteKing |
   whiteKing := MyKing new color: Color white.
    self assert: (MyWhiteChessSquare new renderKing: whiteKing) equals: 'K'.
    self assert: (MyWhiteChessSquare new renderKing: whiteKing) equals: 'k'.
]
]

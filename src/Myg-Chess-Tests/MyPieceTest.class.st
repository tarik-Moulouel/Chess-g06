Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testIsBlack [ [
    | piece |
    piece := MyPiece black.
    self assert: piece isBlack.
]
]

{ #category : 'tests' }
MyPieceTest >> testIsWhite [ [
    | piece |
    piece := MyPiece white.
    self assert: piece isWhite.
]
]

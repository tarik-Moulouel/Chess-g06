Class {
	#name : 'MySquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MySquareTest >> testSquareName [ [
	| board square |
	board := MyChessBoard empty.
	board initializeSquares. 
	square := board at:'d4'.
	self assert: (square name) equals: 'd4'.
]
]

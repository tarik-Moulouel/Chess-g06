Class {
	#name : 'MyWhiteChessSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBishop: aPiece [ [
	^ aPiece isWhite
		  ifTrue: ['B']
		  ifFalse: ['V']
]

]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderKing: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['L']
		  ifTrue: ['K']
]

]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderKnight: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['M']
		  ifTrue: ['N']
]
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderPawn: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['O']
		  ifTrue: ['P']
]

]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderQueen: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['W']
		  ifTrue: ['Q']
]
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderRook: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['T']
		  ifTrue: ['R']
]
]

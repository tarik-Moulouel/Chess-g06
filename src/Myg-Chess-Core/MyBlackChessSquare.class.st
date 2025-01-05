Class {
	#name : 'MyBlackChessSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyBlackChessSquare >> initialize [ [
	super initialize.
	color := Color black
]
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderBishop: aPiece [ [
	^ aPiece isWhite
		  ifTrue: ['b']
		  ifFalse: ['v']
]
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderKing: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['l']
		  ifTrue: ['k']
]
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderKnight: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['m']
		  ifTrue: ['n']
]
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderPawn: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['o']
		  ifTrue: ['p']
]
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderQueen: aPiece [ [
	
	
	^ aPiece isWhite
		  ifFalse: ['w']
		  ifTrue: ['q']
]
]

{ #category : 'rendering' }
MyBlackChessSquare >> renderRook: aPiece [ [
	^ aPiece isWhite
		  ifFalse: ['t']
		  ifTrue: ['r']
]
]

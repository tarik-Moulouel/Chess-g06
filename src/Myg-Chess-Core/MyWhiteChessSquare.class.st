Class {
	#name : 'MyWhiteChessSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyWhiteChessSquare >> initialize [ [
	super initialize.
	color := Color white
]
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderBishop: aPiece [ [
	^ aPiece isWhite
		  ifTrue: [ 'B' ]
		  ifFalse: [ 'V' ]
]
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderKing: aPiece [ [
	^ aPiece isWhite
		  ifTrue: [ 'K' ]
		  ifFalse: [ 'L' ]
]
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderKnight: aPiece [ [
	^ aPiece isWhite
		  ifTrue: [ 'N' ]
		  ifFalse: [ 'M' ]
]
]

{ #category : 'rendering' }
MyWhiteChessSquare >> renderPawn: aPiece [ [
	^ aPiece isWhite
		  ifTrue: [ 'P' ]
		  ifFalse: [ 'O' ]
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
		  ifTrue: [ 'R' ]
		  ifFalse: [ 'T' ]
]
]

{ #category : 'constants' }
MyWhiteChessSquare >> white [ [
	^ MyWhiteChessSquare new
]
]

Class {
	#name : #GameState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
GameState >> hasEnded [
	^ self subclassResponsibility
]

{ #category : #accessing }
GameState >> winner [
	^ self subclassResponsibility
]

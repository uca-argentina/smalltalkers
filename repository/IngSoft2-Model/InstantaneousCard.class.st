Class {
	#name : #InstantaneousCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
InstantaneousCard >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	self subclassResponsibility
]

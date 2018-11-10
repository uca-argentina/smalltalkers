Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Card >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	self subclassResponsibility
]

Class {
	#name : #AddCard,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AddCard >> applyTo: aPlayer on: aGame [
	self subclassResponsibility
]

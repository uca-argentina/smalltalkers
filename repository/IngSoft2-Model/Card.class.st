Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Card >> useAgainst: aPlayer on: aGame [
	self subclassResponsibility
]

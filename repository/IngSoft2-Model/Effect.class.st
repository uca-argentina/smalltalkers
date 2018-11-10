Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
Effect >> applyTo: aPlayer on: aGame [
	self subclassResponsibility
]

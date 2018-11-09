Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Effect >> applyTo: aPlayer on: aGame [
	self subclassResponsibility
]

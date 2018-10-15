Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Effect >> apply: aGame to: aPlayer [
	self subclassResponsibility
]

Class {
	#name : #RollStrategy,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #iterating }
RollStrategy >> next: aQuantityOfFaces [
	self subclassResponsibility
]

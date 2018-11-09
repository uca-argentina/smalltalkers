Class {
	#name : #RollStrategy,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RollStrategy >> next: aQuantityOfFaces [
	self subclassResponsibility
]

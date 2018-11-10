Class {
	#name : #AddCancellationCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AddCancellationCard >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer addCard: Cancellation new
]

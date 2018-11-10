Class {
	#name : #AddOverloadCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AddOverloadCard >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer  addCard: Overload new.
]

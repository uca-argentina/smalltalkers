Class {
	#name : #AddOverloadCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AddOverloadCard >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer addCard: Overload new
]

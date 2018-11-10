Class {
	#name : #AddRepeatCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AddRepeatCard >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer addCard: Repeat new
]

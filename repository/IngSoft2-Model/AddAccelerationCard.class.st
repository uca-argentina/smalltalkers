Class {
	#name : #AddAccelerationCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AddAccelerationCard >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer addCard: Acceleration new
]

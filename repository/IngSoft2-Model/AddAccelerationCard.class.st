Class {
	#name : #AddAccelerationCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AddAccelerationCard >> applyTo: aPlayer on: aGame [
	|  player|
	player := (aGame players) detect: [ :each | each = aPlayer].
	player addCard: Acceleration  new.
]

Class {
	#name : #AddAccelerationCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AddAccelerationCard >> applyTo: aPlayer on: aGame [
	| acceleration player|
	acceleration := Acceleration  new.
	player := (aGame players) detect: [ :each | each = aPlayer].
	player addCard: acceleration
]

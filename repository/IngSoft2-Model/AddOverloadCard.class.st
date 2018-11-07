Class {
	#name : #AddOverloadCard,
	#superclass : #AddCard,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AddOverloadCard >> applyTo: aPlayer on: aGame [
	| overload player|
	overload := Overload new.
	player := (aGame players) detect: [ :each | each = aPlayer].
	player addCard: overload
]

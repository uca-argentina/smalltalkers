Class {
	#name : #DiceRandom,
	#superclass : #Object,
	#instVars : [
		'quantityFaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
DiceRandom class >> assertValidDiceValue: aValue [
	(aValue <3) ifTrue: [AssertionFailure signal: 'A dice must have 3 or more faces']. 
]

{ #category : #initialization }
DiceRandom class >> withNumberOfFaces: aValue [
	self assertValidDiceValue: aValue.
	^ self new initializeWithFaceValue: aValue
]

{ #category : #accessing }
DiceRandom >> faceValue [
	^ quantityFaces
]

{ #category : #initialization }
DiceRandom >> initializeWithFaceValue: aValue [
	quantityFaces := aValue
]

{ #category : #rolling }
DiceRandom >> roll [
	|rand| 
	rand:= Random new.
	rand := ((rand next * (quantityFaces  - 1)) truncated + 1).	"Genera un random entre 0 y 1 (float), lo multiplico por (caras del dado - 1) y luego le sumo 1"
	^ rand
]

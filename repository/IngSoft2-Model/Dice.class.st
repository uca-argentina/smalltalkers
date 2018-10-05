Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'quantityFaces',
		'strategy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Dice class >> assertValidDiceValue: aValue [
	(aValue <3) ifTrue: [AssertionFailure signal: 'A dice must have 3 or more faces']
]

{ #category : #initialization }
Dice class >> faces: aFacesNumber withStrategy: aStrategy [
	self assertValidDiceValue: aFacesNumber.
	^ self new initializeWithNumberOfFaces: aFacesNumber AndStrategy: aStrategy
]

{ #category : #initialization }
Dice >> initializeWithNumberOfFaces: aNumberOfFaces AndStrategy: aStrategy [
	quantityFaces := aNumberOfFaces.
	strategy := aStrategy.
]

{ #category : #initialization }
Dice >> roll [
	^ strategy next:quantityFaces
]

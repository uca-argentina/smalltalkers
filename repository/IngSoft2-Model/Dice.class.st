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
	aValue < 3
		ifTrue: [ AssertionFailure signal: 'A dice must have 3 or more faces' ]
]

{ #category : #'instance creation' }
Dice class >> faces: aFacesNumber withStrategy: aStrategy [
	self assertValidDiceValue: aFacesNumber.
	^ self new initializeWithNumberOfFaces: aFacesNumber andStrategy: aStrategy
]

{ #category : #initialization }
Dice >> initializeWithNumberOfFaces: aNumberOfFaces andStrategy: aStrategy [
	quantityFaces := aNumberOfFaces.
	strategy := aStrategy
]

{ #category : #playing }
Dice >> roll [
	^ strategy next: quantityFaces
]

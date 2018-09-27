Class {
	#name : #DiceCharged,
	#superclass : #Object,
	#instVars : [
		'quantityFaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
DiceCharged class >> assertValidDiceValue: aValue [
	(aValue <3) ifTrue: [AssertionFailure signal: 'A dice must have 3 or more faces']. 
]

{ #category : #initialization }
DiceCharged class >> withNumberOfFaces: aValue [
	self assertValidDiceValue: aValue.
	^ self new initializeWithFaceValue: aValue
]

{ #category : #initialization }
DiceCharged class >> withSequence: aSequence [
^ self new initializeWithSequence: aSequence
]

{ #category : #accessing }
DiceCharged >> faceValue [
	^ quantityFaces
]

{ #category : #initialization }
DiceCharged >> initializeWithFaceValue: aValue [
	quantityFaces := aValue.

	
]

{ #category : #rolling }
DiceCharged >> roll [
	^ quantityFaces
	
]

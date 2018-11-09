Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'length',
		'effects'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertWithValidValueOfLength: aValue [
	aValue <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ]
]

{ #category : #initialization }
Board class >> effects: effectsCollection [
	self assertWithValidValueOfLength: effectsCollection size.
	^ self new initializeWithEffects: effectsCollection
]

{ #category : #playing }
Board >> applyEffect: aGame to: aPlayer [
	(self effectAt: (aGame positionOf: aPlayer))
		applyTo: aPlayer
		on: aGame
]

{ #category : #initialization }
Board >> effectAt: aPosition [
	^ effects at: (aPosition + 1)
]

{ #category : #initialization }
Board >> initializeWithEffects: effectsCollection [
	length := effectsCollection size.
	effects  := effectsCollection.
	
]

{ #category : #accessing }
Board >> length [
	^ length
]

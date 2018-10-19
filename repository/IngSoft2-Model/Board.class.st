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
Board >> activeEffect: aGame to: aPlayer [
	(self effect: (aGame positionOf: aPlayer)) apply: aGame to: aPlayer

]

{ #category : #initialization }
Board >> effect: aPosition [
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

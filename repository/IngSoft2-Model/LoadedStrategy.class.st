Class {
	#name : #LoadedStrategy,
	#superclass : #RollStrategy,
	#instVars : [
		'sequence',
		'nextPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
LoadedStrategy class >> assertWithValidValueOfSequence: aSequence [
	aSequence size <= 0
		ifTrue: [ GameException signal: 'The sequence has a not valid size' ]
]

{ #category : #'instance creation' }
LoadedStrategy class >> withSequence: aSequence [
	self assertWithValidValueOfSequence: aSequence.
	^ self new initializeWithSequence: aSequence
]

{ #category : #initialization }
LoadedStrategy >> initializeWithSequence: aSequence [
	sequence := aSequence asOrderedCollection.
	nextPosition := 1
]

{ #category : #iterating }
LoadedStrategy >> next: aQuantityFace [
	| previousPosition |
	nextPosition > sequence size
		ifTrue: [ nextPosition := 1 ].
	previousPosition := nextPosition.
	nextPosition := nextPosition + 1.
	^ sequence at: previousPosition
]

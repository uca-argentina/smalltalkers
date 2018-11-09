Class {
	#name : #LoadedStrategy,
	#superclass : #RollStrategy,
	#instVars : [
		'sequence',
		'nextPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
LoadedStrategy class >> withSequence: aSequence [
	^ self new initializeWithSequence: aSequence
]

{ #category : #initialization }
LoadedStrategy >> initializeWithSequence: aSequence [
	sequence := aSequence asOrderedCollection.
	nextPosition := 1
]

{ #category : #accessing }
LoadedStrategy >> next: aQuantityFace [
	| previousPosition |
	nextPosition > sequence size
		ifTrue: [ nextPosition := 1 ].
	previousPosition := nextPosition.
	nextPosition := nextPosition + 1.
	^ sequence at: previousPosition
]

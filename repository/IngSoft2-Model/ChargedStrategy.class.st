Class {
	#name : #ChargedStrategy,
	#superclass : #RollStrategy,
	#instVars : [
		'sequence',
		'nextPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
ChargedStrategy class >> withSequence: aSequence [
	^ self new initializeWithSequence: aSequence
]

{ #category : #initialization }
ChargedStrategy >> initializeWithSequence: aSequence [
	sequence := aSequence.
	nextPosition := 1
]

{ #category : #accessing }
ChargedStrategy >> next: aQuantityOfFaces [
	| previousPosition |
	nextPosition > sequence size
		ifTrue: [ nextPosition := 1 ].
	previousPosition := nextPosition.
	nextPosition := nextPosition + 1.
	^ sequence at: previousPosition
]

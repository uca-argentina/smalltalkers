Class {
	#name : #ChargedEffectStrategy,
	#superclass : #EffectStrategy,
	#instVars : [
		'nextPosition',
		'sequence'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
ChargedEffectStrategy class >> withSequence: aSequence [
	^ self new initializeWithSequence: aSequence
]

{ #category : #initialization }
ChargedEffectStrategy >> initializeWithSequence: aSequence [
	sequence := aSequence.
	nextPosition := 1
]

{ #category : #accessing }
ChargedEffectStrategy >> nextEffect [
	| previousPosition |
	nextPosition > sequence size
		ifTrue: [ nextPosition := 1 ].
	previousPosition := nextPosition.
	nextPosition := nextPosition + 1.
	^ sequence at: previousPosition
]

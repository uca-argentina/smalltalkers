Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Player class >> assertWithValidName: aName [
	aName size <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a player without a name' ]
]

{ #category : #initialization }
Player class >> named: aName [
	self assertWithValidName: aName.
	^ self new initializeWithName: aName
]

{ #category : #playing }
Player >> advancePosition: aRollNumber [
	^ position := position + aRollNumber
]

{ #category : #initialization }
Player >> initializeWithName: aName [
	position := 0.
	name := aName
]

{ #category : #accessing }
Player >> named [
	^ name
]

{ #category : #accessing }
Player >> position [
	^ position
]

{ #category : #playing }
Player >> roll: diceCollection [
	| rollNumber |
	rollNumber := diceCollection sumNumbers: [ :dice | dice roll ].
	self advancePosition: rollNumber.
	^ rollNumber
]

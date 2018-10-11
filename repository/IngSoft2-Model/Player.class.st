Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
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

{ #category : #initialization }
Player >> initializeWithName: aName [
	name := aName
]

{ #category : #accessing }
Player >> named [
	^ name
]

{ #category : #playing }
Player >> roll: diceCollection [
	| rollNumber |
	rollNumber := diceCollection sumNumbers: [ :dice | dice roll ].
	^ rollNumber
]

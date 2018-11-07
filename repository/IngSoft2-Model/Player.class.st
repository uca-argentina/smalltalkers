Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'cardCollection'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Player class >> assertWithValidName: aName [
	aName size <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a player without a name' ]
]

{ #category : #initialization }
Player class >> named: aName with: aCardCollection [
	self assertWithValidName: aName.
	^ self new initializeWithName: aName andCardCollection: aCardCollection
]

{ #category : #adding }
Player >> addCard: aCard [
	cardCollection add: aCard
]

{ #category : #initialization }
Player >> initializeWithName: aName andCardCollection: aCardCollection [
	name := aName.
	cardCollection := aCardCollection.
]

{ #category : #playing }
Player >> roll: diceCollection [
	| rollNumber |
	rollNumber := diceCollection sumNumbers: [ :dice | dice roll ].
	^ rollNumber
]

{ #category : #playing }
Player >> useCardNamed: aName [
	| card |
	card := cardCollection detect: [ :each | each name = aName ].
	cardCollection remove: card.
	^ card
]

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

{ #category : #'instance creation' }
Player class >> named: aName with: aCardCollection [
	self assertWithValidName: aName.
	^ self new initializeWithName: aName andCardCollection: aCardCollection
]

{ #category : #adding }
Player >> addCard: aCard [
	cardCollection add: aCard
]

{ #category : #playing }
Player >> cancellationRedoTargetIs: aTarget [
	cardCollection
		detect: [ :each | each name = 'Redo' ]
		ifFound: [ :found | found selectCardTarget: aTarget ]
		ifNone: [ GameException signal: 'You dont have Redo Card' ]
]

{ #category : #playing }
Player >> cancellationTargetIs: aTarget [
	cardCollection
		detect: [ :each | each name = 'Cancellation' ]
		ifFound: [ :found | found selectCardTarget: aTarget ]
		ifNone: [ GameException signal: 'You dont have Cancellation Card' ]
]

{ #category : #initialization }
Player >> initializeWithName: aName andCardCollection: aCardCollection [
	name := aName.
	cardCollection := aCardCollection
]

{ #category : #accessing }
Player >> name [
	^ name
]

{ #category : #playing }
Player >> removeCard: aCardName [
	cardCollection
		detect: [ :each | each name = aCardName ]
		ifFound: [ :found | cardCollection remove: found ]
		ifNone: [ GameException signal: 'You dont have this card' ]
]

{ #category : #playing }
Player >> roll: diceCollection [
	^ diceCollection sumNumbers: [ :dice | dice roll ]
]

{ #category : #playing }
Player >> useCardNamed: aName [
	cardCollection detect: [ :each | each name = aName ] ifFound: [ :found | ^ found ] ifNone: [ GameException signal: 'You dont have that card' ]
]

Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'rollNumber',
		'rank'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Player class >> assertWithValidName: aName [
	(aName equals: '')	 ifTrue: [ AssertionFailure signal:'You cant create a player without a name' ].
]

{ #category : #initialization }
Player class >> named: aName [
	self assertWithValidName: aName.
	^ self name: aName
]

{ #category : #playing }
Player >> advancePosition [
	^ position := position + rollNumber.
]

{ #category : #initialization }
Player >> named: aName [
	position := 0.
	name := aName.
]

{ #category : #playing }
Player >> roll: diceCollection [
	rollNumber := diceCollection sumNumbers: [ :dice | dice roll ].
	^ rollNumber
]

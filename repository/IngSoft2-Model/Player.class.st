Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'diceCollection',
		'rollNumber',
		'rank'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Player class >> assertWithValidValueOfDices:aCollection [
	(aCollection size <= 0 ) ifTrue: [ AssertionFailure signal: 'You cant create a player without dices' ].

]

{ #category : #initialization }
Player class >> withDiceCollection: aDiceCollection andName: aName [
	self assertWithValidValueOfDices: aDiceCollection.
	^ self new initializeWithDiceCollection: aDiceCollection andName: aName
]

{ #category : #updating }
Player >> advancePosition [
	position := position + rollNumber .
]

{ #category : #accessing }
Player >> diceCollection [
	^ diceCollection 
]

{ #category : #initialization }
Player >> initializeWithDiceCollection: aDiceCollection andName: aName [
	position := 0.
	name := aName.
	diceCollection := aDiceCollection .
]

{ #category : #accessing }
Player >> name [
	^ name
]

{ #category : #accessing }
Player >> position [
	^ position 
]

{ #category : #accessing }
Player >> rank [
	^ rank
]

{ #category : #updating }
Player >> rankedWithValue: aValue [
	rank := aValue
]

{ #category : #rolling }
Player >> roll [
	| sum |
	sum := 0.
	1 to: diceCollection size do: [ :i | sum := sum + (diceCollection at: i) roll ].
	rollNumber := sum
]

{ #category : #accessing }
Player >> rollNumber [
	^ rollNumber 
]

"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	diceCollection:		<Object>
	name:		<Object>
	position:		<Object>
	rank:		<Object>
	rollNumber:		<Object>


    Implementation Points
"
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

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


    Implementation Points
"
Class {
	#name : #TestGame,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TestGame >> testGameAllPlayerRollSameNumber [
	| players diceCollection game|
	players := OrderedCollection new.
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 8).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').
	"Deberia quedar 1)Rodri 2)Julian 3)Lucas"
	game := Game name: 'Ludo' withPlayers: players withTableSize: 30.
	[ game finished == false ] whileTrue: [ game play ].
	game rankPlayers.
	self assert: game finished == true.
	self assert: game winner equals: 'Rodri'.
	self assert: (game ranking at: 1) name equals: 'Rodri'.
	self assert: (game ranking at: 2) name equals: 'Julian'.
	self assert: (game ranking at: 3) name equals: 'Lucas'
]

{ #category : #tests }
TestGame >> testGamePlayersRollDifferentNumbers [
	| players diceCollection game |
	players := OrderedCollection new.
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 4).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 6).
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 3).
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').
	"Deberia quedar 1)Julian(30)  2)Rodri(20)  3)Lucas(12)"
	game := Game name: 'Ludo' withPlayers: players withTableSize: 30.
	[ game finished == false ] whileTrue: [ game play ].
	game rankPlayers.
	self assert: game finished == true.
	self assert: game winner equals: 'Julian'.
	self assert: (game ranking at: 1) name equals: 'Julian'.
	self assert: (game ranking at: 1) position equals: 30.
	self assert: (game ranking at: 2) name equals: 'Rodri'.
	self assert: (game ranking at: 2) position equals: 20.
	self assert: (game ranking at: 3) name equals: 'Lucas'.
	self assert: (game ranking at: 3) position equals: 12
]

Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'diceCollection',
		'winner',
		'turn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> playedBy: players onBoardLenght: aBoardLenght withDices: diceCollection [
	^ self new initializeWithPlayers: players OnBoardLenght: aBoardLenght withDices: diceCollection
]

{ #category : #playing }
Game >> changeTurn: nextPlayer [
	(turn == nextPlayer)
		ifTrue:[AssertionFailure signal: 'You need to change the player'].
	winner size > 0
		ifTrue: [ AssertionFailure signal:'You cant change turn because game has finished' ]
		ifFalse: [ ^ turn := nextPlayer ]
]

{ #category : #accessing }
Game >> finished [
	winner := players select: [ :each | each position >= board positions ].
	winner size > 0
		ifTrue: [ ^ winner at: 1 ]
		ifFalse: [ ^ false ]
]

{ #category : #initialization }
Game >> initializeWithPlayers: playersCollection OnBoardLenght: aBoardLenght withDices: aDiceCollection [
	players := playersCollection.
	diceCollection := aDiceCollection.
	board := Board sized: aBoardLenght.
	turn := players at: 1
]

{ #category : #accessing }
Game >> rankPlayers [
	^ board rankPlayers: players
]

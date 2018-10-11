Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'diceCollection',
		'winner',
		'turnPlayer',
		'turnPosition',
		'order'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> playedBy: players onBoard: aBoard withDices: diceCollection [
	^ self new initializeWithPlayers: players onBoard: aBoard withDices: diceCollection
]

{ #category : #playing }
Game >> changeTurn [
	order := order + 1.
	order > players size
		ifTrue: [ order := 1 ].
	turnPlayer := players at: order
]

{ #category : #accessing }
Game >> finished [
	winner := players select: [ :each | each position >= board length].
	winner size > 0
		ifTrue: [ ^ winner at: 1 ]
		ifFalse: [ ^ false ]
]

{ #category : #initialization }
Game >> initializeWithPlayers: playersCollection onBoard: aBoard withDices: aDiceCollection [
	players := playersCollection.
	diceCollection := aDiceCollection.
	board := aBoard.
	turnPlayer := players at: 1.
	order := 1.
]

{ #category : #playing }
Game >> play: aPlayer [
	turnPlayer = aPlayer 
		ifTrue: [ aPlayer roll:diceCollection.
			self changeTurn  ]
		ifFalse:[AssertionFailure signal:'it is not your turn'].
]

{ #category : #accessing }
Game >> rankPlayers [
	^ players asSortedCollection: [ :p1 :p2 | p1 position >= p2 position ]
]

{ #category : #accessing }
Game >> turn [
	^ turnPlayer
]

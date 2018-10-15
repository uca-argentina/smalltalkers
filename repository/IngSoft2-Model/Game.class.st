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
		'order',
		'playersPositions',
		'playersLaps',
		'winningLaps',
		'playerScore'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> playedBy: players onBoard: aBoard withDices: diceCollection withWinningLaps: aNumber [
	^ self new initializeWithPlayers: players onBoard: aBoard withDices: diceCollection withWinningLaps: aNumber
]

{ #category : #accessing }
Game >> board [
	^ board
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
	winner := playersLaps select: [ :each | each value >= winningLaps ].
	^ winner size > 0
		ifTrue: [ winner keys at: 1 ]
		ifFalse: [ false ]
]

{ #category : #initialization }
Game >> initializeWithPlayers: playersCollection onBoard: aBoard withDices: aDiceCollection withWinningLaps: aNumber [
	players := playersCollection.
	diceCollection := aDiceCollection.
	board := aBoard.
	turnPlayer := players at: 1.
	order := 1.
	winningLaps := aNumber.
	playersPositions := Dictionary new.
	players do: [ :player | playersPositions at: player put: 0 ].
	playersLaps := Dictionary new.
	players do: [ :player | playersLaps at: player put: 0 ].
	playerScore := Dictionary new
]

{ #category : #accessing }
Game >> lapsOf: aPlayer [
	^ playersLaps at: aPlayer
]

{ #category : #accessing }
Game >> makeScoreOfPlayers [
	| lapScore finalScore positionScore |
	players
		do: [ :player | 
			lapScore := (playersLaps at: player) * board length.
			positionScore := playersPositions at: player.
			finalScore := lapScore + positionScore.
			playerScore at: player put: finalScore ]
]

{ #category : #playing }
Game >> play: aPlayer [
	turnPlayer = aPlayer
		ifTrue: [ self player: aPlayer advance: (aPlayer roll: diceCollection).
			self changeTurn.
			self board activeEffect: self to: aPlayer ]
		ifFalse: [ AssertionFailure signal: 'it is not your turn' ]
]

{ #category : #playing }
Game >> player: aPlayer advance: aNumber [
	| actualPosition actualLaps |
	actualPosition := playersPositions at: aPlayer.
	actualLaps := playersLaps at: aPlayer.
	actualPosition + aNumber <= 0
		ifTrue: [ playersPositions at: aPlayer put: 0 ]
		ifFalse: [ playersPositions at: aPlayer put: actualPosition + aNumber ].
	(playersPositions at: aPlayer) > board length
		ifFalse: [ ^ self ].
	actualPosition := playersPositions at: aPlayer.
	playersPositions at: aPlayer put: actualPosition - board length.
	playersLaps at: aPlayer put: actualLaps + 1
]

{ #category : #accessing }
Game >> players [
	^ players 
]

{ #category : #accessing }
Game >> positionOf: aPlayer [
	^ playersPositions at: aPlayer ifAbsentPut: [0]
]

{ #category : #accessing }
Game >> rankPlayers [
	self makeScoreOfPlayers.
	^ players asSortedCollection: [ :p1 :p2 | (self scoreOf: p1) >= (self scoreOf: p2) ]
]

{ #category : #accessing }
Game >> scoreOf: aPlayer [
	^ playerScore at: aPlayer
]

{ #category : #accessing }
Game >> turn [
	^ turnPlayer
]

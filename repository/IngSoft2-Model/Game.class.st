Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'diceCollection',
		'turnPlayer',
		'order',
		'playersPositions',
		'playersLaps',
		'winningLaps',
		'playerScore',
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> playedBy: players onBoard: aBoard withDices: diceCollection withWinningLaps: aNumber [
	^ self new initializeWithPlayers: players onBoard: aBoard withDices: diceCollection withWinningLaps: aNumber
]

{ #category : #playing }
Game >> advanced: aPlayer [
	self player: aPlayer advance: (aPlayer roll: diceCollection).
	self board activeEffect: self to: aPlayer.
	self changeTurn
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

{ #category : #playing }
Game >> finished: aPlayer [
	state:= state nextStateFor: self to: aPlayer
]

{ #category : #testing }
Game >> hasEnded [
	^ state hasEnded
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
	playerScore := Dictionary new.
	players do: [ :player | playerScore at: player put: 0 ].
	state:= PlayerState new.
]

{ #category : #accessing }
Game >> lapsOf: aPlayer [
	^ playersLaps at: aPlayer
]

{ #category : #playing }
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
		ifTrue: [ self advanced: aPlayer ]
		ifFalse: [ GameException signal: 'it is not your turn' ].
	self finished: aPlayer
]

{ #category : #playing }
Game >> player: aPlayer advance: aNumber [
	| actualposition actuallaps advancenumber |
	actualposition := playersPositions at: aPlayer.
	actuallaps := playersLaps at: aPlayer.
	advancenumber := (actualposition + aNumber) \\ board length.
	actuallaps := actuallaps + ((aNumber + actualposition) // board length).
	playersPositions at: aPlayer put: advancenumber.
	playersLaps at: aPlayer put: actuallaps
]

{ #category : #accessing }
Game >> players [
	^ players 
]

{ #category : #accessing }
Game >> positionOf: aPlayer [
	^ playersPositions at: aPlayer
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

{ #category : #accessing }
Game >> winner [
	^ state winner
]

{ #category : #accessing }
Game >> winningLaps [
	^ winningLaps
]

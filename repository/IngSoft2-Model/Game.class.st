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
Game >> advanceAndApplyEffectTo: aPlayer [
	self player: aPlayer advance: (aPlayer roll: diceCollection).
	(self board effectAt: (self positionOf: aPlayer))
		applyTo: aPlayer
		on: self.
	self changeTurn
]

{ #category : #playing }
Game >> assertIsTurnOf: aPlayer [
	turnPlayer = aPlayer
		ifFalse: [ GameException signal: 'it is not your turn' ]
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
Game >> checkFinished: aPlayer [
	state := state nextStateOf: aPlayer on: self
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
	self assertIsTurnOf: aPlayer.
	self advanceAndApplyEffectTo: aPlayer.
	state := state nextStateOf: aPlayer on: self
]

{ #category : #playing }
Game >> player: aPlayer advance: aNumber [
	| current |
	current := playersPositions at: aPlayer.
	playersPositions at: aPlayer put: (current + aNumber) \\ board length .
	playersLaps at: aPlayer put: (playersLaps at:aPlayer) + ((current + aNumber) // board length).
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
	^ players asSortedCollection: [ :player | self scoreOf: player ] descending
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

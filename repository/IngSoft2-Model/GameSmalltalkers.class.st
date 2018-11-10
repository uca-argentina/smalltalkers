Class {
	#name : #GameSmalltalkers,
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
		'state',
		'cardEffectAdvanceNumber',
		'cardsHistory',
		'effectsHistory'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
GameSmalltalkers class >> playedBy: players onBoard: aBoard withDices: diceCollection withWinningLaps: aNumber [
	^ self new initializeWithPlayers: players onBoard: aBoard withDices: diceCollection withWinningLaps: aNumber
]

{ #category : #playing }
GameSmalltalkers >> advanceAndApplyEffectTo: aPlayer [
	self player: aPlayer advance: (aPlayer roll: diceCollection).
	effectsHistory add: (EffectHistory with: aPlayer and: (self board effectAt: (self positionOf: aPlayer))).
	(self board effectAt: (self positionOf: aPlayer)) applyTo: aPlayer on: self.
	self changeTurn
]

{ #category : #asserting }
GameSmalltalkers >> assertIsTurnOf: aPlayer [
	turnPlayer = aPlayer
		ifFalse: [ GameException signal: 'it is not your turn' ]
]

{ #category : #accessing }
GameSmalltalkers >> board [
	^ board
]

{ #category : #accessing }
GameSmalltalkers >> cardsHistory [
	^ cardsHistory 
]

{ #category : #playing }
GameSmalltalkers >> changeTurn [
	order := order + 1.
	order > players size
		ifTrue: [ order := 1 ].
	turnPlayer := players at: order
]

{ #category : #accessing }
GameSmalltalkers >> effectsHistory [
	^ effectsHistory 
]

{ #category : #testing }
GameSmalltalkers >> hasEnded [
	^ state hasEnded
]

{ #category : #initialization }
GameSmalltalkers >> initializeWithPlayers: playersCollection onBoard: aBoard withDices: aDiceCollection withWinningLaps: aNumber [
	players := playersCollection.
	diceCollection := aDiceCollection.
	board := aBoard.
	turnPlayer := players at: 1.
	order := 1.
	winningLaps := aNumber.
	playersPositions := Dictionary new.
	playersLaps := Dictionary new.
	playerScore := Dictionary new.
	cardEffectAdvanceNumber := Dictionary new.
	players
		do: [ :player | 
			playersPositions at: player put: 0.
			playersLaps at: player put: 0.
			playerScore at: player put: 0.
			cardEffectAdvanceNumber at: player put: 0 ].
	state := GameState new.
	cardsHistory := OrderedCollection new.
	effectsHistory := OrderedCollection new
]

{ #category : #accessing }
GameSmalltalkers >> lapsOf: aPlayer [
	^ playersLaps at: aPlayer
]

{ #category : #playing }
GameSmalltalkers >> makeScoreOfPlayers [
	| lapScore finalScore positionScore |
	players
		do: [ :player | 
			lapScore := (playersLaps at: player) * board length.
			positionScore := playersPositions at: player.
			finalScore := lapScore + positionScore.
			playerScore at: player put: finalScore ]
]

{ #category : #playing }
GameSmalltalkers >> modifyCardEffectAdvanceNumberOf: aPlayer with: aNumber [
	cardEffectAdvanceNumber at: aPlayer put: (cardEffectAdvanceNumber at: aPlayer) + aNumber
]

{ #category : #playing }
GameSmalltalkers >> modifyCardEffectGoBackNumberOf: aPlayer with: aNumber [
	cardEffectAdvanceNumber at: aPlayer put: (cardEffectAdvanceNumber at: aPlayer) - aNumber
]

{ #category : #playing }
GameSmalltalkers >> play: aPlayer [
	self assertIsTurnOf: aPlayer.
	self advanceAndApplyEffectTo: aPlayer.
	state := state nextStateOf: aPlayer on: self
]

{ #category : #playing }
GameSmalltalkers >> player: aPlayer addCard: aCard [
	players detect: [ :each | each = aPlayer ] ifFound: [ :found | found addCard: aCard ]
]

{ #category : #playing }
GameSmalltalkers >> player: aPlayer advance: aNumber [
	| current cardTotalEffects|
	current := playersPositions at: aPlayer.
	cardTotalEffects := cardEffectAdvanceNumber at: aPlayer.
	playersPositions at: aPlayer put: (current + aNumber + cardTotalEffects) \\ board length .
	playersLaps at: aPlayer put: (playersLaps at:aPlayer) + ((current + aNumber + cardTotalEffects) // board length).
]

{ #category : #playing }
GameSmalltalkers >> player: aPlayer goBack: aNumber [
	| current cardTotalEffects |
	current := playersPositions at: aPlayer.
	cardTotalEffects := cardEffectAdvanceNumber at: aPlayer.
	playersPositions at: aPlayer put: (current - aNumber + cardTotalEffects) \\ board length.
	playersLaps at: aPlayer put: (playersLaps at: aPlayer) + ((current - aNumber + cardTotalEffects) // board length)
]

{ #category : #playing }
GameSmalltalkers >> player: aPlayer targetForCancellationCardIs: aTarget [
	aPlayer cancellationTargetIs: aTarget
]

{ #category : #playing }
GameSmalltalkers >> player: aPlayer useCard: aCardName against: anotherPlayer [
	players
		detect: [ :each | each = aPlayer ]
		ifFound: [ :found | 
			(found useCardNamed: aCardName) player: found useAgainst: anotherPlayer on: self.
			found removeCard: aCardName ].
	aCardName = 'Redo'
		ifFalse: [ cardsHistory add: (CardHistory from: aPlayer to: anotherPlayer with: aCardName) ]
]

{ #category : #accessing }
GameSmalltalkers >> players [
	^ players 
]

{ #category : #accessing }
GameSmalltalkers >> positionOf: aPlayer [
	^ playersPositions at: aPlayer
]

{ #category : #accessing }
GameSmalltalkers >> rankPlayers [
	self makeScoreOfPlayers.
	^ players asSortedCollection: [ :player | self scoreOf: player ] descending
]

{ #category : #playing }
GameSmalltalkers >> removePlayedCardAffecting: aPlayerName with: aCardName [
	cardsHistory
		detect: [ :each | each targetName = aPlayerName and: each effect = aCardName ]
		ifFound: [ :found | cardsHistory remove: found ]
		ifNone: [ AssertionFailure signal: 'That player is not affected by that card' ]
]

{ #category : #accessing }
GameSmalltalkers >> scoreOf: aPlayer [
	^ playerScore at: aPlayer
]

{ #category : #accessing }
GameSmalltalkers >> turn [
	^ turnPlayer
]

{ #category : #accessing }
GameSmalltalkers >> winner [
	^ state winner
]

{ #category : #accessing }
GameSmalltalkers >> winningLaps [
	^ winningLaps
]

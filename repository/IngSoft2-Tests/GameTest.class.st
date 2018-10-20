Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'rodri',
		'fran',
		'players',
		'dice',
		'chargedStrategy',
		'diceCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> gamedWithDiceSequence: diceSequence andEffectSequence: effectSequence [
	|game board |
	chargedStrategy := ChargedStrategy withSequence: diceSequence.
	dice := Dice faces: 4 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	board := Board effects: effectSequence.
	game := Game
		playedBy: players
		onBoard: board
		withDices: diceCollection
		withWinningLaps: 2.
	^ game
]

{ #category : #tests }
GameTest >> setUp [
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.

]

{ #category : #tests }
GameTest >> testAdvancePlayer [
	| speedUp wormHole effectSequence game |
	speedUp := SpeedUp new.
	wormHole := WormHole new.
	effectSequence := OrderedCollection new.
	effectSequence
		add: wormHole;
		add: wormHole;
		add: speedUp.
	game := self gamedWithDiceSequence: #(1 2 3 4) andEffectSequence: effectSequence.
	self assert: (game positionOf: rodri) equals: 0.
	game player: rodri advance: 5.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 1.
	game player: rodri advance: 2.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game lapsOf: rodri) equals: 2.
	game player: rodri advance: 1.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 2.
	game player: rodri advance: 1.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 3.
	game player: rodri advance: -1.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 2.
	game player: rodri advance: -3.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 1.
	game player: rodri advance: -1.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game lapsOf: rodri) equals: 1.
	game player: rodri advance: -4.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 0.
	game player: rodri advance: -6.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: -2
]

{ #category : #tests }
GameTest >> testChangingTurn [
	| speedUp wormHole effectSequence game |
	speedUp := SpeedUp new.
	wormHole := WormHole new.
	effectSequence := OrderedCollection new.
	effectSequence
		add: wormHole;
		add: wormHole;
		add: speedUp.
	game := self gamedWithDiceSequence: #(1 2 3 4) andEffectSequence: effectSequence.
	self assert: game turn equals: rodri.
	self
		should: [ game play: fran ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'it is not your turn' ].
	game changeTurn.
	self assert: game turn equals: fran.
	self
		should: [ game play: rodri ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'it is not your turn' ]
]

{ #category : #tests }
GameTest >> testInstanceCreationGameAndAccesing [
	| game speedUp wormHole effectSequence |
	speedUp := SpeedUp new.
	wormHole := WormHole new.
	effectSequence := OrderedCollection new.
	effectSequence
		add: wormHole;
		add: wormHole;
		add: speedUp.
	game := self gamedWithDiceSequence:#(1 3 5 7)  andEffectSequence: effectSequence .
	self assert: game hasEnded equals: false
]

{ #category : #tests }
GameTest >> testPlayingGameWithEffects [
	| game effectSequence ranking wormHole speedUp moonWalk atomicBomb anotherMoonWalk withoutEffect |
	wormHole := WormHole new.
	withoutEffect := WithoutEffect new.
	speedUp := SpeedUp new.
	moonWalk := MoonWalk goBack: 1.
	atomicBomb := AtomicBomb new.
	anotherMoonWalk := MoonWalk goBack: 2.
	effectSequence := OrderedCollection new.
	effectSequence
		add: speedUp;
		add: wormHole;
		add: moonWalk;
		add: atomicBomb;
		add: anotherMoonWalk;
		add: speedUp;
		add: speedUp;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect.
	game := self gamedWithDiceSequence: #(8 2 2 2) andEffectSequence: effectSequence.
	self assert: game board length equals: 10.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 4.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: game hasEnded equals: false.
	self
		should: [ game winner ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Game isnt finished' ].
	self assert: game turn equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 4.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: game hasEnded equals: false.
	self assert: (game lapsOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: game turn equals: rodri.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 3.
	self assert: (game lapsOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 2.
	self assert: game hasEnded equals: true.
	self assert: game winner equals: rodri.
	ranking := game rankPlayers.
	self assert: (ranking at: 1) equals: rodri.
	self assert: (ranking at: 2) equals: fran.
	self assert: (game scoreOf: rodri) equals: 22.
	self assert: (game scoreOf: fran) equals: 3
]

{ #category : #tests }
GameTest >> testPlayingGameWithoutEffects [
	| game effectSequence ranking withoutEffect |
	withoutEffect := WithoutEffect new.
	effectSequence := OrderedCollection new.
	effectSequence
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect;
		add: withoutEffect.
	game := self gamedWithDiceSequence: #(5 3 5 7) andEffectSequence: effectSequence.
	self assert: game board length equals: 10.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: game hasEnded equals: false.
	self assert: game turn equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 2.
	self assert: game hasEnded equals: false.
	self assert: game turn equals: rodri.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 6.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: game hasEnded equals: false.
	self assert: game turn equals: fran.
	self
		should: [ game play: rodri ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'it is not your turn' ].
	game play: fran.
	self assert: (game positionOf: fran) equals: 4.
	self assert: (game lapsOf: fran) equals: 2.
	self assert: game turn equals: rodri.
	self assert: game hasEnded equals: true.
	self assert: game winner equals: fran.
	ranking := game rankPlayers.
	self assert: (ranking at: 1) equals: fran.
	self assert: (ranking at: 2) equals: rodri.
	self assert: (game scoreOf: fran) equals: 24.
	self assert: (game scoreOf: rodri) equals: 16
]

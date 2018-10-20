Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'players',
		'rodri',
		'fran'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> initializeGameWithSequence: effectsCollection [
	| chargedStrategy dice diceCollection board game|
	chargedStrategy := ChargedStrategy withSequence: #(1 3 5 7).
	dice := Dice faces: 4 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	board := Board effects: effectsCollection.
	game := Game
		playedBy: players
		onBoard: board
		withDices: diceCollection
		withWinningLaps: 1.
	^ game
]

{ #category : #tests }
BoardTest >> setUp [
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran
]

{ #category : #tests }
BoardTest >> testApplyingAtomicBombEffect [
	| game atomicBomb anotherAtomicBomb effectsSequence |
	atomicBomb := AtomicBomb new.
	anotherAtomicBomb := AtomicBomb new.
	effectsSequence := OrderedCollection new.
	effectsSequence
		add: atomicBomb;
		add: anotherAtomicBomb.
	game := self initializeGameWithSequence: effectsSequence.
	game player: rodri advance: 3.
	game player: fran advance: 4.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 2.
	self assert: (game lapsOf: rodri) equals: 1.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 2.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 2
]

{ #category : #tests }
BoardTest >> testApplyingEffects [
	| game speedUp wormhole sequence withoutEffect atomicBomb moonWalk |
	speedUp := SpeedUp new.
	wormhole := WormHole new.
	withoutEffect := WithoutEffect new.
	atomicBomb := AtomicBomb new.
	moonWalk := MoonWalk goBack: 1.
	sequence := OrderedCollection new.
	sequence
		add: atomicBomb;
		add: wormhole;
		add: withoutEffect;
		add: speedUp;
		add: moonWalk.
	game := self initializeGameWithSequence: sequence.
	self assert: game board length equals: 5.
	game player: rodri advance: 5.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game lapsOf: fran) equals: 0.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game lapsOf: fran) equals: 0.
	game player: fran advance: 8.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 3.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game lapsOf: fran) equals: 1.
	game board activeEffect: game to: fran.
	self assert: (game board effect: (game positionOf: fran)) equals: withoutEffect.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 2.
]

{ #category : #tests }
BoardTest >> testApplyingMoonWalkEffect [
	| game moonWalk sequence anotherMoonWalk |
	moonWalk := MoonWalk goBack: 1.
	anotherMoonWalk := MoonWalk goBack: 2.
	sequence := OrderedCollection new.
	sequence
		add: moonWalk;
		add: anotherMoonWalk;
		add: anotherMoonWalk.
	game := self initializeGameWithSequence: sequence.
	self assert: game board length equals: 3.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 2.
	self assert: (game lapsOf: fran) equals: 4.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 1.
	self assert: (game lapsOf: fran) equals: 3.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 1.
	self assert: (game lapsOf: fran) equals: 3
]

{ #category : #tests }
BoardTest >> testApplyingSpeedUpEffect [
	| game speedUp sequence |
	speedUp := SpeedUp new.
	sequence := OrderedCollection new.
	sequence
		add: speedUp;
		add: speedUp;
		add: speedUp;
		add: speedUp.
	game := self initializeGameWithSequence: sequence.
	self assert: game board length equals: 4.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 3.
	self assert: (game lapsOf: rodri) equals: 2.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 3.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 3.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 3.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 4
]

{ #category : #tests }
BoardTest >> testApplyingWormHoleEffect [
	| game wormHole sequence |
	wormHole := WormHole new.
	sequence := OrderedCollection new.
	sequence
		add: wormHole;
		add: wormHole;
		add: wormHole.
	game := self initializeGameWithSequence: sequence.
	self assert: game board length equals: 3.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 4.
	self assert: (game lapsOf: rodri) equals: 2.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 4.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 2.
]

{ #category : #tests }
BoardTest >> testInstanceCreationAndAccessing [
	| game moonWalk sequence speedUp |
	moonWalk := MoonWalk goBack: 6.
	speedUp := SpeedUp new.
	sequence := OrderedCollection new.
	sequence
		add: moonWalk;
		add: speedUp.
	game := self initializeGameWithSequence: sequence.
	self assert: game board length equals: 2
]

{ #category : #tests }
BoardTest >> testInstanceCreationRandomEffects [
	| game effect sequence |
	sequence := OrderedCollection new.
	effect := RandomCreatorEffects new.
	sequence
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect;
		add: effect nextEffect.
	game := self initializeGameWithSequence: sequence.
	self assert: game board length equals: 10
]

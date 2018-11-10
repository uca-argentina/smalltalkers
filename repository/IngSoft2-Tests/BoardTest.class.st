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

{ #category : #'test-support' }
BoardTest >> gameWithDiceRolling: effectsCollection [
	| chargedStrategy dice diceCollection board game|
	chargedStrategy := LoadedStrategy withSequence: #(1 3 5 7).
	dice := Dice faces: 4 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	board := Board effects: effectsCollection.
	game := GameSmalltalkers
		playedBy: players
		onBoard: board
		withDices: diceCollection
		withWinningLaps: 1.
	^ game
]

{ #category : #running }
BoardTest >> setUp [
	players := OrderedCollection new.
	rodri := Player named: 'Rodri' with: 'asd'.
	fran := Player named: 'Fran' with: 'asd'.
	players := OrderedCollection new
		add: rodri;
		add: fran;
		yourself.
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
	game := self gameWithDiceRolling: effectsSequence.
	game player: rodri advance: 3.
	game player: fran advance: 4.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 2.
	self assert: (game lapsOf: rodri) equals: 1.
	game board applyEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 2.
	game board applyEffect: game to: fran.
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
	game := self gameWithDiceRolling: sequence.
	self assert: game board length equals: 5.
	game player: rodri advance: 5.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game lapsOf: fran) equals: 0.
	game board applyEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game lapsOf: fran) equals: 0.
	game player: fran advance: 8.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 3.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game lapsOf: fran) equals: 1.
	game board applyEffect: game to: fran.
	self assert: (game board effectAt: (game positionOf: fran)) equals: withoutEffect.
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
	game := self gameWithDiceRolling: sequence.
	self assert: game board length equals: 3.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: rodri) equals: 2.
	self assert: (game lapsOf: fran) equals: 4.
	game board applyEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 1.
	self assert: (game lapsOf: fran) equals: 3.
	game board applyEffect: game to: fran.
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
	game := self gameWithDiceRolling: sequence.
	self assert: game board length equals: 4.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 3.
	self assert: (game lapsOf: rodri) equals: 2.
	game board applyEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 3.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 3.
	game board applyEffect: game to: fran.
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
	game := self gameWithDiceRolling: sequence.
	self assert: game board length equals: 3.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 4.
	self assert: (game lapsOf: rodri) equals: 2.
	game board applyEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 1.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 4.
	game board applyEffect: game to: fran.
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
	game := self gameWithDiceRolling: sequence.
	self assert: game board length equals: 2
]

{ #category : #tests }
BoardTest >> testInstanceCreationRandomEffects [
	| game effect sequence |
	sequence := OrderedCollection new.
	effect := RandomEffectCreator new.
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
	game := self gameWithDiceRolling: sequence.
	self assert: game board length equals: 10
]

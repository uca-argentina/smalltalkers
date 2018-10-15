Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> intializeGame: players with: sequence [
	| chargedstrategy dice dicecollection board game strategy|
	strategy := ChargedEffectStrategy withSequence: sequence.
	chargedstrategy := ChargedStrategy withSequence: #(1 3 5 7).
	dice := Dice faces: 4 withStrategy: chargedstrategy.
	dicecollection := OrderedCollection new.
	dicecollection
		add: dice;
		add: dice.
	board := Board length: 10 andStrategy: strategy.
	game := Game
		playedBy: players
		onBoard: board
		withDices: dicecollection
		withWinningLaps: 1.
	^ game
]

{ #category : #tests }
BoardTest >> testApplyingAtomicBombEffect [
	| game rodri fran players atomicbomb sequence |
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	atomicbomb := AtomicBomb new.
	sequence := OrderedCollection new.
	sequence add: atomicbomb.
	game := self intializeGame: players with: sequence.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 1.
	self assert: (game lapsOf: rodri) equals: 0.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 1.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game lapsOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	self assert: (game lapsOf: fran) equals: 1.
]

{ #category : #tests }
BoardTest >> testApplyingEffects [
	| game rodri fran players speedup wormhole sequence withouteffect atomicbomb |
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	speedup := SpeedUp new.
	wormhole := WormHole new.
	withouteffect := WithoutEffect new.
	atomicbomb := AtomicBomb new.
	sequence := OrderedCollection new.
	sequence add: atomicbomb.
	game := self intializeGame: players with: sequence.
	game player: rodri advance: 8.
	game player: fran advance: 8.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: (game positionOf: fran) equals: 8.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0.
	game player: rodri advance: 8.
	game player: fran advance: 8.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 0
]

{ #category : #tests }
BoardTest >> testApplyingMoonWalkEffect [
	| game rodri fran players moonwalk sequence |
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	moonwalk := MoonWalk goBack: 6.
	sequence := OrderedCollection new.
	sequence add: moonwalk.
	game := self intializeGame: players with: sequence.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: rodri) equals: 0.
	self assert: (game lapsOf: fran) equals: 1.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: (game lapsOf: rodri) equals: 0.
	self assert: (game lapsOf: fran) equals: 0.
	self assert: (game positionOf: fran) equals: 6
]

{ #category : #tests }
BoardTest >> testApplyingSpeedUpEffect [
	| game rodri fran players speedup sequence |
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	speedup := SpeedUp new.
	sequence := OrderedCollection new.
	sequence add: speedup.
	game := self intializeGame: players with: sequence.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 1.
	self assert: (game lapsOf: rodri) equals: 0.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 1.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 2.
	self assert: (game lapsOf: rodri) equals: 1.
	self assert: (game positionOf: fran) equals: 6.
	self assert: (game lapsOf: fran) equals: 1
]

{ #category : #tests }
BoardTest >> testApplyingWormHoleEffect [
	| game rodri fran players wormhole sequence |
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	wormhole := WormHole new.
	sequence := OrderedCollection new.
	sequence add: wormhole.
	game := self intializeGame: players with: sequence.
	game player: rodri advance: 8.
	game player: fran advance: 12.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 1.
	self assert: (game lapsOf: rodri) equals: 0.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 4.
	self assert: (game lapsOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 2.
	self assert: (game lapsOf: fran) equals: 1.
	game board activeEffect: game to: fran.
	self assert: (game positionOf: rodri) equals: 4.
	self assert: (game lapsOf: rodri) equals: 0.
	self assert: (game positionOf: fran) equals: 8.
	self assert: (game lapsOf: fran) equals: 0.
]

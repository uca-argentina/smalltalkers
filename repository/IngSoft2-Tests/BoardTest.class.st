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
	board := Board length: 30 andStrategy: strategy.
	game := Game
		playedBy: players
		onBoard: board
		withDices: dicecollection
		withWinningLaps: 1.
	^ game
]

{ #category : #tests }
BoardTest >> testApplyingEffects [
	| game rodri fran players speedup wormhole sequence withouteffect |
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
	sequence := OrderedCollection new.
	sequence
		add: withouteffect;
		add: wormhole;
		add: speedup.
	game := self intializeGame: players with: sequence.
	game player: rodri advance: 8.
	self assert: (game positionOf: rodri) equals: 8.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 8.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 4.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 8.
	game board activeEffect: game to: rodri.
	self assert: (game positionOf: rodri) equals: 8
]

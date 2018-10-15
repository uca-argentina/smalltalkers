Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> intializeGame: players withDiceSequence: diceSequence andEffectSequence: effectSequence [
	| chargedstrategy dice dicecollection board game strategy |
	chargedstrategy := ChargedStrategy withSequence: diceSequence.
	strategy := ChargedEffectStrategy withSequence: effectSequence.
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
GameTest >> testChangingTurn [
	| rodri fran game players speedup wormhole effectsequence |
	speedup := SpeedUp new.
	wormhole := WormHole new.
	effectsequence := OrderedCollection new.
	effectsequence
		add: wormhole;
		add: wormhole;
		add: speedup.
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	game := self intializeGame: players withDiceSequence: #(1 3 5 7) andEffectSequence: effectsequence.
	self assert: game turn equals: rodri.
	self should: [ game play: fran ] raise: AssertionFailure.
	game changeTurn.
	self assert: game turn equals: fran.
	self should: [ game play: rodri ] raise: AssertionFailure
]

{ #category : #tests }
GameTest >> testInstanceCreationGameAndAccesing [
	| rodri fran game players speedup wormhole effectsequence |
	speedup := SpeedUp new.
	wormhole := WormHole new.
	effectsequence := OrderedCollection new.
	effectsequence
		add: wormhole;
		add: wormhole;
		add: speedup.
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	game := self intializeGame: players withDiceSequence: #(1 3 5 7) andEffectSequence: effectsequence.
	self assert: game finished equals: false
]

{ #category : #tests }
GameTest >> testPlayingGameWithoutEffects [
	| rodri fran game players speedup wormhole effectsequence ranking withouteffect |
	speedup := SpeedUp new.
	wormhole := WormHole new.
	withouteffect:= WithoutEffect new.
	effectsequence := OrderedCollection new.
	effectsequence
		add: withouteffect.
	players := OrderedCollection new.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	game := self intializeGame: players withDiceSequence: #(1 3 5 7) andEffectSequence: effectsequence.	game play: rodri.
	self assert: (game positionOf: rodri) equals: 4.
	self assert: game finished equals: false.
	self assert: game turn equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 12.
	self assert: game finished equals: false.
	self assert: game turn equals: rodri.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 8.
	self assert: game finished equals: false.
	self assert: game turn equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 24.
	self assert: game finished equals: false.
	self assert: game turn equals: rodri.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 12.
	self assert: game finished equals: false.
	self assert: game turn equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 6.
	self assert: game finished equals: fran.
	self assert: (game lapsOf: fran) equals: 1.
	ranking := game rankPlayers.
	self assert: (ranking at: 1) equals: fran.
	self assert: (ranking at: 2) equals: rodri.
	self assert: (game scoreOf: fran) equals: 36.
	self assert: (game scoreOf: rodri) equals: 12
]

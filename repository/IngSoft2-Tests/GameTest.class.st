Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testChangingTurn [
	| players diceCollection chargedStrategy dice rodri board fran game |
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	dice := Dice faces: 4 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	board := Board length: 20.
	
	game := Game playedBy: players onBoard: board withDices: diceCollection withWinningLaps:1.
	self assert: game turn = rodri.
	self should: [ game play: fran] raise: AssertionFailure.
	game changeTurn.
	self assert: game turn = fran.
	self should: [ game play: rodri] raise: AssertionFailure.
]

{ #category : #tests }
GameTest >> testInstanceCreationGameAndAccesing [
	| rodri juan players diceCollection dice chargedStrategy game board |
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	rodri := Player named: 'Rodri'.
	juan := Player named: 'Juan'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: juan.
	board := Board length: 20.
	game := Game playedBy: players onBoard: board withDices: diceCollection withWinningLaps:1.
	self assert: game finished equals: false
]

{ #category : #tests }
GameTest >> testPlayingGame [
	| rodri fran players diceCollection dice chargedStrategy game ranking board|
	chargedStrategy := ChargedStrategy withSequence: #(1 3 5 7).
	dice := Dice faces: 4 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	rodri := Player named: 'Rodri'.
	fran := Player named: 'Fran'.
	players := OrderedCollection new.
	players
		add: rodri;
		add: fran.
	board := Board length: 30.
	game := Game playedBy: players onBoard: board withDices: diceCollection withWinningLaps: 1.
	game play: rodri.
	self assert: (game positionOf: rodri) equals: 4.
	self assert: game finished equals: false.
	self assert: (game turn) = fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 12.
	self assert: game finished equals: false.
	self assert: (game turn) equals: rodri.
	game play: rodri.
	self assert: (game positionOf: rodri)equals: 8.
	self assert: game finished equals: false.
	self assert: (game turn) equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 24.
	self assert: game finished equals: false.
	self assert: (game turn) equals: rodri.
	game play: rodri.
	self assert: (game positionOf: rodri)equals: 12.
	self assert: game finished equals: false.
	self assert: (game turn) equals: fran.
	game play: fran.
	self assert: (game positionOf: fran) equals: 6.
	self assert: game finished equals: fran.
	self assert: (game lapsOf: fran) equals: 1.
	ranking:=game rankPlayers.
	self assert: (ranking at:1) equals: fran.
	self assert: (ranking at:2) equals: rodri.
	self assert: (game scoreOf: fran) equals: 36.
	self assert: (game scoreOf: rodri) equals: 12.
]

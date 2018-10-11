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
	game := Game playedBy: players onBoard: board withDices: diceCollection.
	self assert: game turn = rodri.
	game changeTurn.
	self assert: game turn = fran
]

{ #category : #tests }
GameTest >> testInstanceCreationGameAndAccesing [
	| rodri juan playerSet diceCollection dice chargedStrategy game board |
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	rodri := Player named: 'Rodri'.
	juan := Player named: 'Juan'.
	playerSet := OrderedCollection new.
	playerSet
		add: rodri;
		add: juan.
	board := Board length: 20.
	game := Game playedBy: playerSet onBoard: board withDices: diceCollection.
	self assert: game finished equals: false
]

{ #category : #tests }
GameTest >> testPlayingGame [
	| rodri fran players diceCollection dice chargedStrategy game ranking board|
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
	board := Board length: 10.
	game := Game playedBy: players onBoard: board withDices: diceCollection.
	game play: 'Rodri'.
	self assert: rodri position equals: 3.
	self assert: game finished equals: false.
	self assert: (game turn) = fran.
	game play: 'Fran'.
	self assert: fran position equals: 7.
	self assert: game finished equals: false.
	self assert: (game turn) equals: rodri.
	game play: 'Rodri'.
	self assert: rodri position equals: 6.
	self assert: game finished equals: false.
	self assert: (game turn) equals: fran.
	game play:'Fran'.
	self assert: fran position equals: 14.
	self assert: game finished equals: fran.
	ranking:=game rankPlayers.
	self assert: (ranking at:1) equals: fran.
	self assert: (ranking at:2) equals: rodri
]

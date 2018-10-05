Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testInstanceCreationGameAndAccesing [
	| rodri juan playerSet diceCollection dice chargedStrategy game |
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
	game := Game playedBy: playerSet onBoardLenght: 20 withDices: diceCollection.
	self assert: game finished equals: false 
]

{ #category : #tests }
GameTest >> testPlayingGame [
	| rodri fran players diceCollection dice chargedStrategy game ranking|
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
	game := Game playedBy: players onBoardLenght: 20 withDices: diceCollection.
	rodri roll: diceCollection.
	self assert: rodri position equals: 3.
	self assert: game finished equals: false.
	self assert: (game changeTurn: fran) equals: fran.
	fran roll: diceCollection.
	self assert: fran position equals: 7.
	self assert: game finished equals: false.
	self assert: (game changeTurn: rodri) equals: rodri.
	rodri roll: diceCollection.
	self assert: rodri position equals: 6.
	self assert: game finished equals: false.
	self assert: (game changeTurn: fran) equals: fran.
	fran roll: diceCollection.
	self assert: fran position equals: 14.
	self assert: game finished equals: false.
	self assert: (game changeTurn: rodri) equals: rodri.
	rodri roll: diceCollection.
	self assert: rodri position equals: 9.
	self assert: game finished equals: false.
	self assert: (game changeTurn: fran) equals: fran.
	fran roll: diceCollection.
	self assert: fran position equals: 21.
	self assert: game finished equals: fran.
	ranking:=game rankPlayers.
	self assert: (ranking at:1) equals: fran.
	self assert: (ranking at:2) equals: rodri	
]

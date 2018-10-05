Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testBoardPlayerRanking [
	| playerRodri playerJuan board diceCollection playerSet dice chargedStrategy ranking |
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection
		add: dice;
		add: dice.
	playerRodri := Player named: 'Rodri'.
	playerJuan := Player named: 'Juan'.
	playerSet := Set new.
	playerSet
		add: playerRodri;
		add: playerJuan.
	playerRodri advancePosition: (playerRodri roll: diceCollection).
	playerJuan advancePosition: (playerJuan roll: diceCollection).
	board := Board sized: 20.
	ranking := board rankPlayers: playerSet.
	self assert: (ranking at: 1) equals: playerJuan.
	self assert: (ranking at: 2) equals: playerRodri
]

{ #category : #tests }
BoardTest >> testCreatingBoard [
	| table |
	table := Board sized: 100.
	self assert: table positions equals: 100
]

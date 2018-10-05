Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerRollAndAdvance [
	| dice diceCollection player chargedStrategy |
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection add: dice.
	diceCollection add: dice.
	player := Player named: 'Rodri'.
	player roll: diceCollection.
	self assert: player position equals: 3.
	player roll: diceCollection.
	self assert: player position equals: 10.
	player roll: diceCollection.
	self assert: player position equals: 13.
	player roll: diceCollection.
	self assert: player position equals: 20
]

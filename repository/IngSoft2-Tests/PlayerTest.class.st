Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerRoll [
	| dice diceCollection player chargedStrategy |
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection add: dice.
	diceCollection add: dice.
	player := Player named: 'Rodri'.
	self assert: (player roll: diceCollection) equals:  3.
	self assert: (player roll: diceCollection) equals:  7.
	
]

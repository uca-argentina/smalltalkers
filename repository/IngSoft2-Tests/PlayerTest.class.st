Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerRoll [
	| dice anotherDice diceCollection player chargedStrategy anotherChargedStrategy|
	chargedStrategy := ChargedStrategy withSequence: #(1 2 3 4).
	anotherChargedStrategy := ChargedStrategy withSequence: #(2 3 4 5).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	anotherDice := Dice faces: 6 withStrategy: anotherChargedStrategy.
	diceCollection := OrderedCollection new.
	diceCollection add: dice.
	diceCollection add: anotherDice.
	player := Player named: 'Rodri'.
	self assert: (player roll: diceCollection) equals:  3.
	self assert: (player roll: diceCollection) equals:  5.
	self assert: (player roll: diceCollection) equals:  7.
	self assert: (player roll: diceCollection) equals:  9.
	self assert: (player roll: diceCollection) equals:  3.
	
]

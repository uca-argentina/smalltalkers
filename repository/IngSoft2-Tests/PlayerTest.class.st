Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerRoll [
	| dice anotherDice diceCollection player chargedStrategy anotherChargedStrategy cardCollection overload speed |
	chargedStrategy := LoadedStrategy withSequence: #(1 2 3 4).
	anotherChargedStrategy := LoadedStrategy withSequence: #(2 3 4 5).
	dice := Dice faces: 6 withStrategy: chargedStrategy.
	anotherDice := Dice faces: 6 withStrategy: anotherChargedStrategy.
	diceCollection := OrderedCollection new
		add: dice;
		add: anotherDice;
		yourself.
	overload := Overload new.
	speed := Speed new.
	cardCollection := OrderedCollection new
		add: overload;
		add: speed;
		yourself.
	player := Player named: 'Rodri' with: cardCollection.
	self assert: (player roll: diceCollection) equals: 3.
	self assert: (player roll: diceCollection) equals: 5.
	self assert: (player roll: diceCollection) equals: 7.
	self assert: (player roll: diceCollection) equals: 9.
	self assert: (player roll: diceCollection) equals: 3
]

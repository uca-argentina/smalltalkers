Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testDiceCreationInstanceAndRoll [
	|chargedstrategy dice|
	chargedstrategy := ChargedStrategy withSequence: #(1 2 4 5).
	dice:= Dice faces:5 withStrategy: chargedstrategy.
	self assert: dice roll equals:1.
	self assert: dice roll equals:2.
	self assert: dice roll equals:4.
	self assert: dice roll equals:5.
]

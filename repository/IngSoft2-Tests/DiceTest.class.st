Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testDiceCreationInstanceAndRoll [
	|chargedStrategy dice|
	chargedStrategy := LoadedStrategy withSequence: #(1 2 4 5).
	dice:= Dice faces:5 withStrategy: chargedStrategy.
	self assert: dice roll equals:1.
	self assert: dice roll equals:2.
	self assert: dice roll equals:4.
	self assert: dice roll equals:5.
]

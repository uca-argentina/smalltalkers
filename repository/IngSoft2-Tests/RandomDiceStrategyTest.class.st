Class {
	#name : #RandomDiceStrategyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RandomDiceStrategyTest >> testRollRandomDiceStrategy [
	| dice randomStrategy |
	randomStrategy := RandomStrategy new.
	dice := Dice faces: 7 withStrategy: randomStrategy.
	self assert: (dice roll between: 1 and: 7).
]

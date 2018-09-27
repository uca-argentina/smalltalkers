Class {
	#name : #TestRandomDice,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TestRandomDice >> testRandomDiceCreation [
	| dice |
	dice := DiceRandom  withNumberOfFaces: 6.
	self assert: dice faceValue equals: 6.
]

{ #category : #tests }
TestRandomDice >> testRollRandom [
	| dice |
	dice := DiceRandom withNumberOfFaces: 6.
	self assert: (dice roll between: 1 and: 6)
]

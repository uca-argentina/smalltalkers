Class {
	#name : #TestChargedDice,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TestChargedDice >> testDiceCreation [
	| dice |
	dice := DiceCharged withNumberOfFaces: 6.
	self assert: dice faceValue equals: 6
]

{ #category : #tests }
TestChargedDice >> testRollDice [
	| dice |
	dice := DiceCharged withNumberOfFaces: 6.
	self assert: dice roll equals: 6
]

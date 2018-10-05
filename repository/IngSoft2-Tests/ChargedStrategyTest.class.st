Class {
	#name : #ChargedStrategyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ChargedStrategyTest >> testChargedStrategyCreationAndAccesing [
	|sequence chargedStrategy|
	sequence:= #(4 5 6).
	chargedStrategy := ChargedStrategy withSequence: sequence.
	self assert: (chargedStrategy next:6) equals:4.
	self assert: (chargedStrategy next:6) equals:5.
	self assert: (chargedStrategy next:6) equals:6.
	self assert: (chargedStrategy next:6) equals:4.
]

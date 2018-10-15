Class {
	#name : #ChargedStrategyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ChargedStrategyTest >> testChargedStrategyCreationAndAccesing [
	| sequence chargedstrategy |
	sequence := #(4 5 6).
	chargedstrategy := ChargedStrategy withSequence: sequence.
	self assert: (chargedstrategy next: 6) equals: 4.
	self assert: (chargedstrategy next: 6) equals: 5.
	self assert: (chargedstrategy next: 6) equals: 6.
	self assert: (chargedstrategy next: 6) equals: 4
]

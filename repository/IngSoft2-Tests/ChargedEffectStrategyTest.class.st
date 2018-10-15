Class {
	#name : #ChargedEffectStrategyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ChargedEffectStrategyTest >> testChargedEffects [
	| sequence chargedstrategy speedup wormhole |
	speedup := SpeedUp new.
	wormhole := WormHole new.
	sequence := OrderedCollection new.
	sequence
		add: speedup;
		add: wormhole.
	chargedstrategy := ChargedEffectStrategy withSequence: sequence.
	self assert: chargedstrategy nextEffect equals: speedup.
	self assert: chargedstrategy nextEffect equals: wormhole.
	self assert: chargedstrategy nextEffect equals: speedup.
]

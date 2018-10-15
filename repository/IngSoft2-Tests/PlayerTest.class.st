Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerRoll [
	| dice anotherdice dicecollection player chargedstrategy anotherchargedstrategy|
	chargedstrategy := ChargedStrategy withSequence: #(1 2 3 4).
	anotherchargedstrategy := ChargedStrategy withSequence: #(2 3 4 5).
	dice := Dice faces: 6 withStrategy: chargedstrategy.
	anotherdice := Dice faces: 6 withStrategy: anotherchargedstrategy.
	dicecollection := OrderedCollection new.
	dicecollection add: dice.
	dicecollection add: anotherdice.
	player := Player named: 'Rodri'.
	self assert: (player roll: dicecollection) equals:  3.
	self assert: (player roll: dicecollection) equals:  5.
	self assert: (player roll: dicecollection) equals:  7.
	self assert: (player roll: dicecollection) equals:  9.
	self assert: (player roll: dicecollection) equals:  3.
	
]

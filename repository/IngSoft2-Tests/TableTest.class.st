Class {
	#name : #TableTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TableTest >> testCreatingTable [
	 |table|
	table := Table sized: 100.
	self assert: table positions equals: 100.
]

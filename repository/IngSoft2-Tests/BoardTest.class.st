Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testCreatingBoard [
	| table |
	table := Board length: 100.
	self assert: table length equals: 100
]

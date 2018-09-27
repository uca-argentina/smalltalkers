Class {
	#name : #TestTable,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TestTable >> testCreatingTable [
	 |table|
	table := Table withSize: 100.
	self assert: table positions equals: 100.
	
]

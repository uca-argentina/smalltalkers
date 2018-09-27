Class {
	#name : #Table,
	#superclass : #Object,
	#instVars : [
		'positions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Table class >> assertWithValidValueOfPositions: aValue [
	(aValue <= 0) ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ].
]

{ #category : #initialization }
Table class >> withSize: aSize [
	self assertWithValidValueOfPositions: aSize.
	^ self new initializeWithSize: aSize
]

{ #category : #initialization }
Table >> initializeWithSize: aSize [
	positions := aSize.
]

{ #category : #accessing }
Table >> positions [
	^ positions
]

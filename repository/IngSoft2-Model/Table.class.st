Class {
	#name : #Table,
	#superclass : #Object,
	#instVars : [
		'positions',
		'ranking',
		'playerTurn',
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Table class >> assertWithValidValueOfPositions: aValue [
	(aValue <= 0) ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ].
]

{ #category : #initialization }
Table class >> sized: aSize [
	self assertWithValidValueOfPositions: aSize.
	^ self new initializeWithSize: aSize
]

{ #category : #initialization }
Table >> initializeWithSize: aSize [
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 position >= p2 position ].
	positions := aSize.
]

{ #category : #accessing }
Table >> positions [
	^ positions
]

{ #category : #accessing }
Table >> rankPlayers: aPlayerSet [
	ranking addAll: aPlayerSet.
	^ ranking
]

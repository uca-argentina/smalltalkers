Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'positions',
		'ranking'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertWithValidValueOfPositions: aValue [
	aValue <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ]
]

{ #category : #initialization }
Board class >> sized: aSize [
	self assertWithValidValueOfPositions: aSize.
	^ self new initializeWithSize: aSize
]

{ #category : #initialization }
Board >> initializeWithSize: aSize [
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 position >= p2 position ].
	positions := aSize
]

{ #category : #accessing }
Board >> positions [
	^ positions
]

{ #category : #accessing }
Board >> rankPlayers: players [
	ranking addAll: players.
	^ ranking
]

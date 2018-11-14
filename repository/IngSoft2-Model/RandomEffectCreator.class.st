Class {
	#name : #RandomEffectCreator,
	#superclass : #Object,
	#instVars : [
		'distribution',
		'randomNumberDistribution',
		'randomMoonWalkNumber',
		'boardSize'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
RandomEffectCreator class >> assertWithValidValueOfBoardLength: aValue [
	aValue <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a Random Creator Effects' ]
]

{ #category : #'instance creation' }
RandomEffectCreator class >> withBoardSize: aSize [
	self assertWithValidValueOfBoardLength: aSize.
	^ self new initializeWithBoardSize: aSize.
]

{ #category : #accessing }
RandomEffectCreator >> giveMeAnEffect: aNumber [
	distribution
		at: (1 to: 48) put: [ WithoutEffect new ];
		at: (49 to: 68) put: [ WormHole new ];
		at: (69 to: 88) put: [ SpeedUp new ];
		at: (89 to: 98) put: [ MoonWalk goBack: (randomMoonWalkNumber nextInt: boardSize) ];
		at: (99 to: 100) put: [ AtomicBomb new ].
	distribution keys
		detect: [ :interval | interval includes: aNumber ]
		ifFound: [ :foundInterval | ^ (distribution at: foundInterval) value ]
		ifNone: [ GameException signal: 'value not found' ]
]

{ #category : #initialization }
RandomEffectCreator >> initializeWithBoardSize: aSize [
	randomNumberDistribution := Random new.
	randomMoonWalkNumber := Random new.
	distribution := Dictionary new.
	boardSize := aSize
]

{ #category : #iterating }
RandomEffectCreator >> nextEffect [
	^ self giveMeAnEffect: (randomNumberDistribution nextInt: 100)
]

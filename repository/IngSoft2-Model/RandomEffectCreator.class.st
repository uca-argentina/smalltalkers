Class {
	#name : #RandomEffectCreator,
	#superclass : #Object,
	#instVars : [
		'distribution',
		'randomNumberDistribution',
		'randomMoonWalkNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomEffectCreator >> giveMeAnEffect: aNumber [
	distribution
		at: (1 to: 48) put: [ WithoutEffect new ];
		at: (49 to: 68) put: [ WormHole new ];
		at: (69 to: 88) put: [ SpeedUp new ];
		at: (89 to: 98) put: [ MoonWalk goBack: (randomMoonWalkNumber nextInt: 100) ];
		at: (99 to: 100) put: [ AtomicBomb new ].
	distribution keys detect: [ :interval | interval includes: aNumber ] ifFound: [ :foundInterval | ^ (distribution at: foundInterval) value ]
]

{ #category : #initialization }
RandomEffectCreator >> initialize [
	randomNumberDistribution := Random new.
	randomMoonWalkNumber := Random new.
	distribution := Dictionary new
]

{ #category : #iterating }
RandomEffectCreator >> nextEffect [
	^ self giveMeAnEffect: (randomNumberDistribution nextInt: 100)
]

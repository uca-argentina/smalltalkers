Class {
	#name : #RandomCreatorEffects,
	#superclass : #Object,
	#instVars : [
		'distribution',
		'rand'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomCreatorEffects >> giveMeAnEffect: aNumber [
	distribution := Dictionary new
		at: (1 to: 48) put: [ WithoutEffect new ];
		at: (49 to: 68) put: [ WormHole new ];
		at: (69 to: 88) put: [ SpeedUp new ];
		at: (89 to: 98) put: [ MoonWalk goBack: 5 ];
		at: (99 to: 100) put: [ AtomicBomb new ];
		yourself.
	distribution keys detect: [ :interval | interval includes: aNumber ] ifFound: [ :foundInterval | ^ (distribution at: foundInterval) value ]
	"ifAbsent: [ AssertionFailure signal: 'value not found']"
]

{ #category : #initialization }
RandomCreatorEffects >> initialize [
	rand := Random new.
]

{ #category : #accessing }
RandomCreatorEffects >> nextEffect [
	^ self giveMeAnEffect: (rand nextInt: 100)
]

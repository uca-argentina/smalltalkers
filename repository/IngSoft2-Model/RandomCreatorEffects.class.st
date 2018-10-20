Class {
	#name : #RandomCreatorEffects,
	#superclass : #Object,
	#instVars : [
		'distribution'
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
]

{ #category : #accessing }
RandomCreatorEffects >> nextEffect [
	| rand |
	rand := Random new.
	rand := (rand next * (100 - 1)) truncated + 1.
	^ self giveMeAnEffect: rand.
]

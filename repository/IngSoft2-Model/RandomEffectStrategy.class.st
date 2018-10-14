Class {
	#name : #RandomEffectStrategy,
	#superclass : #EffectStrategy,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomEffectStrategy >> nextEffect [
	| rand |
	rand := Random new.
	rand := (rand next * (100 - 1)) truncated + 1.
	(rand between: 1 and: 48)
		ifTrue: [ ^ WithoutEffect new ].
	(rand between: 49 and: 68)
		ifTrue: [ ^ WormHole new ].
	(rand between: 69 and: 88)
		ifTrue: [ ^ SpeedUp new ].
	(rand between: 89 and: 98)
		ifTrue: [ ^ MoonWalk new ].
	(rand between: 99 and: 100)
		ifTrue: [ ^ AtomicBomb new ]
]

Class {
	#name : #AtomicBomb,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicBomb >> applyTo: aPlayer on: aGame [
	aGame players do: [ :player | aGame player: player advance: (aGame positionOf: aPlayer) negated ]
]

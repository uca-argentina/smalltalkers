Class {
	#name : #WormHole,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
WormHole >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer advance: -4.
]

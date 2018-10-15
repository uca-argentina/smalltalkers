Class {
	#name : #WormHole,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
WormHole >> apply: aGame to: aPlayer [
	aGame player: aPlayer advance: -4.
]

Class {
	#name : #WormHole,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
WormHole >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer goBack: 4
]

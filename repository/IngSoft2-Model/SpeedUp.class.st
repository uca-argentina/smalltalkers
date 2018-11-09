Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
SpeedUp >> applyTo: aPlayer on: aGame [
	aGame player: aPlayer advance: 4
]

Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
SpeedUp >> apply: aGame to: aPlayer [
	aGame player: aPlayer advance: 4
]

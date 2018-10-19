Class {
	#name : #PlayerState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
PlayerState >> hasEnded [
	^ false
]

{ #category : #testing }
PlayerState >> nextStateFor: aGame to: aPlayer [
	(aGame lapsOf: aPlayer) >= aGame winningLaps
		ifTrue: [ ^ GameEnded withWinner: aPlayer ]
]

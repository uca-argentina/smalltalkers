Class {
	#name : #PlayerState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
PlayerState >> hasEnded [
	^ false
]

{ #category : #accessing }
PlayerState >> nextStateOf: aPlayer on: aGame [
	^ (aGame lapsOf: aPlayer) >= aGame winningLaps
		ifTrue: [ GameEnded withWinner: aPlayer ]
		ifFalse: [ self ]
]

{ #category : #accessing }
PlayerState >> winner [
	GameException signal: 'Game isnt finished'
]

Class {
	#name : #GameState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
GameState >> hasEnded [
	^ false
]

{ #category : #accessing }
GameState >> nextStateOf: aPlayer on: aGame [
	^ (aGame lapsOf: aPlayer) >= aGame winningLaps
		ifTrue: [ GameEnded withWinner: aPlayer ]
		ifFalse: [ self ]
]

{ #category : #accessing }
GameState >> winner [
	GameException signal: 'Game isnt finished'
]

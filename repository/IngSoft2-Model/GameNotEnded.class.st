Class {
	#name : #GameNotEnded,
	#superclass : #GameState,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
GameNotEnded >> hasEnded [
	^ false
]

{ #category : #accessing }
GameNotEnded >> nextStateOf: aPlayer on: aGame [
	^ (aGame lapsOf: aPlayer) >= aGame winningLaps
		ifTrue: [ GameEnded withWinner: aPlayer ]
		ifFalse: [ self ]
]

{ #category : #accessing }
GameNotEnded >> winner [
	GameException signal: 'Game isnt finished'
]

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
PlayerState >> nextStateFor: aGame to: aPlayer [
	(aGame lapsOf: aPlayer) >= aGame winningLaps
		ifTrue: [ ^ GameEnded withWinner: aPlayer ]
]

{ #category : #accessing }
PlayerState >> winner [
	GameException signal: 'Game isnt finished'
]

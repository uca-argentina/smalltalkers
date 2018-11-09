Class {
	#name : #GameEnded,
	#superclass : #Object,
	#instVars : [
		'player'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
GameEnded class >> withWinner: aPlayer [
	^ self new initializeWithWinner: aPlayer
]

{ #category : #initialization }
GameEnded >> hasEnded [
	^ true
]

{ #category : #initialization }
GameEnded >> initializeWithWinner: aPlayer [
	player := aPlayer
]

{ #category : #initialization }
GameEnded >> winner [
	^ player
]

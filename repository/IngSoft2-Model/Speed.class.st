Class {
	#name : #Speed,
	#superclass : #PermanentCard,
	#instVars : [
		'name',
		'extraNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Speed >> initialize [
name := 'Speed'.
extraNumber := 1
]

{ #category : #accessing }
Speed >> name [
	^ name
]

{ #category : #playing }
Speed >> opposeEffect [
	extraNumber := -1
]

{ #category : #playing }
Speed >> useAgainst: aPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectAdvanceNumberOf: aPlayer with: extraNumber
]

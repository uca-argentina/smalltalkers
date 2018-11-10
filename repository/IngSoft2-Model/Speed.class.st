Class {
	#name : #Speed,
	#superclass : #PermanentCard,
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
Speed >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectAdvanceNumberOf: anotherPlayer with: extraNumber
]

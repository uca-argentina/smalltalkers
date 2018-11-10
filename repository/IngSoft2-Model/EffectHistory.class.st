Class {
	#name : #EffectHistory,
	#superclass : #Object,
	#instVars : [
		'player',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
EffectHistory class >> with: aPlayer and: anEffect [
^ self new initializeWith: aPlayer and: anEffect
]

{ #category : #accessing }
EffectHistory >> effect [
	^ effect
]

{ #category : #initialization }
EffectHistory >> initializeWith: aPlayer and: anEffect [
player := aPlayer.
effect := anEffect
]

{ #category : #accessing }
EffectHistory >> player [
	^ player
]

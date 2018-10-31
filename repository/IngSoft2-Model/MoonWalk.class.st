Class {
	#name : #MoonWalk,
	#superclass : #Effect,
	#instVars : [
		'goBack'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
MoonWalk class >> goBack: aNumber [
	^ self new initializeWithGoBack: aNumber.
]

{ #category : #accessing }
MoonWalk >> applyTo: aPlayer on: aGame [
	| players |
	players := aGame players reject: [ :player | player = aPlayer ].
	players do: [ :player | aGame player: player advance: goBack negated ]
]

{ #category : #initialization }
MoonWalk >> initializeWithGoBack: aNumber [
	goBack:= aNumber.
]

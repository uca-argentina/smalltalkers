Class {
	#name : #Speed,
	#superclass : #PermanentCard,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Speed >> initialize [
name := 'Speed'
]

{ #category : #accessing }
Speed >> name [
	^ name
]

{ #category : #playing }
Speed >> useAgainst: aPlayer on: aGame [
aGame modifyCardEffectAdvanceNumberOf: aPlayer with: 1
]

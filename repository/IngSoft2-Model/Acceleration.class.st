Class {
	#name : #Acceleration,
	#superclass : #PermanentCard,
	#instVars : [
		'name',
		'extraNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Acceleration >> initialize [
name := 'Acceleration'.
extraNumber := 1
]

{ #category : #accessing }
Acceleration >> name [
	^ name
]

{ #category : #playing }
Acceleration >> opposeEffect [
extraNumber := -1
]

{ #category : #playing }
Acceleration >> useAgainst: aPlayer on: aGame [
	aGame players do: [ :player | aGame modifyCardEffectAdvanceNumberOf: player with: extraNumber ]
]

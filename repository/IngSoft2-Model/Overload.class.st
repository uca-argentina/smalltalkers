Class {
	#name : #Overload,
	#superclass : #PermanentCard,
	#instVars : [
		'name',
		'extraNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Overload >> initialize [
name := 'Overload'.
extraNumber := -2

]

{ #category : #'as yet unclassified' }
Overload >> name [
	^ name
]

{ #category : #playing }
Overload >> opposeEffect [
	extraNumber := 2
]

{ #category : #playing }
Overload >> useAgainst: aPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectAdvanceNumberOf: aPlayer with: extraNumber.
]

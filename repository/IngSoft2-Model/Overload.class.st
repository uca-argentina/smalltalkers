Class {
	#name : #Overload,
	#superclass : #PermanentCard,
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
Overload >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectAdvanceNumberOf: anotherPlayer with: extraNumber
]

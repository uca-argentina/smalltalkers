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
Overload >> player: aPlayer cancelEffectTo: anotherPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectAdvanceNumberOf: anotherPlayer with: 2
]

{ #category : #playing }
Overload >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectGoBackNumberOf: anotherPlayer with: 2
]

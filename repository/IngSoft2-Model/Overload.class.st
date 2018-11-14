Class {
	#name : #Overload,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Overload >> initialize [
	name := 'Overload'
]

{ #category : #accessing }
Overload >> name [
	^ name
]

{ #category : #playing }
Overload >> player: aPlayer cancelEffectTo: anotherPlayer on: aGame [
	aGame modifyCardEffectAdvanceNumberOf: anotherPlayer with: 2
]

{ #category : #playing }
Overload >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame modifyCardEffectGoBackNumberOf: anotherPlayer with: 2
]

{ #category : #assigning }
Overload >> selectCardTarget: aCardName [
	target := aCardName
]

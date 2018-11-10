Class {
	#name : #Acceleration,
	#superclass : #PermanentCard,
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
Acceleration >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	aGame assertIsTurnOf: aPlayer.
	aGame players
		do:
			[ :player | aGame modifyCardEffectAdvanceNumberOf: player with: extraNumber ]
]

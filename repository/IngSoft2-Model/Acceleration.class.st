Class {
	#name : #Acceleration,
	#superclass : #PermanentCard,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Acceleration >> initialize [
name := 'Acceleration'
]

{ #category : #accessing }
Acceleration >> name [
	^ name
]

{ #category : #playing }
Acceleration >> useAgainst: aPlayer on: aGame [

aGame players do: [ :player | aGame modifyCardEffectAdvanceNumberOf: player with: 1]
 
]

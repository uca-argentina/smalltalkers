Class {
	#name : #Repeat,
	#superclass : #InstantaneousCard,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Repeat >> initialize [
	name := 'Repeat'
]

{ #category : #accessing }
Repeat >> name [
	^ name
]

{ #category : #playing }
Repeat >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	| effect player |
	effect := aGame effectsHistory last effect.
	player := aGame effectsHistory last player.
	effect applyTo: player on: aGame 
	
	
]

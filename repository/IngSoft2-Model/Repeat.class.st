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

{ #category : #'as yet unclassified' }
Repeat >> useAgainst: aPlayer on: aGame [
	(aGame playerLastEffect at: aPlayer) applyTo: aPlayer on: aGame
]

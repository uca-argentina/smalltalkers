Class {
	#name : #Overload,
	#superclass : #PermanentCard,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Overload >> initialize [
name := 'Overload'

]

{ #category : #'as yet unclassified' }
Overload >> name [
	^ name
]

{ #category : #playing }
Overload >> useAgainst: aPlayer on: aGame [
aGame modifyCardEffectAdvanceNumberOf: aPlayer with: -2
 

]

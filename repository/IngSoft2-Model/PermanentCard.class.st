Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#instVars : [
		'extraNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
PermanentCard >> opposeEffect [
	^ self subclassResponsibility
]

{ #category : #playing }
PermanentCard >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	self subclassResponsibility
]

Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'name',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Card >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	self subclassResponsibility
]

{ #category : #assigning }
Card >> selectCardTarget: aCardName [
	^ self subclassResponsibility
]

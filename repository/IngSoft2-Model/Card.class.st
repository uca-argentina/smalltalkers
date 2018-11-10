Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Card >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	self subclassResponsibility
]

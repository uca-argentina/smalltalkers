Class {
	#name : #History,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
History >> effect [
	^ self subclassResponsibility
]

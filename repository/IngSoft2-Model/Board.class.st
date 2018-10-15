Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'length',
		'strategy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertWithValidValueOfLength: aValue [
	aValue <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ]
]

{ #category : #initialization }
Board class >> length: aLenght andStrategy: aStrategy [
	self assertWithValidValueOfLength: aLenght.
	^ self new initializeWithLength: aLenght andStrategy: aStrategy
]

{ #category : #playing }
Board >> activeEffect: aGame to: aPlayer [
	strategy nextEffect apply: aGame to: aPlayer
]

{ #category : #initialization }
Board >> initializeWithLength: aLength andStrategy: aStrategy [
	length := aLength.
	strategy := aStrategy.
	
]

{ #category : #accessing }
Board >> length [
	^ length
]

{ #category : #accessing }
Board >> strategy [
	^ strategy
]

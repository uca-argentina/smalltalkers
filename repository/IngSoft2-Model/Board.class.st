Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'length',
		'ranking'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertWithValidValueOfLength: aValue [
	aValue <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ]
]

{ #category : #initialization }
Board class >> length: aLenght [
	self assertWithValidValueOfLength: aLenght.
	^ self new initializeWithLength: aLenght
]

{ #category : #initialization }
Board >> initializeWithLength: aLength [
	length := aLength
]

{ #category : #accessing }
Board >> length [
	^ length 
]

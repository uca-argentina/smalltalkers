Class {
	#name : #Redo,
	#superclass : #Card,
	#instVars : [
		'name',
		'cards',
		'target',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Redo >> initialize [
	name := 'Redo'.
	cards := OrderedCollection new.
	cards
		add: Acceleration new;
		add: Overload new;
		add: Speed new;
		add: Cancellation new.
]

{ #category : #accessing }
Redo >> name [
	^ name
]

{ #category : #playing }
Redo >> useAgainst: aPlayer on: aGame [
	effect := aGame cardsHistory last effect.
	cards detect: [ :each | each name = effect ] ifFound: [ :found | found useAgainst: aPlayer on: aGame ]
]

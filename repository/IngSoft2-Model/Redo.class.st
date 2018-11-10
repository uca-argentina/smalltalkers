Class {
	#name : #Redo,
	#superclass : #Card,
	#instVars : [
		'name',
		'cards',
		'target'
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
Redo >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	| effect |
	effect := aGame cardsHistory last effect.
	cards detect: [ :each | each name = effect ] ifFound: [ :found | found player: aGame turn useAgainst: anotherPlayer on: aGame ]
]

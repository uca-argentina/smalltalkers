Class {
	#name : #Cancellation,
	#superclass : #InstantaneousCard,
	#instVars : [
		'target',
		'permanentCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Cancellation >> initialize [
	name := 'Cancellation'.
	target := 'none'.
	permanentCards := OrderedCollection new.
	permanentCards
		add: Acceleration new;
		add: Overload new;
		add: Speed new.
]

{ #category : #initialization }
Cancellation >> name [
	^ name
]

{ #category : #playing }
Cancellation >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	target = 'none'
		ifTrue: [ AssertionFailure signal: 'You have to declare a target first' ]
		ifFalse: [ permanentCards
				detect: [ :each | each name = target ]
				ifFound: [ :found | 
					aGame removePlayedCardAffecting: anotherPlayer name with: found name.
					found player: aPlayer cancelEffectTo: anotherPlayer on: aGame ] ]
]

{ #category : #accessing }
Cancellation >> selectTarget: aCardName [
	target := aCardName
]

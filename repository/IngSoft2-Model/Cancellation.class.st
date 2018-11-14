Class {
	#name : #Cancellation,
	#superclass : #InstantaneousCard,
	#instVars : [
		'permanentCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Cancellation >> initialize [
	name := 'Cancellation'.
	target := 'none'.
	permanentCards := OrderedCollection new
		add: Acceleration new;
		add: Overload new;
		add: Speed new;
		yourself
]

{ #category : #accessing }
Cancellation >> name [
	^ name
]

{ #category : #playing }
Cancellation >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	target = 'none'
		ifTrue: [ GameException signal: 'You have to declare a target first' ]
		ifFalse: [ permanentCards
				detect: [ :each | each name = target ]
				ifFound: [ :found | 
					aGame removePlayedCardAffecting: anotherPlayer name with: found name.
					found player: aPlayer cancelEffectTo: anotherPlayer on: aGame ] ]
]

{ #category : #assigning }
Cancellation >> selectCardTarget: aCardName [
	target := aCardName
]

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
	permanentCards do: [ :card | card opposeEffect. ]
]

{ #category : #initialization }
Cancellation >> name [
	^ name
]

{ #category : #playing }
Cancellation >> player: aPlayer useAgainst: anotherPlayer on: aGame [
	| card |
	target = 'none'
		ifTrue: [ AssertionFailure signal: 'You have to declare a target first' ]
		ifFalse: [ card := permanentCards detect: [ :each | each name = target ].
			aGame removePlayedCardAffecting: anotherPlayer name with: card name.
			card player: aPlayer useAgainst: anotherPlayer on: aGame ]
]

{ #category : #accessing }
Cancellation >> selectTarget: aCardName [
	target := aCardName
]

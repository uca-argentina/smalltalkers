Class {
	#name : #Ranking,
	#superclass : #Object,
	#instVars : [
		'players',
		'playersScore'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Ranking class >> assertValidValueOfPlayers: players [
	players size <= 0
		ifTrue:[AssertionFailure signal: 'You cannot create a ranking without players']
]

{ #category : #'instance creation' }
Ranking class >> withPlayers: aPlayerCollection [
	self assertValidValueOfPlayers: aPlayerCollection.
	^ self new initializeWithPlayers: aPlayerCollection
]

{ #category : #initialization }
Ranking >> initializeWithPlayers: aPlayerCollection [
	players := aPlayerCollection.
	playersScore := Dictionary new.
	players do: [ :player | playersScore at: player put: 0 ]
]

{ #category : #ordering }
Ranking >> makeScoreOfPlayersOn: aGame [
	players do: [ :player | playersScore at: player put: (aGame lapsOf: player) * aGame board length + (aGame positionOf: player) ].
	players := players asSortedCollection: [ :player | self scoreOf: player ] descending
]

{ #category : #accessing }
Ranking >> playerAtPosition: aPosition [
	^ players at: aPosition
]

{ #category : #accessing }
Ranking >> scoreOf: aPlayer [
	^ playersScore at: aPlayer
]

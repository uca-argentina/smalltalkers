Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'table',
		'players',
		'ranking',
		'diceCollection',
		'finish',
		'name',
		'winner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> name: aName withPlayers: playersColletion withTableSize: aSize [
	^ self new initializeWithname: aName withPlayers: playersColletion withTableSize: aSize
]

{ #category : #accessing }
Game >> finished [
	^ finish.
]

{ #category : #initialization }
Game >> initializeWithname: aName withPlayers: playersColletion withTableSize: aSize [
	finish := false.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 position >= p2 position ].
	name := aName.
	players := playersColletion.
	table := Table withSize: aSize
]

{ #category : #playing }
Game >> play [
	1 to: players size do: [ :i | 
		finish == false
			ifTrue: [ (players at: i) roll.
				(players at: i) advancePosition.
				(players at: i) position >= table positions
					ifTrue: [ finish := true.
						winner:= (players at: i) name ] ] ]
]

{ #category : #playing }
Game >> rankPlayers [
	"Creo una lista ordenada con las posiciones de cada jugador"

	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Recorro esa lista y agrego el ranking de los jugadores"
	1 to: ranking size do: [ :i | (ranking at: i) rankedWithValue: i ].
	^ ranking
]

{ #category : #accessing }
Game >> ranking [
	^ ranking
]

{ #category : #accessing }
Game >> winner [
	^ winner
]

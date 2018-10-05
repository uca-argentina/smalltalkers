Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'table',
		'players',
		'diceCollection',
		'finish',
		'name',
		'winner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> playedBy: aPlayerSet onBoardOfLenght: aBoardLenght withSetOfDices: diceCollection [
	^ self new initializeWithPlayers: aPlayerSet OnBoardLenght: aBoardLenght withDices: diceCollection
]

{ #category : #initialization }
Game >> initializeWithPlayers: aPlayerSet OnBoardLenght: aBoardLenght withDices:aDiceCollection [
	|ranking|
	finish := false.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 position >= p2 position ].
	players := aPlayerSet.
	diceCollection :=aDiceCollection.
	table := Table size: aBoardLenght.
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

{ #category : #accessing }
Game >> rankPlayers [
	|ranking|
	ranking addAll: players.
	^ ranking
]

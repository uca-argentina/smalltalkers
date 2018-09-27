Class {
	#name : #TestPlayer,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TestPlayer >> testCreationPlayer [
	|diceCollection player|
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 5).
	player:= Player withDiceCollection: diceCollection andName: 'Lucas'.
	self assert: player diceCollection size equals: 1.
	
]

{ #category : #tests }
TestPlayer >> testCreationPlayerWithName [
	|diceCollection player|
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 5).
	player:= Player withDiceCollection: diceCollection andName: 'Lucas'.
	self assert: player diceCollection size equals: 1.
	self assert: player name equals: 'Lucas'.
	
]

{ #category : #tests }
TestPlayer >> testPlayerGetsRanked [
	|diceCollection player|
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 5).
	player:= Player withDiceCollection: diceCollection andName: 'Lucas'.
	player rankedWithValue: 1.
	self assert: player rank equals: 1.
	

	
]

{ #category : #tests }
TestPlayer >> testPlayerRoll [
	|diceCollection player|
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 5).
	player:= Player withDiceCollection: diceCollection andName: 'Lucas'.
	player roll.
	self assert: player rollNumber equals: 5.

	
]

{ #category : #tests }
TestPlayer >> testPlayerRollsAndAdvance [
	|diceCollection player|
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 5).
	player:= Player withDiceCollection: diceCollection andName: 'Lucas'.
	player roll.
	player advancePosition.
	self assert: player position equals: 5.
	player roll.
	player advancePosition.
	self assert: player position equals: 10.
	

	
]

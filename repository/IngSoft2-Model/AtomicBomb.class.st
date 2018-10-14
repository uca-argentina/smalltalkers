Class {
	#name : #AtomicBomb,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicBomb >> apply: aGame to: aPlayer [
	|players position|
	players := aGame players.
	players do:[:player | 
		position:= aGame positionOf: player.
		aGame player: player advance: position negated].
	
]

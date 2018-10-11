Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'length',
		'ranking',
		'positions',
		'strategy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertWithValidValueOfLength: aValue [
	aValue <= 0
		ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ]
]

{ #category : #initialization }
Board class >> length: aLenght [
	self assertWithValidValueOfLength: aLenght.
	^ self new initializeWithLength: aLenght andStrategy: strategy
]

{ #category : #initialization }
Board class >> length: aLenght andStrategy: aStrategy [
	self assertWithValidValueOfLength: aLenght.
	^ self new initializeWithLength: aLenght andStrategy: aStrategy
]

{ #category : #initialization }
Board >> initializeWithLength: aLength [
	"PROTOTIPO-REVISAR"

	"48% de los casilleros no tienen efecto.  (1-48)"

	"20% de los casilleros tienen el efecto WormHole. (49-68)"

	"20% de los casilleros tienen el efecto SpeedUp (69-88)"

	"10% de los casilleros tienen el efecto MoonWalk. (89-98)"

	"2% de los casilleros tienen el efecto AtomicBomb.(99-100)"

	"Creo que seria mas facil que el tablero asigne los efectos, pero que el juego los implemente ya que toda la logica esta en Game"

	| rand |
	length := aLength.
	"lo siguiente deberia estar implementado en RandomEffectStrategy"
	positions := OrderedCollection new.	"positions va a tener almacenado los casilleros con efectos"
	1 to: length do: [ :i | 
		rand := Random new.
		rand := (rand next * (100 - 1)) truncated + 1.	"genero un numero del 1 al 100"
		(rand between: 1 and: 48)
			ifTrue: [ "No tiene efecto" ].
		(rand between: 49 and: 68)
			ifTrue: [ "WormHole" ].
		(rand between: 69 and: 88)
			ifTrue: [ "SpeedUp" ].
		(rand between: 89 and: 98)
			ifTrue: [ "MoonWalk" ].
		(rand between: 99 and: 100)
			ifTrue: [ "AtomicBomb" ] ]
]

{ #category : #initialization }
Board >> initializeWithLength: aLength andStrategy: aStrategy [
	length := aLength.
	strategy := aStrategy.
	
]

{ #category : #accessing }
Board >> length [
	^ length 
]

{ #category : #accessing }
Board >> positions [
	^ positions
]

{ #category : #playing }
Board >> prepareEffects [
	positions := strategy addEffects: length 
]

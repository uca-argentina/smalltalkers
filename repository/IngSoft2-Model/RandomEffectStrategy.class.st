Class {
	#name : #RandomEffectStrategy,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #adding }
RandomEffectStrategy >> addEffects: length [
	"PROTOTIPO-REVISAR"

	"48% de los casilleros no tienen efecto.  (1-48)"

	"20% de los casilleros tienen el efecto WormHole. (49-68)"

	"20% de los casilleros tienen el efecto SpeedUp (69-88)"

	"10% de los casilleros tienen el efecto MoonWalk. (89-98)"

	"2% de los casilleros tienen el efecto AtomicBomb.(99-100)"

	"Creo que seria mas facil que el tablero asigne los efectos, pero que el juego los implemente ya que toda la logica esta en Game"

	| rand positions |
	positions := OrderedCollection new.	"positions va a tener almacenado los casilleros con efectos"
	1 to: length do: [ :i | 
		rand := Random new.
		rand := (rand next * (100 - 1)) truncated + 1.	"genero un numero del 1 al 100"
		(rand between: 1 and: 48)
			ifTrue: [ (positions at: i) add: 'No tiene efecto' ].
		(rand between: 49 and: 68)
			ifTrue: [ (positions at: i) add: 'WormHole' ].
		(rand between: 69 and: 88)
			ifTrue: [ (positions at: i) add: 'SpeedUp' ].
		(rand between: 89 and: 98)
			ifTrue: [ (positions at: i) add: 'MoonWalk' ].
		(rand between: 99 and: 100)
			ifTrue: [ (positions at: i) add: 'AtomicBomb' ] ].
	^ positions
]

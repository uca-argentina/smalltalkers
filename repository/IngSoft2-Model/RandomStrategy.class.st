Class {
	#name : #RandomStrategy,
	#superclass : #RollStrategy,
	#instVars : [
		'rand'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
RandomStrategy >> initialize [
	rand := Random new.
]

{ #category : #accessing }
RandomStrategy >> next: aQuantityFace [
	^ rand nextInt: aQuantityFace
]

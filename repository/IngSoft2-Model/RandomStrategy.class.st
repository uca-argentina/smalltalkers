Class {
	#name : #RandomStrategy,
	#superclass : #RollStrategy,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomStrategy >> next: aQuantityFace [
	| rand |
	rand := Random new.
	^ (rand next * (aQuantityFace - 1)) truncated + 1.
]

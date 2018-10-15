Class {
	#name : #EffectStrategy,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
EffectStrategy >> nextEffect [
	self subclassResponsibility
]

Class {
	#name : #CardHistory,
	#superclass : #History,
	#instVars : [
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CardHistory class >> to: destinyPlayer with: aCard [
	^ self new to: destinyPlayer with: aCard
]

{ #category : #accessing }
CardHistory >> effect [
	^ effect
]

{ #category : #accessing }
CardHistory >> targetName [
	^ target
]

{ #category : #initialization }
CardHistory >> to: anAffectedPlayer with: aCard [
	target := anAffectedPlayer name.
	effect := aCard
]

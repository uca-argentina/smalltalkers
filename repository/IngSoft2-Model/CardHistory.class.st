Class {
	#name : #CardHistory,
	#superclass : #Object,
	#instVars : [
		'source',
		'target',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CardHistory class >> from: sourcePlayer to: destinyPlayer with: aCard [
	^ self new initializeFrom: sourcePlayer to: destinyPlayer  with: aCard
]

{ #category : #accessing }
CardHistory >> effect [
	^ effect
]

{ #category : #initialization }
CardHistory >> initializeFrom: aPlayer to: anAffectedPlayer with: aCard [
	source := aPlayer name.
	target := anAffectedPlayer name.
	effect := aCard
]

{ #category : #accessing }
CardHistory >> sourceName [
	^ source
]

{ #category : #accessing }
CardHistory >> targetName [
	^ target
]

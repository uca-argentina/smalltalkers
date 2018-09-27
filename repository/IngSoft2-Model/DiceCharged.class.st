"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	quantityFaces:		<Object>


    Implementation Points
"
Class {
	#name : #DiceCharged,
	#superclass : #Object,
	#instVars : [
		'quantityFaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
DiceCharged class >> assertValidDiceValue: aValue [
	(aValue <3) ifTrue: [AssertionFailure signal: 'A dice must have 3 or more faces']. 
]

{ #category : #initialization }
DiceCharged class >> withNumberOfFaces: aValue [
	self assertValidDiceValue: aValue.
	^ self new initializeWithFaceValue: aValue
]

{ #category : #accessing }
DiceCharged >> faceValue [
	^ quantityFaces
]

{ #category : #initialization }
DiceCharged >> initializeWithFaceValue: aValue [
	quantityFaces := aValue.

	
]

{ #category : #rolling }
DiceCharged >> roll [
	^ quantityFaces
	
]

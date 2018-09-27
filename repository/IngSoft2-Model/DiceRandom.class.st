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
	#name : #DiceRandom,
	#superclass : #Object,
	#instVars : [
		'quantityFaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
DiceRandom class >> assertValidDiceValue: aValue [
	(aValue <3) ifTrue: [AssertionFailure signal: 'A dice must have 3 or more faces']. 
]

{ #category : #initialization }
DiceRandom class >> withNumberOfFaces: aValue [
	self assertValidDiceValue: aValue.
	^ self new initializeWithFaceValue: aValue
]

{ #category : #accessing }
DiceRandom >> faceValue [
	^ quantityFaces
]

{ #category : #initialization }
DiceRandom >> initializeWithFaceValue: aValue [
	quantityFaces := aValue
]

{ #category : #rolling }
DiceRandom >> roll [
	|rand| 
	rand:= Random new.
	rand := ((rand next * (quantityFaces  - 1)) truncated + 1).	"Genera un random entre 0 y 1 (float), lo multiplico por (caras del dado - 1) y luego le sumo 1"
	^ rand
]

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
	positions:		<Object>


    Implementation Points
"
Class {
	#name : #Table,
	#superclass : #Object,
	#instVars : [
		'positions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Table class >> assertWithValidValueOfPositions: aValue [
	(aValue <= 0) ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ].
]

{ #category : #initialization }
Table class >> withSize: aSize [
	self assertWithValidValueOfPositions: aSize.
	^ self new initializeWithSize: aSize
]

{ #category : #initialization }
Table >> initializeWithSize: aSize [
	positions := aSize.
]

{ #category : #accessing }
Table >> positions [
	^ positions
]

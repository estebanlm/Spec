"
A SpecSplitterHorizontal is a description of the addition of a horizontal splitter
"
Class {
	#name : #SpecSplitterHorizontal,
	#superclass : #SpecLayoutAdd,
	#instVars : [
		'commands'
	],
	#category : #'Spec-Layout-Actions'
}

{ #category : #'instance creation' }
SpecSplitterHorizontal class >> commands: commands [

	^ self new
		commands: commands;
		yourself
]

{ #category : #protocol }
SpecSplitterHorizontal >> arguments [
	^ {(self commands identityIndexOf: self)}
]

{ #category : #accessing }
SpecSplitterHorizontal >> commands [
	
	^ commands
]

{ #category : #accessing }
SpecSplitterHorizontal >> commands: anObject [
	
	commands := anObject
]

{ #category : #initialization }
SpecSplitterHorizontal >> initialize [

	super initialize.

	selector := #newHSplitterAt:.
	layoutFrame  := (0@0 corner: 0@0) asSpecLayoutFrame 
							bottomOffset: 1.
	commands := nil.
]

{ #category : #testing }
SpecSplitterHorizontal >> isSplitter [

	^ true
]

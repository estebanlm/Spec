"
A SpecLayoutAddRow is an action representing the addition of a row to a layout

"
Class {
	#name : #SpecLayoutAddRow,
	#superclass : #SpecLayoutAdd,
	#category : #'Spec-Layout-Actions'
}

{ #category : #'instance creation' }
SpecLayoutAddRow class >> block: aBlock layoutFrame: aLayoutFrame [

	^ self new
			block: aBlock 
			layoutFrame: aLayoutFrame;
			yourself
]

{ #category : #'instance creation' }
SpecLayoutAddRow >> block: aBlock layoutFrame: aLayoutFrame [
	| row |
	row := SpecRowLayout composed.
	aBlock value: row.
	subwidget := row.
	self layoutFrame: aLayoutFrame
]

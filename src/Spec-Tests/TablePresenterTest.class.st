Class {
	#name : #TablePresenterTest,
	#superclass : #SpecTestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Spec-Tests-Core-Widgets'
}

{ #category : #running }
TablePresenterTest >> classToTest [
	
	^ TablePresenter
]

{ #category : #running }
TablePresenterTest >> setUp [
	super setUp.
	presenter := self classToTest new.
]

{ #category : #'tests-doubleClick' }
TablePresenterTest >> testDoubleClickCallsDoubleClickAction [

	| doubleClickInvoked |
	doubleClickInvoked := false.

	window := presenter
		items: #(10 20 30);
		doubleClickAction: [ doubleClickInvoked := true ];
		openWithSpec.

	presenter doubleClickAtIndex: 2.
	
	self assert: doubleClickInvoked
]

{ #category : #'tests-doubleClick' }
TablePresenterTest >> testDoubleClickOutsideSelectionUnsetsSelectedIndex [

	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter doubleClickAtIndex: 4.
	
	self assert: presenter selectedIndex equals: 0
]

{ #category : #'tests-doubleClick' }
TablePresenterTest >> testDoubleClickOutsideSelectionUnsetsSelectedItem [

	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter doubleClickAtIndex: 4.
	
	self assert: presenter selectedItem equals: nil
]

{ #category : #'tests-doubleClick' }
TablePresenterTest >> testDoubleClickSelectsItem [

	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter doubleClickAtIndex: 2.
	
	self assert: presenter selectedIndex equals: 2
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSelectIndexOutsideRangeUnsetsSelectedIndex [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedIndex: 4.
	
	self assert: presenter selectedIndex equals: 0
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSelectIndexOutsideRangeUnsetsSelectedItem [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedIndex: 4.
	
	self assert: presenter selectedItem equals: nil
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSelectIndexSetsSelectedIndex [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedIndex: 1.
	
	self assert: presenter selectedIndex equals: 1
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSelectIndexSetsSelectedItem [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedIndex: 1.
	
	self assert: presenter selectedItem equals: 10
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSelectItemOutsideRangeUnsetsSelectedIndex [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedItem: 40.
	
	self assert: presenter selectedIndex equals: 0
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSelectItemOutsideRangeUnsetsSelectedItem [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedItem: 40.
	
	self assert: presenter selectedItem equals: nil
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSelectItemSetsSelectedIndex [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedItem: 20.
	
	self assert: presenter selectedIndex equals: 2
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSelectItemSetsSelectedItem [

	window := presenter
		items: #(10 20 30);
		openWithSpec.
		
	presenter selectedItem: 20.
	
	self assert: presenter selectedItem equals: 20
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSetSelectIndexOutsideRangeRaisesSelectionChangeEventWithUnsetIndex [

	| selectedIndex |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedIndex := selection first ].
	presenter selectedIndex: 4.
	
	self assert: selectedIndex equals: 0
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSetSelectIndexOutsideRangeRaisesSelectionChangeEventWithUnsetItem [

	| selectedItem |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedItem := selection second ].
	presenter selectedIndex: 4.
	
	self assert: selectedItem equals: nil
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSetSelectIndexRaisesSelectionChangeEventWithSelectedIndex [

	| selectedIndex |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedIndex := selection first ].
	presenter selectedIndex: 1.
	
	self assert: selectedIndex equals: 1
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSetSelectIndexRaisesSelectionChangeEventWithSelectedItem [

	| selectedElement |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedElement := selection second ].
	presenter selectedIndex: 1.
	
	self assert: selectedElement equals: 10
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSetSelectIndexRaisesSelectionIndexChangeEventWithSelectedIndex [

	| selectedIndex |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectedIndexChangedDo: [ :selection | selectedIndex := selection ].
	presenter selectedIndex: 1.
	
	self assert: selectedIndex equals: 1
]

{ #category : #'tests-selection-index' }
TablePresenterTest >> testSetSelectIndexRaisesSelectionItemChangeEventWithSelectedIndex [

	| selectedItem |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectedItemChangedDo: [ :selection | selectedItem := selection ].
	presenter selectedIndex: 1.
	
	self assert: selectedItem equals: 10
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSetSelectItemOutsideRangeRaisesSelectionChangeEventWithUnsetIndex [

	| selectedIndex |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedIndex := selection first ].
	presenter selectedItem: 40.
	
	self assert: selectedIndex equals: 0
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSetSelectItemOutsideRangeRaisesSelectionChangeEventWithUnsetItem [

	| selectedItem |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedItem := selection second ].
	presenter selectedItem: 40.
	
	self assert: selectedItem equals: nil
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSetSelectItemRaisesSelectionChangeEventWithSelectedIndex [

	| selectedIndex |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedIndex := selection first ].
	presenter selectedItem: 20.
	
	self assert: selectedIndex equals: 2
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSetSelectItemRaisesSelectionChangeEventWithSelectedItem [

	| selectedElement |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectionChangedDo: [ :selection | selectedElement := selection second ].
	presenter selectedItem: 20.
	
	self assert: selectedElement equals: 20
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSetSelectItemRaisesSelectionIndexChangeEventWithSelectedIndex [

	| selectedIndex |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectedIndexChangedDo: [ :selection | selectedIndex := selection ].
	presenter selectedItem: 10.
	
	self assert: selectedIndex equals: 1
]

{ #category : #'tests-selection-item' }
TablePresenterTest >> testSetSelectItemRaisesSelectionItemChangeEventWithSelectedItem [

	| selectedItem |
	window := presenter
		items: #(10 20 30);
		openWithSpec.

	presenter whenSelectedItemChangedDo: [ :selection | selectedItem := selection ].
	presenter selectedItem: 10.
	
	self assert: selectedItem equals: 10
]

{ #category : #'tests-smoke' }
TablePresenterTest >> testSmokeOpenEmptyTablePresenter [

	window := presenter openWithSpec
]

{ #category : #'tests-smoke' }
TablePresenterTest >> testSmokeOpenTablePresenterWithItemsButNoColumns [

	window := presenter
		items: #(1 2 3);
		openWithSpec.
]

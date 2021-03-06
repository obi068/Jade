"Filed out from Dolphin Smalltalk 7"!

GsObject subclass: #GsClass
	instanceVariableNames: 'category parent children isVisible classHistory isTestCase'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GsClass guid: (GUID fromString: '{B3021ACC-6EB1-40F5-93E7-6353E8DB8A14}')!
GsClass comment: ''!
!GsClass categoriesForClass!Unclassified! !
!GsClass methodsFor!

addChild: aGsClass2

	children add: aGsClass2.
!

addToDictionary: aDictionary

	isVisible ifFalse: [
		| other |
		other := aDictionary
			at: oopType value
			ifAbsent: [nil].
		isVisible := other notNil and: [other isVisible].
	].
	aDictionary
		at: oopType value
		put: self.
!

category

	^category.
!

children
	^children!

classHistory
	^classHistory!

implementorsOf: aGsMethod

	| string |
	string := gciSession
		serverPerform: #'implementorsOf:startingAt:'
		with: aGsMethod
		with: self.
	^self class
		listFromString: string 
		session: gciSession.
!

initialize: aList
	"See JadeServer>>#_addClass: aClass toStream: aStream isVisible: aBoolean fromDictionary: aDictionary
	1. OOP; 2. key; 3. category; 4. superclass OOP; 5. children; 6. Visible/Inherited; 7. Class History; 8. isTestCase"

	super initialize: aList.
	category := aList at: 3.
	aList size < 4 ifTrue: [^self].	"When we get a Class as the holder of a GsMethod, then we don't get all the details"
	parent := gciSession oopTypeWithOop: (aList at: 4) asNumber.
	children := SortedCollection sortBlock: [:a :b | a name <= b name].
	isVisible := (aList at: 6) = 'V'.
	classHistory := aList at: 7.
	classHistory := classHistory = '1/1' 
	  ifTrue: ['']
	  ifFalse: [' [' , classHistory , ']'].
	isTestCase := (aList at: 8) = 'true'.
!

isTestCase

	^isTestCase.
!

isVisible

	^isVisible.
!

nameWithVersion

	^name , classHistory.
!

parent

	^parent.
!

superclassListForMeta: aBoolean

	| string |
	string := gciSession
		serverPerform: #'superclassesOf:isMeta:'
		with: self
		with: aBoolean.
	^self class
		listFromString: string 
		session: gciSession.
!

updateFrom: aGsClass2

	isVisible := isVisible or: [aGsClass2 isVisible].
!

updateParentInDictionary: aDictionary

	parent := aDictionary
		at: parent value
		ifAbsent: [nil].
	parent notNil ifTrue: [
		parent addChild: self.
	].
! !
!GsClass categoriesFor: #addChild:!public! !
!GsClass categoriesFor: #addToDictionary:!public! !
!GsClass categoriesFor: #category!public! !
!GsClass categoriesFor: #children!accessing!public! !
!GsClass categoriesFor: #classHistory!accessing!public! !
!GsClass categoriesFor: #implementorsOf:!public! !
!GsClass categoriesFor: #initialize:!public! !
!GsClass categoriesFor: #isTestCase!public! !
!GsClass categoriesFor: #isVisible!public! !
!GsClass categoriesFor: #nameWithVersion!public! !
!GsClass categoriesFor: #parent!accessing!public! !
!GsClass categoriesFor: #superclassListForMeta:!public! !
!GsClass categoriesFor: #updateFrom:!public! !
!GsClass categoriesFor: #updateParentInDictionary:!public! !


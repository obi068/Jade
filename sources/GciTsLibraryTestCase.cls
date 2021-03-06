"Filed out from Dolphin Smalltalk 7"!

GciLibraryTestCase subclass: #GciTsLibraryTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GciTsLibraryTestCase guid: (GUID fromString: '{2E0598BB-4AF7-4844-B149-7A3990FD628E}')!
GciTsLibraryTestCase comment: ''!
!GciTsLibraryTestCase categoriesForClass!Unclassified! !
!GciTsLibraryTestCase methodsFor!

setUp

	super setUp.
	library := LibGciTs_3_3 default.
	session := GciTsLibraryTestResource current session.
!

test_break
	"Because all calls are blocking, we can't do a break!!"

	library 
		softBreakSession: session;
		hardBreakSession: session;
		session: session breakHard: false;
		session: session breakHard: true;
		yourself.
! !
!GciTsLibraryTestCase categoriesFor: #setUp!private! !
!GciTsLibraryTestCase categoriesFor: #test_break!public! !

!GciTsLibraryTestCase class methodsFor!

resources

	^IdentitySet with: GciTsLibraryTestResource! !
!GciTsLibraryTestCase class categoriesFor: #resources!public! !


"Filed out from Dolphin Smalltalk 7"!

Model subclass: #Contact
	instanceVariableNames: 'oop name title phone'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Contact guid: (GUID fromString: '{4F617257-BA88-4FCE-AD0B-5D8918FEA0EF}')!
Contact comment: '
| segment dict newUser |
segment := Segment newInRepository: SystemRepository.
segment group: ''Publishers'' authorization: #''write''.
segment group: ''Subscribers'' authorization: #''read''.
UserGlobals
	at: #''ContactsSecurityPolicy''
	put: segment.
System commitTransaction ifFalse: [nil error: ''commit failed''].

(dict := SymbolDictionary new)
	at: #''ContactsGlobals'' put: dict;
	at: #''ContactsSecurityPolicy'' put: segment;
	assignToSegment: segment;
	yourself.
(AllUsers userWithId: ''DataCurator'') insertDictionary: dict at: 1.
System commitTransaction ifFalse: [nil error: ''commit failed''].

newUser := AllUsers
	addNewUserWithId: ''Manager1''
	password: ''Monkey''. 
newUser
	addGroup: ''Subscribers''; 
	addPrivilege: ''CodeModification''; 
	insertDictionary: dict at: 1;
	yourself.
System commitTransaction ifFalse: [nil error: ''commit failed''].
'!
!Contact categoriesForClass!Unclassified! !
!Contact methodsFor!

attemptLock: aSymbol session: aGciSession

	| string |
	self oop isEmpty ifTrue: [
		MessageBox notify: 'Save object before attempting lock!!'.
		^self.
	].
	string := '
| object |
object := ContactList 
	detect: [:each | each asOop = ' , self oop , ']
	ifNone: [nil error: ''Contact has been deleted!!''].
System ' , aSymbol , 'Lock: object.
System addToCommitOrAbortReleaseLocksSet: object.'.
	[
		aGciSession executeString: string.
		Sound informationBeep.
	] on: Error do: [:ex | 
		MessageBox errorMsg: ex description.
	].
!

initialize

	oop 		:= '0'.
	name 	:= ''.
	title 		:= ''.
	phone 	:= ''.
!

initialize: aString

	| list |
	list := aString , '					' subStrings: Character tab.
	oop 		:= list at: 1.
	name 	:= list at: 2.
	title 		:= list at: 3.
	phone 	:= list at: 4.
!

name
	^name!

name: anObject
	name := anObject!

oop
	^oop!

oop: anObject
	oop := anObject!

phone
	^phone!

phone: anObject
	phone := anObject!

saveUsing: gciSession

	| string result |
	string := ' 
| array |
array := ContactList 
	detect: [:each | each asOop = ' , oop , ']
	ifNone: [ContactList add: (Array new: 3)].
array
	at: 1 put: ' , name printString , ';
	at: 2 put: ' , title printString , ';
	at: 3 put: ' , phone printString , ';
	yourself.
nil'.
	result := gciSession executeString: string.
	result isNil ifTrue: [^self].
	MessageBox warning: result.
!

title
	^title!

title: anObject
	title := anObject! !
!Contact categoriesFor: #attemptLock:session:!public! !
!Contact categoriesFor: #initialize!public! !
!Contact categoriesFor: #initialize:!public! !
!Contact categoriesFor: #name!accessing!public! !
!Contact categoriesFor: #name:!accessing!public! !
!Contact categoriesFor: #oop!accessing!public! !
!Contact categoriesFor: #oop:!accessing!public! !
!Contact categoriesFor: #phone!accessing!public! !
!Contact categoriesFor: #phone:!accessing!public! !
!Contact categoriesFor: #saveUsing:!public! !
!Contact categoriesFor: #title!accessing!public! !
!Contact categoriesFor: #title:!accessing!public! !

!Contact class methodsFor!

fillListString

^'	| i stream |
	i := 0.
	[
		ContactsGlobals includesKey: #ContactList.
	] whileFalse: [
		ContactsGlobals
			at: #ContactList
			put: RcIdentityBag new.
		System
			commitTransaction;
			abortTransaction;
			yourself.
		i := i + 1.
		10 < i ifTrue: [nil error: ''Unable to create ContactList!!''].
	].
	stream := WriteStream on: String new.
	(ContactsGlobals at: #ContactList) do: [:eachContact | 	"really (Array with: nameString with: titleString with: phoneString)" 
		eachContact asOop printOn: stream.
		eachContact do: [:each | 
			stream tab; nextPutAll: each.
		].
		stream nextPut: Character lf.
	].
	stream contents.
'.
!

fromString: aString

	^super new
		initialize: aString;
		yourself.
!

listFromGciSession: aGciSession

	| string |
	string := aGciSession executeString: self fillListString.
	^self listFromString: string.
!

listFromString: aString

	| list |
	list := aString subStrings: Character lf.
	list := list collect: [:each | self fromString: each].
	^list.
!

new

	^super new
		initialize;
		yourself.
! !
!Contact class categoriesFor: #fillListString!public! !
!Contact class categoriesFor: #fromString:!public! !
!Contact class categoriesFor: #listFromGciSession:!public! !
!Contact class categoriesFor: #listFromString:!public! !
!Contact class categoriesFor: #new!public! !


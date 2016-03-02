"Filed out from Dolphin Smalltalk 7"!

TestCase subclass: #JadeTest
	instanceVariableNames: 'gciSession transcriptShell'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
JadeTest guid: (GUID fromString: '{C02B6503-FFD6-49CF-A51E-8A389FB7E5F8}')!
JadeTest comment: 'Transcript:
	Transcript show: ''Transcript test''.	"Copy, Delete"
My Session:
	UserGlobals at: #''James'' put: 42.	"Commit"
	UserGlobals at: #''James''.
	UserGlobals at: #''James'' put: 24.
	UserGlobals at: #''James''.				"Abort"
	UserGlobals at: #''James''.
All Sessions:
	"Menus"
	"Auto-update"
Workspace:
	2 + 3.	"Display, Execute, Inspect"
	2 -> 3.	"Inspect"
		self key.
		self value.
User Browser:
	"New user: Seaside"
	"Missing edit of Details & Password"
'!
!JadeTest categoriesForClass!SUnit! !
!JadeTest methodsFor!

buttonWithCommand: aSymbol inToolbar: aPresenter

	| view |
	view := aPresenter toolbarPresenter view.
	1 to: view size do: [:i | 
		| item |
		item := view itemAtIndex: i.
		(item isDivider not and: [item command == aSymbol]) ifTrue: [^item].
	].
	^nil!

doTranscriptToolbarCommand: aSymbol

	| button toolbar view |
	toolbar := self transcriptShell toolbarPresenter.
	button := self buttonWithCommand: aSymbol inToolbar: toolbar.
	self assert: button isEnabled.
	toolbar perform: aSymbol.
!

doTranscriptToolbarCommand: aSymbol shell: aClass 

	| after before |
	before := aClass allInstances.
	self doTranscriptToolbarCommand: aSymbol.
	after := aClass allInstances.
	self assert: before size + 1 == after size.
	after do: [:each | (before includes: each) ifFalse: [each view close]].
!

gciSession

	^gciSession ifNil: [gciSession := self transcriptShell gciSession].
	!

loginShell

	|  list |
	list := JadeLoginShell allInstances reject: [:each | each view == DeafObject current].
	list isEmpty ifTrue: [
		| additionalTools jadeTool |
		additionalTools := Smalltalk developmentSystem systemFolder childrenOf: Smalltalk developmentSystem additionalToolsFolder.
		jadeTool := additionalTools detect: [:each | each description = 'Jade Login for GemStone/S'].
		jadeTool openBlock value: nil value: nil.
		list := JadeLoginShell allInstances reject: [:each | each view == DeafObject current].
		self assert: list size == 1.
	].
	^list at: 1.
!

testEditToolbarDoIt

	| button textPresenter toolbarPresenter transcriptPresenter view |
	transcriptPresenter := self transcriptShell transcriptPresenter.
	textPresenter := transcriptPresenter textPresenter.
	toolbarPresenter := transcriptPresenter toolbarPresenter.
	button := self buttonWithCommand: #'displayIt' inToolbar: toolbarPresenter.
	self assert: button isEnabled.
	view := textPresenter view.
	"textPresenter value: '2 + 3'.
	view halt."!

testTranscriptToolbarAbort

	| after before string success |
	string := 'System myCacheStatisticWithName: ''AbortCount'''.
	before := self gciSession executeString: string.
	[
		success := false.
		self doTranscriptToolbarCommand: #abort.
	] on: SuccessNotification do: [:ex | 
		success := true.
		ex resume.
	].
	after := self gciSession executeString: string.
	self 
		assert: before + 1 == after;
		assert: success;
		yourself.
!

testTranscriptToolbarClasses
	self doTranscriptToolbarCommand: #browseClasses shell: JadeSystemBrowser!

testTranscriptToolbarCommit

	| after before success |
	before := self gciSession executeString: 'UserGlobals at: #''Jade_test'' put: Object new. System myCacheStatisticWithName: ''CommitCount''.'.
	[
		success := false.
		self doTranscriptToolbarCommand: #commit.
	] on: SuccessNotification do: [:ex | 
		success := true.
		ex resume.
	].
	after := self gciSession executeString: 'System myCacheStatisticWithName: ''CommitCount'''.
	self 
		assert: before + 1 == after;
		assert: success;
		yourself.
!

testTranscriptToolbarMontecello
	self doTranscriptToolbarCommand: #browseMonticello shell: MCRepositoryBrowser!

testTranscriptToolbarNewWorkspace
	self doTranscriptToolbarCommand: #fileNew shell: JadeWorkspace!

testTranscriptToolbarUsers
	| after before |
	before := AllUsersShell allInstances.
	self doTranscriptToolbarCommand: #browseUsers.
	after := AllUsersShell allInstances.
	self assert: before size + 1 == after size.
	after do: [:each | (before includes: each) ifFalse: [each view close]]!

transcriptShell

	^transcriptShell ifNil: [
		| list |
		list := JadeTranscript allInstances reject: [:each | each view == DeafObject current].
		list isEmpty ifTrue: [
			self loginShell login.
			list := JadeTranscript allInstances reject: [:each | each view == DeafObject current].
		].
		transcriptShell := list first
	].
! !
!JadeTest categoriesFor: #buttonWithCommand:inToolbar:!private!tools toolbar! !
!JadeTest categoriesFor: #doTranscriptToolbarCommand:!private!tools toolbar! !
!JadeTest categoriesFor: #doTranscriptToolbarCommand:shell:!private!tools toolbar! !
!JadeTest categoriesFor: #gciSession!public! !
!JadeTest categoriesFor: #loginShell!public! !
!JadeTest categoriesFor: #testEditToolbarDoIt!edit toolbar!public! !
!JadeTest categoriesFor: #testTranscriptToolbarAbort!public!tools toolbar! !
!JadeTest categoriesFor: #testTranscriptToolbarClasses!public!tools toolbar! !
!JadeTest categoriesFor: #testTranscriptToolbarCommit!public!tools toolbar! !
!JadeTest categoriesFor: #testTranscriptToolbarMontecello!public!tools toolbar! !
!JadeTest categoriesFor: #testTranscriptToolbarNewWorkspace!public!tools toolbar! !
!JadeTest categoriesFor: #testTranscriptToolbarUsers!public!tools toolbar! !
!JadeTest categoriesFor: #transcriptShell!public! !


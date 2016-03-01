"Filed out from Dolphin Smalltalk 7"!

JadePresenter subclass: #JadeEditToolBarPresenter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
JadeEditToolBarPresenter guid: (GUID fromString: '{F557CDF8-6D1D-49DC-A346-A0F757A1D7BA}')!
JadeEditToolBarPresenter comment: ''!
!JadeEditToolBarPresenter categoriesForClass!MVP-Presenters! !
!JadeEditToolBarPresenter methodsFor!

clearSelection

	parentPresenter editDelete.
!

copySelection

	parentPresenter editCopy.!

cutSelection

	parentPresenter editCut.
!

displayIt

	parentPresenter jadeDisplay.
!

doIt

	parentPresenter jadeExecute.
!

find

	parentPresenter editFind.
!

inspectIt

	parentPresenter jadeInspect.
!

pasteClipboard

	parentPresenter editPaste.
!

queryCommand: query

	| documentPresenter |
	documentPresenter := parentPresenter documentPresenter.

	(#(#'save') includes: query commandSymbol) ifTrue: [
		query isEnabled: documentPresenter isModified.
		^true.
	].
	(#(#clearSelection #copySelection #cutSelection) includes: query commandSymbol) ifTrue: [
		query isEnabled: documentPresenter hasSelection.
		^true.
	].
	(query commandSymbol = #pasteClipboard) ifTrue: [
		query isEnabled: documentPresenter view canPaste.
		^true.
	].
	(query commandSymbol = #undo) ifTrue: [
		query isEnabled: parentPresenter documentPresenter view canUndo.
		^true.
	].
	(query commandSymbol = #redo) ifTrue: [
		query isEnabled: parentPresenter documentPresenter view canRedo.
		^true.
	].
	^super queryCommand: query.
!

redo

	self halt.
!

replace

	parentPresenter editReplace.
!

save

	self halt.
!

undo

	self halt.
! !
!JadeEditToolBarPresenter categoriesFor: #clearSelection!clipboard operations!public! !
!JadeEditToolBarPresenter categoriesFor: #copySelection!clipboard operations!public! !
!JadeEditToolBarPresenter categoriesFor: #cutSelection!clipboard operations!public! !
!JadeEditToolBarPresenter categoriesFor: #displayIt!evaluating!public! !
!JadeEditToolBarPresenter categoriesFor: #doIt!evaluating!public! !
!JadeEditToolBarPresenter categoriesFor: #find!public!searching & replacing! !
!JadeEditToolBarPresenter categoriesFor: #inspectIt!evaluating!public! !
!JadeEditToolBarPresenter categoriesFor: #pasteClipboard!clipboard operations!public! !
!JadeEditToolBarPresenter categoriesFor: #queryCommand:!public! !
!JadeEditToolBarPresenter categoriesFor: #redo!public!undo & redo! !
!JadeEditToolBarPresenter categoriesFor: #replace!public!searching & replacing! !
!JadeEditToolBarPresenter categoriesFor: #save!public! !
!JadeEditToolBarPresenter categoriesFor: #undo!public!undo & redo! !

!JadeEditToolBarPresenter class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 3 788558 10 ##(Smalltalk.STBViewProxy) 8 ##(Smalltalk.ContainerView) 98 15 0 0 98 2 8 1409286144 131073 416 0 0 0 5 0 0 0 416 852230 ##(Smalltalk.FramingLayout) 234 240 98 2 410 8 ##(Smalltalk.ToolbarA) 98 25 0 416 98 2 8 1140851500 131137 560 0 524550 ##(Smalltalk.ColorRef) 8 4278190080 0 517 0 263174 ##(Smalltalk.Font) 0 16 459014 ##(Smalltalk.LOGFONT) 8 #[243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 3 2 1 34 65 114 105 97 108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0] 328198 ##(Smalltalk.Point) 193 193 0 560 642 8 4278190080 8 4294902737 0 234 256 98 24 10441 1246982 ##(Smalltalk.ToolbarSystemButton) 10441 0 560 1 1180998 4 ##(Smalltalk.CommandDescription) 8 #undo 8 'Undo' 1 1 0 1 7 10443 882 10443 0 560 1 914 8 #redo 8 'Redo' 1 1 0 1 9 10445 882 10445 0 560 1 914 8 #find 8 'Find' 1 1 0 1 25 10447 882 10447 0 560 1 914 8 #replace 8 'Replace' 1 1 0 1 27 10425 853766 ##(Smalltalk.ToolbarButton) 10425 0 560 1 914 8 #displayIt 8 'Print Result of Selection or Line' 1 1 0 395334 3 ##(Smalltalk.Bitmap) 0 16 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'Tools.bmp' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' 0 0 7 770 1857 33 55 10427 1170 10427 0 560 1 914 8 #doIt 8 'Evaluate Selection or Line' 1 1 0 1264 57 10429 1170 10429 0 560 1 914 8 #inspectIt 8 'Inspect Selection or Line' 1 1 0 1264 59 10431 882 10431 0 560 1 914 8 #save 8 'Save' 1 1 0 1 17 10433 882 10433 0 560 1 914 8 #cutSelection 8 'Cut' 1 1 0 1 1 10435 882 10435 0 560 1 914 8 #copySelection 8 'Copy' 1 1 0 1 3 10437 882 10437 0 560 1 914 8 #pasteClipboard 8 'Paste' 1 1 0 1 5 10439 882 10439 0 560 1 914 8 #clearSelection 8 'Delete' 1 1 0 1 11 98 15 1184 1392 1456 1050118 ##(Smalltalk.ToolbarSeparator) 0 0 560 3 0 1 1520 1858 0 0 560 3 0 1 1584 1648 1712 1776 896 976 1858 0 0 560 3 0 1 1040 1104 234 240 98 4 1 117 1264 1 0 1 0 770 33 33 770 45 45 0 0 983302 ##(Smalltalk.MessageSequence) 202 208 98 2 721670 ##(Smalltalk.MessageSend) 8 #createAt:extent: 98 2 770 1 1 770 701 51 560 2050 8 #updateSizePosted 98 0 560 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 94 1 0 0 25 0 0 0] 98 0 770 193 193 0 27 1181766 2 ##(Smalltalk.FramingConstraints) 1180678 ##(Smalltalk.FramingCalculation) 8 #fixedParentLeft 1 2306 8 #fixedParentRight 1 2306 8 #fixedParentTop 1 2306 8 #fixedViewTop 51 234 256 2176 0 1986 202 208 98 1 2050 2080 98 2 770 5119 21 770 701 51 416 2194 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 9 0 0 10 0 0 0 93 11 0 0 35 0 0 0] 98 1 560 2256 0 27 )! !
!JadeEditToolBarPresenter class categoriesFor: #resource_Default_view!public!resources-views! !


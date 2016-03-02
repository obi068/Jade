"Filed out from Dolphin Smalltalk 7"!

JadePresenter subclass: #JadeToolsToolBarPresenter
	instanceVariableNames: 'toolbarPresenter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
JadeToolsToolBarPresenter guid: (GUID fromString: '{7109CDBE-8FA3-4A9D-A3D2-0C1295A3256E}')!
JadeToolsToolBarPresenter comment: ''!
!JadeToolsToolBarPresenter categoriesForClass!Unclassified! !
!JadeToolsToolBarPresenter methodsFor!

abort

	gciSession abort.
	Sound informationBeep.
!

commit

	gciSession commit ifTrue: [
		Sound informationBeep.
	] ifFalse: [
		MessageBox warning: 'Commit failed!!'.
	].
!

createComponents

	super createComponents.
	toolbarPresenter := self add: Presenter new name: 'toolbar'.
self halt.!

fileNew

	JadeWorkspace showOnSession: gciSession.
!

fileOpen

	JadeWorkspace openOnSession: gciSession.
!

toolbarPresenter

	^toolbarPresenter! !
!JadeToolsToolBarPresenter categoriesFor: #abort!Jade!public! !
!JadeToolsToolBarPresenter categoriesFor: #commit!public! !
!JadeToolsToolBarPresenter categoriesFor: #createComponents!public! !
!JadeToolsToolBarPresenter categoriesFor: #fileNew!public! !
!JadeToolsToolBarPresenter categoriesFor: #fileOpen!public! !
!JadeToolsToolBarPresenter categoriesFor: #toolbarPresenter!public! !

!JadeToolsToolBarPresenter class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 3 788558 10 ##(Smalltalk.STBViewProxy) 8 ##(Smalltalk.ContainerView) 98 15 0 0 98 2 8 1409286144 131073 416 0 0 0 5 0 0 0 416 852230 ##(Smalltalk.FramingLayout) 234 240 98 2 410 8 ##(Smalltalk.ToolbarA) 98 25 0 416 98 2 8 1140851500 131137 560 0 524550 ##(Smalltalk.ColorRef) 8 4278190080 0 517 0 263174 ##(Smalltalk.Font) 0 16 459014 ##(Smalltalk.LOGFONT) 8 #[243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 3 2 1 34 65 114 105 97 108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0] 328198 ##(Smalltalk.Point) 193 193 0 560 642 8 4278190080 8 4294903315 0 234 256 98 14 11603 853766 ##(Smalltalk.ToolbarButton) 11603 0 560 1 1180998 4 ##(Smalltalk.CommandDescription) 8 #abort 8 'Abort Transaction' 1 1 0 395334 3 ##(Smalltalk.Bitmap) 0 16 1572870 ##(Smalltalk.ImageRelativeFileLocator) 8 'Tools.bmp' 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 8 'dolphindr7.dll' 0 0 7 770 1857 33 1 11605 882 11605 0 560 1 914 8 #commit 8 'Commit Transaction' 1 1 0 992 27 11607 1246982 ##(Smalltalk.ToolbarSystemButton) 11607 0 560 1 914 8 #fileNew 8 'New Workspace' 1 1 0 1 13 11609 1186 11609 0 560 1 914 8 #fileOpen 8 'Open Workspace' 1 1 0 1 15 11611 882 11611 0 560 1 914 8 #browseUsers 8 'Browse Users' 1 1 0 992 75 11613 882 11613 0 560 1 914 8 #browseClasses 8 'Open System Browser' 1 1 0 992 17 11615 882 11615 0 560 1 914 8 #browseMonticello 8 'Open Monticello Browser' 1 1 0 992 3 98 9 896 1120 1050118 ##(Smalltalk.ToolbarSeparator) 0 0 560 3 0 1 1200 1264 1538 0 0 560 3 0 1 1328 1392 1456 234 240 98 4 1 117 992 1 0 1 0 770 33 33 770 45 45 0 0 983302 ##(Smalltalk.MessageSequence) 202 208 98 2 721670 ##(Smalltalk.MessageSend) 8 #createAt:extent: 98 2 770 1 1 770 401 51 560 1714 8 #updateSizePosted 98 0 560 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 200 0 0 0 25 0 0 0] 98 0 770 193 193 0 27 1181766 2 ##(Smalltalk.FramingConstraints) 1180678 ##(Smalltalk.FramingCalculation) 8 #fixedParentLeft 1 1970 8 #fixedParentRight 1 1970 8 #fixedParentTop 1 1970 8 #fixedParentBottom 1 234 256 98 2 560 8 'toolbar' 0 1650 202 208 98 1 1714 1744 98 2 770 5119 21 770 401 51 416 1858 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 9 0 0 10 0 0 0 199 10 0 0 35 0 0 0] 98 1 560 1920 0 27 )! !
!JadeToolsToolBarPresenter class categoriesFor: #resource_Default_view!public!resources-views! !


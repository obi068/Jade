"Filed out from Dolphin Smalltalk 7"!

JadePresenter subclass: #JadeToolbarPresenter
	instanceVariableNames: 'toolbarPresenter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
JadeToolbarPresenter guid: (GUID fromString: '{B7504A8F-0228-44A2-B7AD-9EF57A1ECC1F}')!
JadeToolbarPresenter comment: ''!
!JadeToolbarPresenter categoriesForClass!MVP-Presenters! !
!JadeToolbarPresenter methodsFor!

createComponents

	super createComponents.
	toolbarPresenter := self add: Presenter new name: 'toolbar'.
!

toolbarPresenter

	^toolbarPresenter! !
!JadeToolbarPresenter categoriesFor: #createComponents!public! !
!JadeToolbarPresenter categoriesFor: #toolbarPresenter!public! !


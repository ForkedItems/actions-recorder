
var
  React $ require :react
  Immutable $ require :immutable

var
  actions $ require :../actions

var
  Controller $ React.createFactory $ require :../panel/controller

var
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.List
    :records $ React.PropTypes.instanceOf Immutable.List
    :pointer React.PropTypes.number.isRequired

  :onCommit $ \ ()
    actions.internalCommit

  :onReset $ \ ()
    actions.internalReset

  :onPeek $ \ (position)
    actions.internalPeek position

  :onDiscard $ \ ()
    actions.internalDiscard

  :render $ \ ()
    div ({} (:className :app-page))
      Controller $ {}
        :onCommit this.onCommit
        :onReset this.onReset
        :onPeek this.onPeek
        :onDiscard this.onDiscard
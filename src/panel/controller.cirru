
var
  React $ require :react
  Immutable $ require :immutable

var
  RecordItem $ React.createFactory $ require :./record-item

var
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :actions-recorder-controller

  :propTypes $ {}
    :records $ React.PropTypes.instanceOf Immutable.List
    :pointer React.PropTypes.number.isRequired
    :isTravelling React.PropTypes.bool.isRequired
    :onCommit React.PropTypes.func.isRequired
    :onSwitch React.PropTypes.func.isRequired
    :onReset React.PropTypes.func.isRequired
    :onPeek React.PropTypes.func.isRequired
    :onDiscard React.PropTypes.func.isRequired

  :render $ \ ()
    div ({} (:className :actions-recorder-controller))
      div
        {} (:className :recorder-monitor)
          :style $ {}
            :paddingBottom $ - innerHeight 50
            :height $ - innerHeight 50
        this.props.records.map $ \\ (record index)
          var onClick $ \\ () (this.props.onPeek index)
          RecordItem $ {} (:onClick onClick) (:record record)
            :key index
            :index index
            :isPointer $ and this.props.isTravelling
              is this.props.pointer index
            :onPeek this.props.onPeek
      div ({} (:className :recorder-footer))
        div ({} (:className ":button is-attract") (:onClick this.props.onCommit)) :Commit
        div ({} (:className ":button is-attract") (:onClick this.props.onSwitch))
          cond this.props.isTravelling :Back :Travel
        div ({} (:className ":button is-danger") (:onClick this.props.onDiscard)) :Discard
        div ({} (:className ":button is-danger") (:onClick this.props.onReset)) :Reset

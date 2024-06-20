; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4114 () Bool)

(assert start!4114)

(declare-fun mapNonEmpty!231 () Bool)

(declare-fun mapRes!232 () Bool)

(declare-fun tp!232 () Bool)

(declare-fun tp_is_empty!79 () Bool)

(assert (=> mapNonEmpty!231 (= mapRes!232 (and tp!232 tp_is_empty!79))))

(declare-datatypes ((T!4345 0))(
  ( (T!4346 (val!39 Int)) )
))
(declare-fun mapRest!232 () (Array (_ BitVec 32) T!4345))

(declare-fun mapKey!231 () (_ BitVec 32))

(declare-fun mapValue!232 () T!4345)

(declare-datatypes ((array!1101 0))(
  ( (array!1102 (arr!898 (Array (_ BitVec 32) T!4345)) (size!469 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1101)

(assert (=> mapNonEmpty!231 (= (arr!898 src!2) (store mapRest!232 mapKey!231 mapValue!232))))

(declare-fun mapIsEmpty!231 () Bool)

(assert (=> mapIsEmpty!231 mapRes!232))

(declare-fun b!17367 () Bool)

(declare-fun e!11082 () Bool)

(assert (=> b!17367 (= e!11082 (and tp_is_empty!79 mapRes!232))))

(declare-fun condMapEmpty!232 () Bool)

(declare-fun mapDefault!232 () T!4345)


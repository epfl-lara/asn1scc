; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4132 () Bool)

(assert start!4132)

(declare-fun mapIsEmpty!283 () Bool)

(declare-fun mapRes!284 () Bool)

(assert (=> mapIsEmpty!283 mapRes!284))

(declare-fun mapIsEmpty!284 () Bool)

(declare-fun mapRes!283 () Bool)

(assert (=> mapIsEmpty!284 mapRes!283))

(declare-fun b!17417 () Bool)

(declare-fun e!11130 () Bool)

(declare-fun tp_is_empty!95 () Bool)

(assert (=> b!17417 (= e!11130 (and tp_is_empty!95 mapRes!284))))

(declare-fun condMapEmpty!284 () Bool)

(declare-datatypes ((T!4401 0))(
  ( (T!4402 (val!47 Int)) )
))
(declare-datatypes ((array!1118 0))(
  ( (array!1119 (arr!906 (Array (_ BitVec 32) T!4401)) (size!477 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1118)

(declare-fun mapDefault!284 () T!4401)


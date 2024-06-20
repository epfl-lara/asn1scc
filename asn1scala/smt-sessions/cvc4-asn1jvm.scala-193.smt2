; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4042 () Bool)

(assert start!4042)

(declare-fun mapIsEmpty!38 () Bool)

(declare-fun mapRes!38 () Bool)

(assert (=> mapIsEmpty!38 mapRes!38))

(declare-fun b!17167 () Bool)

(declare-fun e!10893 () Bool)

(declare-fun tp_is_empty!17 () Bool)

(declare-fun mapRes!39 () Bool)

(assert (=> b!17167 (= e!10893 (and tp_is_empty!17 mapRes!39))))

(declare-fun condMapEmpty!39 () Bool)

(declare-datatypes ((T!4063 0))(
  ( (T!4064 (val!8 Int)) )
))
(declare-datatypes ((array!1035 0))(
  ( (array!1036 (arr!867 (Array (_ BitVec 32) T!4063)) (size!438 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1035)

(declare-fun mapDefault!38 () T!4063)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4050 () Bool)

(assert start!4050)

(declare-fun b!17191 () Bool)

(declare-fun e!10917 () Bool)

(declare-fun tp_is_empty!25 () Bool)

(declare-fun mapRes!63 () Bool)

(assert (=> b!17191 (= e!10917 (and tp_is_empty!25 mapRes!63))))

(declare-fun condMapEmpty!62 () Bool)

(declare-datatypes ((T!4111 0))(
  ( (T!4112 (val!12 Int)) )
))
(declare-datatypes ((array!1043 0))(
  ( (array!1044 (arr!871 (Array (_ BitVec 32) T!4111)) (size!442 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1043)

(declare-fun mapDefault!63 () T!4111)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63122 () Bool)

(assert start!63122)

(declare-fun mapIsEmpty!700 () Bool)

(declare-fun mapRes!701 () Bool)

(assert (=> mapIsEmpty!700 mapRes!701))

(declare-fun b!282509 () Bool)

(declare-fun e!201857 () Bool)

(declare-fun tp_is_empty!287 () Bool)

(declare-fun mapRes!700 () Bool)

(assert (=> b!282509 (= e!201857 (and tp_is_empty!287 mapRes!700))))

(declare-fun condMapEmpty!701 () Bool)

(declare-datatypes ((T!50053 0))(
  ( (T!50054 (val!143 Int)) )
))
(declare-datatypes ((array!16320 0))(
  ( (array!16321 (arr!8040 (Array (_ BitVec 32) T!50053)) (size!7044 (_ BitVec 32))) )
))
(declare-fun a2!463 () array!16320)

(declare-fun mapDefault!701 () T!50053)


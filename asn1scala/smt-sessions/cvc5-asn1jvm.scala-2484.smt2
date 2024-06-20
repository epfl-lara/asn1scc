; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63154 () Bool)

(assert start!63154)

(declare-fun b!282681 () Bool)

(declare-fun e!201983 () Bool)

(declare-fun tp_is_empty!313 () Bool)

(declare-fun mapRes!782 () Bool)

(assert (=> b!282681 (= e!201983 (and tp_is_empty!313 mapRes!782))))

(declare-fun condMapEmpty!783 () Bool)

(declare-datatypes ((T!50179 0))(
  ( (T!50180 (val!156 Int)) )
))
(declare-datatypes ((array!16347 0))(
  ( (array!16348 (arr!8053 (Array (_ BitVec 32) T!50179)) (size!7057 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16347)

(declare-fun mapDefault!783 () T!50179)


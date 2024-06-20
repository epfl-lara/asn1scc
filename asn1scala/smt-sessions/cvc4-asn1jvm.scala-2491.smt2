; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63206 () Bool)

(assert start!63206)

(declare-fun b!283147 () Bool)

(declare-fun e!202209 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!283147 (= e!202209 (bvslt i!913 #b00000000000000000000000000000000))))

(declare-fun b!283148 () Bool)

(declare-fun e!202210 () Bool)

(declare-fun tp_is_empty!359 () Bool)

(declare-fun mapRes!925 () Bool)

(assert (=> b!283148 (= e!202210 (and tp_is_empty!359 mapRes!925))))

(declare-fun condMapEmpty!925 () Bool)

(declare-datatypes ((T!50365 0))(
  ( (T!50366 (val!179 Int)) )
))
(declare-datatypes ((array!16394 0))(
  ( (array!16395 (arr!8076 (Array (_ BitVec 32) T!50365)) (size!7080 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16394)

(declare-fun mapDefault!925 () T!50365)


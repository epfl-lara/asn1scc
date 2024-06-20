; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68490 () Bool)

(assert start!68490)

(declare-fun b!307645 () Bool)

(declare-fun e!221653 () Bool)

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun to!599 () (_ BitVec 32))

(assert (=> b!307645 (= e!221653 (bvsgt fromSlice!41 to!599))))

(declare-fun b!307646 () Bool)

(declare-fun e!221652 () Bool)

(declare-fun tp_is_empty!775 () Bool)

(declare-fun mapRes!2485 () Bool)

(assert (=> b!307646 (= e!221652 (and tp_is_empty!775 mapRes!2485))))

(declare-fun condMapEmpty!2485 () Bool)

(declare-datatypes ((T!57561 0))(
  ( (T!57562 (val!387 Int)) )
))
(declare-datatypes ((array!18638 0))(
  ( (array!18639 (arr!9157 (Array (_ BitVec 32) T!57561)) (size!8074 (_ BitVec 32))) )
))
(declare-fun a2!506 () array!18638)

(declare-fun mapDefault!2486 () T!57561)


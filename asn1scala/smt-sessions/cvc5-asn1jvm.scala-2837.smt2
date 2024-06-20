; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68536 () Bool)

(assert start!68536)

(declare-fun b!308023 () Bool)

(declare-fun res!252703 () Bool)

(declare-fun e!221859 () Bool)

(assert (=> b!308023 (=> (not res!252703) (not e!221859))))

(declare-fun to!617 () (_ BitVec 32))

(declare-datatypes ((T!57743 0))(
  ( (T!57744 (val!408 Int)) )
))
(declare-datatypes ((array!18681 0))(
  ( (array!18682 (arr!9178 (Array (_ BitVec 32) T!57743)) (size!8095 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18681)

(declare-fun a2!524 () array!18681)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEq!1715 (array!18681 array!18681 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308023 (= res!252703 (arrayRangesEq!1715 a1!524 a2!524 from!650 to!617))))

(declare-fun e!221861 () Bool)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun b!308024 () Bool)

(assert (=> b!308024 (= e!221861 (arrayRangesEq!1715 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308025 () Bool)

(declare-fun e!221862 () Bool)

(declare-fun tp_is_empty!817 () Bool)

(declare-fun mapRes!2615 () Bool)

(assert (=> b!308025 (= e!221862 (and tp_is_empty!817 mapRes!2615))))

(declare-fun condMapEmpty!2615 () Bool)

(declare-fun mapDefault!2615 () T!57743)


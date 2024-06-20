; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68546 () Bool)

(assert start!68546)

(declare-fun b!308143 () Bool)

(declare-fun res!252794 () Bool)

(declare-fun e!221919 () Bool)

(assert (=> b!308143 (=> (not res!252794) (not e!221919))))

(declare-datatypes ((T!57773 0))(
  ( (T!57774 (val!413 Int)) )
))
(declare-datatypes ((array!18691 0))(
  ( (array!18692 (arr!9183 (Array (_ BitVec 32) T!57773)) (size!8100 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18691)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun a1!524 () array!18691)

(declare-fun arrayRangesEq!1719 (array!18691 array!18691 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308143 (= res!252794 (arrayRangesEq!1719 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308144 () Bool)

(declare-fun e!221921 () Bool)

(declare-fun tp_is_empty!827 () Bool)

(declare-fun mapRes!2646 () Bool)

(assert (=> b!308144 (= e!221921 (and tp_is_empty!827 mapRes!2646))))

(declare-fun condMapEmpty!2645 () Bool)

(declare-fun mapDefault!2645 () T!57773)


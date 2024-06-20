; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68482 () Bool)

(assert start!68482)

(declare-fun e!221606 () Bool)

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57513 0))(
  ( (T!57514 (val!383 Int)) )
))
(declare-datatypes ((array!18630 0))(
  ( (array!18631 (arr!9153 (Array (_ BitVec 32) T!57513)) (size!8070 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18630)

(declare-fun b!307557 () Bool)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18630)

(declare-fun arrayRangesEq!1698 (array!18630 array!18630 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307557 (= e!221606 (arrayRangesEq!1698 a1!506 a2!506 to!599 toSlice!41))))

(declare-fun b!307558 () Bool)

(declare-fun e!221608 () Bool)

(declare-fun tp_is_empty!767 () Bool)

(declare-fun mapRes!2462 () Bool)

(assert (=> b!307558 (= e!221608 (and tp_is_empty!767 mapRes!2462))))

(declare-fun condMapEmpty!2461 () Bool)

(declare-fun mapDefault!2461 () T!57513)


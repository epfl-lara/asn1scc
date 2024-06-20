; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68516 () Bool)

(assert start!68516)

(declare-fun b!307855 () Bool)

(declare-fun e!221769 () Bool)

(assert (=> b!307855 (= e!221769 (not true))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57643 0))(
  ( (T!57644 (val!398 Int)) )
))
(declare-datatypes ((array!18661 0))(
  ( (array!18662 (arr!9168 (Array (_ BitVec 32) T!57643)) (size!8085 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18661)

(declare-fun a2!506 () array!18661)

(declare-fun arrayRangesEq!1708 (array!18661 array!18661 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307855 (arrayRangesEq!1708 a1!506 a2!506 fromSlice!41 toSlice!41)))

(declare-fun from!632 () (_ BitVec 32))

(declare-datatypes ((Unit!21449 0))(
  ( (Unit!21450) )
))
(declare-fun lt!440268 () Unit!21449)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun rec!94 (array!18661 array!18661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21449)

(assert (=> b!307855 (= lt!440268 (rec!94 a1!506 a2!506 from!632 fromSlice!41 to!599 toSlice!41 to!599))))

(declare-fun e!221768 () Bool)

(declare-fun b!307856 () Bool)

(assert (=> b!307856 (= e!221768 (arrayRangesEq!1708 a1!506 a2!506 to!599 toSlice!41))))

(declare-fun b!307857 () Bool)

(declare-fun e!221767 () Bool)

(declare-fun tp_is_empty!797 () Bool)

(declare-fun mapRes!2556 () Bool)

(assert (=> b!307857 (= e!221767 (and tp_is_empty!797 mapRes!2556))))

(declare-fun condMapEmpty!2556 () Bool)

(declare-fun mapDefault!2556 () T!57643)


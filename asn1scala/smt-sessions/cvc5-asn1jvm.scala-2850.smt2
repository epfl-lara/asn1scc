; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68614 () Bool)

(assert start!68614)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!58081 0))(
  ( (T!58082 (val!447 Int)) )
))
(declare-datatypes ((array!18759 0))(
  ( (array!18760 (arr!9217 (Array (_ BitVec 32) T!58081)) (size!8134 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18759)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun e!222383 () Bool)

(declare-fun a1!524 () array!18759)

(declare-fun b!309141 () Bool)

(declare-fun arrayRangesEq!1747 (array!18759 array!18759 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309141 (= e!222383 (arrayRangesEq!1747 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309142 () Bool)

(declare-fun e!222381 () Bool)

(declare-fun tp_is_empty!895 () Bool)

(declare-fun mapRes!2849 () Bool)

(assert (=> b!309142 (= e!222381 (and tp_is_empty!895 mapRes!2849))))

(declare-fun condMapEmpty!2850 () Bool)

(declare-fun mapDefault!2850 () T!58081)


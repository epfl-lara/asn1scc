; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68654 () Bool)

(assert start!68654)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!58189 0))(
  ( (T!58190 (val!461 Int)) )
))
(declare-datatypes ((array!18789 0))(
  ( (array!18790 (arr!9231 (Array (_ BitVec 32) T!58189)) (size!8148 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18789)

(declare-fun e!222629 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun b!309653 () Bool)

(declare-fun a1!524 () array!18789)

(declare-fun arrayRangesEq!1760 (array!18789 array!18789 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309653 (= e!222629 (not (arrayRangesEq!1760 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!309654 () Bool)

(declare-fun e!222628 () Bool)

(declare-fun tp_is_empty!923 () Bool)

(declare-fun mapRes!2942 () Bool)

(assert (=> b!309654 (= e!222628 (and tp_is_empty!923 mapRes!2942))))

(declare-fun condMapEmpty!2942 () Bool)

(declare-fun mapDefault!2941 () T!58189)


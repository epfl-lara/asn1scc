; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63112 () Bool)

(assert start!63112)

(declare-fun b!282463 () Bool)

(declare-fun e!201820 () Bool)

(declare-fun tp_is_empty!281 () Bool)

(declare-fun mapRes!678 () Bool)

(assert (=> b!282463 (= e!201820 (and tp_is_empty!281 mapRes!678))))

(declare-fun condMapEmpty!678 () Bool)

(declare-datatypes ((T!50027 0))(
  ( (T!50028 (val!140 Int)) )
))
(declare-datatypes ((array!16313 0))(
  ( (array!16314 (arr!8037 (Array (_ BitVec 32) T!50027)) (size!7041 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16313)

(declare-fun mapDefault!679 () T!50027)


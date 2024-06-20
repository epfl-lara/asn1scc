; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63220 () Bool)

(assert start!63220)

(declare-fun b!283282 () Bool)

(declare-fun e!202274 () Bool)

(declare-fun tp_is_empty!373 () Bool)

(declare-fun mapRes!966 () Bool)

(assert (=> b!283282 (= e!202274 (and tp_is_empty!373 mapRes!966))))

(declare-fun condMapEmpty!966 () Bool)

(declare-datatypes ((T!50439 0))(
  ( (T!50440 (val!186 Int)) )
))
(declare-datatypes ((array!16408 0))(
  ( (array!16409 (arr!8083 (Array (_ BitVec 32) T!50439)) (size!7087 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16408)

(declare-fun mapDefault!966 () T!50439)


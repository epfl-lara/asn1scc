; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63140 () Bool)

(assert start!63140)

(declare-fun mapIsEmpty!754 () Bool)

(declare-fun mapRes!755 () Bool)

(assert (=> mapIsEmpty!754 mapRes!755))

(declare-fun b!282617 () Bool)

(declare-fun e!201937 () Bool)

(declare-fun tp_is_empty!305 () Bool)

(declare-fun mapRes!754 () Bool)

(assert (=> b!282617 (= e!201937 (and tp_is_empty!305 mapRes!754))))

(declare-fun condMapEmpty!755 () Bool)

(declare-datatypes ((T!50131 0))(
  ( (T!50132 (val!152 Int)) )
))
(declare-datatypes ((array!16338 0))(
  ( (array!16339 (arr!8049 (Array (_ BitVec 32) T!50131)) (size!7053 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16338)

(declare-fun mapDefault!755 () T!50131)


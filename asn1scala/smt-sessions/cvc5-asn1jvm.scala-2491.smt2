; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63202 () Bool)

(assert start!63202)

(declare-fun b!283111 () Bool)

(declare-fun e!202192 () Bool)

(declare-fun tp_is_empty!355 () Bool)

(declare-fun mapRes!912 () Bool)

(assert (=> b!283111 (= e!202192 (and tp_is_empty!355 mapRes!912))))

(declare-fun condMapEmpty!912 () Bool)

(declare-datatypes ((T!50361 0))(
  ( (T!50362 (val!177 Int)) )
))
(declare-datatypes ((array!16390 0))(
  ( (array!16391 (arr!8074 (Array (_ BitVec 32) T!50361)) (size!7078 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16390)

(declare-fun mapDefault!913 () T!50361)


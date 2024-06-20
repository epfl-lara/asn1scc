; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63190 () Bool)

(assert start!63190)

(declare-fun mapIsEmpty!876 () Bool)

(declare-fun mapRes!876 () Bool)

(assert (=> mapIsEmpty!876 mapRes!876))

(declare-fun b!282987 () Bool)

(declare-fun e!202138 () Bool)

(declare-fun tp_is_empty!343 () Bool)

(assert (=> b!282987 (= e!202138 (and tp_is_empty!343 mapRes!876))))

(declare-fun condMapEmpty!877 () Bool)

(declare-datatypes ((T!50309 0))(
  ( (T!50310 (val!171 Int)) )
))
(declare-datatypes ((array!16378 0))(
  ( (array!16379 (arr!8068 (Array (_ BitVec 32) T!50309)) (size!7072 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16378)

(declare-fun mapDefault!877 () T!50309)


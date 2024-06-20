; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63242 () Bool)

(assert start!63242)

(declare-fun mapIsEmpty!1032 () Bool)

(declare-fun mapRes!1033 () Bool)

(assert (=> mapIsEmpty!1032 mapRes!1033))

(declare-fun b!283506 () Bool)

(declare-fun e!202373 () Bool)

(declare-fun tp_is_empty!395 () Bool)

(assert (=> b!283506 (= e!202373 (and tp_is_empty!395 mapRes!1033))))

(declare-fun condMapEmpty!1032 () Bool)

(declare-datatypes ((T!50521 0))(
  ( (T!50522 (val!197 Int)) )
))
(declare-datatypes ((array!16430 0))(
  ( (array!16431 (arr!8094 (Array (_ BitVec 32) T!50521)) (size!7098 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16430)

(declare-fun mapDefault!1033 () T!50521)


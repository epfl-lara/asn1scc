; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63184 () Bool)

(assert start!63184)

(declare-fun b!282924 () Bool)

(declare-fun e!202110 () Bool)

(declare-fun tp_is_empty!337 () Bool)

(declare-fun mapRes!859 () Bool)

(assert (=> b!282924 (= e!202110 (and tp_is_empty!337 mapRes!859))))

(declare-fun condMapEmpty!859 () Bool)

(declare-datatypes ((T!50283 0))(
  ( (T!50284 (val!168 Int)) )
))
(declare-datatypes ((array!16372 0))(
  ( (array!16373 (arr!8065 (Array (_ BitVec 32) T!50283)) (size!7069 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16372)

(declare-fun mapDefault!859 () T!50283)


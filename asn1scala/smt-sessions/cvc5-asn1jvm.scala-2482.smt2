; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63136 () Bool)

(assert start!63136)

(declare-fun mapIsEmpty!742 () Bool)

(declare-fun mapRes!743 () Bool)

(assert (=> mapIsEmpty!742 mapRes!743))

(declare-fun mapNonEmpty!742 () Bool)

(declare-fun tp!743 () Bool)

(declare-fun tp_is_empty!301 () Bool)

(assert (=> mapNonEmpty!742 (= mapRes!743 (and tp!743 tp_is_empty!301))))

(declare-datatypes ((T!50127 0))(
  ( (T!50128 (val!150 Int)) )
))
(declare-fun mapRest!743 () (Array (_ BitVec 32) T!50127))

(declare-datatypes ((array!16334 0))(
  ( (array!16335 (arr!8047 (Array (_ BitVec 32) T!50127)) (size!7051 (_ BitVec 32))) )
))
(declare-fun a2!463 () array!16334)

(declare-fun mapKey!743 () (_ BitVec 32))

(declare-fun mapValue!743 () T!50127)

(assert (=> mapNonEmpty!742 (= (arr!8047 a2!463) (store mapRest!743 mapKey!743 mapValue!743))))

(declare-fun b!282593 () Bool)

(declare-fun e!201918 () Bool)

(assert (=> b!282593 (= e!201918 (and tp_is_empty!301 mapRes!743))))

(declare-fun condMapEmpty!743 () Bool)

(declare-fun mapDefault!743 () T!50127)


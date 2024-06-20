; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63108 () Bool)

(assert start!63108)

(declare-fun mapNonEmpty!666 () Bool)

(declare-fun mapRes!667 () Bool)

(declare-fun tp!666 () Bool)

(declare-fun tp_is_empty!277 () Bool)

(assert (=> mapNonEmpty!666 (= mapRes!667 (and tp!666 tp_is_empty!277))))

(declare-datatypes ((T!50023 0))(
  ( (T!50024 (val!138 Int)) )
))
(declare-fun mapRest!667 () (Array (_ BitVec 32) T!50023))

(declare-fun mapValue!667 () T!50023)

(declare-fun mapKey!666 () (_ BitVec 32))

(declare-datatypes ((array!16309 0))(
  ( (array!16310 (arr!8035 (Array (_ BitVec 32) T!50023)) (size!7039 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16309)

(assert (=> mapNonEmpty!666 (= (arr!8035 a1!463) (store mapRest!667 mapKey!666 mapValue!667))))

(declare-fun mapIsEmpty!666 () Bool)

(assert (=> mapIsEmpty!666 mapRes!667))

(declare-fun b!282439 () Bool)

(declare-fun e!201802 () Bool)

(declare-fun mapRes!666 () Bool)

(assert (=> b!282439 (= e!201802 (and tp_is_empty!277 mapRes!666))))

(declare-fun condMapEmpty!667 () Bool)

(declare-fun a2!463 () array!16309)

(declare-fun mapDefault!667 () T!50023)


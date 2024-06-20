; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63118 () Bool)

(assert start!63118)

(declare-fun mapNonEmpty!688 () Bool)

(declare-fun mapRes!688 () Bool)

(declare-fun tp!688 () Bool)

(declare-fun tp_is_empty!283 () Bool)

(assert (=> mapNonEmpty!688 (= mapRes!688 (and tp!688 tp_is_empty!283))))

(declare-datatypes ((T!50049 0))(
  ( (T!50050 (val!141 Int)) )
))
(declare-fun mapValue!689 () T!50049)

(declare-fun mapRest!689 () (Array (_ BitVec 32) T!50049))

(declare-fun mapKey!689 () (_ BitVec 32))

(declare-datatypes ((array!16316 0))(
  ( (array!16317 (arr!8038 (Array (_ BitVec 32) T!50049)) (size!7042 (_ BitVec 32))) )
))
(declare-fun a2!463 () array!16316)

(assert (=> mapNonEmpty!688 (= (arr!8038 a2!463) (store mapRest!689 mapKey!689 mapValue!689))))

(declare-fun b!282485 () Bool)

(declare-fun res!234330 () Bool)

(declare-fun e!201837 () Bool)

(assert (=> b!282485 (=> (not res!234330) (not e!201837))))

(declare-fun to!556 () (_ BitVec 32))

(declare-fun from!589 () (_ BitVec 32))

(declare-fun a1!463 () array!16316)

(declare-fun arrayRangesEq!1308 (array!16316 array!16316 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282485 (= res!234330 (arrayRangesEq!1308 a1!463 a2!463 from!589 to!556))))

(declare-fun mapIsEmpty!688 () Bool)

(assert (=> mapIsEmpty!688 mapRes!688))

(declare-fun b!282486 () Bool)

(declare-fun e!201838 () Bool)

(declare-fun mapRes!689 () Bool)

(assert (=> b!282486 (= e!201838 (and tp_is_empty!283 mapRes!689))))

(declare-fun condMapEmpty!688 () Bool)

(declare-fun mapDefault!688 () T!50049)


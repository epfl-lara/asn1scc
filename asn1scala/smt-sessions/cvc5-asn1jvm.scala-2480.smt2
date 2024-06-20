; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63124 () Bool)

(assert start!63124)

(declare-fun mapIsEmpty!706 () Bool)

(declare-fun mapRes!706 () Bool)

(assert (=> mapIsEmpty!706 mapRes!706))

(declare-fun mapNonEmpty!706 () Bool)

(declare-fun tp!706 () Bool)

(declare-fun tp_is_empty!289 () Bool)

(assert (=> mapNonEmpty!706 (= mapRes!706 (and tp!706 tp_is_empty!289))))

(declare-fun mapKey!707 () (_ BitVec 32))

(declare-datatypes ((T!50075 0))(
  ( (T!50076 (val!144 Int)) )
))
(declare-fun mapRest!707 () (Array (_ BitVec 32) T!50075))

(declare-fun mapValue!706 () T!50075)

(declare-datatypes ((array!16322 0))(
  ( (array!16323 (arr!8041 (Array (_ BitVec 32) T!50075)) (size!7045 (_ BitVec 32))) )
))
(declare-fun a2!463 () array!16322)

(assert (=> mapNonEmpty!706 (= (arr!8041 a2!463) (store mapRest!707 mapKey!707 mapValue!706))))

(declare-fun b!282521 () Bool)

(declare-fun e!201864 () Bool)

(assert (=> b!282521 (= e!201864 (and tp_is_empty!289 mapRes!706))))

(declare-fun condMapEmpty!706 () Bool)

(declare-fun mapDefault!707 () T!50075)


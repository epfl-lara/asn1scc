; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63208 () Bool)

(assert start!63208)

(declare-fun mapIsEmpty!930 () Bool)

(declare-fun mapRes!930 () Bool)

(assert (=> mapIsEmpty!930 mapRes!930))

(declare-fun mapNonEmpty!930 () Bool)

(declare-fun mapRes!931 () Bool)

(declare-fun tp!930 () Bool)

(declare-fun tp_is_empty!361 () Bool)

(assert (=> mapNonEmpty!930 (= mapRes!931 (and tp!930 tp_is_empty!361))))

(declare-fun mapKey!931 () (_ BitVec 32))

(declare-datatypes ((T!50387 0))(
  ( (T!50388 (val!180 Int)) )
))
(declare-fun mapRest!931 () (Array (_ BitVec 32) T!50387))

(declare-datatypes ((array!16396 0))(
  ( (array!16397 (arr!8077 (Array (_ BitVec 32) T!50387)) (size!7081 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16396)

(declare-fun mapValue!930 () T!50387)

(assert (=> mapNonEmpty!930 (= (arr!8077 a2!471) (store mapRest!931 mapKey!931 mapValue!930))))

(declare-fun b!283167 () Bool)

(declare-fun e!202218 () Bool)

(assert (=> b!283167 (= e!202218 (and tp_is_empty!361 mapRes!930))))

(declare-fun condMapEmpty!931 () Bool)

(declare-fun a1!471 () array!16396)

(declare-fun mapDefault!931 () T!50387)


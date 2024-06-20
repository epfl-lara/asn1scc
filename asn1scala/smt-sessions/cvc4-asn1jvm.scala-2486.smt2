; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63170 () Bool)

(assert start!63170)

(declare-fun mapNonEmpty!830 () Bool)

(declare-fun mapRes!830 () Bool)

(declare-fun tp!830 () Bool)

(declare-fun tp_is_empty!329 () Bool)

(assert (=> mapNonEmpty!830 (= mapRes!830 (and tp!830 tp_is_empty!329))))

(declare-datatypes ((T!50235 0))(
  ( (T!50236 (val!164 Int)) )
))
(declare-fun mapValue!831 () T!50235)

(declare-fun mapRest!830 () (Array (_ BitVec 32) T!50235))

(declare-fun mapKey!830 () (_ BitVec 32))

(declare-datatypes ((array!16363 0))(
  ( (array!16364 (arr!8061 (Array (_ BitVec 32) T!50235)) (size!7065 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16363)

(assert (=> mapNonEmpty!830 (= (arr!8061 a2!471) (store mapRest!830 mapKey!830 mapValue!831))))

(declare-fun mapIsEmpty!830 () Bool)

(assert (=> mapIsEmpty!830 mapRes!830))

(declare-fun res!234519 () Bool)

(declare-fun e!202057 () Bool)

(assert (=> start!63170 (=> (not res!234519) (not e!202057))))

(declare-fun a1!471 () array!16363)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> start!63170 (= res!234519 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7065 a1!471)) (= (size!7065 a1!471) (size!7065 a2!471))))))

(assert (=> start!63170 e!202057))

(declare-fun e!202056 () Bool)

(declare-fun array_inv!6776 (array!16363) Bool)

(assert (=> start!63170 (and (array_inv!6776 a1!471) e!202056)))

(assert (=> start!63170 true))

(declare-fun e!202055 () Bool)

(assert (=> start!63170 (and (array_inv!6776 a2!471) e!202055)))

(declare-fun b!282819 () Bool)

(declare-fun res!234521 () Bool)

(assert (=> b!282819 (=> (not res!234521) (not e!202057))))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun arrayRangesEq!1323 (array!16363 array!16363 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282819 (= res!234521 (arrayRangesEq!1323 a2!471 a1!471 i!913 to!564))))

(declare-fun b!282820 () Bool)

(assert (=> b!282820 (= e!202055 (and tp_is_empty!329 mapRes!830))))

(declare-fun condMapEmpty!831 () Bool)

(declare-fun mapDefault!831 () T!50235)


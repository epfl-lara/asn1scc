; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63160 () Bool)

(assert start!63160)

(declare-fun b!282721 () Bool)

(declare-fun res!234453 () Bool)

(declare-fun e!202011 () Bool)

(assert (=> b!282721 (=> (not res!234453) (not e!202011))))

(declare-datatypes ((T!50205 0))(
  ( (T!50206 (val!159 Int)) )
))
(declare-datatypes ((array!16353 0))(
  ( (array!16354 (arr!8056 (Array (_ BitVec 32) T!50205)) (size!7060 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16353)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16353)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1319 (array!16353 array!16353 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282721 (= res!234453 (arrayRangesEq!1319 a1!471 a2!471 from!597 to!564))))

(declare-fun mapIsEmpty!800 () Bool)

(declare-fun mapRes!800 () Bool)

(assert (=> mapIsEmpty!800 mapRes!800))

(declare-fun mapNonEmpty!800 () Bool)

(declare-fun tp!801 () Bool)

(declare-fun tp_is_empty!319 () Bool)

(assert (=> mapNonEmpty!800 (= mapRes!800 (and tp!801 tp_is_empty!319))))

(declare-fun mapRest!800 () (Array (_ BitVec 32) T!50205))

(declare-fun mapKey!800 () (_ BitVec 32))

(declare-fun mapValue!800 () T!50205)

(assert (=> mapNonEmpty!800 (= (arr!8056 a2!471) (store mapRest!800 mapKey!800 mapValue!800))))

(declare-fun res!234451 () Bool)

(assert (=> start!63160 (=> (not res!234451) (not e!202011))))

(assert (=> start!63160 (= res!234451 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7060 a1!471)) (= (size!7060 a1!471) (size!7060 a2!471))))))

(assert (=> start!63160 e!202011))

(declare-fun e!202012 () Bool)

(declare-fun array_inv!6772 (array!16353) Bool)

(assert (=> start!63160 (and (array_inv!6772 a1!471) e!202012)))

(assert (=> start!63160 true))

(declare-fun e!202010 () Bool)

(assert (=> start!63160 (and (array_inv!6772 a2!471) e!202010)))

(declare-fun mapNonEmpty!801 () Bool)

(declare-fun mapRes!801 () Bool)

(declare-fun tp!800 () Bool)

(assert (=> mapNonEmpty!801 (= mapRes!801 (and tp!800 tp_is_empty!319))))

(declare-fun mapRest!801 () (Array (_ BitVec 32) T!50205))

(declare-fun mapValue!801 () T!50205)

(declare-fun mapKey!801 () (_ BitVec 32))

(assert (=> mapNonEmpty!801 (= (arr!8056 a1!471) (store mapRest!801 mapKey!801 mapValue!801))))

(declare-fun b!282722 () Bool)

(assert (=> b!282722 (= e!202010 (and tp_is_empty!319 mapRes!800))))

(declare-fun condMapEmpty!800 () Bool)

(declare-fun mapDefault!800 () T!50205)


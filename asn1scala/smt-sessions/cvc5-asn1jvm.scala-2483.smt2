; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63148 () Bool)

(assert start!63148)

(declare-fun mapIsEmpty!764 () Bool)

(declare-fun mapRes!764 () Bool)

(assert (=> mapIsEmpty!764 mapRes!764))

(declare-fun res!234410 () Bool)

(declare-fun e!201957 () Bool)

(assert (=> start!63148 (=> (not res!234410) (not e!201957))))

(declare-datatypes ((T!50153 0))(
  ( (T!50154 (val!153 Int)) )
))
(declare-datatypes ((array!16341 0))(
  ( (array!16342 (arr!8050 (Array (_ BitVec 32) T!50153)) (size!7054 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16341)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16341)

(declare-fun from!597 () (_ BitVec 32))

(assert (=> start!63148 (= res!234410 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7054 a1!471)) (= (size!7054 a1!471) (size!7054 a2!471))))))

(assert (=> start!63148 e!201957))

(declare-fun e!201956 () Bool)

(declare-fun array_inv!6768 (array!16341) Bool)

(assert (=> start!63148 (and (array_inv!6768 a1!471) e!201956)))

(assert (=> start!63148 true))

(declare-fun e!201958 () Bool)

(assert (=> start!63148 (and (array_inv!6768 a2!471) e!201958)))

(declare-fun mapNonEmpty!764 () Bool)

(declare-fun tp!764 () Bool)

(declare-fun tp_is_empty!307 () Bool)

(assert (=> mapNonEmpty!764 (= mapRes!764 (and tp!764 tp_is_empty!307))))

(declare-fun mapRest!764 () (Array (_ BitVec 32) T!50153))

(declare-fun mapValue!764 () T!50153)

(declare-fun mapKey!764 () (_ BitVec 32))

(assert (=> mapNonEmpty!764 (= (arr!8050 a2!471) (store mapRest!764 mapKey!764 mapValue!764))))

(declare-fun mapNonEmpty!765 () Bool)

(declare-fun mapRes!765 () Bool)

(declare-fun tp!765 () Bool)

(assert (=> mapNonEmpty!765 (= mapRes!765 (and tp!765 tp_is_empty!307))))

(declare-fun mapKey!765 () (_ BitVec 32))

(declare-fun mapRest!765 () (Array (_ BitVec 32) T!50153))

(declare-fun mapValue!765 () T!50153)

(assert (=> mapNonEmpty!765 (= (arr!8050 a1!471) (store mapRest!765 mapKey!765 mapValue!765))))

(declare-fun b!282645 () Bool)

(declare-fun res!234411 () Bool)

(assert (=> b!282645 (=> (not res!234411) (not e!201957))))

(declare-fun arrayRangesEq!1314 (array!16341 array!16341 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282645 (= res!234411 (arrayRangesEq!1314 a1!471 a2!471 from!597 to!564))))

(declare-fun b!282646 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!282646 (= e!201957 (and (bvsle from!597 i!913) (bvsle i!913 to!564) (bvsgt #b00000000000000000000000000000000 i!913)))))

(declare-fun mapIsEmpty!765 () Bool)

(assert (=> mapIsEmpty!765 mapRes!765))

(declare-fun b!282647 () Bool)

(assert (=> b!282647 (= e!201956 (and tp_is_empty!307 mapRes!765))))

(declare-fun condMapEmpty!764 () Bool)

(declare-fun mapDefault!765 () T!50153)


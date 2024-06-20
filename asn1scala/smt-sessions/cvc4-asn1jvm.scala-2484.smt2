; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63158 () Bool)

(assert start!63158)

(declare-fun res!234441 () Bool)

(declare-fun e!202003 () Bool)

(assert (=> start!63158 (=> (not res!234441) (not e!202003))))

(declare-datatypes ((T!50183 0))(
  ( (T!50184 (val!158 Int)) )
))
(declare-datatypes ((array!16351 0))(
  ( (array!16352 (arr!8055 (Array (_ BitVec 32) T!50183)) (size!7059 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16351)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16351)

(declare-fun from!597 () (_ BitVec 32))

(assert (=> start!63158 (= res!234441 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7059 a1!471)) (= (size!7059 a1!471) (size!7059 a2!471))))))

(assert (=> start!63158 e!202003))

(declare-fun e!202001 () Bool)

(declare-fun array_inv!6771 (array!16351) Bool)

(assert (=> start!63158 (and (array_inv!6771 a1!471) e!202001)))

(assert (=> start!63158 true))

(declare-fun e!202002 () Bool)

(assert (=> start!63158 (and (array_inv!6771 a2!471) e!202002)))

(declare-fun mapNonEmpty!794 () Bool)

(declare-fun mapRes!794 () Bool)

(declare-fun tp!794 () Bool)

(declare-fun tp_is_empty!317 () Bool)

(assert (=> mapNonEmpty!794 (= mapRes!794 (and tp!794 tp_is_empty!317))))

(declare-fun mapRest!795 () (Array (_ BitVec 32) T!50183))

(declare-fun mapKey!794 () (_ BitVec 32))

(declare-fun mapValue!794 () T!50183)

(assert (=> mapNonEmpty!794 (= (arr!8055 a1!471) (store mapRest!795 mapKey!794 mapValue!794))))

(declare-fun b!282705 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!282705 (= e!202003 (and (bvsle from!597 i!913) (bvsle i!913 to!564) (bvsle #b00000000000000000000000000000000 i!913) (bvsgt to!564 (size!7059 a2!471))))))

(declare-fun mapIsEmpty!794 () Bool)

(declare-fun mapRes!795 () Bool)

(assert (=> mapIsEmpty!794 mapRes!795))

(declare-fun b!282706 () Bool)

(declare-fun res!234440 () Bool)

(assert (=> b!282706 (=> (not res!234440) (not e!202003))))

(declare-fun arrayRangesEq!1318 (array!16351 array!16351 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282706 (= res!234440 (arrayRangesEq!1318 a1!471 a2!471 from!597 to!564))))

(declare-fun b!282707 () Bool)

(assert (=> b!282707 (= e!202002 (and tp_is_empty!317 mapRes!795))))

(declare-fun condMapEmpty!795 () Bool)

(declare-fun mapDefault!795 () T!50183)


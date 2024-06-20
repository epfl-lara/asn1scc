; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63224 () Bool)

(assert start!63224)

(declare-fun b!283318 () Bool)

(declare-fun res!234871 () Bool)

(declare-fun e!202290 () Bool)

(assert (=> b!283318 (=> (not res!234871) (not e!202290))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283318 (= res!234871 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun mapIsEmpty!978 () Bool)

(declare-fun mapRes!979 () Bool)

(assert (=> mapIsEmpty!978 mapRes!979))

(declare-fun res!234873 () Bool)

(assert (=> start!63224 (=> (not res!234873) (not e!202290))))

(declare-datatypes ((T!50443 0))(
  ( (T!50444 (val!188 Int)) )
))
(declare-datatypes ((array!16412 0))(
  ( (array!16413 (arr!8085 (Array (_ BitVec 32) T!50443)) (size!7089 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16412)

(declare-fun a2!471 () array!16412)

(assert (=> start!63224 (= res!234873 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7089 a1!471)) (= (size!7089 a1!471) (size!7089 a2!471))))))

(assert (=> start!63224 e!202290))

(declare-fun e!202291 () Bool)

(declare-fun array_inv!6786 (array!16412) Bool)

(assert (=> start!63224 (and (array_inv!6786 a1!471) e!202291)))

(assert (=> start!63224 true))

(declare-fun e!202292 () Bool)

(assert (=> start!63224 (and (array_inv!6786 a2!471) e!202292)))

(declare-fun b!283319 () Bool)

(declare-fun res!234872 () Bool)

(assert (=> b!283319 (=> (not res!234872) (not e!202290))))

(declare-fun arrayRangesEq!1338 (array!16412 array!16412 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283319 (= res!234872 (arrayRangesEq!1338 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283320 () Bool)

(declare-fun res!234874 () Bool)

(assert (=> b!283320 (=> (not res!234874) (not e!202290))))

(assert (=> b!283320 (= res!234874 (arrayRangesEq!1338 a1!471 a2!471 from!597 to!564))))

(declare-fun mapNonEmpty!978 () Bool)

(declare-fun mapRes!978 () Bool)

(declare-fun tp!978 () Bool)

(declare-fun tp_is_empty!377 () Bool)

(assert (=> mapNonEmpty!978 (= mapRes!978 (and tp!978 tp_is_empty!377))))

(declare-fun mapValue!979 () T!50443)

(declare-fun mapKey!978 () (_ BitVec 32))

(declare-fun mapRest!979 () (Array (_ BitVec 32) T!50443))

(assert (=> mapNonEmpty!978 (= (arr!8085 a1!471) (store mapRest!979 mapKey!978 mapValue!979))))

(declare-fun mapIsEmpty!979 () Bool)

(assert (=> mapIsEmpty!979 mapRes!978))

(declare-fun b!283321 () Bool)

(assert (=> b!283321 (= e!202291 (and tp_is_empty!377 mapRes!978))))

(declare-fun condMapEmpty!978 () Bool)

(declare-fun mapDefault!978 () T!50443)


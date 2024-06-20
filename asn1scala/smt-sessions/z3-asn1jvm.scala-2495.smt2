; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63228 () Bool)

(assert start!63228)

(declare-fun b!283359 () Bool)

(declare-fun res!234902 () Bool)

(declare-fun e!202310 () Bool)

(assert (=> b!283359 (=> (not res!234902) (not e!202310))))

(declare-datatypes ((T!50467 0))(
  ( (T!50468 (val!190 Int)) )
))
(declare-datatypes ((array!16416 0))(
  ( (array!16417 (arr!8087 (Array (_ BitVec 32) T!50467)) (size!7091 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16416)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16416)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1340 (array!16416 array!16416 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283359 (= res!234902 (arrayRangesEq!1340 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283360 () Bool)

(declare-fun res!234904 () Bool)

(assert (=> b!283360 (=> (not res!234904) (not e!202310))))

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!283360 (= res!234904 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283361 () Bool)

(declare-fun e!202308 () Bool)

(declare-fun tp_is_empty!381 () Bool)

(declare-fun mapRes!990 () Bool)

(assert (=> b!283361 (= e!202308 (and tp_is_empty!381 mapRes!990))))

(declare-fun condMapEmpty!991 () Bool)

(declare-fun mapDefault!991 () T!50467)

(assert (=> b!283361 (= condMapEmpty!991 (= (arr!8087 a1!471) ((as const (Array (_ BitVec 32) T!50467)) mapDefault!991)))))

(declare-fun b!283362 () Bool)

(declare-fun e!202309 () Bool)

(declare-fun mapRes!991 () Bool)

(assert (=> b!283362 (= e!202309 (and tp_is_empty!381 mapRes!991))))

(declare-fun condMapEmpty!990 () Bool)

(declare-fun mapDefault!990 () T!50467)

(assert (=> b!283362 (= condMapEmpty!990 (= (arr!8087 a2!471) ((as const (Array (_ BitVec 32) T!50467)) mapDefault!990)))))

(declare-fun b!283363 () Bool)

(assert (=> b!283363 (= e!202310 (not (or (= (bvand i!913 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand i!913 #b10000000000000000000000000000000) (bvand (bvsub i!913 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!283363 (= (select (arr!8087 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8087 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19836 0))(
  ( (Unit!19837) )
))
(declare-fun lt!417903 () Unit!19836)

(declare-fun arrayRangesEqImpliesEq!193 (array!16416 array!16416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19836)

(assert (=> b!283363 (= lt!417903 (arrayRangesEqImpliesEq!193 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun b!283364 () Bool)

(declare-fun res!234901 () Bool)

(assert (=> b!283364 (=> (not res!234901) (not e!202310))))

(assert (=> b!283364 (= res!234901 (not (= i!913 from!597)))))

(declare-fun b!283365 () Bool)

(declare-fun res!234900 () Bool)

(assert (=> b!283365 (=> (not res!234900) (not e!202310))))

(assert (=> b!283365 (= res!234900 (arrayRangesEq!1340 a2!471 a1!471 i!913 to!564))))

(declare-fun mapIsEmpty!991 () Bool)

(assert (=> mapIsEmpty!991 mapRes!990))

(declare-fun mapNonEmpty!990 () Bool)

(declare-fun tp!990 () Bool)

(assert (=> mapNonEmpty!990 (= mapRes!990 (and tp!990 tp_is_empty!381))))

(declare-fun mapRest!991 () (Array (_ BitVec 32) T!50467))

(declare-fun mapKey!991 () (_ BitVec 32))

(declare-fun mapValue!991 () T!50467)

(assert (=> mapNonEmpty!990 (= (arr!8087 a1!471) (store mapRest!991 mapKey!991 mapValue!991))))

(declare-fun mapNonEmpty!991 () Bool)

(declare-fun tp!991 () Bool)

(assert (=> mapNonEmpty!991 (= mapRes!991 (and tp!991 tp_is_empty!381))))

(declare-fun mapRest!990 () (Array (_ BitVec 32) T!50467))

(declare-fun mapKey!990 () (_ BitVec 32))

(declare-fun mapValue!990 () T!50467)

(assert (=> mapNonEmpty!991 (= (arr!8087 a2!471) (store mapRest!990 mapKey!990 mapValue!990))))

(declare-fun res!234903 () Bool)

(assert (=> start!63228 (=> (not res!234903) (not e!202310))))

(assert (=> start!63228 (= res!234903 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7091 a1!471)) (= (size!7091 a1!471) (size!7091 a2!471))))))

(assert (=> start!63228 e!202310))

(declare-fun array_inv!6787 (array!16416) Bool)

(assert (=> start!63228 (and (array_inv!6787 a1!471) e!202308)))

(assert (=> start!63228 true))

(assert (=> start!63228 (and (array_inv!6787 a2!471) e!202309)))

(declare-fun mapIsEmpty!990 () Bool)

(assert (=> mapIsEmpty!990 mapRes!991))

(assert (= (and start!63228 res!234903) b!283359))

(assert (= (and b!283359 res!234902) b!283360))

(assert (= (and b!283360 res!234904) b!283365))

(assert (= (and b!283365 res!234900) b!283364))

(assert (= (and b!283364 res!234901) b!283363))

(assert (= (and b!283361 condMapEmpty!991) mapIsEmpty!991))

(assert (= (and b!283361 (not condMapEmpty!991)) mapNonEmpty!990))

(assert (= start!63228 b!283361))

(assert (= (and b!283362 condMapEmpty!990) mapIsEmpty!990))

(assert (= (and b!283362 (not condMapEmpty!990)) mapNonEmpty!991))

(assert (= start!63228 b!283362))

(declare-fun m!416369 () Bool)

(assert (=> b!283359 m!416369))

(declare-fun m!416371 () Bool)

(assert (=> mapNonEmpty!991 m!416371))

(declare-fun m!416373 () Bool)

(assert (=> b!283363 m!416373))

(declare-fun m!416375 () Bool)

(assert (=> b!283363 m!416375))

(declare-fun m!416377 () Bool)

(assert (=> b!283363 m!416377))

(declare-fun m!416379 () Bool)

(assert (=> mapNonEmpty!990 m!416379))

(declare-fun m!416381 () Bool)

(assert (=> start!63228 m!416381))

(declare-fun m!416383 () Bool)

(assert (=> start!63228 m!416383))

(declare-fun m!416385 () Bool)

(assert (=> b!283365 m!416385))

(check-sat (not b!283359) (not start!63228) (not b!283365) (not mapNonEmpty!991) tp_is_empty!381 (not b!283363) (not mapNonEmpty!990))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63972 () Bool)

(assert start!63972)

(declare-fun mapNonEmpty!1134 () Bool)

(declare-fun mapRes!1135 () Bool)

(declare-fun tp!1136 () Bool)

(declare-fun tp_is_empty!417 () Bool)

(assert (=> mapNonEmpty!1134 (= mapRes!1135 (and tp!1136 tp_is_empty!417))))

(declare-datatypes ((T!51283 0))(
  ( (T!51284 (val!208 Int)) )
))
(declare-datatypes ((array!16694 0))(
  ( (array!16695 (arr!8195 (Array (_ BitVec 32) T!51283)) (size!7199 (_ BitVec 32))) )
))
(declare-fun a1!623 () array!16694)

(declare-fun mapKey!1135 () (_ BitVec 32))

(declare-fun mapRest!1134 () (Array (_ BitVec 32) T!51283))

(declare-fun mapValue!1136 () T!51283)

(assert (=> mapNonEmpty!1134 (= (arr!8195 a1!623) (store mapRest!1134 mapKey!1135 mapValue!1136))))

(declare-fun b!284475 () Bool)

(declare-fun res!235598 () Bool)

(declare-fun e!203353 () Bool)

(assert (=> b!284475 (=> (not res!235598) (not e!203353))))

(declare-fun a3!63 () array!16694)

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1350 (array!16694 array!16694 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284475 (= res!235598 (arrayRangesEq!1350 a1!623 a3!63 from!749 from!749))))

(declare-fun b!284476 () Bool)

(declare-fun e!203355 () Bool)

(declare-fun mapRes!1136 () Bool)

(assert (=> b!284476 (= e!203355 (and tp_is_empty!417 mapRes!1136))))

(declare-fun condMapEmpty!1136 () Bool)

(declare-fun a2!623 () array!16694)

(declare-fun mapDefault!1134 () T!51283)

(assert (=> b!284476 (= condMapEmpty!1136 (= (arr!8195 a2!623) ((as const (Array (_ BitVec 32) T!51283)) mapDefault!1134)))))

(declare-fun mapNonEmpty!1135 () Bool)

(declare-fun mapRes!1134 () Bool)

(declare-fun tp!1135 () Bool)

(assert (=> mapNonEmpty!1135 (= mapRes!1134 (and tp!1135 tp_is_empty!417))))

(declare-fun mapKey!1136 () (_ BitVec 32))

(declare-fun mapRest!1136 () (Array (_ BitVec 32) T!51283))

(declare-fun mapValue!1134 () T!51283)

(assert (=> mapNonEmpty!1135 (= (arr!8195 a3!63) (store mapRest!1136 mapKey!1136 mapValue!1134))))

(declare-fun b!284477 () Bool)

(declare-fun res!235599 () Bool)

(assert (=> b!284477 (=> (not res!235599) (not e!203353))))

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> b!284477 (= res!235599 (arrayRangesEq!1350 a1!623 a2!623 from!749 mid!66))))

(declare-fun mapNonEmpty!1136 () Bool)

(declare-fun tp!1134 () Bool)

(assert (=> mapNonEmpty!1136 (= mapRes!1136 (and tp!1134 tp_is_empty!417))))

(declare-fun mapRest!1135 () (Array (_ BitVec 32) T!51283))

(declare-fun mapValue!1135 () T!51283)

(declare-fun mapKey!1134 () (_ BitVec 32))

(assert (=> mapNonEmpty!1136 (= (arr!8195 a2!623) (store mapRest!1135 mapKey!1134 mapValue!1135))))

(declare-fun res!235600 () Bool)

(assert (=> start!63972 (=> (not res!235600) (not e!203353))))

(declare-fun to!716 () (_ BitVec 32))

(assert (=> start!63972 (= res!235600 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7199 a1!623) (size!7199 a2!623)) (bvsle (size!7199 a2!623) (size!7199 a3!63)) (bvsle mid!66 (size!7199 a1!623)) (bvsle to!716 (size!7199 a2!623))))))

(assert (=> start!63972 e!203353))

(declare-fun array_inv!6887 (array!16694) Bool)

(assert (=> start!63972 (and (array_inv!6887 a2!623) e!203355)))

(declare-fun e!203354 () Bool)

(assert (=> start!63972 (and (array_inv!6887 a1!623) e!203354)))

(assert (=> start!63972 true))

(declare-fun e!203352 () Bool)

(assert (=> start!63972 (and (array_inv!6887 a3!63) e!203352)))

(declare-fun mapIsEmpty!1134 () Bool)

(assert (=> mapIsEmpty!1134 mapRes!1136))

(declare-fun b!284478 () Bool)

(assert (=> b!284478 (= e!203354 (and tp_is_empty!417 mapRes!1135))))

(declare-fun condMapEmpty!1134 () Bool)

(declare-fun mapDefault!1136 () T!51283)

(assert (=> b!284478 (= condMapEmpty!1134 (= (arr!8195 a1!623) ((as const (Array (_ BitVec 32) T!51283)) mapDefault!1136)))))

(declare-fun b!284479 () Bool)

(declare-fun res!235601 () Bool)

(assert (=> b!284479 (=> (not res!235601) (not e!203353))))

(assert (=> b!284479 (= res!235601 (arrayRangesEq!1350 a2!623 a3!63 from!749 to!716))))

(declare-fun mapIsEmpty!1135 () Bool)

(assert (=> mapIsEmpty!1135 mapRes!1134))

(declare-fun b!284480 () Bool)

(assert (=> b!284480 (= e!203352 (and tp_is_empty!417 mapRes!1134))))

(declare-fun condMapEmpty!1135 () Bool)

(declare-fun mapDefault!1135 () T!51283)

(assert (=> b!284480 (= condMapEmpty!1135 (= (arr!8195 a3!63) ((as const (Array (_ BitVec 32) T!51283)) mapDefault!1135)))))

(declare-fun mapIsEmpty!1136 () Bool)

(assert (=> mapIsEmpty!1136 mapRes!1135))

(declare-fun b!284481 () Bool)

(assert (=> b!284481 (= e!203353 (not true))))

(assert (=> b!284481 (arrayRangesEq!1350 a1!623 a3!63 from!749 mid!66)))

(declare-datatypes ((Unit!19913 0))(
  ( (Unit!19914) )
))
(declare-fun lt!418530 () Unit!19913)

(declare-fun rec!61 (array!16694 array!16694 array!16694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19913)

(assert (=> b!284481 (= lt!418530 (rec!61 a1!623 a2!623 a3!63 from!749 mid!66 to!716 from!749))))

(assert (= (and start!63972 res!235600) b!284477))

(assert (= (and b!284477 res!235599) b!284479))

(assert (= (and b!284479 res!235601) b!284475))

(assert (= (and b!284475 res!235598) b!284481))

(assert (= (and b!284476 condMapEmpty!1136) mapIsEmpty!1134))

(assert (= (and b!284476 (not condMapEmpty!1136)) mapNonEmpty!1136))

(assert (= start!63972 b!284476))

(assert (= (and b!284478 condMapEmpty!1134) mapIsEmpty!1136))

(assert (= (and b!284478 (not condMapEmpty!1134)) mapNonEmpty!1134))

(assert (= start!63972 b!284478))

(assert (= (and b!284480 condMapEmpty!1135) mapIsEmpty!1135))

(assert (= (and b!284480 (not condMapEmpty!1135)) mapNonEmpty!1135))

(assert (= start!63972 b!284480))

(declare-fun m!417631 () Bool)

(assert (=> mapNonEmpty!1135 m!417631))

(declare-fun m!417633 () Bool)

(assert (=> mapNonEmpty!1134 m!417633))

(declare-fun m!417635 () Bool)

(assert (=> b!284475 m!417635))

(declare-fun m!417637 () Bool)

(assert (=> b!284479 m!417637))

(declare-fun m!417639 () Bool)

(assert (=> mapNonEmpty!1136 m!417639))

(declare-fun m!417641 () Bool)

(assert (=> start!63972 m!417641))

(declare-fun m!417643 () Bool)

(assert (=> start!63972 m!417643))

(declare-fun m!417645 () Bool)

(assert (=> start!63972 m!417645))

(declare-fun m!417647 () Bool)

(assert (=> b!284481 m!417647))

(declare-fun m!417649 () Bool)

(assert (=> b!284481 m!417649))

(declare-fun m!417651 () Bool)

(assert (=> b!284477 m!417651))

(check-sat (not mapNonEmpty!1135) (not mapNonEmpty!1134) (not mapNonEmpty!1136) (not b!284479) tp_is_empty!417 (not b!284477) (not b!284475) (not b!284481) (not start!63972))
(check-sat)

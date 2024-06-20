; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63222 () Bool)

(assert start!63222)

(declare-fun mapNonEmpty!972 () Bool)

(declare-fun mapRes!973 () Bool)

(declare-fun tp!973 () Bool)

(declare-fun tp_is_empty!375 () Bool)

(assert (=> mapNonEmpty!972 (= mapRes!973 (and tp!973 tp_is_empty!375))))

(declare-datatypes ((T!50441 0))(
  ( (T!50442 (val!187 Int)) )
))
(declare-fun mapValue!972 () T!50441)

(declare-fun mapRest!973 () (Array (_ BitVec 32) T!50441))

(declare-fun mapKey!972 () (_ BitVec 32))

(declare-datatypes ((array!16410 0))(
  ( (array!16411 (arr!8084 (Array (_ BitVec 32) T!50441)) (size!7088 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16410)

(assert (=> mapNonEmpty!972 (= (arr!8084 a2!471) (store mapRest!973 mapKey!972 mapValue!972))))

(declare-fun mapIsEmpty!972 () Bool)

(assert (=> mapIsEmpty!972 mapRes!973))

(declare-fun b!283300 () Bool)

(declare-fun e!202282 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283300 (= e!202282 (and (not (= i!913 from!597)) (bvsgt from!597 (bvsub i!913 #b00000000000000000000000000000001))))))

(declare-fun b!283301 () Bool)

(declare-fun e!202281 () Bool)

(declare-fun mapRes!972 () Bool)

(assert (=> b!283301 (= e!202281 (and tp_is_empty!375 mapRes!972))))

(declare-fun condMapEmpty!972 () Bool)

(declare-fun a1!471 () array!16410)

(declare-fun mapDefault!972 () T!50441)

(assert (=> b!283301 (= condMapEmpty!972 (= (arr!8084 a1!471) ((as const (Array (_ BitVec 32) T!50441)) mapDefault!972)))))

(declare-fun b!283302 () Bool)

(declare-fun res!234859 () Bool)

(assert (=> b!283302 (=> (not res!234859) (not e!202282))))

(declare-fun to!564 () (_ BitVec 32))

(assert (=> b!283302 (= res!234859 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283303 () Bool)

(declare-fun e!202283 () Bool)

(assert (=> b!283303 (= e!202283 (and tp_is_empty!375 mapRes!973))))

(declare-fun condMapEmpty!973 () Bool)

(declare-fun mapDefault!973 () T!50441)

(assert (=> b!283303 (= condMapEmpty!973 (= (arr!8084 a2!471) ((as const (Array (_ BitVec 32) T!50441)) mapDefault!973)))))

(declare-fun mapNonEmpty!973 () Bool)

(declare-fun tp!972 () Bool)

(assert (=> mapNonEmpty!973 (= mapRes!972 (and tp!972 tp_is_empty!375))))

(declare-fun mapRest!972 () (Array (_ BitVec 32) T!50441))

(declare-fun mapKey!973 () (_ BitVec 32))

(declare-fun mapValue!973 () T!50441)

(assert (=> mapNonEmpty!973 (= (arr!8084 a1!471) (store mapRest!972 mapKey!973 mapValue!973))))

(declare-fun mapIsEmpty!973 () Bool)

(assert (=> mapIsEmpty!973 mapRes!972))

(declare-fun b!283305 () Bool)

(declare-fun res!234860 () Bool)

(assert (=> b!283305 (=> (not res!234860) (not e!202282))))

(declare-fun arrayRangesEq!1337 (array!16410 array!16410 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283305 (= res!234860 (arrayRangesEq!1337 a2!471 a1!471 i!913 to!564))))

(declare-fun res!234861 () Bool)

(assert (=> start!63222 (=> (not res!234861) (not e!202282))))

(assert (=> start!63222 (= res!234861 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7088 a1!471)) (= (size!7088 a1!471) (size!7088 a2!471))))))

(assert (=> start!63222 e!202282))

(declare-fun array_inv!6785 (array!16410) Bool)

(assert (=> start!63222 (and (array_inv!6785 a1!471) e!202281)))

(assert (=> start!63222 true))

(assert (=> start!63222 (and (array_inv!6785 a2!471) e!202283)))

(declare-fun b!283304 () Bool)

(declare-fun res!234862 () Bool)

(assert (=> b!283304 (=> (not res!234862) (not e!202282))))

(assert (=> b!283304 (= res!234862 (arrayRangesEq!1337 a1!471 a2!471 from!597 to!564))))

(assert (= (and start!63222 res!234861) b!283304))

(assert (= (and b!283304 res!234862) b!283302))

(assert (= (and b!283302 res!234859) b!283305))

(assert (= (and b!283305 res!234860) b!283300))

(assert (= (and b!283301 condMapEmpty!972) mapIsEmpty!973))

(assert (= (and b!283301 (not condMapEmpty!972)) mapNonEmpty!973))

(assert (= start!63222 b!283301))

(assert (= (and b!283303 condMapEmpty!973) mapIsEmpty!972))

(assert (= (and b!283303 (not condMapEmpty!973)) mapNonEmpty!972))

(assert (= start!63222 b!283303))

(declare-fun m!416327 () Bool)

(assert (=> start!63222 m!416327))

(declare-fun m!416329 () Bool)

(assert (=> start!63222 m!416329))

(declare-fun m!416331 () Bool)

(assert (=> mapNonEmpty!972 m!416331))

(declare-fun m!416333 () Bool)

(assert (=> mapNonEmpty!973 m!416333))

(declare-fun m!416335 () Bool)

(assert (=> b!283304 m!416335))

(declare-fun m!416337 () Bool)

(assert (=> b!283305 m!416337))

(check-sat tp_is_empty!375 (not b!283305) (not mapNonEmpty!972) (not mapNonEmpty!973) (not b!283304) (not start!63222))
(check-sat)

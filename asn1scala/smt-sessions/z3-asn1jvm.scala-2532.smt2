; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63960 () Bool)

(assert start!63960)

(declare-fun mapNonEmpty!1080 () Bool)

(declare-fun mapRes!1080 () Bool)

(declare-fun tp!1081 () Bool)

(declare-fun tp_is_empty!405 () Bool)

(assert (=> mapNonEmpty!1080 (= mapRes!1080 (and tp!1081 tp_is_empty!405))))

(declare-datatypes ((T!51231 0))(
  ( (T!51232 (val!202 Int)) )
))
(declare-fun mapValue!1080 () T!51231)

(declare-fun mapKey!1081 () (_ BitVec 32))

(declare-datatypes ((array!16682 0))(
  ( (array!16683 (arr!8189 (Array (_ BitVec 32) T!51231)) (size!7193 (_ BitVec 32))) )
))
(declare-fun a1!623 () array!16682)

(declare-fun mapRest!1081 () (Array (_ BitVec 32) T!51231))

(assert (=> mapNonEmpty!1080 (= (arr!8189 a1!623) (store mapRest!1081 mapKey!1081 mapValue!1080))))

(declare-fun res!235529 () Bool)

(declare-fun e!203280 () Bool)

(assert (=> start!63960 (=> (not res!235529) (not e!203280))))

(declare-fun a2!623 () array!16682)

(declare-fun to!716 () (_ BitVec 32))

(declare-fun from!749 () (_ BitVec 32))

(declare-fun mid!66 () (_ BitVec 32))

(declare-fun a3!63 () array!16682)

(assert (=> start!63960 (= res!235529 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7193 a1!623) (size!7193 a2!623)) (bvsle (size!7193 a2!623) (size!7193 a3!63)) (bvsle mid!66 (size!7193 a1!623)) (bvsle to!716 (size!7193 a2!623))))))

(assert (=> start!63960 e!203280))

(declare-fun e!203283 () Bool)

(declare-fun array_inv!6883 (array!16682) Bool)

(assert (=> start!63960 (and (array_inv!6883 a2!623) e!203283)))

(declare-fun e!203282 () Bool)

(assert (=> start!63960 (and (array_inv!6883 a1!623) e!203282)))

(assert (=> start!63960 true))

(declare-fun e!203281 () Bool)

(assert (=> start!63960 (and (array_inv!6883 a3!63) e!203281)))

(declare-fun mapIsEmpty!1080 () Bool)

(declare-fun mapRes!1081 () Bool)

(assert (=> mapIsEmpty!1080 mapRes!1081))

(declare-fun b!284349 () Bool)

(declare-fun res!235527 () Bool)

(assert (=> b!284349 (=> (not res!235527) (not e!203280))))

(declare-fun arrayRangesEq!1346 (array!16682 array!16682 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284349 (= res!235527 (arrayRangesEq!1346 a1!623 a2!623 from!749 mid!66))))

(declare-fun b!284350 () Bool)

(declare-fun mapRes!1082 () Bool)

(assert (=> b!284350 (= e!203283 (and tp_is_empty!405 mapRes!1082))))

(declare-fun condMapEmpty!1081 () Bool)

(declare-fun mapDefault!1081 () T!51231)

(assert (=> b!284350 (= condMapEmpty!1081 (= (arr!8189 a2!623) ((as const (Array (_ BitVec 32) T!51231)) mapDefault!1081)))))

(declare-fun b!284351 () Bool)

(assert (=> b!284351 (= e!203280 (not true))))

(assert (=> b!284351 (arrayRangesEq!1346 a1!623 a3!63 from!749 mid!66)))

(declare-datatypes ((Unit!19907 0))(
  ( (Unit!19908) )
))
(declare-fun lt!418512 () Unit!19907)

(declare-fun rec!58 (array!16682 array!16682 array!16682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19907)

(assert (=> b!284351 (= lt!418512 (rec!58 a1!623 a2!623 a3!63 from!749 mid!66 to!716 from!749))))

(declare-fun mapIsEmpty!1081 () Bool)

(assert (=> mapIsEmpty!1081 mapRes!1080))

(declare-fun b!284352 () Bool)

(assert (=> b!284352 (= e!203281 (and tp_is_empty!405 mapRes!1081))))

(declare-fun condMapEmpty!1080 () Bool)

(declare-fun mapDefault!1082 () T!51231)

(assert (=> b!284352 (= condMapEmpty!1080 (= (arr!8189 a3!63) ((as const (Array (_ BitVec 32) T!51231)) mapDefault!1082)))))

(declare-fun mapIsEmpty!1082 () Bool)

(assert (=> mapIsEmpty!1082 mapRes!1082))

(declare-fun mapNonEmpty!1081 () Bool)

(declare-fun tp!1082 () Bool)

(assert (=> mapNonEmpty!1081 (= mapRes!1082 (and tp!1082 tp_is_empty!405))))

(declare-fun mapKey!1080 () (_ BitVec 32))

(declare-fun mapRest!1080 () (Array (_ BitVec 32) T!51231))

(declare-fun mapValue!1081 () T!51231)

(assert (=> mapNonEmpty!1081 (= (arr!8189 a2!623) (store mapRest!1080 mapKey!1080 mapValue!1081))))

(declare-fun b!284353 () Bool)

(declare-fun res!235526 () Bool)

(assert (=> b!284353 (=> (not res!235526) (not e!203280))))

(assert (=> b!284353 (= res!235526 (arrayRangesEq!1346 a1!623 a3!63 from!749 from!749))))

(declare-fun mapNonEmpty!1082 () Bool)

(declare-fun tp!1080 () Bool)

(assert (=> mapNonEmpty!1082 (= mapRes!1081 (and tp!1080 tp_is_empty!405))))

(declare-fun mapRest!1082 () (Array (_ BitVec 32) T!51231))

(declare-fun mapKey!1082 () (_ BitVec 32))

(declare-fun mapValue!1082 () T!51231)

(assert (=> mapNonEmpty!1082 (= (arr!8189 a3!63) (store mapRest!1082 mapKey!1082 mapValue!1082))))

(declare-fun b!284354 () Bool)

(assert (=> b!284354 (= e!203282 (and tp_is_empty!405 mapRes!1080))))

(declare-fun condMapEmpty!1082 () Bool)

(declare-fun mapDefault!1080 () T!51231)

(assert (=> b!284354 (= condMapEmpty!1082 (= (arr!8189 a1!623) ((as const (Array (_ BitVec 32) T!51231)) mapDefault!1080)))))

(declare-fun b!284355 () Bool)

(declare-fun res!235528 () Bool)

(assert (=> b!284355 (=> (not res!235528) (not e!203280))))

(assert (=> b!284355 (= res!235528 (arrayRangesEq!1346 a2!623 a3!63 from!749 to!716))))

(assert (= (and start!63960 res!235529) b!284349))

(assert (= (and b!284349 res!235527) b!284355))

(assert (= (and b!284355 res!235528) b!284353))

(assert (= (and b!284353 res!235526) b!284351))

(assert (= (and b!284350 condMapEmpty!1081) mapIsEmpty!1082))

(assert (= (and b!284350 (not condMapEmpty!1081)) mapNonEmpty!1081))

(assert (= start!63960 b!284350))

(assert (= (and b!284354 condMapEmpty!1082) mapIsEmpty!1081))

(assert (= (and b!284354 (not condMapEmpty!1082)) mapNonEmpty!1080))

(assert (= start!63960 b!284354))

(assert (= (and b!284352 condMapEmpty!1080) mapIsEmpty!1080))

(assert (= (and b!284352 (not condMapEmpty!1080)) mapNonEmpty!1082))

(assert (= start!63960 b!284352))

(declare-fun m!417499 () Bool)

(assert (=> b!284355 m!417499))

(declare-fun m!417501 () Bool)

(assert (=> b!284349 m!417501))

(declare-fun m!417503 () Bool)

(assert (=> mapNonEmpty!1082 m!417503))

(declare-fun m!417505 () Bool)

(assert (=> mapNonEmpty!1080 m!417505))

(declare-fun m!417507 () Bool)

(assert (=> mapNonEmpty!1081 m!417507))

(declare-fun m!417509 () Bool)

(assert (=> start!63960 m!417509))

(declare-fun m!417511 () Bool)

(assert (=> start!63960 m!417511))

(declare-fun m!417513 () Bool)

(assert (=> start!63960 m!417513))

(declare-fun m!417515 () Bool)

(assert (=> b!284351 m!417515))

(declare-fun m!417517 () Bool)

(assert (=> b!284351 m!417517))

(declare-fun m!417519 () Bool)

(assert (=> b!284353 m!417519))

(check-sat (not mapNonEmpty!1082) (not b!284353) (not start!63960) (not b!284349) (not mapNonEmpty!1081) (not mapNonEmpty!1080) (not b!284351) (not b!284355) tp_is_empty!405)
(check-sat)

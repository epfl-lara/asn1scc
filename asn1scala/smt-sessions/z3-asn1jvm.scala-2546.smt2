; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64048 () Bool)

(assert start!64048)

(declare-fun res!236280 () Bool)

(declare-fun e!203803 () Bool)

(assert (=> start!64048 (=> (not res!236280) (not e!203803))))

(declare-datatypes ((T!51595 0))(
  ( (T!51596 (val!244 Int)) )
))
(declare-datatypes ((array!16767 0))(
  ( (array!16768 (arr!8231 (Array (_ BitVec 32) T!51595)) (size!7235 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16767)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16767)

(declare-fun a3!68 () array!16767)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64048 (= res!236280 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7235 a1!647) (size!7235 a2!647)) (bvsle (size!7235 a2!647) (size!7235 a3!68)) (bvsle mid!71 (size!7235 a1!647)) (bvsle to!740 (size!7235 a2!647))))))

(assert (=> start!64048 e!203803))

(declare-fun e!203801 () Bool)

(declare-fun array_inv!6904 (array!16767) Bool)

(assert (=> start!64048 (and (array_inv!6904 a2!647) e!203801)))

(assert (=> start!64048 true))

(declare-fun e!203802 () Bool)

(assert (=> start!64048 (and (array_inv!6904 a1!647) e!203802)))

(declare-fun e!203800 () Bool)

(assert (=> start!64048 (and (array_inv!6904 a3!68) e!203800)))

(declare-fun mapIsEmpty!1463 () Bool)

(declare-fun mapRes!1464 () Bool)

(assert (=> mapIsEmpty!1463 mapRes!1464))

(declare-fun b!285476 () Bool)

(declare-fun tp_is_empty!489 () Bool)

(declare-fun mapRes!1465 () Bool)

(assert (=> b!285476 (= e!203800 (and tp_is_empty!489 mapRes!1465))))

(declare-fun condMapEmpty!1465 () Bool)

(declare-fun mapDefault!1463 () T!51595)

(assert (=> b!285476 (= condMapEmpty!1465 (= (arr!8231 a3!68) ((as const (Array (_ BitVec 32) T!51595)) mapDefault!1463)))))

(declare-fun mapIsEmpty!1464 () Bool)

(declare-fun mapRes!1463 () Bool)

(assert (=> mapIsEmpty!1464 mapRes!1463))

(declare-fun b!285477 () Bool)

(declare-fun e!203799 () Bool)

(assert (=> b!285477 (= e!203803 (not e!203799))))

(declare-fun res!236282 () Bool)

(assert (=> b!285477 (=> res!236282 e!203799)))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!285477 (= res!236282 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun arrayRangesEq!1377 (array!16767 array!16767 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285477 (arrayRangesEq!1377 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19933 0))(
  ( (Unit!19934) )
))
(declare-fun lt!418590 () Unit!19933)

(declare-fun arrayRangesEqAppend!9 (array!16767 array!16767 (_ BitVec 32) (_ BitVec 32)) Unit!19933)

(assert (=> b!285477 (= lt!418590 (arrayRangesEqAppend!9 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1465 () Bool)

(assert (=> mapIsEmpty!1465 mapRes!1465))

(declare-fun b!285478 () Bool)

(declare-fun res!236279 () Bool)

(assert (=> b!285478 (=> res!236279 e!203799)))

(assert (=> b!285478 (= res!236279 (not (arrayRangesEq!1377 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740)))))

(declare-fun b!285479 () Bool)

(declare-fun res!236278 () Bool)

(assert (=> b!285479 (=> (not res!236278) (not e!203803))))

(assert (=> b!285479 (= res!236278 (arrayRangesEq!1377 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285480 () Bool)

(assert (=> b!285480 (= e!203802 (and tp_is_empty!489 mapRes!1463))))

(declare-fun condMapEmpty!1464 () Bool)

(declare-fun mapDefault!1465 () T!51595)

(assert (=> b!285480 (= condMapEmpty!1464 (= (arr!8231 a1!647) ((as const (Array (_ BitVec 32) T!51595)) mapDefault!1465)))))

(declare-fun mapNonEmpty!1463 () Bool)

(declare-fun tp!1463 () Bool)

(assert (=> mapNonEmpty!1463 (= mapRes!1465 (and tp!1463 tp_is_empty!489))))

(declare-fun mapKey!1463 () (_ BitVec 32))

(declare-fun mapRest!1463 () (Array (_ BitVec 32) T!51595))

(declare-fun mapValue!1463 () T!51595)

(assert (=> mapNonEmpty!1463 (= (arr!8231 a3!68) (store mapRest!1463 mapKey!1463 mapValue!1463))))

(declare-fun b!285481 () Bool)

(declare-fun res!236275 () Bool)

(assert (=> b!285481 (=> res!236275 e!203799)))

(assert (=> b!285481 (= res!236275 (not (arrayRangesEq!1377 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun b!285482 () Bool)

(declare-fun res!236283 () Bool)

(assert (=> b!285482 (=> (not res!236283) (not e!203803))))

(assert (=> b!285482 (= res!236283 (arrayRangesEq!1377 a2!647 a3!68 i!964 to!740))))

(declare-fun mapNonEmpty!1464 () Bool)

(declare-fun tp!1464 () Bool)

(assert (=> mapNonEmpty!1464 (= mapRes!1463 (and tp!1464 tp_is_empty!489))))

(declare-fun mapValue!1465 () T!51595)

(declare-fun mapKey!1464 () (_ BitVec 32))

(declare-fun mapRest!1465 () (Array (_ BitVec 32) T!51595))

(assert (=> mapNonEmpty!1464 (= (arr!8231 a1!647) (store mapRest!1465 mapKey!1464 mapValue!1465))))

(declare-fun b!285483 () Bool)

(declare-fun res!236273 () Bool)

(assert (=> b!285483 (=> (not res!236273) (not e!203803))))

(assert (=> b!285483 (= res!236273 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1465 () Bool)

(declare-fun tp!1465 () Bool)

(assert (=> mapNonEmpty!1465 (= mapRes!1464 (and tp!1465 tp_is_empty!489))))

(declare-fun mapKey!1465 () (_ BitVec 32))

(declare-fun mapRest!1464 () (Array (_ BitVec 32) T!51595))

(declare-fun mapValue!1464 () T!51595)

(assert (=> mapNonEmpty!1465 (= (arr!8231 a2!647) (store mapRest!1464 mapKey!1465 mapValue!1464))))

(declare-fun b!285484 () Bool)

(declare-fun res!236274 () Bool)

(assert (=> b!285484 (=> (not res!236274) (not e!203803))))

(assert (=> b!285484 (= res!236274 (not (= i!964 mid!71)))))

(declare-fun b!285485 () Bool)

(assert (=> b!285485 (= e!203801 (and tp_is_empty!489 mapRes!1464))))

(declare-fun condMapEmpty!1463 () Bool)

(declare-fun mapDefault!1464 () T!51595)

(assert (=> b!285485 (= condMapEmpty!1463 (= (arr!8231 a2!647) ((as const (Array (_ BitVec 32) T!51595)) mapDefault!1464)))))

(declare-fun b!285486 () Bool)

(declare-fun res!236276 () Bool)

(assert (=> b!285486 (=> (not res!236276) (not e!203803))))

(assert (=> b!285486 (= res!236276 (arrayRangesEq!1377 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285487 () Bool)

(assert (=> b!285487 (= e!203799 true)))

(assert (=> b!285487 (arrayRangesEq!1377 a1!647 a3!68 from!773 mid!71)))

(declare-fun lt!418589 () Unit!19933)

(declare-fun rec!64 (array!16767 array!16767 array!16767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19933)

(assert (=> b!285487 (= lt!418589 (rec!64 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun b!285488 () Bool)

(declare-fun res!236281 () Bool)

(assert (=> b!285488 (=> (not res!236281) (not e!203803))))

(assert (=> b!285488 (= res!236281 (arrayRangesEq!1377 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285489 () Bool)

(declare-fun res!236277 () Bool)

(assert (=> b!285489 (=> (not res!236277) (not e!203803))))

(assert (=> b!285489 (= res!236277 (arrayRangesEq!1377 a2!647 a3!68 from!773 to!740))))

(assert (= (and start!64048 res!236280) b!285479))

(assert (= (and b!285479 res!236278) b!285489))

(assert (= (and b!285489 res!236277) b!285483))

(assert (= (and b!285483 res!236273) b!285486))

(assert (= (and b!285486 res!236276) b!285482))

(assert (= (and b!285482 res!236283) b!285488))

(assert (= (and b!285488 res!236281) b!285484))

(assert (= (and b!285484 res!236274) b!285477))

(assert (= (and b!285477 (not res!236282)) b!285481))

(assert (= (and b!285481 (not res!236275)) b!285478))

(assert (= (and b!285478 (not res!236279)) b!285487))

(assert (= (and b!285485 condMapEmpty!1463) mapIsEmpty!1463))

(assert (= (and b!285485 (not condMapEmpty!1463)) mapNonEmpty!1465))

(assert (= start!64048 b!285485))

(assert (= (and b!285480 condMapEmpty!1464) mapIsEmpty!1464))

(assert (= (and b!285480 (not condMapEmpty!1464)) mapNonEmpty!1464))

(assert (= start!64048 b!285480))

(assert (= (and b!285476 condMapEmpty!1465) mapIsEmpty!1465))

(assert (= (and b!285476 (not condMapEmpty!1465)) mapNonEmpty!1463))

(assert (= start!64048 b!285476))

(declare-fun m!418447 () Bool)

(assert (=> b!285478 m!418447))

(declare-fun m!418449 () Bool)

(assert (=> start!64048 m!418449))

(declare-fun m!418451 () Bool)

(assert (=> start!64048 m!418451))

(declare-fun m!418453 () Bool)

(assert (=> start!64048 m!418453))

(declare-fun m!418455 () Bool)

(assert (=> b!285489 m!418455))

(declare-fun m!418457 () Bool)

(assert (=> b!285487 m!418457))

(declare-fun m!418459 () Bool)

(assert (=> b!285487 m!418459))

(declare-fun m!418461 () Bool)

(assert (=> mapNonEmpty!1464 m!418461))

(declare-fun m!418463 () Bool)

(assert (=> b!285481 m!418463))

(declare-fun m!418465 () Bool)

(assert (=> b!285486 m!418465))

(declare-fun m!418467 () Bool)

(assert (=> mapNonEmpty!1463 m!418467))

(declare-fun m!418469 () Bool)

(assert (=> b!285479 m!418469))

(declare-fun m!418471 () Bool)

(assert (=> mapNonEmpty!1465 m!418471))

(declare-fun m!418473 () Bool)

(assert (=> b!285482 m!418473))

(declare-fun m!418475 () Bool)

(assert (=> b!285477 m!418475))

(declare-fun m!418477 () Bool)

(assert (=> b!285477 m!418477))

(declare-fun m!418479 () Bool)

(assert (=> b!285488 m!418479))

(check-sat tp_is_empty!489 (not mapNonEmpty!1464) (not b!285479) (not b!285487) (not b!285477) (not mapNonEmpty!1463) (not b!285482) (not start!64048) (not b!285478) (not mapNonEmpty!1465) (not b!285486) (not b!285481) (not b!285489) (not b!285488))
(check-sat)

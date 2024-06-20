; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64042 () Bool)

(assert start!64042)

(declare-fun b!285362 () Bool)

(declare-fun res!236187 () Bool)

(declare-fun e!203760 () Bool)

(assert (=> b!285362 (=> (not res!236187) (not e!203760))))

(declare-datatypes ((T!51569 0))(
  ( (T!51570 (val!241 Int)) )
))
(declare-datatypes ((array!16761 0))(
  ( (array!16762 (arr!8228 (Array (_ BitVec 32) T!51569)) (size!7232 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16761)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun a1!647 () array!16761)

(declare-fun arrayRangesEq!1374 (array!16761 array!16761 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285362 (= res!236187 (arrayRangesEq!1374 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285363 () Bool)

(declare-fun res!236186 () Bool)

(assert (=> b!285363 (=> (not res!236186) (not e!203760))))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!285363 (= res!236186 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1436 () Bool)

(declare-fun mapRes!1438 () Bool)

(assert (=> mapIsEmpty!1436 mapRes!1438))

(declare-fun b!285364 () Bool)

(assert (=> b!285364 (= e!203760 (not true))))

(declare-fun a3!68 () array!16761)

(assert (=> b!285364 (arrayRangesEq!1374 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19929 0))(
  ( (Unit!19930) )
))
(declare-fun lt!418575 () Unit!19929)

(declare-fun arrayRangesEqAppend!7 (array!16761 array!16761 (_ BitVec 32) (_ BitVec 32)) Unit!19929)

(assert (=> b!285364 (= lt!418575 (arrayRangesEqAppend!7 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285365 () Bool)

(declare-fun res!236193 () Bool)

(assert (=> b!285365 (=> (not res!236193) (not e!203760))))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285365 (= res!236193 (arrayRangesEq!1374 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285366 () Bool)

(declare-fun res!236189 () Bool)

(assert (=> b!285366 (=> (not res!236189) (not e!203760))))

(assert (=> b!285366 (= res!236189 (arrayRangesEq!1374 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285367 () Bool)

(declare-fun res!236190 () Bool)

(assert (=> b!285367 (=> (not res!236190) (not e!203760))))

(assert (=> b!285367 (= res!236190 (arrayRangesEq!1374 a1!647 a3!68 from!773 i!964))))

(declare-fun res!236188 () Bool)

(assert (=> start!64042 (=> (not res!236188) (not e!203760))))

(assert (=> start!64042 (= res!236188 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7232 a1!647) (size!7232 a2!647)) (bvsle (size!7232 a2!647) (size!7232 a3!68)) (bvsle mid!71 (size!7232 a1!647)) (bvsle to!740 (size!7232 a2!647))))))

(assert (=> start!64042 e!203760))

(declare-fun e!203758 () Bool)

(declare-fun array_inv!6901 (array!16761) Bool)

(assert (=> start!64042 (and (array_inv!6901 a2!647) e!203758)))

(assert (=> start!64042 true))

(declare-fun e!203759 () Bool)

(assert (=> start!64042 (and (array_inv!6901 a1!647) e!203759)))

(declare-fun e!203761 () Bool)

(assert (=> start!64042 (and (array_inv!6901 a3!68) e!203761)))

(declare-fun b!285368 () Bool)

(declare-fun tp_is_empty!483 () Bool)

(assert (=> b!285368 (= e!203761 (and tp_is_empty!483 mapRes!1438))))

(declare-fun condMapEmpty!1436 () Bool)

(declare-fun mapDefault!1436 () T!51569)

(assert (=> b!285368 (= condMapEmpty!1436 (= (arr!8228 a3!68) ((as const (Array (_ BitVec 32) T!51569)) mapDefault!1436)))))

(declare-fun mapNonEmpty!1436 () Bool)

(declare-fun tp!1437 () Bool)

(assert (=> mapNonEmpty!1436 (= mapRes!1438 (and tp!1437 tp_is_empty!483))))

(declare-fun mapRest!1438 () (Array (_ BitVec 32) T!51569))

(declare-fun mapKey!1437 () (_ BitVec 32))

(declare-fun mapValue!1438 () T!51569)

(assert (=> mapNonEmpty!1436 (= (arr!8228 a3!68) (store mapRest!1438 mapKey!1437 mapValue!1438))))

(declare-fun mapNonEmpty!1437 () Bool)

(declare-fun mapRes!1437 () Bool)

(declare-fun tp!1436 () Bool)

(assert (=> mapNonEmpty!1437 (= mapRes!1437 (and tp!1436 tp_is_empty!483))))

(declare-fun mapRest!1437 () (Array (_ BitVec 32) T!51569))

(declare-fun mapValue!1437 () T!51569)

(declare-fun mapKey!1438 () (_ BitVec 32))

(assert (=> mapNonEmpty!1437 (= (arr!8228 a2!647) (store mapRest!1437 mapKey!1438 mapValue!1437))))

(declare-fun mapNonEmpty!1438 () Bool)

(declare-fun mapRes!1436 () Bool)

(declare-fun tp!1438 () Bool)

(assert (=> mapNonEmpty!1438 (= mapRes!1436 (and tp!1438 tp_is_empty!483))))

(declare-fun mapValue!1436 () T!51569)

(declare-fun mapKey!1436 () (_ BitVec 32))

(declare-fun mapRest!1436 () (Array (_ BitVec 32) T!51569))

(assert (=> mapNonEmpty!1438 (= (arr!8228 a1!647) (store mapRest!1436 mapKey!1436 mapValue!1436))))

(declare-fun b!285369 () Bool)

(assert (=> b!285369 (= e!203759 (and tp_is_empty!483 mapRes!1436))))

(declare-fun condMapEmpty!1438 () Bool)

(declare-fun mapDefault!1437 () T!51569)

(assert (=> b!285369 (= condMapEmpty!1438 (= (arr!8228 a1!647) ((as const (Array (_ BitVec 32) T!51569)) mapDefault!1437)))))

(declare-fun b!285370 () Bool)

(declare-fun res!236192 () Bool)

(assert (=> b!285370 (=> (not res!236192) (not e!203760))))

(assert (=> b!285370 (= res!236192 (not (= i!964 mid!71)))))

(declare-fun mapIsEmpty!1437 () Bool)

(assert (=> mapIsEmpty!1437 mapRes!1436))

(declare-fun b!285371 () Bool)

(assert (=> b!285371 (= e!203758 (and tp_is_empty!483 mapRes!1437))))

(declare-fun condMapEmpty!1437 () Bool)

(declare-fun mapDefault!1438 () T!51569)

(assert (=> b!285371 (= condMapEmpty!1437 (= (arr!8228 a2!647) ((as const (Array (_ BitVec 32) T!51569)) mapDefault!1438)))))

(declare-fun b!285372 () Bool)

(declare-fun res!236191 () Bool)

(assert (=> b!285372 (=> (not res!236191) (not e!203760))))

(assert (=> b!285372 (= res!236191 (arrayRangesEq!1374 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1438 () Bool)

(assert (=> mapIsEmpty!1438 mapRes!1437))

(assert (= (and start!64042 res!236188) b!285366))

(assert (= (and b!285366 res!236189) b!285372))

(assert (= (and b!285372 res!236191) b!285363))

(assert (= (and b!285363 res!236186) b!285362))

(assert (= (and b!285362 res!236187) b!285365))

(assert (= (and b!285365 res!236193) b!285367))

(assert (= (and b!285367 res!236190) b!285370))

(assert (= (and b!285370 res!236192) b!285364))

(assert (= (and b!285371 condMapEmpty!1437) mapIsEmpty!1438))

(assert (= (and b!285371 (not condMapEmpty!1437)) mapNonEmpty!1437))

(assert (= start!64042 b!285371))

(assert (= (and b!285369 condMapEmpty!1438) mapIsEmpty!1437))

(assert (= (and b!285369 (not condMapEmpty!1438)) mapNonEmpty!1438))

(assert (= start!64042 b!285369))

(assert (= (and b!285368 condMapEmpty!1436) mapIsEmpty!1436))

(assert (= (and b!285368 (not condMapEmpty!1436)) mapNonEmpty!1436))

(assert (= start!64042 b!285368))

(declare-fun m!418361 () Bool)

(assert (=> mapNonEmpty!1438 m!418361))

(declare-fun m!418363 () Bool)

(assert (=> start!64042 m!418363))

(declare-fun m!418365 () Bool)

(assert (=> start!64042 m!418365))

(declare-fun m!418367 () Bool)

(assert (=> start!64042 m!418367))

(declare-fun m!418369 () Bool)

(assert (=> b!285372 m!418369))

(declare-fun m!418371 () Bool)

(assert (=> b!285366 m!418371))

(declare-fun m!418373 () Bool)

(assert (=> mapNonEmpty!1437 m!418373))

(declare-fun m!418375 () Bool)

(assert (=> b!285362 m!418375))

(declare-fun m!418377 () Bool)

(assert (=> b!285365 m!418377))

(declare-fun m!418379 () Bool)

(assert (=> b!285367 m!418379))

(declare-fun m!418381 () Bool)

(assert (=> b!285364 m!418381))

(declare-fun m!418383 () Bool)

(assert (=> b!285364 m!418383))

(declare-fun m!418385 () Bool)

(assert (=> mapNonEmpty!1436 m!418385))

(check-sat (not mapNonEmpty!1436) (not b!285365) (not start!64042) tp_is_empty!483 (not mapNonEmpty!1438) (not b!285367) (not b!285364) (not b!285366) (not b!285372) (not b!285362) (not mapNonEmpty!1437))
(check-sat)

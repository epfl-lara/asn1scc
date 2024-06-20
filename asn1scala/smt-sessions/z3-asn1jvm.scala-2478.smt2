; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63110 () Bool)

(assert start!63110)

(declare-fun res!234310 () Bool)

(declare-fun e!201811 () Bool)

(assert (=> start!63110 (=> (not res!234310) (not e!201811))))

(declare-fun to!556 () (_ BitVec 32))

(declare-fun from!589 () (_ BitVec 32))

(declare-datatypes ((T!50025 0))(
  ( (T!50026 (val!139 Int)) )
))
(declare-datatypes ((array!16311 0))(
  ( (array!16312 (arr!8036 (Array (_ BitVec 32) T!50025)) (size!7040 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16311)

(declare-fun a2!463 () array!16311)

(assert (=> start!63110 (= res!234310 (and (bvsle #b00000000000000000000000000000000 from!589) (bvsle from!589 to!556) (bvsle to!556 (size!7040 a1!463)) (= (size!7040 a1!463) (size!7040 a2!463))))))

(assert (=> start!63110 e!201811))

(assert (=> start!63110 true))

(declare-fun e!201812 () Bool)

(declare-fun array_inv!6763 (array!16311) Bool)

(assert (=> start!63110 (and (array_inv!6763 a1!463) e!201812)))

(declare-fun e!201813 () Bool)

(assert (=> start!63110 (and (array_inv!6763 a2!463) e!201813)))

(declare-fun mapNonEmpty!672 () Bool)

(declare-fun mapRes!673 () Bool)

(declare-fun tp!672 () Bool)

(declare-fun tp_is_empty!279 () Bool)

(assert (=> mapNonEmpty!672 (= mapRes!673 (and tp!672 tp_is_empty!279))))

(declare-fun mapKey!673 () (_ BitVec 32))

(declare-fun mapValue!672 () T!50025)

(declare-fun mapRest!673 () (Array (_ BitVec 32) T!50025))

(assert (=> mapNonEmpty!672 (= (arr!8036 a2!463) (store mapRest!673 mapKey!673 mapValue!672))))

(declare-fun mapIsEmpty!672 () Bool)

(declare-fun mapRes!672 () Bool)

(assert (=> mapIsEmpty!672 mapRes!672))

(declare-fun mapIsEmpty!673 () Bool)

(assert (=> mapIsEmpty!673 mapRes!673))

(declare-fun b!282451 () Bool)

(assert (=> b!282451 (= e!201813 (and tp_is_empty!279 mapRes!673))))

(declare-fun condMapEmpty!673 () Bool)

(declare-fun mapDefault!673 () T!50025)

(assert (=> b!282451 (= condMapEmpty!673 (= (arr!8036 a2!463) ((as const (Array (_ BitVec 32) T!50025)) mapDefault!673)))))

(declare-fun b!282452 () Bool)

(declare-fun arrayRangesEq!1307 (array!16311 array!16311 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282452 (= e!201811 (not (arrayRangesEq!1307 a2!463 a1!463 to!556 to!556)))))

(declare-fun b!282453 () Bool)

(assert (=> b!282453 (= e!201812 (and tp_is_empty!279 mapRes!672))))

(declare-fun condMapEmpty!672 () Bool)

(declare-fun mapDefault!672 () T!50025)

(assert (=> b!282453 (= condMapEmpty!672 (= (arr!8036 a1!463) ((as const (Array (_ BitVec 32) T!50025)) mapDefault!672)))))

(declare-fun b!282454 () Bool)

(declare-fun res!234311 () Bool)

(assert (=> b!282454 (=> (not res!234311) (not e!201811))))

(assert (=> b!282454 (= res!234311 (arrayRangesEq!1307 a1!463 a2!463 from!589 to!556))))

(declare-fun mapNonEmpty!673 () Bool)

(declare-fun tp!673 () Bool)

(assert (=> mapNonEmpty!673 (= mapRes!672 (and tp!673 tp_is_empty!279))))

(declare-fun mapRest!672 () (Array (_ BitVec 32) T!50025))

(declare-fun mapKey!672 () (_ BitVec 32))

(declare-fun mapValue!673 () T!50025)

(assert (=> mapNonEmpty!673 (= (arr!8036 a1!463) (store mapRest!672 mapKey!672 mapValue!673))))

(assert (= (and start!63110 res!234310) b!282454))

(assert (= (and b!282454 res!234311) b!282452))

(assert (= (and b!282453 condMapEmpty!672) mapIsEmpty!672))

(assert (= (and b!282453 (not condMapEmpty!672)) mapNonEmpty!673))

(assert (= start!63110 b!282453))

(assert (= (and b!282451 condMapEmpty!673) mapIsEmpty!673))

(assert (= (and b!282451 (not condMapEmpty!673)) mapNonEmpty!672))

(assert (= start!63110 b!282451))

(declare-fun m!415581 () Bool)

(assert (=> mapNonEmpty!672 m!415581))

(declare-fun m!415583 () Bool)

(assert (=> b!282452 m!415583))

(declare-fun m!415585 () Bool)

(assert (=> b!282454 m!415585))

(declare-fun m!415587 () Bool)

(assert (=> mapNonEmpty!673 m!415587))

(declare-fun m!415589 () Bool)

(assert (=> start!63110 m!415589))

(declare-fun m!415591 () Bool)

(assert (=> start!63110 m!415591))

(check-sat (not mapNonEmpty!672) (not b!282454) (not b!282452) (not start!63110) (not mapNonEmpty!673) tp_is_empty!279)
(check-sat)
(get-model)

(declare-fun d!97178 () Bool)

(declare-fun res!234322 () Bool)

(declare-fun e!201827 () Bool)

(assert (=> d!97178 (=> res!234322 e!201827)))

(assert (=> d!97178 (= res!234322 (= from!589 to!556))))

(assert (=> d!97178 (= (arrayRangesEq!1307 a1!463 a2!463 from!589 to!556) e!201827)))

(declare-fun b!282471 () Bool)

(declare-fun e!201828 () Bool)

(assert (=> b!282471 (= e!201827 e!201828)))

(declare-fun res!234323 () Bool)

(assert (=> b!282471 (=> (not res!234323) (not e!201828))))

(assert (=> b!282471 (= res!234323 (= (select (arr!8036 a1!463) from!589) (select (arr!8036 a2!463) from!589)))))

(declare-fun b!282472 () Bool)

(assert (=> b!282472 (= e!201828 (arrayRangesEq!1307 a1!463 a2!463 (bvadd from!589 #b00000000000000000000000000000001) to!556))))

(assert (= (and d!97178 (not res!234322)) b!282471))

(assert (= (and b!282471 res!234323) b!282472))

(declare-fun m!415605 () Bool)

(assert (=> b!282471 m!415605))

(declare-fun m!415607 () Bool)

(assert (=> b!282471 m!415607))

(declare-fun m!415609 () Bool)

(assert (=> b!282472 m!415609))

(assert (=> b!282454 d!97178))

(declare-fun d!97180 () Bool)

(declare-fun res!234324 () Bool)

(declare-fun e!201829 () Bool)

(assert (=> d!97180 (=> res!234324 e!201829)))

(assert (=> d!97180 (= res!234324 (= to!556 to!556))))

(assert (=> d!97180 (= (arrayRangesEq!1307 a2!463 a1!463 to!556 to!556) e!201829)))

(declare-fun b!282473 () Bool)

(declare-fun e!201830 () Bool)

(assert (=> b!282473 (= e!201829 e!201830)))

(declare-fun res!234325 () Bool)

(assert (=> b!282473 (=> (not res!234325) (not e!201830))))

(assert (=> b!282473 (= res!234325 (= (select (arr!8036 a2!463) to!556) (select (arr!8036 a1!463) to!556)))))

(declare-fun b!282474 () Bool)

(assert (=> b!282474 (= e!201830 (arrayRangesEq!1307 a2!463 a1!463 (bvadd to!556 #b00000000000000000000000000000001) to!556))))

(assert (= (and d!97180 (not res!234324)) b!282473))

(assert (= (and b!282473 res!234325) b!282474))

(declare-fun m!415611 () Bool)

(assert (=> b!282473 m!415611))

(declare-fun m!415613 () Bool)

(assert (=> b!282473 m!415613))

(declare-fun m!415615 () Bool)

(assert (=> b!282474 m!415615))

(assert (=> b!282452 d!97180))

(declare-fun d!97182 () Bool)

(assert (=> d!97182 (= (array_inv!6763 a1!463) (bvsge (size!7040 a1!463) #b00000000000000000000000000000000))))

(assert (=> start!63110 d!97182))

(declare-fun d!97184 () Bool)

(assert (=> d!97184 (= (array_inv!6763 a2!463) (bvsge (size!7040 a2!463) #b00000000000000000000000000000000))))

(assert (=> start!63110 d!97184))

(declare-fun condMapEmpty!682 () Bool)

(declare-fun mapDefault!682 () T!50025)

(assert (=> mapNonEmpty!673 (= condMapEmpty!682 (= mapRest!672 ((as const (Array (_ BitVec 32) T!50025)) mapDefault!682)))))

(declare-fun mapRes!682 () Bool)

(assert (=> mapNonEmpty!673 (= tp!673 (and tp_is_empty!279 mapRes!682))))

(declare-fun mapIsEmpty!682 () Bool)

(assert (=> mapIsEmpty!682 mapRes!682))

(declare-fun mapNonEmpty!682 () Bool)

(declare-fun tp!682 () Bool)

(assert (=> mapNonEmpty!682 (= mapRes!682 (and tp!682 tp_is_empty!279))))

(declare-fun mapKey!682 () (_ BitVec 32))

(declare-fun mapValue!682 () T!50025)

(declare-fun mapRest!682 () (Array (_ BitVec 32) T!50025))

(assert (=> mapNonEmpty!682 (= mapRest!672 (store mapRest!682 mapKey!682 mapValue!682))))

(assert (= (and mapNonEmpty!673 condMapEmpty!682) mapIsEmpty!682))

(assert (= (and mapNonEmpty!673 (not condMapEmpty!682)) mapNonEmpty!682))

(declare-fun m!415617 () Bool)

(assert (=> mapNonEmpty!682 m!415617))

(declare-fun condMapEmpty!683 () Bool)

(declare-fun mapDefault!683 () T!50025)

(assert (=> mapNonEmpty!672 (= condMapEmpty!683 (= mapRest!673 ((as const (Array (_ BitVec 32) T!50025)) mapDefault!683)))))

(declare-fun mapRes!683 () Bool)

(assert (=> mapNonEmpty!672 (= tp!672 (and tp_is_empty!279 mapRes!683))))

(declare-fun mapIsEmpty!683 () Bool)

(assert (=> mapIsEmpty!683 mapRes!683))

(declare-fun mapNonEmpty!683 () Bool)

(declare-fun tp!683 () Bool)

(assert (=> mapNonEmpty!683 (= mapRes!683 (and tp!683 tp_is_empty!279))))

(declare-fun mapKey!683 () (_ BitVec 32))

(declare-fun mapRest!683 () (Array (_ BitVec 32) T!50025))

(declare-fun mapValue!683 () T!50025)

(assert (=> mapNonEmpty!683 (= mapRest!673 (store mapRest!683 mapKey!683 mapValue!683))))

(assert (= (and mapNonEmpty!672 condMapEmpty!683) mapIsEmpty!683))

(assert (= (and mapNonEmpty!672 (not condMapEmpty!683)) mapNonEmpty!683))

(declare-fun m!415619 () Bool)

(assert (=> mapNonEmpty!683 m!415619))

(check-sat (not mapNonEmpty!682) (not mapNonEmpty!683) tp_is_empty!279 (not b!282472) (not b!282474))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68474 () Bool)

(assert start!68474)

(declare-fun b!307461 () Bool)

(declare-fun e!221559 () Bool)

(declare-fun tp_is_empty!759 () Bool)

(declare-fun mapRes!2438 () Bool)

(assert (=> b!307461 (= e!221559 (and tp_is_empty!759 mapRes!2438))))

(declare-fun condMapEmpty!2438 () Bool)

(declare-datatypes ((T!57485 0))(
  ( (T!57486 (val!379 Int)) )
))
(declare-datatypes ((array!18622 0))(
  ( (array!18623 (arr!9149 (Array (_ BitVec 32) T!57485)) (size!8066 (_ BitVec 32))) )
))
(declare-fun a2!506 () array!18622)

(declare-fun mapDefault!2437 () T!57485)

(assert (=> b!307461 (= condMapEmpty!2438 (= (arr!9149 a2!506) ((as const (Array (_ BitVec 32) T!57485)) mapDefault!2437)))))

(declare-fun b!307462 () Bool)

(declare-fun res!252315 () Bool)

(declare-fun e!221560 () Bool)

(assert (=> b!307462 (=> (not res!252315) (not e!221560))))

(declare-fun a1!506 () array!18622)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun arrayRangesEq!1695 (array!18622 array!18622 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307462 (= res!252315 (arrayRangesEq!1695 a1!506 a2!506 to!599 to!599))))

(declare-fun b!307463 () Bool)

(declare-fun res!252317 () Bool)

(assert (=> b!307463 (=> (not res!252317) (not e!221560))))

(declare-fun from!632 () (_ BitVec 32))

(assert (=> b!307463 (= res!252317 (arrayRangesEq!1695 a1!506 a2!506 from!632 to!599))))

(declare-fun mapNonEmpty!2437 () Bool)

(declare-fun tp!2438 () Bool)

(assert (=> mapNonEmpty!2437 (= mapRes!2438 (and tp!2438 tp_is_empty!759))))

(declare-fun mapValue!2438 () T!57485)

(declare-fun mapRest!2437 () (Array (_ BitVec 32) T!57485))

(declare-fun mapKey!2438 () (_ BitVec 32))

(assert (=> mapNonEmpty!2437 (= (arr!9149 a2!506) (store mapRest!2437 mapKey!2438 mapValue!2438))))

(declare-fun mapNonEmpty!2438 () Bool)

(declare-fun mapRes!2437 () Bool)

(declare-fun tp!2437 () Bool)

(assert (=> mapNonEmpty!2438 (= mapRes!2437 (and tp!2437 tp_is_empty!759))))

(declare-fun mapValue!2437 () T!57485)

(declare-fun mapKey!2437 () (_ BitVec 32))

(declare-fun mapRest!2438 () (Array (_ BitVec 32) T!57485))

(assert (=> mapNonEmpty!2438 (= (arr!9149 a1!506) (store mapRest!2438 mapKey!2437 mapValue!2437))))

(declare-fun mapIsEmpty!2437 () Bool)

(assert (=> mapIsEmpty!2437 mapRes!2437))

(declare-fun mapIsEmpty!2438 () Bool)

(assert (=> mapIsEmpty!2438 mapRes!2438))

(declare-fun b!307464 () Bool)

(declare-fun fromSlice!41 () (_ BitVec 32))

(assert (=> b!307464 (= e!221560 (not (bvsle #b00000000000000000000000000000000 fromSlice!41)))))

(declare-fun toSlice!41 () (_ BitVec 32))

(assert (=> b!307464 (arrayRangesEq!1695 a1!506 a2!506 fromSlice!41 toSlice!41)))

(declare-datatypes ((Unit!21439 0))(
  ( (Unit!21440) )
))
(declare-fun lt!440238 () Unit!21439)

(declare-fun rec!89 (array!18622 array!18622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21439)

(assert (=> b!307464 (= lt!440238 (rec!89 a1!506 a2!506 from!632 fromSlice!41 to!599 toSlice!41 to!599))))

(declare-fun res!252318 () Bool)

(assert (=> start!68474 (=> (not res!252318) (not e!221560))))

(assert (=> start!68474 (= res!252318 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8066 a1!506) (size!8066 a2!506)) (bvsle to!599 (size!8066 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68474 e!221560))

(assert (=> start!68474 true))

(declare-fun e!221557 () Bool)

(declare-fun array_inv!7678 (array!18622) Bool)

(assert (=> start!68474 (and (array_inv!7678 a1!506) e!221557)))

(assert (=> start!68474 (and (array_inv!7678 a2!506) e!221559)))

(declare-fun b!307465 () Bool)

(declare-fun res!252314 () Bool)

(assert (=> b!307465 (=> (not res!252314) (not e!221560))))

(declare-fun e!221558 () Bool)

(assert (=> b!307465 (= res!252314 e!221558)))

(declare-fun res!252313 () Bool)

(assert (=> b!307465 (=> res!252313 e!221558)))

(assert (=> b!307465 (= res!252313 (bvsgt to!599 toSlice!41))))

(declare-fun b!307466 () Bool)

(assert (=> b!307466 (= e!221558 (arrayRangesEq!1695 a1!506 a2!506 to!599 toSlice!41))))

(declare-fun b!307467 () Bool)

(declare-fun res!252316 () Bool)

(assert (=> b!307467 (=> (not res!252316) (not e!221560))))

(assert (=> b!307467 (= res!252316 (bvsle fromSlice!41 to!599))))

(declare-fun b!307468 () Bool)

(assert (=> b!307468 (= e!221557 (and tp_is_empty!759 mapRes!2437))))

(declare-fun condMapEmpty!2437 () Bool)

(declare-fun mapDefault!2438 () T!57485)

(assert (=> b!307468 (= condMapEmpty!2437 (= (arr!9149 a1!506) ((as const (Array (_ BitVec 32) T!57485)) mapDefault!2438)))))

(assert (= (and start!68474 res!252318) b!307463))

(assert (= (and b!307463 res!252317) b!307467))

(assert (= (and b!307467 res!252316) b!307462))

(assert (= (and b!307462 res!252315) b!307465))

(assert (= (and b!307465 (not res!252313)) b!307466))

(assert (= (and b!307465 res!252314) b!307464))

(assert (= (and b!307468 condMapEmpty!2437) mapIsEmpty!2437))

(assert (= (and b!307468 (not condMapEmpty!2437)) mapNonEmpty!2438))

(assert (= start!68474 b!307468))

(assert (= (and b!307461 condMapEmpty!2438) mapIsEmpty!2438))

(assert (= (and b!307461 (not condMapEmpty!2438)) mapNonEmpty!2437))

(assert (= start!68474 b!307461))

(declare-fun m!446033 () Bool)

(assert (=> start!68474 m!446033))

(declare-fun m!446035 () Bool)

(assert (=> start!68474 m!446035))

(declare-fun m!446037 () Bool)

(assert (=> b!307466 m!446037))

(declare-fun m!446039 () Bool)

(assert (=> b!307464 m!446039))

(declare-fun m!446041 () Bool)

(assert (=> b!307464 m!446041))

(declare-fun m!446043 () Bool)

(assert (=> mapNonEmpty!2438 m!446043))

(declare-fun m!446045 () Bool)

(assert (=> b!307462 m!446045))

(declare-fun m!446047 () Bool)

(assert (=> b!307463 m!446047))

(declare-fun m!446049 () Bool)

(assert (=> mapNonEmpty!2437 m!446049))

(check-sat (not mapNonEmpty!2438) (not mapNonEmpty!2437) (not b!307463) (not b!307464) (not start!68474) (not b!307466) (not b!307462) tp_is_empty!759)
(check-sat)

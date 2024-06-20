; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68480 () Bool)

(assert start!68480)

(declare-fun b!307533 () Bool)

(declare-fun res!252372 () Bool)

(declare-fun e!221595 () Bool)

(assert (=> b!307533 (=> (not res!252372) (not e!221595))))

(declare-datatypes ((T!57511 0))(
  ( (T!57512 (val!382 Int)) )
))
(declare-datatypes ((array!18628 0))(
  ( (array!18629 (arr!9152 (Array (_ BitVec 32) T!57511)) (size!8069 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18628)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18628)

(declare-fun arrayRangesEq!1697 (array!18628 array!18628 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307533 (= res!252372 (arrayRangesEq!1697 a1!506 a2!506 to!599 to!599))))

(declare-fun b!307534 () Bool)

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-fun e!221593 () Bool)

(assert (=> b!307534 (= e!221593 (arrayRangesEq!1697 a1!506 a2!506 to!599 toSlice!41))))

(declare-fun mapIsEmpty!2455 () Bool)

(declare-fun mapRes!2456 () Bool)

(assert (=> mapIsEmpty!2455 mapRes!2456))

(declare-fun b!307535 () Bool)

(declare-fun res!252367 () Bool)

(assert (=> b!307535 (=> (not res!252367) (not e!221595))))

(declare-fun from!632 () (_ BitVec 32))

(assert (=> b!307535 (= res!252367 (arrayRangesEq!1697 a1!506 a2!506 from!632 to!599))))

(declare-fun b!307536 () Bool)

(assert (=> b!307536 (= e!221595 (not true))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(assert (=> b!307536 (arrayRangesEq!1697 a1!506 a2!506 fromSlice!41 toSlice!41)))

(declare-datatypes ((Unit!21441 0))(
  ( (Unit!21442) )
))
(declare-fun lt!440247 () Unit!21441)

(declare-fun rec!90 (array!18628 array!18628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21441)

(assert (=> b!307536 (= lt!440247 (rec!90 a1!506 a2!506 from!632 fromSlice!41 to!599 toSlice!41 to!599))))

(declare-fun res!252368 () Bool)

(assert (=> start!68480 (=> (not res!252368) (not e!221595))))

(assert (=> start!68480 (= res!252368 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8069 a1!506) (size!8069 a2!506)) (bvsle to!599 (size!8069 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68480 e!221595))

(assert (=> start!68480 true))

(declare-fun e!221594 () Bool)

(declare-fun array_inv!7679 (array!18628) Bool)

(assert (=> start!68480 (and (array_inv!7679 a1!506) e!221594)))

(declare-fun e!221596 () Bool)

(assert (=> start!68480 (and (array_inv!7679 a2!506) e!221596)))

(declare-fun mapNonEmpty!2455 () Bool)

(declare-fun mapRes!2455 () Bool)

(declare-fun tp!2455 () Bool)

(declare-fun tp_is_empty!765 () Bool)

(assert (=> mapNonEmpty!2455 (= mapRes!2455 (and tp!2455 tp_is_empty!765))))

(declare-fun mapRest!2456 () (Array (_ BitVec 32) T!57511))

(declare-fun mapValue!2456 () T!57511)

(declare-fun mapKey!2455 () (_ BitVec 32))

(assert (=> mapNonEmpty!2455 (= (arr!9152 a2!506) (store mapRest!2456 mapKey!2455 mapValue!2456))))

(declare-fun b!307537 () Bool)

(declare-fun res!252371 () Bool)

(assert (=> b!307537 (=> (not res!252371) (not e!221595))))

(assert (=> b!307537 (= res!252371 (bvsle fromSlice!41 to!599))))

(declare-fun mapIsEmpty!2456 () Bool)

(assert (=> mapIsEmpty!2456 mapRes!2455))

(declare-fun mapNonEmpty!2456 () Bool)

(declare-fun tp!2456 () Bool)

(assert (=> mapNonEmpty!2456 (= mapRes!2456 (and tp!2456 tp_is_empty!765))))

(declare-fun mapRest!2455 () (Array (_ BitVec 32) T!57511))

(declare-fun mapValue!2455 () T!57511)

(declare-fun mapKey!2456 () (_ BitVec 32))

(assert (=> mapNonEmpty!2456 (= (arr!9152 a1!506) (store mapRest!2455 mapKey!2456 mapValue!2455))))

(declare-fun b!307538 () Bool)

(declare-fun res!252369 () Bool)

(assert (=> b!307538 (=> (not res!252369) (not e!221595))))

(assert (=> b!307538 (= res!252369 e!221593)))

(declare-fun res!252370 () Bool)

(assert (=> b!307538 (=> res!252370 e!221593)))

(assert (=> b!307538 (= res!252370 (bvsgt to!599 toSlice!41))))

(declare-fun b!307539 () Bool)

(assert (=> b!307539 (= e!221596 (and tp_is_empty!765 mapRes!2455))))

(declare-fun condMapEmpty!2455 () Bool)

(declare-fun mapDefault!2456 () T!57511)

(assert (=> b!307539 (= condMapEmpty!2455 (= (arr!9152 a2!506) ((as const (Array (_ BitVec 32) T!57511)) mapDefault!2456)))))

(declare-fun b!307540 () Bool)

(assert (=> b!307540 (= e!221594 (and tp_is_empty!765 mapRes!2456))))

(declare-fun condMapEmpty!2456 () Bool)

(declare-fun mapDefault!2455 () T!57511)

(assert (=> b!307540 (= condMapEmpty!2456 (= (arr!9152 a1!506) ((as const (Array (_ BitVec 32) T!57511)) mapDefault!2455)))))

(assert (= (and start!68480 res!252368) b!307535))

(assert (= (and b!307535 res!252367) b!307537))

(assert (= (and b!307537 res!252371) b!307533))

(assert (= (and b!307533 res!252372) b!307538))

(assert (= (and b!307538 (not res!252370)) b!307534))

(assert (= (and b!307538 res!252369) b!307536))

(assert (= (and b!307540 condMapEmpty!2456) mapIsEmpty!2455))

(assert (= (and b!307540 (not condMapEmpty!2456)) mapNonEmpty!2456))

(assert (= start!68480 b!307540))

(assert (= (and b!307539 condMapEmpty!2455) mapIsEmpty!2456))

(assert (= (and b!307539 (not condMapEmpty!2455)) mapNonEmpty!2455))

(assert (= start!68480 b!307539))

(declare-fun m!446087 () Bool)

(assert (=> b!307535 m!446087))

(declare-fun m!446089 () Bool)

(assert (=> mapNonEmpty!2455 m!446089))

(declare-fun m!446091 () Bool)

(assert (=> b!307536 m!446091))

(declare-fun m!446093 () Bool)

(assert (=> b!307536 m!446093))

(declare-fun m!446095 () Bool)

(assert (=> start!68480 m!446095))

(declare-fun m!446097 () Bool)

(assert (=> start!68480 m!446097))

(declare-fun m!446099 () Bool)

(assert (=> b!307534 m!446099))

(declare-fun m!446101 () Bool)

(assert (=> b!307533 m!446101))

(declare-fun m!446103 () Bool)

(assert (=> mapNonEmpty!2456 m!446103))

(check-sat (not mapNonEmpty!2455) (not b!307533) (not start!68480) tp_is_empty!765 (not mapNonEmpty!2456) (not b!307534) (not b!307535) (not b!307536))
(check-sat)

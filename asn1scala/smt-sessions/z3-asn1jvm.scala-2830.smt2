; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68492 () Bool)

(assert start!68492)

(declare-fun mapNonEmpty!2491 () Bool)

(declare-fun mapRes!2492 () Bool)

(declare-fun tp!2492 () Bool)

(declare-fun tp_is_empty!777 () Bool)

(assert (=> mapNonEmpty!2491 (= mapRes!2492 (and tp!2492 tp_is_empty!777))))

(declare-datatypes ((T!57563 0))(
  ( (T!57564 (val!388 Int)) )
))
(declare-fun mapValue!2492 () T!57563)

(declare-fun mapRest!2492 () (Array (_ BitVec 32) T!57563))

(declare-fun mapKey!2492 () (_ BitVec 32))

(declare-datatypes ((array!18640 0))(
  ( (array!18641 (arr!9158 (Array (_ BitVec 32) T!57563)) (size!8075 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18640)

(assert (=> mapNonEmpty!2491 (= (arr!9158 a1!506) (store mapRest!2492 mapKey!2492 mapValue!2492))))

(declare-fun b!307657 () Bool)

(declare-fun e!221662 () Bool)

(declare-fun mapRes!2491 () Bool)

(assert (=> b!307657 (= e!221662 (and tp_is_empty!777 mapRes!2491))))

(declare-fun condMapEmpty!2492 () Bool)

(declare-fun a2!506 () array!18640)

(declare-fun mapDefault!2492 () T!57563)

(assert (=> b!307657 (= condMapEmpty!2492 (= (arr!9158 a2!506) ((as const (Array (_ BitVec 32) T!57563)) mapDefault!2492)))))

(declare-fun mapIsEmpty!2491 () Bool)

(assert (=> mapIsEmpty!2491 mapRes!2492))

(declare-fun mapNonEmpty!2492 () Bool)

(declare-fun tp!2491 () Bool)

(assert (=> mapNonEmpty!2492 (= mapRes!2491 (and tp!2491 tp_is_empty!777))))

(declare-fun mapRest!2491 () (Array (_ BitVec 32) T!57563))

(declare-fun mapValue!2491 () T!57563)

(declare-fun mapKey!2491 () (_ BitVec 32))

(assert (=> mapNonEmpty!2492 (= (arr!9158 a2!506) (store mapRest!2491 mapKey!2491 mapValue!2491))))

(declare-fun b!307658 () Bool)

(declare-fun e!221660 () Bool)

(assert (=> b!307658 (= e!221660 (and tp_is_empty!777 mapRes!2492))))

(declare-fun condMapEmpty!2491 () Bool)

(declare-fun mapDefault!2491 () T!57563)

(assert (=> b!307658 (= condMapEmpty!2491 (= (arr!9158 a1!506) ((as const (Array (_ BitVec 32) T!57563)) mapDefault!2491)))))

(declare-fun res!252456 () Bool)

(declare-fun e!221661 () Bool)

(assert (=> start!68492 (=> (not res!252456) (not e!221661))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-fun to!599 () (_ BitVec 32))

(assert (=> start!68492 (= res!252456 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8075 a1!506) (size!8075 a2!506)) (bvsle to!599 (size!8075 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68492 e!221661))

(assert (=> start!68492 true))

(declare-fun array_inv!7682 (array!18640) Bool)

(assert (=> start!68492 (and (array_inv!7682 a1!506) e!221660)))

(assert (=> start!68492 (and (array_inv!7682 a2!506) e!221662)))

(declare-fun b!307659 () Bool)

(assert (=> b!307659 (= e!221661 (bvsgt fromSlice!41 to!599))))

(declare-fun b!307660 () Bool)

(declare-fun res!252455 () Bool)

(assert (=> b!307660 (=> (not res!252455) (not e!221661))))

(declare-fun arrayRangesEq!1700 (array!18640 array!18640 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307660 (= res!252455 (arrayRangesEq!1700 a1!506 a2!506 from!632 to!599))))

(declare-fun mapIsEmpty!2492 () Bool)

(assert (=> mapIsEmpty!2492 mapRes!2491))

(assert (= (and start!68492 res!252456) b!307660))

(assert (= (and b!307660 res!252455) b!307659))

(assert (= (and b!307658 condMapEmpty!2491) mapIsEmpty!2491))

(assert (= (and b!307658 (not condMapEmpty!2491)) mapNonEmpty!2491))

(assert (= start!68492 b!307658))

(assert (= (and b!307657 condMapEmpty!2492) mapIsEmpty!2492))

(assert (= (and b!307657 (not condMapEmpty!2492)) mapNonEmpty!2492))

(assert (= start!68492 b!307657))

(declare-fun m!446187 () Bool)

(assert (=> mapNonEmpty!2491 m!446187))

(declare-fun m!446189 () Bool)

(assert (=> mapNonEmpty!2492 m!446189))

(declare-fun m!446191 () Bool)

(assert (=> start!68492 m!446191))

(declare-fun m!446193 () Bool)

(assert (=> start!68492 m!446193))

(declare-fun m!446195 () Bool)

(assert (=> b!307660 m!446195))

(check-sat (not b!307660) (not mapNonEmpty!2492) tp_is_empty!777 (not mapNonEmpty!2491) (not start!68492))
(check-sat)

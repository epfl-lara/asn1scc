; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68538 () Bool)

(assert start!68538)

(declare-fun b!308047 () Bool)

(declare-fun res!252719 () Bool)

(declare-fun e!221871 () Bool)

(assert (=> b!308047 (=> (not res!252719) (not e!221871))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308047 (= res!252719 (bvsle i!932 to!617))))

(declare-fun res!252717 () Bool)

(assert (=> start!68538 (=> (not res!252717) (not e!221871))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!57745 0))(
  ( (T!57746 (val!409 Int)) )
))
(declare-datatypes ((array!18683 0))(
  ( (array!18684 (arr!9179 (Array (_ BitVec 32) T!57745)) (size!8096 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18683)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun a1!524 () array!18683)

(assert (=> start!68538 (= res!252717 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8096 a1!524) (size!8096 a2!524)) (bvsle to!617 (size!8096 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68538 e!221871))

(assert (=> start!68538 true))

(declare-fun e!221872 () Bool)

(declare-fun array_inv!7695 (array!18683) Bool)

(assert (=> start!68538 (and (array_inv!7695 a2!524) e!221872)))

(declare-fun e!221874 () Bool)

(assert (=> start!68538 (and (array_inv!7695 a1!524) e!221874)))

(declare-fun b!308048 () Bool)

(declare-fun e!221873 () Bool)

(declare-fun arrayRangesEq!1716 (array!18683 array!18683 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308048 (= e!221873 (arrayRangesEq!1716 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapNonEmpty!2621 () Bool)

(declare-fun mapRes!2622 () Bool)

(declare-fun tp!2622 () Bool)

(declare-fun tp_is_empty!819 () Bool)

(assert (=> mapNonEmpty!2621 (= mapRes!2622 (and tp!2622 tp_is_empty!819))))

(declare-fun mapRest!2621 () (Array (_ BitVec 32) T!57745))

(declare-fun mapKey!2622 () (_ BitVec 32))

(declare-fun mapValue!2621 () T!57745)

(assert (=> mapNonEmpty!2621 (= (arr!9179 a1!524) (store mapRest!2621 mapKey!2622 mapValue!2621))))

(declare-fun b!308049 () Bool)

(declare-fun res!252722 () Bool)

(assert (=> b!308049 (=> (not res!252722) (not e!221871))))

(assert (=> b!308049 (= res!252722 (arrayRangesEq!1716 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308050 () Bool)

(assert (=> b!308050 (= e!221874 (and tp_is_empty!819 mapRes!2622))))

(declare-fun condMapEmpty!2622 () Bool)

(declare-fun mapDefault!2621 () T!57745)

(assert (=> b!308050 (= condMapEmpty!2622 (= (arr!9179 a1!524) ((as const (Array (_ BitVec 32) T!57745)) mapDefault!2621)))))

(declare-fun b!308051 () Bool)

(declare-fun res!252721 () Bool)

(assert (=> b!308051 (=> (not res!252721) (not e!221871))))

(assert (=> b!308051 (= res!252721 e!221873)))

(declare-fun res!252718 () Bool)

(assert (=> b!308051 (=> res!252718 e!221873)))

(assert (=> b!308051 (= res!252718 (bvsgt i!932 toSlice!46))))

(declare-fun mapNonEmpty!2622 () Bool)

(declare-fun mapRes!2621 () Bool)

(declare-fun tp!2621 () Bool)

(assert (=> mapNonEmpty!2622 (= mapRes!2621 (and tp!2621 tp_is_empty!819))))

(declare-fun mapRest!2622 () (Array (_ BitVec 32) T!57745))

(declare-fun mapKey!2621 () (_ BitVec 32))

(declare-fun mapValue!2622 () T!57745)

(assert (=> mapNonEmpty!2622 (= (arr!9179 a2!524) (store mapRest!2622 mapKey!2621 mapValue!2622))))

(declare-fun b!308052 () Bool)

(declare-fun res!252720 () Bool)

(assert (=> b!308052 (=> (not res!252720) (not e!221871))))

(assert (=> b!308052 (= res!252720 (arrayRangesEq!1716 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308053 () Bool)

(assert (=> b!308053 (= e!221871 (and (= i!932 fromSlice!46) (bvsgt #b00000000000000000000000000000000 fromSlice!46)))))

(declare-fun b!308054 () Bool)

(assert (=> b!308054 (= e!221872 (and tp_is_empty!819 mapRes!2621))))

(declare-fun condMapEmpty!2621 () Bool)

(declare-fun mapDefault!2622 () T!57745)

(assert (=> b!308054 (= condMapEmpty!2621 (= (arr!9179 a2!524) ((as const (Array (_ BitVec 32) T!57745)) mapDefault!2622)))))

(declare-fun mapIsEmpty!2621 () Bool)

(assert (=> mapIsEmpty!2621 mapRes!2622))

(declare-fun mapIsEmpty!2622 () Bool)

(assert (=> mapIsEmpty!2622 mapRes!2621))

(assert (= (and start!68538 res!252717) b!308052))

(assert (= (and b!308052 res!252720) b!308047))

(assert (= (and b!308047 res!252719) b!308049))

(assert (= (and b!308049 res!252722) b!308051))

(assert (= (and b!308051 (not res!252718)) b!308048))

(assert (= (and b!308051 res!252721) b!308053))

(assert (= (and b!308054 condMapEmpty!2621) mapIsEmpty!2622))

(assert (= (and b!308054 (not condMapEmpty!2621)) mapNonEmpty!2622))

(assert (= start!68538 b!308054))

(assert (= (and b!308050 condMapEmpty!2622) mapIsEmpty!2621))

(assert (= (and b!308050 (not condMapEmpty!2622)) mapNonEmpty!2621))

(assert (= start!68538 b!308050))

(declare-fun m!446471 () Bool)

(assert (=> start!68538 m!446471))

(declare-fun m!446473 () Bool)

(assert (=> start!68538 m!446473))

(declare-fun m!446475 () Bool)

(assert (=> b!308049 m!446475))

(declare-fun m!446477 () Bool)

(assert (=> mapNonEmpty!2621 m!446477))

(declare-fun m!446479 () Bool)

(assert (=> mapNonEmpty!2622 m!446479))

(declare-fun m!446481 () Bool)

(assert (=> b!308052 m!446481))

(declare-fun m!446483 () Bool)

(assert (=> b!308048 m!446483))

(check-sat (not mapNonEmpty!2621) (not b!308049) (not start!68538) (not b!308052) (not mapNonEmpty!2622) (not b!308048) tp_is_empty!819)
(check-sat)

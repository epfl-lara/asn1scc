; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68544 () Bool)

(assert start!68544)

(declare-fun b!308119 () Bool)

(declare-fun res!252773 () Bool)

(declare-fun e!221907 () Bool)

(assert (=> b!308119 (=> (not res!252773) (not e!221907))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308119 (= res!252773 (bvsle i!932 to!617))))

(declare-fun mapIsEmpty!2639 () Bool)

(declare-fun mapRes!2640 () Bool)

(assert (=> mapIsEmpty!2639 mapRes!2640))

(declare-fun mapIsEmpty!2640 () Bool)

(declare-fun mapRes!2639 () Bool)

(assert (=> mapIsEmpty!2640 mapRes!2639))

(declare-fun b!308120 () Bool)

(declare-fun e!221910 () Bool)

(declare-fun tp_is_empty!825 () Bool)

(assert (=> b!308120 (= e!221910 (and tp_is_empty!825 mapRes!2639))))

(declare-fun condMapEmpty!2640 () Bool)

(declare-datatypes ((T!57771 0))(
  ( (T!57772 (val!412 Int)) )
))
(declare-datatypes ((array!18689 0))(
  ( (array!18690 (arr!9182 (Array (_ BitVec 32) T!57771)) (size!8099 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18689)

(declare-fun mapDefault!2640 () T!57771)

(assert (=> b!308120 (= condMapEmpty!2640 (= (arr!9182 a1!524) ((as const (Array (_ BitVec 32) T!57771)) mapDefault!2640)))))

(declare-fun res!252772 () Bool)

(assert (=> start!68544 (=> (not res!252772) (not e!221907))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun a2!524 () array!18689)

(declare-fun from!650 () (_ BitVec 32))

(assert (=> start!68544 (= res!252772 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8099 a1!524) (size!8099 a2!524)) (bvsle to!617 (size!8099 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68544 e!221907))

(assert (=> start!68544 true))

(declare-fun e!221908 () Bool)

(declare-fun array_inv!7697 (array!18689) Bool)

(assert (=> start!68544 (and (array_inv!7697 a2!524) e!221908)))

(assert (=> start!68544 (and (array_inv!7697 a1!524) e!221910)))

(declare-fun mapNonEmpty!2639 () Bool)

(declare-fun tp!2639 () Bool)

(assert (=> mapNonEmpty!2639 (= mapRes!2640 (and tp!2639 tp_is_empty!825))))

(declare-fun mapValue!2640 () T!57771)

(declare-fun mapRest!2639 () (Array (_ BitVec 32) T!57771))

(declare-fun mapKey!2639 () (_ BitVec 32))

(assert (=> mapNonEmpty!2639 (= (arr!9182 a2!524) (store mapRest!2639 mapKey!2639 mapValue!2640))))

(declare-fun b!308121 () Bool)

(declare-fun res!252775 () Bool)

(assert (=> b!308121 (=> (not res!252775) (not e!221907))))

(declare-fun arrayRangesEq!1718 (array!18689 array!18689 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308121 (= res!252775 (arrayRangesEq!1718 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308122 () Bool)

(assert (=> b!308122 (= e!221907 (and (= i!932 fromSlice!46) (bvsle #b00000000000000000000000000000000 fromSlice!46) (bvsgt toSlice!46 (size!8099 a1!524))))))

(declare-fun b!308123 () Bool)

(declare-fun res!252776 () Bool)

(assert (=> b!308123 (=> (not res!252776) (not e!221907))))

(assert (=> b!308123 (= res!252776 (arrayRangesEq!1718 a1!524 a2!524 from!650 to!617))))

(declare-fun e!221909 () Bool)

(declare-fun b!308124 () Bool)

(assert (=> b!308124 (= e!221909 (arrayRangesEq!1718 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308125 () Bool)

(declare-fun res!252774 () Bool)

(assert (=> b!308125 (=> (not res!252774) (not e!221907))))

(assert (=> b!308125 (= res!252774 e!221909)))

(declare-fun res!252771 () Bool)

(assert (=> b!308125 (=> res!252771 e!221909)))

(assert (=> b!308125 (= res!252771 (bvsgt i!932 toSlice!46))))

(declare-fun mapNonEmpty!2640 () Bool)

(declare-fun tp!2640 () Bool)

(assert (=> mapNonEmpty!2640 (= mapRes!2639 (and tp!2640 tp_is_empty!825))))

(declare-fun mapValue!2639 () T!57771)

(declare-fun mapRest!2640 () (Array (_ BitVec 32) T!57771))

(declare-fun mapKey!2640 () (_ BitVec 32))

(assert (=> mapNonEmpty!2640 (= (arr!9182 a1!524) (store mapRest!2640 mapKey!2640 mapValue!2639))))

(declare-fun b!308126 () Bool)

(assert (=> b!308126 (= e!221908 (and tp_is_empty!825 mapRes!2640))))

(declare-fun condMapEmpty!2639 () Bool)

(declare-fun mapDefault!2639 () T!57771)

(assert (=> b!308126 (= condMapEmpty!2639 (= (arr!9182 a2!524) ((as const (Array (_ BitVec 32) T!57771)) mapDefault!2639)))))

(assert (= (and start!68544 res!252772) b!308123))

(assert (= (and b!308123 res!252776) b!308119))

(assert (= (and b!308119 res!252773) b!308121))

(assert (= (and b!308121 res!252775) b!308125))

(assert (= (and b!308125 (not res!252771)) b!308124))

(assert (= (and b!308125 res!252774) b!308122))

(assert (= (and b!308126 condMapEmpty!2639) mapIsEmpty!2639))

(assert (= (and b!308126 (not condMapEmpty!2639)) mapNonEmpty!2639))

(assert (= start!68544 b!308126))

(assert (= (and b!308120 condMapEmpty!2640) mapIsEmpty!2640))

(assert (= (and b!308120 (not condMapEmpty!2640)) mapNonEmpty!2640))

(assert (= start!68544 b!308120))

(declare-fun m!446513 () Bool)

(assert (=> b!308123 m!446513))

(declare-fun m!446515 () Bool)

(assert (=> b!308124 m!446515))

(declare-fun m!446517 () Bool)

(assert (=> mapNonEmpty!2640 m!446517))

(declare-fun m!446519 () Bool)

(assert (=> start!68544 m!446519))

(declare-fun m!446521 () Bool)

(assert (=> start!68544 m!446521))

(declare-fun m!446523 () Bool)

(assert (=> b!308121 m!446523))

(declare-fun m!446525 () Bool)

(assert (=> mapNonEmpty!2639 m!446525))

(check-sat (not b!308124) (not start!68544) (not mapNonEmpty!2639) (not b!308121) tp_is_empty!825 (not mapNonEmpty!2640) (not b!308123))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68532 () Bool)

(assert start!68532)

(declare-fun b!307983 () Bool)

(declare-fun res!252674 () Bool)

(declare-fun e!221839 () Bool)

(assert (=> b!307983 (=> (not res!252674) (not e!221839))))

(declare-datatypes ((T!57719 0))(
  ( (T!57720 (val!406 Int)) )
))
(declare-datatypes ((array!18677 0))(
  ( (array!18678 (arr!9176 (Array (_ BitVec 32) T!57719)) (size!8093 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18677)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18677)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEq!1714 (array!18677 array!18677 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307983 (= res!252674 (arrayRangesEq!1714 a1!524 a2!524 from!650 to!617))))

(declare-fun b!307984 () Bool)

(declare-fun res!252671 () Bool)

(assert (=> b!307984 (=> (not res!252671) (not e!221839))))

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!307984 (= res!252671 (arrayRangesEq!1714 a1!524 a2!524 i!932 to!617))))

(declare-fun b!307985 () Bool)

(declare-fun e!221841 () Bool)

(declare-fun tp_is_empty!813 () Bool)

(declare-fun mapRes!2603 () Bool)

(assert (=> b!307985 (= e!221841 (and tp_is_empty!813 mapRes!2603))))

(declare-fun condMapEmpty!2604 () Bool)

(declare-fun mapDefault!2603 () T!57719)

(assert (=> b!307985 (= condMapEmpty!2604 (= (arr!9176 a1!524) ((as const (Array (_ BitVec 32) T!57719)) mapDefault!2603)))))

(declare-fun mapIsEmpty!2603 () Bool)

(declare-fun mapRes!2604 () Bool)

(assert (=> mapIsEmpty!2603 mapRes!2604))

(declare-fun mapNonEmpty!2603 () Bool)

(declare-fun tp!2604 () Bool)

(assert (=> mapNonEmpty!2603 (= mapRes!2603 (and tp!2604 tp_is_empty!813))))

(declare-fun mapKey!2604 () (_ BitVec 32))

(declare-fun mapRest!2603 () (Array (_ BitVec 32) T!57719))

(declare-fun mapValue!2604 () T!57719)

(assert (=> mapNonEmpty!2603 (= (arr!9176 a1!524) (store mapRest!2603 mapKey!2604 mapValue!2604))))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun b!307986 () Bool)

(assert (=> b!307986 (= e!221839 (and (bvsle i!932 toSlice!46) (bvsle #b00000000000000000000000000000000 i!932) (bvsgt toSlice!46 (size!8093 a1!524))))))

(declare-fun mapIsEmpty!2604 () Bool)

(assert (=> mapIsEmpty!2604 mapRes!2603))

(declare-fun mapNonEmpty!2604 () Bool)

(declare-fun tp!2603 () Bool)

(assert (=> mapNonEmpty!2604 (= mapRes!2604 (and tp!2603 tp_is_empty!813))))

(declare-fun mapKey!2603 () (_ BitVec 32))

(declare-fun mapRest!2604 () (Array (_ BitVec 32) T!57719))

(declare-fun mapValue!2603 () T!57719)

(assert (=> mapNonEmpty!2604 (= (arr!9176 a2!524) (store mapRest!2604 mapKey!2603 mapValue!2603))))

(declare-fun b!307987 () Bool)

(declare-fun res!252672 () Bool)

(assert (=> b!307987 (=> (not res!252672) (not e!221839))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!307987 (= res!252672 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!307988 () Bool)

(declare-fun e!221840 () Bool)

(assert (=> b!307988 (= e!221840 (and tp_is_empty!813 mapRes!2604))))

(declare-fun condMapEmpty!2603 () Bool)

(declare-fun mapDefault!2604 () T!57719)

(assert (=> b!307988 (= condMapEmpty!2603 (= (arr!9176 a2!524) ((as const (Array (_ BitVec 32) T!57719)) mapDefault!2604)))))

(declare-fun res!252673 () Bool)

(assert (=> start!68532 (=> (not res!252673) (not e!221839))))

(assert (=> start!68532 (= res!252673 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8093 a1!524) (size!8093 a2!524)) (bvsle to!617 (size!8093 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68532 e!221839))

(assert (=> start!68532 true))

(declare-fun array_inv!7694 (array!18677) Bool)

(assert (=> start!68532 (and (array_inv!7694 a2!524) e!221840)))

(assert (=> start!68532 (and (array_inv!7694 a1!524) e!221841)))

(assert (= (and start!68532 res!252673) b!307983))

(assert (= (and b!307983 res!252674) b!307987))

(assert (= (and b!307987 res!252672) b!307984))

(assert (= (and b!307984 res!252671) b!307986))

(assert (= (and b!307988 condMapEmpty!2603) mapIsEmpty!2603))

(assert (= (and b!307988 (not condMapEmpty!2603)) mapNonEmpty!2604))

(assert (= start!68532 b!307988))

(assert (= (and b!307985 condMapEmpty!2604) mapIsEmpty!2604))

(assert (= (and b!307985 (not condMapEmpty!2604)) mapNonEmpty!2603))

(assert (= start!68532 b!307985))

(declare-fun m!446433 () Bool)

(assert (=> b!307983 m!446433))

(declare-fun m!446435 () Bool)

(assert (=> mapNonEmpty!2604 m!446435))

(declare-fun m!446437 () Bool)

(assert (=> b!307984 m!446437))

(declare-fun m!446439 () Bool)

(assert (=> start!68532 m!446439))

(declare-fun m!446441 () Bool)

(assert (=> start!68532 m!446441))

(declare-fun m!446443 () Bool)

(assert (=> mapNonEmpty!2603 m!446443))

(check-sat tp_is_empty!813 (not b!307984) (not mapNonEmpty!2603) (not start!68532) (not mapNonEmpty!2604) (not b!307983))
(check-sat)

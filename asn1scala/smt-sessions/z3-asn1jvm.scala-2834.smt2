; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68520 () Bool)

(assert start!68520)

(declare-fun res!252607 () Bool)

(declare-fun e!221787 () Bool)

(assert (=> start!68520 (=> (not res!252607) (not e!221787))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!57667 0))(
  ( (T!57668 (val!400 Int)) )
))
(declare-datatypes ((array!18665 0))(
  ( (array!18666 (arr!9170 (Array (_ BitVec 32) T!57667)) (size!8087 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18665)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18665)

(assert (=> start!68520 (= res!252607 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8087 a1!524) (size!8087 a2!524)) (bvsle to!617 (size!8087 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68520 e!221787))

(assert (=> start!68520 true))

(declare-fun e!221785 () Bool)

(declare-fun array_inv!7690 (array!18665) Bool)

(assert (=> start!68520 (and (array_inv!7690 a2!524) e!221785)))

(declare-fun e!221786 () Bool)

(assert (=> start!68520 (and (array_inv!7690 a1!524) e!221786)))

(declare-fun mapIsEmpty!2567 () Bool)

(declare-fun mapRes!2567 () Bool)

(assert (=> mapIsEmpty!2567 mapRes!2567))

(declare-fun b!307883 () Bool)

(declare-fun tp_is_empty!801 () Bool)

(assert (=> b!307883 (= e!221785 (and tp_is_empty!801 mapRes!2567))))

(declare-fun condMapEmpty!2567 () Bool)

(declare-fun mapDefault!2567 () T!57667)

(assert (=> b!307883 (= condMapEmpty!2567 (= (arr!9170 a2!524) ((as const (Array (_ BitVec 32) T!57667)) mapDefault!2567)))))

(declare-fun b!307884 () Bool)

(declare-fun res!252608 () Bool)

(assert (=> b!307884 (=> (not res!252608) (not e!221787))))

(declare-fun arrayRangesEq!1709 (array!18665 array!18665 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307884 (= res!252608 (arrayRangesEq!1709 a1!524 a2!524 from!650 to!617))))

(declare-fun mapNonEmpty!2567 () Bool)

(declare-fun tp!2567 () Bool)

(assert (=> mapNonEmpty!2567 (= mapRes!2567 (and tp!2567 tp_is_empty!801))))

(declare-fun mapValue!2567 () T!57667)

(declare-fun mapRest!2567 () (Array (_ BitVec 32) T!57667))

(declare-fun mapKey!2567 () (_ BitVec 32))

(assert (=> mapNonEmpty!2567 (= (arr!9170 a2!524) (store mapRest!2567 mapKey!2567 mapValue!2567))))

(declare-fun mapIsEmpty!2568 () Bool)

(declare-fun mapRes!2568 () Bool)

(assert (=> mapIsEmpty!2568 mapRes!2568))

(declare-fun mapNonEmpty!2568 () Bool)

(declare-fun tp!2568 () Bool)

(assert (=> mapNonEmpty!2568 (= mapRes!2568 (and tp!2568 tp_is_empty!801))))

(declare-fun mapRest!2568 () (Array (_ BitVec 32) T!57667))

(declare-fun mapValue!2568 () T!57667)

(declare-fun mapKey!2568 () (_ BitVec 32))

(assert (=> mapNonEmpty!2568 (= (arr!9170 a1!524) (store mapRest!2568 mapKey!2568 mapValue!2568))))

(declare-fun b!307885 () Bool)

(assert (=> b!307885 (= e!221786 (and tp_is_empty!801 mapRes!2568))))

(declare-fun condMapEmpty!2568 () Bool)

(declare-fun mapDefault!2568 () T!57667)

(assert (=> b!307885 (= condMapEmpty!2568 (= (arr!9170 a1!524) ((as const (Array (_ BitVec 32) T!57667)) mapDefault!2568)))))

(declare-fun b!307886 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!307886 (= e!221787 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617) (bvsgt #b00000000000000000000000000000000 i!932)))))

(assert (= (and start!68520 res!252607) b!307884))

(assert (= (and b!307884 res!252608) b!307886))

(assert (= (and b!307883 condMapEmpty!2567) mapIsEmpty!2567))

(assert (= (and b!307883 (not condMapEmpty!2567)) mapNonEmpty!2567))

(assert (= start!68520 b!307883))

(assert (= (and b!307885 condMapEmpty!2568) mapIsEmpty!2568))

(assert (= (and b!307885 (not condMapEmpty!2568)) mapNonEmpty!2568))

(assert (= start!68520 b!307885))

(declare-fun m!446365 () Bool)

(assert (=> start!68520 m!446365))

(declare-fun m!446367 () Bool)

(assert (=> start!68520 m!446367))

(declare-fun m!446369 () Bool)

(assert (=> b!307884 m!446369))

(declare-fun m!446371 () Bool)

(assert (=> mapNonEmpty!2567 m!446371))

(declare-fun m!446373 () Bool)

(assert (=> mapNonEmpty!2568 m!446373))

(check-sat (not b!307884) (not mapNonEmpty!2567) (not mapNonEmpty!2568) (not start!68520) tp_is_empty!801)
(check-sat)

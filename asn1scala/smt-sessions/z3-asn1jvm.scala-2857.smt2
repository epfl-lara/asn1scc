; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68670 () Bool)

(assert start!68670)

(declare-fun mapIsEmpty!2989 () Bool)

(declare-fun mapRes!2989 () Bool)

(assert (=> mapIsEmpty!2989 mapRes!2989))

(declare-fun b!309758 () Bool)

(declare-fun res!254064 () Bool)

(declare-fun e!222704 () Bool)

(assert (=> b!309758 (=> (not res!254064) (not e!222704))))

(declare-datatypes ((T!58265 0))(
  ( (T!58266 (val!469 Int)) )
))
(declare-datatypes ((array!18805 0))(
  ( (array!18806 (arr!9239 (Array (_ BitVec 32) T!58265)) (size!8156 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18805)

(declare-fun a1!555 () array!18805)

(declare-fun from!681 () (_ BitVec 32))

(declare-fun to!648 () (_ BitVec 32))

(declare-fun arrayRangesEq!1763 (array!18805 array!18805 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309758 (= res!254064 (arrayRangesEq!1763 a1!555 a2!555 from!681 to!648))))

(declare-fun mapNonEmpty!2989 () Bool)

(declare-fun tp!2990 () Bool)

(declare-fun tp_is_empty!939 () Bool)

(assert (=> mapNonEmpty!2989 (= mapRes!2989 (and tp!2990 tp_is_empty!939))))

(declare-fun mapRest!2990 () (Array (_ BitVec 32) T!58265))

(declare-fun mapValue!2989 () T!58265)

(declare-fun mapKey!2989 () (_ BitVec 32))

(assert (=> mapNonEmpty!2989 (= (arr!9239 a2!555) (store mapRest!2990 mapKey!2989 mapValue!2989))))

(declare-fun b!309759 () Bool)

(declare-fun e!222703 () Bool)

(declare-fun mapRes!2990 () Bool)

(assert (=> b!309759 (= e!222703 (and tp_is_empty!939 mapRes!2990))))

(declare-fun condMapEmpty!2990 () Bool)

(declare-fun mapDefault!2990 () T!58265)

(assert (=> b!309759 (= condMapEmpty!2990 (= (arr!9239 a1!555) ((as const (Array (_ BitVec 32) T!58265)) mapDefault!2990)))))

(declare-fun mapIsEmpty!2990 () Bool)

(assert (=> mapIsEmpty!2990 mapRes!2990))

(declare-fun mapNonEmpty!2990 () Bool)

(declare-fun tp!2989 () Bool)

(assert (=> mapNonEmpty!2990 (= mapRes!2990 (and tp!2989 tp_is_empty!939))))

(declare-fun mapRest!2989 () (Array (_ BitVec 32) T!58265))

(declare-fun mapKey!2990 () (_ BitVec 32))

(declare-fun mapValue!2990 () T!58265)

(assert (=> mapNonEmpty!2990 (= (arr!9239 a1!555) (store mapRest!2989 mapKey!2990 mapValue!2990))))

(declare-fun res!254065 () Bool)

(assert (=> start!68670 (=> (not res!254065) (not e!222704))))

(declare-fun at!230 () (_ BitVec 32))

(assert (=> start!68670 (= res!254065 (and (bvsle #b00000000000000000000000000000000 from!681) (bvsle from!681 to!648) (bvsle (size!8156 a1!555) (size!8156 a2!555)) (bvsle to!648 (size!8156 a1!555)) (bvsle from!681 at!230) (bvslt at!230 to!648)))))

(assert (=> start!68670 e!222704))

(declare-fun e!222702 () Bool)

(declare-fun array_inv!7728 (array!18805) Bool)

(assert (=> start!68670 (and (array_inv!7728 a2!555) e!222702)))

(assert (=> start!68670 (and (array_inv!7728 a1!555) e!222703)))

(assert (=> start!68670 true))

(declare-fun b!309760 () Bool)

(assert (=> b!309760 (= e!222704 (not true))))

(assert (=> b!309760 (= (select (arr!9239 a1!555) at!230) (select (arr!9239 a2!555) at!230))))

(declare-datatypes ((Unit!21495 0))(
  ( (Unit!21496) )
))
(declare-fun lt!440442 () Unit!21495)

(declare-fun rec!105 (array!18805 array!18805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21495)

(assert (=> b!309760 (= lt!440442 (rec!105 a1!555 a2!555 at!230 from!681 to!648 from!681))))

(declare-fun b!309761 () Bool)

(assert (=> b!309761 (= e!222702 (and tp_is_empty!939 mapRes!2989))))

(declare-fun condMapEmpty!2989 () Bool)

(declare-fun mapDefault!2989 () T!58265)

(assert (=> b!309761 (= condMapEmpty!2989 (= (arr!9239 a2!555) ((as const (Array (_ BitVec 32) T!58265)) mapDefault!2989)))))

(assert (= (and start!68670 res!254065) b!309758))

(assert (= (and b!309758 res!254064) b!309760))

(assert (= (and b!309761 condMapEmpty!2989) mapIsEmpty!2989))

(assert (= (and b!309761 (not condMapEmpty!2989)) mapNonEmpty!2989))

(assert (= start!68670 b!309761))

(assert (= (and b!309759 condMapEmpty!2990) mapIsEmpty!2990))

(assert (= (and b!309759 (not condMapEmpty!2990)) mapNonEmpty!2990))

(assert (= start!68670 b!309759))

(declare-fun m!447719 () Bool)

(assert (=> mapNonEmpty!2990 m!447719))

(declare-fun m!447721 () Bool)

(assert (=> start!68670 m!447721))

(declare-fun m!447723 () Bool)

(assert (=> start!68670 m!447723))

(declare-fun m!447725 () Bool)

(assert (=> mapNonEmpty!2989 m!447725))

(declare-fun m!447727 () Bool)

(assert (=> b!309760 m!447727))

(declare-fun m!447729 () Bool)

(assert (=> b!309760 m!447729))

(declare-fun m!447731 () Bool)

(assert (=> b!309760 m!447731))

(declare-fun m!447733 () Bool)

(assert (=> b!309758 m!447733))

(check-sat (not b!309758) (not mapNonEmpty!2989) (not b!309760) (not start!68670) (not mapNonEmpty!2990) tp_is_empty!939)
(check-sat)

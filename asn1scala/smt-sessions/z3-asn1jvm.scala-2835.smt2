; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68526 () Bool)

(assert start!68526)

(declare-fun b!307929 () Bool)

(declare-fun e!221813 () Bool)

(declare-fun tp_is_empty!807 () Bool)

(declare-fun mapRes!2586 () Bool)

(assert (=> b!307929 (= e!221813 (and tp_is_empty!807 mapRes!2586))))

(declare-fun condMapEmpty!2585 () Bool)

(declare-datatypes ((T!57693 0))(
  ( (T!57694 (val!403 Int)) )
))
(declare-datatypes ((array!18671 0))(
  ( (array!18672 (arr!9173 (Array (_ BitVec 32) T!57693)) (size!8090 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18671)

(declare-fun mapDefault!2586 () T!57693)

(assert (=> b!307929 (= condMapEmpty!2585 (= (arr!9173 a2!524) ((as const (Array (_ BitVec 32) T!57693)) mapDefault!2586)))))

(declare-fun b!307930 () Bool)

(declare-fun res!252638 () Bool)

(declare-fun e!221812 () Bool)

(assert (=> b!307930 (=> (not res!252638) (not e!221812))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18671)

(declare-fun arrayRangesEq!1711 (array!18671 array!18671 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307930 (= res!252638 (arrayRangesEq!1711 a1!524 a2!524 from!650 to!617))))

(declare-fun mapIsEmpty!2585 () Bool)

(assert (=> mapIsEmpty!2585 mapRes!2586))

(declare-fun res!252637 () Bool)

(assert (=> start!68526 (=> (not res!252637) (not e!221812))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> start!68526 (= res!252637 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8090 a1!524) (size!8090 a2!524)) (bvsle to!617 (size!8090 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68526 e!221812))

(assert (=> start!68526 true))

(declare-fun array_inv!7692 (array!18671) Bool)

(assert (=> start!68526 (and (array_inv!7692 a2!524) e!221813)))

(declare-fun e!221814 () Bool)

(assert (=> start!68526 (and (array_inv!7692 a1!524) e!221814)))

(declare-fun b!307931 () Bool)

(declare-fun mapRes!2585 () Bool)

(assert (=> b!307931 (= e!221814 (and tp_is_empty!807 mapRes!2585))))

(declare-fun condMapEmpty!2586 () Bool)

(declare-fun mapDefault!2585 () T!57693)

(assert (=> b!307931 (= condMapEmpty!2586 (= (arr!9173 a1!524) ((as const (Array (_ BitVec 32) T!57693)) mapDefault!2585)))))

(declare-fun mapNonEmpty!2585 () Bool)

(declare-fun tp!2586 () Bool)

(assert (=> mapNonEmpty!2585 (= mapRes!2586 (and tp!2586 tp_is_empty!807))))

(declare-fun mapKey!2585 () (_ BitVec 32))

(declare-fun mapRest!2585 () (Array (_ BitVec 32) T!57693))

(declare-fun mapValue!2586 () T!57693)

(assert (=> mapNonEmpty!2585 (= (arr!9173 a2!524) (store mapRest!2585 mapKey!2585 mapValue!2586))))

(declare-fun mapNonEmpty!2586 () Bool)

(declare-fun tp!2585 () Bool)

(assert (=> mapNonEmpty!2586 (= mapRes!2585 (and tp!2585 tp_is_empty!807))))

(declare-fun mapKey!2586 () (_ BitVec 32))

(declare-fun mapRest!2586 () (Array (_ BitVec 32) T!57693))

(declare-fun mapValue!2585 () T!57693)

(assert (=> mapNonEmpty!2586 (= (arr!9173 a1!524) (store mapRest!2586 mapKey!2586 mapValue!2585))))

(declare-fun mapIsEmpty!2586 () Bool)

(assert (=> mapIsEmpty!2586 mapRes!2585))

(declare-fun b!307932 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!307932 (= e!221812 (and (bvsle i!932 toSlice!46) (bvsgt #b00000000000000000000000000000000 i!932)))))

(declare-fun b!307933 () Bool)

(declare-fun res!252635 () Bool)

(assert (=> b!307933 (=> (not res!252635) (not e!221812))))

(assert (=> b!307933 (= res!252635 (arrayRangesEq!1711 a1!524 a2!524 i!932 to!617))))

(declare-fun b!307934 () Bool)

(declare-fun res!252636 () Bool)

(assert (=> b!307934 (=> (not res!252636) (not e!221812))))

(assert (=> b!307934 (= res!252636 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(assert (= (and start!68526 res!252637) b!307930))

(assert (= (and b!307930 res!252638) b!307934))

(assert (= (and b!307934 res!252636) b!307933))

(assert (= (and b!307933 res!252635) b!307932))

(assert (= (and b!307929 condMapEmpty!2585) mapIsEmpty!2585))

(assert (= (and b!307929 (not condMapEmpty!2585)) mapNonEmpty!2585))

(assert (= start!68526 b!307929))

(assert (= (and b!307931 condMapEmpty!2586) mapIsEmpty!2586))

(assert (= (and b!307931 (not condMapEmpty!2586)) mapNonEmpty!2586))

(assert (= start!68526 b!307931))

(declare-fun m!446397 () Bool)

(assert (=> b!307930 m!446397))

(declare-fun m!446399 () Bool)

(assert (=> mapNonEmpty!2585 m!446399))

(declare-fun m!446401 () Bool)

(assert (=> b!307933 m!446401))

(declare-fun m!446403 () Bool)

(assert (=> start!68526 m!446403))

(declare-fun m!446405 () Bool)

(assert (=> start!68526 m!446405))

(declare-fun m!446407 () Bool)

(assert (=> mapNonEmpty!2586 m!446407))

(check-sat (not mapNonEmpty!2585) (not b!307933) (not mapNonEmpty!2586) (not start!68526) (not b!307930) tp_is_empty!807)
(check-sat)

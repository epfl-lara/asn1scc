; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64332 () Bool)

(assert start!64332)

(declare-fun b!288754 () Bool)

(declare-fun res!238631 () Bool)

(declare-fun e!205281 () Bool)

(assert (=> b!288754 (=> (not res!238631) (not e!205281))))

(declare-datatypes ((T!52713 0))(
  ( (T!52714 (val!373 Int)) )
))
(declare-datatypes ((array!17030 0))(
  ( (array!17031 (arr!8360 (Array (_ BitVec 32) T!52713)) (size!7364 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17030)

(declare-fun a2!596 () array!17030)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1469 (array!17030 array!17030 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288754 (= res!238631 (arrayRangesEq!1469 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288755 () Bool)

(declare-fun res!238630 () Bool)

(assert (=> b!288755 (=> (not res!238630) (not e!205281))))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288755 (= res!238630 (arrayRangesEq!1469 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288756 () Bool)

(declare-fun res!238632 () Bool)

(assert (=> b!288756 (=> (not res!238632) (not e!205281))))

(assert (=> b!288756 (= res!238632 (and (= (select (arr!8360 a1!596) to!689) (select (arr!8360 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2401 () Bool)

(declare-fun mapRes!2402 () Bool)

(declare-fun tp!2401 () Bool)

(declare-fun tp_is_empty!747 () Bool)

(assert (=> mapNonEmpty!2401 (= mapRes!2402 (and tp!2401 tp_is_empty!747))))

(declare-fun mapValue!2401 () T!52713)

(declare-fun mapKey!2402 () (_ BitVec 32))

(declare-fun mapRest!2401 () (Array (_ BitVec 32) T!52713))

(assert (=> mapNonEmpty!2401 (= (arr!8360 a1!596) (store mapRest!2401 mapKey!2402 mapValue!2401))))

(declare-fun b!288757 () Bool)

(declare-fun e!205280 () Bool)

(assert (=> b!288757 (= e!205280 (or (not (= (bvand to!689 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand to!689 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!689) #b10000000000000000000000000000000))))))

(assert (=> b!288757 (arrayRangesEq!1469 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-datatypes ((Unit!20013 0))(
  ( (Unit!20014) )
))
(declare-fun lt!418877 () Unit!20013)

(declare-fun rec!86 (array!17030 array!17030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20013)

(assert (=> b!288757 (= lt!418877 (rec!86 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!2401 () Bool)

(assert (=> mapIsEmpty!2401 mapRes!2402))

(declare-fun res!238633 () Bool)

(assert (=> start!64332 (=> (not res!238633) (not e!205281))))

(assert (=> start!64332 (= res!238633 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7364 a1!596) (size!7364 a2!596)) (bvslt to!689 (size!7364 a1!596))))))

(assert (=> start!64332 e!205281))

(declare-fun e!205278 () Bool)

(declare-fun array_inv!6978 (array!17030) Bool)

(assert (=> start!64332 (and (array_inv!6978 a1!596) e!205278)))

(declare-fun e!205279 () Bool)

(assert (=> start!64332 (and (array_inv!6978 a2!596) e!205279)))

(assert (=> start!64332 true))

(declare-fun b!288758 () Bool)

(assert (=> b!288758 (= e!205278 (and tp_is_empty!747 mapRes!2402))))

(declare-fun condMapEmpty!2402 () Bool)

(declare-fun mapDefault!2402 () T!52713)

(assert (=> b!288758 (= condMapEmpty!2402 (= (arr!8360 a1!596) ((as const (Array (_ BitVec 32) T!52713)) mapDefault!2402)))))

(declare-fun b!288759 () Bool)

(declare-fun res!238628 () Bool)

(assert (=> b!288759 (=> (not res!238628) (not e!205281))))

(assert (=> b!288759 (= res!238628 (not (= i!953 from!722)))))

(declare-fun b!288760 () Bool)

(declare-fun mapRes!2401 () Bool)

(assert (=> b!288760 (= e!205279 (and tp_is_empty!747 mapRes!2401))))

(declare-fun condMapEmpty!2401 () Bool)

(declare-fun mapDefault!2401 () T!52713)

(assert (=> b!288760 (= condMapEmpty!2401 (= (arr!8360 a2!596) ((as const (Array (_ BitVec 32) T!52713)) mapDefault!2401)))))

(declare-fun mapIsEmpty!2402 () Bool)

(assert (=> mapIsEmpty!2402 mapRes!2401))

(declare-fun b!288761 () Bool)

(assert (=> b!288761 (= e!205281 (not e!205280))))

(declare-fun res!238629 () Bool)

(assert (=> b!288761 (=> res!238629 e!205280)))

(assert (=> b!288761 (= res!238629 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!288761 (= (select (arr!8360 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8360 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun lt!418878 () Unit!20013)

(declare-fun arrayRangesEqImpliesEq!212 (array!17030 array!17030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20013)

(assert (=> b!288761 (= lt!418878 (arrayRangesEqImpliesEq!212 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun b!288762 () Bool)

(declare-fun res!238634 () Bool)

(assert (=> b!288762 (=> res!238634 e!205280)))

(assert (=> b!288762 (= res!238634 (not (arrayRangesEq!1469 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun mapNonEmpty!2402 () Bool)

(declare-fun tp!2402 () Bool)

(assert (=> mapNonEmpty!2402 (= mapRes!2401 (and tp!2402 tp_is_empty!747))))

(declare-fun mapRest!2402 () (Array (_ BitVec 32) T!52713))

(declare-fun mapKey!2401 () (_ BitVec 32))

(declare-fun mapValue!2402 () T!52713)

(assert (=> mapNonEmpty!2402 (= (arr!8360 a2!596) (store mapRest!2402 mapKey!2401 mapValue!2402))))

(assert (= (and start!64332 res!238633) b!288755))

(assert (= (and b!288755 res!238630) b!288756))

(assert (= (and b!288756 res!238632) b!288754))

(assert (= (and b!288754 res!238631) b!288759))

(assert (= (and b!288759 res!238628) b!288761))

(assert (= (and b!288761 (not res!238629)) b!288762))

(assert (= (and b!288762 (not res!238634)) b!288757))

(assert (= (and b!288758 condMapEmpty!2402) mapIsEmpty!2401))

(assert (= (and b!288758 (not condMapEmpty!2402)) mapNonEmpty!2401))

(assert (= start!64332 b!288758))

(assert (= (and b!288760 condMapEmpty!2401) mapIsEmpty!2402))

(assert (= (and b!288760 (not condMapEmpty!2401)) mapNonEmpty!2402))

(assert (= start!64332 b!288760))

(declare-fun m!421435 () Bool)

(assert (=> b!288754 m!421435))

(declare-fun m!421437 () Bool)

(assert (=> b!288757 m!421437))

(declare-fun m!421439 () Bool)

(assert (=> b!288757 m!421439))

(declare-fun m!421441 () Bool)

(assert (=> start!64332 m!421441))

(declare-fun m!421443 () Bool)

(assert (=> start!64332 m!421443))

(declare-fun m!421445 () Bool)

(assert (=> mapNonEmpty!2401 m!421445))

(declare-fun m!421447 () Bool)

(assert (=> b!288755 m!421447))

(declare-fun m!421449 () Bool)

(assert (=> b!288756 m!421449))

(declare-fun m!421451 () Bool)

(assert (=> b!288756 m!421451))

(declare-fun m!421453 () Bool)

(assert (=> b!288761 m!421453))

(declare-fun m!421455 () Bool)

(assert (=> b!288761 m!421455))

(declare-fun m!421457 () Bool)

(assert (=> b!288761 m!421457))

(declare-fun m!421459 () Bool)

(assert (=> mapNonEmpty!2402 m!421459))

(declare-fun m!421461 () Bool)

(assert (=> b!288762 m!421461))

(check-sat (not b!288755) (not mapNonEmpty!2401) (not b!288757) (not b!288761) (not start!64332) (not b!288762) tp_is_empty!747 (not mapNonEmpty!2402) (not b!288754))
(check-sat)

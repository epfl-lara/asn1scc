; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63132 () Bool)

(assert start!63132)

(declare-fun mapIsEmpty!730 () Bool)

(declare-fun mapRes!730 () Bool)

(assert (=> mapIsEmpty!730 mapRes!730))

(declare-fun b!282569 () Bool)

(declare-fun res!234372 () Bool)

(declare-fun e!201900 () Bool)

(assert (=> b!282569 (=> (not res!234372) (not e!201900))))

(declare-fun to!556 () (_ BitVec 32))

(declare-fun from!589 () (_ BitVec 32))

(declare-datatypes ((T!50103 0))(
  ( (T!50104 (val!148 Int)) )
))
(declare-datatypes ((array!16330 0))(
  ( (array!16331 (arr!8045 (Array (_ BitVec 32) T!50103)) (size!7049 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16330)

(declare-fun a2!463 () array!16330)

(declare-fun arrayRangesEq!1312 (array!16330 array!16330 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282569 (= res!234372 (arrayRangesEq!1312 a1!463 a2!463 from!589 to!556))))

(declare-fun res!234373 () Bool)

(assert (=> start!63132 (=> (not res!234373) (not e!201900))))

(assert (=> start!63132 (= res!234373 (and (bvsle #b00000000000000000000000000000000 from!589) (bvsle from!589 to!556) (bvsle to!556 (size!7049 a1!463)) (= (size!7049 a1!463) (size!7049 a2!463))))))

(assert (=> start!63132 e!201900))

(assert (=> start!63132 true))

(declare-fun e!201901 () Bool)

(declare-fun array_inv!6766 (array!16330) Bool)

(assert (=> start!63132 (and (array_inv!6766 a1!463) e!201901)))

(declare-fun e!201902 () Bool)

(assert (=> start!63132 (and (array_inv!6766 a2!463) e!201902)))

(declare-fun b!282570 () Bool)

(declare-fun tp_is_empty!297 () Bool)

(declare-fun mapRes!731 () Bool)

(assert (=> b!282570 (= e!201901 (and tp_is_empty!297 mapRes!731))))

(declare-fun condMapEmpty!730 () Bool)

(declare-fun mapDefault!730 () T!50103)

(assert (=> b!282570 (= condMapEmpty!730 (= (arr!8045 a1!463) ((as const (Array (_ BitVec 32) T!50103)) mapDefault!730)))))

(declare-fun mapNonEmpty!730 () Bool)

(declare-fun tp!730 () Bool)

(assert (=> mapNonEmpty!730 (= mapRes!731 (and tp!730 tp_is_empty!297))))

(declare-fun mapValue!731 () T!50103)

(declare-fun mapKey!731 () (_ BitVec 32))

(declare-fun mapRest!730 () (Array (_ BitVec 32) T!50103))

(assert (=> mapNonEmpty!730 (= (arr!8045 a1!463) (store mapRest!730 mapKey!731 mapValue!731))))

(declare-fun mapIsEmpty!731 () Bool)

(assert (=> mapIsEmpty!731 mapRes!731))

(declare-fun b!282571 () Bool)

(assert (=> b!282571 (= e!201902 (and tp_is_empty!297 mapRes!730))))

(declare-fun condMapEmpty!731 () Bool)

(declare-fun mapDefault!731 () T!50103)

(assert (=> b!282571 (= condMapEmpty!731 (= (arr!8045 a2!463) ((as const (Array (_ BitVec 32) T!50103)) mapDefault!731)))))

(declare-fun b!282572 () Bool)

(assert (=> b!282572 (= e!201900 (and (bvsle (size!7049 a2!463) (size!7049 a1!463)) (bvsgt to!556 (size!7049 a2!463))))))

(declare-datatypes ((Unit!19815 0))(
  ( (Unit!19816) )
))
(declare-fun lt!417798 () Unit!19815)

(declare-fun rec!50 (array!16330 array!16330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19815)

(assert (=> b!282572 (= lt!417798 (rec!50 a1!463 a2!463 from!589 to!556 to!556))))

(declare-fun mapNonEmpty!731 () Bool)

(declare-fun tp!731 () Bool)

(assert (=> mapNonEmpty!731 (= mapRes!730 (and tp!731 tp_is_empty!297))))

(declare-fun mapRest!731 () (Array (_ BitVec 32) T!50103))

(declare-fun mapValue!730 () T!50103)

(declare-fun mapKey!730 () (_ BitVec 32))

(assert (=> mapNonEmpty!731 (= (arr!8045 a2!463) (store mapRest!731 mapKey!730 mapValue!730))))

(assert (= (and start!63132 res!234373) b!282569))

(assert (= (and b!282569 res!234372) b!282572))

(assert (= (and b!282570 condMapEmpty!730) mapIsEmpty!731))

(assert (= (and b!282570 (not condMapEmpty!730)) mapNonEmpty!730))

(assert (= start!63132 b!282570))

(assert (= (and b!282571 condMapEmpty!731) mapIsEmpty!730))

(assert (= (and b!282571 (not condMapEmpty!731)) mapNonEmpty!731))

(assert (= start!63132 b!282571))

(declare-fun m!415705 () Bool)

(assert (=> b!282569 m!415705))

(declare-fun m!415707 () Bool)

(assert (=> b!282572 m!415707))

(declare-fun m!415709 () Bool)

(assert (=> start!63132 m!415709))

(declare-fun m!415711 () Bool)

(assert (=> start!63132 m!415711))

(declare-fun m!415713 () Bool)

(assert (=> mapNonEmpty!731 m!415713))

(declare-fun m!415715 () Bool)

(assert (=> mapNonEmpty!730 m!415715))

(check-sat (not b!282569) (not mapNonEmpty!730) (not b!282572) (not start!63132) tp_is_empty!297 (not mapNonEmpty!731))
(check-sat)

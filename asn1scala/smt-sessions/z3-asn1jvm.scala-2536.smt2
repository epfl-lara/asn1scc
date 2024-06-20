; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63988 () Bool)

(assert start!63988)

(declare-fun b!284604 () Bool)

(declare-fun e!203437 () Bool)

(declare-fun tp_is_empty!429 () Bool)

(declare-fun mapRes!1193 () Bool)

(assert (=> b!284604 (= e!203437 (and tp_is_empty!429 mapRes!1193))))

(declare-fun condMapEmpty!1193 () Bool)

(declare-datatypes ((T!51335 0))(
  ( (T!51336 (val!214 Int)) )
))
(declare-datatypes ((array!16707 0))(
  ( (array!16708 (arr!8201 (Array (_ BitVec 32) T!51335)) (size!7205 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16707)

(declare-fun mapDefault!1193 () T!51335)

(assert (=> b!284604 (= condMapEmpty!1193 (= (arr!8201 a2!623) ((as const (Array (_ BitVec 32) T!51335)) mapDefault!1193)))))

(declare-fun b!284605 () Bool)

(declare-fun res!235673 () Bool)

(declare-fun e!203434 () Bool)

(assert (=> b!284605 (=> (not res!235673) (not e!203434))))

(declare-fun a1!623 () array!16707)

(declare-fun a3!63 () array!16707)

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1355 (array!16707 array!16707 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284605 (= res!235673 (arrayRangesEq!1355 a1!623 a3!63 from!749 from!749))))

(declare-fun b!284606 () Bool)

(assert (=> b!284606 (= e!203434 (not true))))

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> b!284606 (arrayRangesEq!1355 a1!623 a3!63 from!749 mid!66)))

(declare-datatypes ((Unit!19915 0))(
  ( (Unit!19916) )
))
(declare-fun lt!418539 () Unit!19915)

(declare-fun to!716 () (_ BitVec 32))

(declare-fun rec!62 (array!16707 array!16707 array!16707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19915)

(assert (=> b!284606 (= lt!418539 (rec!62 a1!623 a2!623 a3!63 from!749 mid!66 to!716 from!749))))

(declare-fun b!284607 () Bool)

(declare-fun e!203435 () Bool)

(declare-fun mapRes!1195 () Bool)

(assert (=> b!284607 (= e!203435 (and tp_is_empty!429 mapRes!1195))))

(declare-fun condMapEmpty!1195 () Bool)

(declare-fun mapDefault!1194 () T!51335)

(assert (=> b!284607 (= condMapEmpty!1195 (= (arr!8201 a3!63) ((as const (Array (_ BitVec 32) T!51335)) mapDefault!1194)))))

(declare-fun mapNonEmpty!1193 () Bool)

(declare-fun tp!1195 () Bool)

(assert (=> mapNonEmpty!1193 (= mapRes!1195 (and tp!1195 tp_is_empty!429))))

(declare-fun mapValue!1195 () T!51335)

(declare-fun mapKey!1194 () (_ BitVec 32))

(declare-fun mapRest!1193 () (Array (_ BitVec 32) T!51335))

(assert (=> mapNonEmpty!1193 (= (arr!8201 a3!63) (store mapRest!1193 mapKey!1194 mapValue!1195))))

(declare-fun b!284608 () Bool)

(declare-fun e!203436 () Bool)

(declare-fun mapRes!1194 () Bool)

(assert (=> b!284608 (= e!203436 (and tp_is_empty!429 mapRes!1194))))

(declare-fun condMapEmpty!1194 () Bool)

(declare-fun mapDefault!1195 () T!51335)

(assert (=> b!284608 (= condMapEmpty!1194 (= (arr!8201 a1!623) ((as const (Array (_ BitVec 32) T!51335)) mapDefault!1195)))))

(declare-fun res!235671 () Bool)

(assert (=> start!63988 (=> (not res!235671) (not e!203434))))

(assert (=> start!63988 (= res!235671 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7205 a1!623) (size!7205 a2!623)) (bvsle (size!7205 a2!623) (size!7205 a3!63)) (bvsle mid!66 (size!7205 a1!623)) (bvsle to!716 (size!7205 a2!623))))))

(assert (=> start!63988 e!203434))

(declare-fun array_inv!6890 (array!16707) Bool)

(assert (=> start!63988 (and (array_inv!6890 a2!623) e!203437)))

(assert (=> start!63988 (and (array_inv!6890 a1!623) e!203436)))

(assert (=> start!63988 true))

(assert (=> start!63988 (and (array_inv!6890 a3!63) e!203435)))

(declare-fun mapIsEmpty!1193 () Bool)

(assert (=> mapIsEmpty!1193 mapRes!1195))

(declare-fun mapIsEmpty!1194 () Bool)

(assert (=> mapIsEmpty!1194 mapRes!1193))

(declare-fun b!284609 () Bool)

(declare-fun res!235674 () Bool)

(assert (=> b!284609 (=> (not res!235674) (not e!203434))))

(assert (=> b!284609 (= res!235674 (arrayRangesEq!1355 a2!623 a3!63 from!749 to!716))))

(declare-fun mapNonEmpty!1194 () Bool)

(declare-fun tp!1193 () Bool)

(assert (=> mapNonEmpty!1194 (= mapRes!1193 (and tp!1193 tp_is_empty!429))))

(declare-fun mapValue!1193 () T!51335)

(declare-fun mapRest!1194 () (Array (_ BitVec 32) T!51335))

(declare-fun mapKey!1195 () (_ BitVec 32))

(assert (=> mapNonEmpty!1194 (= (arr!8201 a2!623) (store mapRest!1194 mapKey!1195 mapValue!1193))))

(declare-fun mapIsEmpty!1195 () Bool)

(assert (=> mapIsEmpty!1195 mapRes!1194))

(declare-fun b!284610 () Bool)

(declare-fun res!235672 () Bool)

(assert (=> b!284610 (=> (not res!235672) (not e!203434))))

(assert (=> b!284610 (= res!235672 (arrayRangesEq!1355 a1!623 a2!623 from!749 mid!66))))

(declare-fun mapNonEmpty!1195 () Bool)

(declare-fun tp!1194 () Bool)

(assert (=> mapNonEmpty!1195 (= mapRes!1194 (and tp!1194 tp_is_empty!429))))

(declare-fun mapKey!1193 () (_ BitVec 32))

(declare-fun mapRest!1195 () (Array (_ BitVec 32) T!51335))

(declare-fun mapValue!1194 () T!51335)

(assert (=> mapNonEmpty!1195 (= (arr!8201 a1!623) (store mapRest!1195 mapKey!1193 mapValue!1194))))

(assert (= (and start!63988 res!235671) b!284610))

(assert (= (and b!284610 res!235672) b!284609))

(assert (= (and b!284609 res!235674) b!284605))

(assert (= (and b!284605 res!235673) b!284606))

(assert (= (and b!284604 condMapEmpty!1193) mapIsEmpty!1194))

(assert (= (and b!284604 (not condMapEmpty!1193)) mapNonEmpty!1194))

(assert (= start!63988 b!284604))

(assert (= (and b!284608 condMapEmpty!1194) mapIsEmpty!1195))

(assert (= (and b!284608 (not condMapEmpty!1194)) mapNonEmpty!1195))

(assert (= start!63988 b!284608))

(assert (= (and b!284607 condMapEmpty!1195) mapIsEmpty!1193))

(assert (= (and b!284607 (not condMapEmpty!1195)) mapNonEmpty!1193))

(assert (= start!63988 b!284607))

(declare-fun m!417769 () Bool)

(assert (=> b!284606 m!417769))

(declare-fun m!417771 () Bool)

(assert (=> b!284606 m!417771))

(declare-fun m!417773 () Bool)

(assert (=> b!284610 m!417773))

(declare-fun m!417775 () Bool)

(assert (=> start!63988 m!417775))

(declare-fun m!417777 () Bool)

(assert (=> start!63988 m!417777))

(declare-fun m!417779 () Bool)

(assert (=> start!63988 m!417779))

(declare-fun m!417781 () Bool)

(assert (=> b!284609 m!417781))

(declare-fun m!417783 () Bool)

(assert (=> b!284605 m!417783))

(declare-fun m!417785 () Bool)

(assert (=> mapNonEmpty!1193 m!417785))

(declare-fun m!417787 () Bool)

(assert (=> mapNonEmpty!1195 m!417787))

(declare-fun m!417789 () Bool)

(assert (=> mapNonEmpty!1194 m!417789))

(check-sat (not b!284610) (not b!284605) tp_is_empty!429 (not b!284609) (not b!284606) (not start!63988) (not mapNonEmpty!1193) (not mapNonEmpty!1194) (not mapNonEmpty!1195))
(check-sat)

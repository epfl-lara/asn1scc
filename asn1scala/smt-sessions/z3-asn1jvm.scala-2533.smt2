; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63966 () Bool)

(assert start!63966)

(declare-fun b!284412 () Bool)

(declare-fun e!203317 () Bool)

(declare-fun tp_is_empty!411 () Bool)

(declare-fun mapRes!1108 () Bool)

(assert (=> b!284412 (= e!203317 (and tp_is_empty!411 mapRes!1108))))

(declare-fun condMapEmpty!1109 () Bool)

(declare-datatypes ((T!51257 0))(
  ( (T!51258 (val!205 Int)) )
))
(declare-datatypes ((array!16688 0))(
  ( (array!16689 (arr!8192 (Array (_ BitVec 32) T!51257)) (size!7196 (_ BitVec 32))) )
))
(declare-fun a3!63 () array!16688)

(declare-fun mapDefault!1107 () T!51257)

(assert (=> b!284412 (= condMapEmpty!1109 (= (arr!8192 a3!63) ((as const (Array (_ BitVec 32) T!51257)) mapDefault!1107)))))

(declare-fun b!284413 () Bool)

(declare-fun res!235563 () Bool)

(declare-fun e!203319 () Bool)

(assert (=> b!284413 (=> (not res!235563) (not e!203319))))

(declare-fun a1!623 () array!16688)

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1348 (array!16688 array!16688 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284413 (= res!235563 (arrayRangesEq!1348 a1!623 a3!63 from!749 from!749))))

(declare-fun res!235564 () Bool)

(assert (=> start!63966 (=> (not res!235564) (not e!203319))))

(declare-fun a2!623 () array!16688)

(declare-fun to!716 () (_ BitVec 32))

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> start!63966 (= res!235564 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7196 a1!623) (size!7196 a2!623)) (bvsle (size!7196 a2!623) (size!7196 a3!63)) (bvsle mid!66 (size!7196 a1!623)) (bvsle to!716 (size!7196 a2!623))))))

(assert (=> start!63966 e!203319))

(declare-fun e!203318 () Bool)

(declare-fun array_inv!6885 (array!16688) Bool)

(assert (=> start!63966 (and (array_inv!6885 a2!623) e!203318)))

(declare-fun e!203316 () Bool)

(assert (=> start!63966 (and (array_inv!6885 a1!623) e!203316)))

(assert (=> start!63966 true))

(assert (=> start!63966 (and (array_inv!6885 a3!63) e!203317)))

(declare-fun mapIsEmpty!1107 () Bool)

(assert (=> mapIsEmpty!1107 mapRes!1108))

(declare-fun b!284414 () Bool)

(declare-fun res!235565 () Bool)

(assert (=> b!284414 (=> (not res!235565) (not e!203319))))

(assert (=> b!284414 (= res!235565 (arrayRangesEq!1348 a1!623 a2!623 from!749 mid!66))))

(declare-fun b!284415 () Bool)

(declare-fun res!235562 () Bool)

(assert (=> b!284415 (=> (not res!235562) (not e!203319))))

(assert (=> b!284415 (= res!235562 (arrayRangesEq!1348 a2!623 a3!63 from!749 to!716))))

(declare-fun mapNonEmpty!1107 () Bool)

(declare-fun mapRes!1109 () Bool)

(declare-fun tp!1109 () Bool)

(assert (=> mapNonEmpty!1107 (= mapRes!1109 (and tp!1109 tp_is_empty!411))))

(declare-fun mapKey!1109 () (_ BitVec 32))

(declare-fun mapValue!1109 () T!51257)

(declare-fun mapRest!1109 () (Array (_ BitVec 32) T!51257))

(assert (=> mapNonEmpty!1107 (= (arr!8192 a2!623) (store mapRest!1109 mapKey!1109 mapValue!1109))))

(declare-fun b!284416 () Bool)

(assert (=> b!284416 (= e!203318 (and tp_is_empty!411 mapRes!1109))))

(declare-fun condMapEmpty!1108 () Bool)

(declare-fun mapDefault!1109 () T!51257)

(assert (=> b!284416 (= condMapEmpty!1108 (= (arr!8192 a2!623) ((as const (Array (_ BitVec 32) T!51257)) mapDefault!1109)))))

(declare-fun mapNonEmpty!1108 () Bool)

(declare-fun tp!1108 () Bool)

(assert (=> mapNonEmpty!1108 (= mapRes!1108 (and tp!1108 tp_is_empty!411))))

(declare-fun mapKey!1108 () (_ BitVec 32))

(declare-fun mapRest!1107 () (Array (_ BitVec 32) T!51257))

(declare-fun mapValue!1107 () T!51257)

(assert (=> mapNonEmpty!1108 (= (arr!8192 a3!63) (store mapRest!1107 mapKey!1108 mapValue!1107))))

(declare-fun mapIsEmpty!1108 () Bool)

(assert (=> mapIsEmpty!1108 mapRes!1109))

(declare-fun b!284417 () Bool)

(assert (=> b!284417 (= e!203319 (not (bvsle (size!7196 a1!623) (size!7196 a3!63))))))

(assert (=> b!284417 (arrayRangesEq!1348 a1!623 a3!63 from!749 mid!66)))

(declare-datatypes ((Unit!19909 0))(
  ( (Unit!19910) )
))
(declare-fun lt!418521 () Unit!19909)

(declare-fun rec!59 (array!16688 array!16688 array!16688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19909)

(assert (=> b!284417 (= lt!418521 (rec!59 a1!623 a2!623 a3!63 from!749 mid!66 to!716 from!749))))

(declare-fun mapIsEmpty!1109 () Bool)

(declare-fun mapRes!1107 () Bool)

(assert (=> mapIsEmpty!1109 mapRes!1107))

(declare-fun b!284418 () Bool)

(assert (=> b!284418 (= e!203316 (and tp_is_empty!411 mapRes!1107))))

(declare-fun condMapEmpty!1107 () Bool)

(declare-fun mapDefault!1108 () T!51257)

(assert (=> b!284418 (= condMapEmpty!1107 (= (arr!8192 a1!623) ((as const (Array (_ BitVec 32) T!51257)) mapDefault!1108)))))

(declare-fun mapNonEmpty!1109 () Bool)

(declare-fun tp!1107 () Bool)

(assert (=> mapNonEmpty!1109 (= mapRes!1107 (and tp!1107 tp_is_empty!411))))

(declare-fun mapKey!1107 () (_ BitVec 32))

(declare-fun mapRest!1108 () (Array (_ BitVec 32) T!51257))

(declare-fun mapValue!1108 () T!51257)

(assert (=> mapNonEmpty!1109 (= (arr!8192 a1!623) (store mapRest!1108 mapKey!1107 mapValue!1108))))

(assert (= (and start!63966 res!235564) b!284414))

(assert (= (and b!284414 res!235565) b!284415))

(assert (= (and b!284415 res!235562) b!284413))

(assert (= (and b!284413 res!235563) b!284417))

(assert (= (and b!284416 condMapEmpty!1108) mapIsEmpty!1108))

(assert (= (and b!284416 (not condMapEmpty!1108)) mapNonEmpty!1107))

(assert (= start!63966 b!284416))

(assert (= (and b!284418 condMapEmpty!1107) mapIsEmpty!1109))

(assert (= (and b!284418 (not condMapEmpty!1107)) mapNonEmpty!1109))

(assert (= start!63966 b!284418))

(assert (= (and b!284412 condMapEmpty!1109) mapIsEmpty!1107))

(assert (= (and b!284412 (not condMapEmpty!1109)) mapNonEmpty!1108))

(assert (= start!63966 b!284412))

(declare-fun m!417565 () Bool)

(assert (=> b!284413 m!417565))

(declare-fun m!417567 () Bool)

(assert (=> b!284414 m!417567))

(declare-fun m!417569 () Bool)

(assert (=> mapNonEmpty!1107 m!417569))

(declare-fun m!417571 () Bool)

(assert (=> mapNonEmpty!1108 m!417571))

(declare-fun m!417573 () Bool)

(assert (=> mapNonEmpty!1109 m!417573))

(declare-fun m!417575 () Bool)

(assert (=> start!63966 m!417575))

(declare-fun m!417577 () Bool)

(assert (=> start!63966 m!417577))

(declare-fun m!417579 () Bool)

(assert (=> start!63966 m!417579))

(declare-fun m!417581 () Bool)

(assert (=> b!284415 m!417581))

(declare-fun m!417583 () Bool)

(assert (=> b!284417 m!417583))

(declare-fun m!417585 () Bool)

(assert (=> b!284417 m!417585))

(check-sat (not mapNonEmpty!1109) (not b!284414) (not b!284415) (not start!63966) (not b!284413) (not mapNonEmpty!1108) tp_is_empty!411 (not b!284417) (not mapNonEmpty!1107))
(check-sat)

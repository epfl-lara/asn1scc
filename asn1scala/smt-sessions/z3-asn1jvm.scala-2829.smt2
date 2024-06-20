; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68486 () Bool)

(assert start!68486)

(declare-fun res!252425 () Bool)

(declare-fun e!221632 () Bool)

(assert (=> start!68486 (=> (not res!252425) (not e!221632))))

(declare-fun from!632 () (_ BitVec 32))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57537 0))(
  ( (T!57538 (val!385 Int)) )
))
(declare-datatypes ((array!18634 0))(
  ( (array!18635 (arr!9155 (Array (_ BitVec 32) T!57537)) (size!8072 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18634)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18634)

(assert (=> start!68486 (= res!252425 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8072 a1!506) (size!8072 a2!506)) (bvsle to!599 (size!8072 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68486 e!221632))

(assert (=> start!68486 true))

(declare-fun e!221631 () Bool)

(declare-fun array_inv!7681 (array!18634) Bool)

(assert (=> start!68486 (and (array_inv!7681 a1!506) e!221631)))

(declare-fun e!221629 () Bool)

(assert (=> start!68486 (and (array_inv!7681 a2!506) e!221629)))

(declare-fun b!307605 () Bool)

(declare-fun res!252423 () Bool)

(assert (=> b!307605 (=> (not res!252423) (not e!221632))))

(declare-fun e!221630 () Bool)

(assert (=> b!307605 (= res!252423 e!221630)))

(declare-fun res!252422 () Bool)

(assert (=> b!307605 (=> res!252422 e!221630)))

(assert (=> b!307605 (= res!252422 (bvsgt to!599 toSlice!41))))

(declare-fun b!307606 () Bool)

(declare-fun arrayRangesEq!1699 (array!18634 array!18634 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307606 (= e!221630 (arrayRangesEq!1699 a1!506 a2!506 to!599 toSlice!41))))

(declare-fun b!307607 () Bool)

(declare-fun res!252421 () Bool)

(assert (=> b!307607 (=> (not res!252421) (not e!221632))))

(assert (=> b!307607 (= res!252421 (bvsle fromSlice!41 to!599))))

(declare-fun b!307608 () Bool)

(declare-fun res!252424 () Bool)

(assert (=> b!307608 (=> (not res!252424) (not e!221632))))

(assert (=> b!307608 (= res!252424 (arrayRangesEq!1699 a1!506 a2!506 from!632 to!599))))

(declare-fun mapIsEmpty!2473 () Bool)

(declare-fun mapRes!2473 () Bool)

(assert (=> mapIsEmpty!2473 mapRes!2473))

(declare-fun mapNonEmpty!2473 () Bool)

(declare-fun tp!2473 () Bool)

(declare-fun tp_is_empty!771 () Bool)

(assert (=> mapNonEmpty!2473 (= mapRes!2473 (and tp!2473 tp_is_empty!771))))

(declare-fun mapRest!2473 () (Array (_ BitVec 32) T!57537))

(declare-fun mapKey!2474 () (_ BitVec 32))

(declare-fun mapValue!2473 () T!57537)

(assert (=> mapNonEmpty!2473 (= (arr!9155 a1!506) (store mapRest!2473 mapKey!2474 mapValue!2473))))

(declare-fun mapIsEmpty!2474 () Bool)

(declare-fun mapRes!2474 () Bool)

(assert (=> mapIsEmpty!2474 mapRes!2474))

(declare-fun mapNonEmpty!2474 () Bool)

(declare-fun tp!2474 () Bool)

(assert (=> mapNonEmpty!2474 (= mapRes!2474 (and tp!2474 tp_is_empty!771))))

(declare-fun mapKey!2473 () (_ BitVec 32))

(declare-fun mapValue!2474 () T!57537)

(declare-fun mapRest!2474 () (Array (_ BitVec 32) T!57537))

(assert (=> mapNonEmpty!2474 (= (arr!9155 a2!506) (store mapRest!2474 mapKey!2473 mapValue!2474))))

(declare-fun b!307609 () Bool)

(assert (=> b!307609 (= e!221632 (not (or (bvsgt #b00000000000000000000000000000000 fromSlice!41) (bvsle toSlice!41 (size!8072 a1!506)))))))

(assert (=> b!307609 (arrayRangesEq!1699 a1!506 a2!506 fromSlice!41 toSlice!41)))

(declare-datatypes ((Unit!21443 0))(
  ( (Unit!21444) )
))
(declare-fun lt!440256 () Unit!21443)

(declare-fun rec!91 (array!18634 array!18634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21443)

(assert (=> b!307609 (= lt!440256 (rec!91 a1!506 a2!506 from!632 fromSlice!41 to!599 toSlice!41 to!599))))

(declare-fun b!307610 () Bool)

(assert (=> b!307610 (= e!221629 (and tp_is_empty!771 mapRes!2474))))

(declare-fun condMapEmpty!2474 () Bool)

(declare-fun mapDefault!2474 () T!57537)

(assert (=> b!307610 (= condMapEmpty!2474 (= (arr!9155 a2!506) ((as const (Array (_ BitVec 32) T!57537)) mapDefault!2474)))))

(declare-fun b!307611 () Bool)

(assert (=> b!307611 (= e!221631 (and tp_is_empty!771 mapRes!2473))))

(declare-fun condMapEmpty!2473 () Bool)

(declare-fun mapDefault!2473 () T!57537)

(assert (=> b!307611 (= condMapEmpty!2473 (= (arr!9155 a1!506) ((as const (Array (_ BitVec 32) T!57537)) mapDefault!2473)))))

(declare-fun b!307612 () Bool)

(declare-fun res!252426 () Bool)

(assert (=> b!307612 (=> (not res!252426) (not e!221632))))

(assert (=> b!307612 (= res!252426 (arrayRangesEq!1699 a1!506 a2!506 to!599 to!599))))

(assert (= (and start!68486 res!252425) b!307608))

(assert (= (and b!307608 res!252424) b!307607))

(assert (= (and b!307607 res!252421) b!307612))

(assert (= (and b!307612 res!252426) b!307605))

(assert (= (and b!307605 (not res!252422)) b!307606))

(assert (= (and b!307605 res!252423) b!307609))

(assert (= (and b!307611 condMapEmpty!2473) mapIsEmpty!2473))

(assert (= (and b!307611 (not condMapEmpty!2473)) mapNonEmpty!2473))

(assert (= start!68486 b!307611))

(assert (= (and b!307610 condMapEmpty!2474) mapIsEmpty!2474))

(assert (= (and b!307610 (not condMapEmpty!2474)) mapNonEmpty!2474))

(assert (= start!68486 b!307610))

(declare-fun m!446141 () Bool)

(assert (=> b!307612 m!446141))

(declare-fun m!446143 () Bool)

(assert (=> mapNonEmpty!2474 m!446143))

(declare-fun m!446145 () Bool)

(assert (=> b!307609 m!446145))

(declare-fun m!446147 () Bool)

(assert (=> b!307609 m!446147))

(declare-fun m!446149 () Bool)

(assert (=> mapNonEmpty!2473 m!446149))

(declare-fun m!446151 () Bool)

(assert (=> start!68486 m!446151))

(declare-fun m!446153 () Bool)

(assert (=> start!68486 m!446153))

(declare-fun m!446155 () Bool)

(assert (=> b!307606 m!446155))

(declare-fun m!446157 () Bool)

(assert (=> b!307608 m!446157))

(check-sat (not b!307608) (not mapNonEmpty!2474) (not mapNonEmpty!2473) (not b!307612) (not b!307609) tp_is_empty!771 (not b!307606) (not start!68486))
(check-sat)

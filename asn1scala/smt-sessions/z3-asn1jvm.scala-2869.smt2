; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68750 () Bool)

(assert start!68750)

(declare-fun b!310457 () Bool)

(declare-fun e!223046 () Bool)

(declare-fun at!235 () (_ BitVec 32))

(declare-datatypes ((T!58577 0))(
  ( (T!58578 (val!505 Int)) )
))
(declare-datatypes ((array!18879 0))(
  ( (array!18880 (arr!9275 (Array (_ BitVec 32) T!58577)) (size!8192 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18879)

(assert (=> b!310457 (= e!223046 (not (and (bvsge at!235 #b00000000000000000000000000000000) (bvslt at!235 (size!8192 a2!566)))))))

(declare-fun a1!566 () array!18879)

(assert (=> b!310457 (= (select (arr!9275 a1!566) at!235) (select (arr!9275 a2!566) at!235))))

(declare-fun i!943 () (_ BitVec 32))

(declare-datatypes ((Unit!21501 0))(
  ( (Unit!21502) )
))
(declare-fun lt!440460 () Unit!21501)

(declare-fun to!659 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(declare-fun rec!108 (array!18879 array!18879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21501)

(assert (=> b!310457 (= lt!440460 (rec!108 a1!566 a2!566 at!235 from!692 to!659 (bvadd #b00000000000000000000000000000001 i!943)))))

(declare-fun mapNonEmpty!3213 () Bool)

(declare-fun mapRes!3214 () Bool)

(declare-fun tp!3213 () Bool)

(declare-fun tp_is_empty!1011 () Bool)

(assert (=> mapNonEmpty!3213 (= mapRes!3214 (and tp!3213 tp_is_empty!1011))))

(declare-fun mapValue!3213 () T!58577)

(declare-fun mapKey!3214 () (_ BitVec 32))

(declare-fun mapRest!3214 () (Array (_ BitVec 32) T!58577))

(assert (=> mapNonEmpty!3213 (= (arr!9275 a2!566) (store mapRest!3214 mapKey!3214 mapValue!3213))))

(declare-fun b!310459 () Bool)

(declare-fun e!223044 () Bool)

(assert (=> b!310459 (= e!223044 (and tp_is_empty!1011 mapRes!3214))))

(declare-fun condMapEmpty!3214 () Bool)

(declare-fun mapDefault!3213 () T!58577)

(assert (=> b!310459 (= condMapEmpty!3214 (= (arr!9275 a2!566) ((as const (Array (_ BitVec 32) T!58577)) mapDefault!3213)))))

(declare-fun mapIsEmpty!3213 () Bool)

(assert (=> mapIsEmpty!3213 mapRes!3214))

(declare-fun b!310460 () Bool)

(declare-fun res!254545 () Bool)

(assert (=> b!310460 (=> (not res!254545) (not e!223046))))

(assert (=> b!310460 (= res!254545 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun b!310461 () Bool)

(declare-fun res!254543 () Bool)

(assert (=> b!310461 (=> (not res!254543) (not e!223046))))

(assert (=> b!310461 (= res!254543 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun mapNonEmpty!3214 () Bool)

(declare-fun mapRes!3213 () Bool)

(declare-fun tp!3214 () Bool)

(assert (=> mapNonEmpty!3214 (= mapRes!3213 (and tp!3214 tp_is_empty!1011))))

(declare-fun mapKey!3213 () (_ BitVec 32))

(declare-fun mapRest!3213 () (Array (_ BitVec 32) T!58577))

(declare-fun mapValue!3214 () T!58577)

(assert (=> mapNonEmpty!3214 (= (arr!9275 a1!566) (store mapRest!3213 mapKey!3213 mapValue!3214))))

(declare-fun b!310462 () Bool)

(declare-fun res!254546 () Bool)

(assert (=> b!310462 (=> (not res!254546) (not e!223046))))

(declare-fun arrayRangesEq!1787 (array!18879 array!18879 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310462 (= res!254546 (arrayRangesEq!1787 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310463 () Bool)

(declare-fun res!254544 () Bool)

(assert (=> b!310463 (=> (not res!254544) (not e!223046))))

(assert (=> b!310463 (= res!254544 (arrayRangesEq!1787 a1!566 a2!566 from!692 to!659))))

(declare-fun res!254547 () Bool)

(assert (=> start!68750 (=> (not res!254547) (not e!223046))))

(assert (=> start!68750 (= res!254547 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8192 a1!566) (size!8192 a2!566)) (bvsle to!659 (size!8192 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68750 e!223046))

(assert (=> start!68750 true))

(declare-fun array_inv!7750 (array!18879) Bool)

(assert (=> start!68750 (and (array_inv!7750 a2!566) e!223044)))

(declare-fun e!223045 () Bool)

(assert (=> start!68750 (and (array_inv!7750 a1!566) e!223045)))

(declare-fun b!310458 () Bool)

(assert (=> b!310458 (= e!223045 (and tp_is_empty!1011 mapRes!3213))))

(declare-fun condMapEmpty!3213 () Bool)

(declare-fun mapDefault!3214 () T!58577)

(assert (=> b!310458 (= condMapEmpty!3213 (= (arr!9275 a1!566) ((as const (Array (_ BitVec 32) T!58577)) mapDefault!3214)))))

(declare-fun b!310464 () Bool)

(declare-fun res!254548 () Bool)

(assert (=> b!310464 (=> (not res!254548) (not e!223046))))

(assert (=> b!310464 (= res!254548 (arrayRangesEq!1787 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(declare-fun mapIsEmpty!3214 () Bool)

(assert (=> mapIsEmpty!3214 mapRes!3213))

(assert (= (and start!68750 res!254547) b!310463))

(assert (= (and b!310463 res!254544) b!310461))

(assert (= (and b!310461 res!254543) b!310462))

(assert (= (and b!310462 res!254546) b!310460))

(assert (= (and b!310460 res!254545) b!310464))

(assert (= (and b!310464 res!254548) b!310457))

(assert (= (and b!310459 condMapEmpty!3214) mapIsEmpty!3213))

(assert (= (and b!310459 (not condMapEmpty!3214)) mapNonEmpty!3213))

(assert (= start!68750 b!310459))

(assert (= (and b!310458 condMapEmpty!3213) mapIsEmpty!3214))

(assert (= (and b!310458 (not condMapEmpty!3213)) mapNonEmpty!3214))

(assert (= start!68750 b!310458))

(declare-fun m!448247 () Bool)

(assert (=> start!68750 m!448247))

(declare-fun m!448249 () Bool)

(assert (=> start!68750 m!448249))

(declare-fun m!448251 () Bool)

(assert (=> b!310462 m!448251))

(declare-fun m!448253 () Bool)

(assert (=> mapNonEmpty!3214 m!448253))

(declare-fun m!448255 () Bool)

(assert (=> b!310457 m!448255))

(declare-fun m!448257 () Bool)

(assert (=> b!310457 m!448257))

(declare-fun m!448259 () Bool)

(assert (=> b!310457 m!448259))

(declare-fun m!448261 () Bool)

(assert (=> mapNonEmpty!3213 m!448261))

(declare-fun m!448263 () Bool)

(assert (=> b!310463 m!448263))

(declare-fun m!448265 () Bool)

(assert (=> b!310464 m!448265))

(check-sat (not mapNonEmpty!3213) (not b!310463) (not b!310464) (not mapNonEmpty!3214) (not b!310462) (not b!310457) tp_is_empty!1011 (not start!68750))
(check-sat)

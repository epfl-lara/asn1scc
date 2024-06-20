; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63126 () Bool)

(assert start!63126)

(declare-fun mapNonEmpty!712 () Bool)

(declare-fun mapRes!713 () Bool)

(declare-fun tp!712 () Bool)

(declare-fun tp_is_empty!291 () Bool)

(assert (=> mapNonEmpty!712 (= mapRes!713 (and tp!712 tp_is_empty!291))))

(declare-datatypes ((T!50077 0))(
  ( (T!50078 (val!145 Int)) )
))
(declare-fun mapRest!712 () (Array (_ BitVec 32) T!50077))

(declare-datatypes ((array!16324 0))(
  ( (array!16325 (arr!8042 (Array (_ BitVec 32) T!50077)) (size!7046 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16324)

(declare-fun mapKey!713 () (_ BitVec 32))

(declare-fun mapValue!712 () T!50077)

(assert (=> mapNonEmpty!712 (= (arr!8042 a1!463) (store mapRest!712 mapKey!713 mapValue!712))))

(declare-fun mapIsEmpty!712 () Bool)

(assert (=> mapIsEmpty!712 mapRes!713))

(declare-fun b!282534 () Bool)

(declare-fun res!234354 () Bool)

(declare-fun e!201873 () Bool)

(assert (=> b!282534 (=> (not res!234354) (not e!201873))))

(declare-fun to!556 () (_ BitVec 32))

(declare-fun from!589 () (_ BitVec 32))

(declare-fun a2!463 () array!16324)

(declare-fun arrayRangesEq!1310 (array!16324 array!16324 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282534 (= res!234354 (arrayRangesEq!1310 a1!463 a2!463 from!589 to!556))))

(declare-fun mapNonEmpty!713 () Bool)

(declare-fun mapRes!712 () Bool)

(declare-fun tp!713 () Bool)

(assert (=> mapNonEmpty!713 (= mapRes!712 (and tp!713 tp_is_empty!291))))

(declare-fun mapKey!712 () (_ BitVec 32))

(declare-fun mapRest!713 () (Array (_ BitVec 32) T!50077))

(declare-fun mapValue!713 () T!50077)

(assert (=> mapNonEmpty!713 (= (arr!8042 a2!463) (store mapRest!713 mapKey!712 mapValue!713))))

(declare-fun mapIsEmpty!713 () Bool)

(assert (=> mapIsEmpty!713 mapRes!712))

(declare-fun b!282535 () Bool)

(assert (=> b!282535 (= e!201873 (bvsgt (size!7046 a2!463) (size!7046 a1!463)))))

(declare-datatypes ((Unit!19811 0))(
  ( (Unit!19812) )
))
(declare-fun lt!417789 () Unit!19811)

(declare-fun rec!48 (array!16324 array!16324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19811)

(assert (=> b!282535 (= lt!417789 (rec!48 a1!463 a2!463 from!589 to!556 to!556))))

(declare-fun b!282536 () Bool)

(declare-fun e!201875 () Bool)

(assert (=> b!282536 (= e!201875 (and tp_is_empty!291 mapRes!712))))

(declare-fun condMapEmpty!712 () Bool)

(declare-fun mapDefault!713 () T!50077)

(assert (=> b!282536 (= condMapEmpty!712 (= (arr!8042 a2!463) ((as const (Array (_ BitVec 32) T!50077)) mapDefault!713)))))

(declare-fun res!234355 () Bool)

(assert (=> start!63126 (=> (not res!234355) (not e!201873))))

(assert (=> start!63126 (= res!234355 (and (bvsle #b00000000000000000000000000000000 from!589) (bvsle from!589 to!556) (bvsle to!556 (size!7046 a1!463)) (= (size!7046 a1!463) (size!7046 a2!463))))))

(assert (=> start!63126 e!201873))

(assert (=> start!63126 true))

(declare-fun e!201874 () Bool)

(declare-fun array_inv!6765 (array!16324) Bool)

(assert (=> start!63126 (and (array_inv!6765 a1!463) e!201874)))

(assert (=> start!63126 (and (array_inv!6765 a2!463) e!201875)))

(declare-fun b!282533 () Bool)

(assert (=> b!282533 (= e!201874 (and tp_is_empty!291 mapRes!713))))

(declare-fun condMapEmpty!713 () Bool)

(declare-fun mapDefault!712 () T!50077)

(assert (=> b!282533 (= condMapEmpty!713 (= (arr!8042 a1!463) ((as const (Array (_ BitVec 32) T!50077)) mapDefault!712)))))

(assert (= (and start!63126 res!234355) b!282534))

(assert (= (and b!282534 res!234354) b!282535))

(assert (= (and b!282533 condMapEmpty!713) mapIsEmpty!712))

(assert (= (and b!282533 (not condMapEmpty!713)) mapNonEmpty!712))

(assert (= start!63126 b!282533))

(assert (= (and b!282536 condMapEmpty!712) mapIsEmpty!713))

(assert (= (and b!282536 (not condMapEmpty!712)) mapNonEmpty!713))

(assert (= start!63126 b!282536))

(declare-fun m!415669 () Bool)

(assert (=> b!282534 m!415669))

(declare-fun m!415671 () Bool)

(assert (=> b!282535 m!415671))

(declare-fun m!415673 () Bool)

(assert (=> mapNonEmpty!713 m!415673))

(declare-fun m!415675 () Bool)

(assert (=> mapNonEmpty!712 m!415675))

(declare-fun m!415677 () Bool)

(assert (=> start!63126 m!415677))

(declare-fun m!415679 () Bool)

(assert (=> start!63126 m!415679))

(check-sat (not b!282534) (not b!282535) tp_is_empty!291 (not mapNonEmpty!713) (not start!63126) (not mapNonEmpty!712))
(check-sat)

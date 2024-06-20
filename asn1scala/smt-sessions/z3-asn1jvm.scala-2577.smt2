; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64254 () Bool)

(assert start!64254)

(declare-fun b!288013 () Bool)

(declare-fun res!238109 () Bool)

(declare-fun e!204919 () Bool)

(assert (=> b!288013 (=> (not res!238109) (not e!204919))))

(declare-datatypes ((T!52401 0))(
  ( (T!52402 (val!337 Int)) )
))
(declare-datatypes ((array!16957 0))(
  ( (array!16958 (arr!8324 (Array (_ BitVec 32) T!52401)) (size!7328 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16957)

(declare-fun a2!596 () array!16957)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1444 (array!16957 array!16957 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288013 (= res!238109 (arrayRangesEq!1444 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288014 () Bool)

(declare-fun res!238108 () Bool)

(assert (=> b!288014 (=> (not res!238108) (not e!204919))))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!288014 (= res!238108 (not (= i!953 from!722)))))

(declare-fun mapIsEmpty!2181 () Bool)

(declare-fun mapRes!2182 () Bool)

(assert (=> mapIsEmpty!2181 mapRes!2182))

(declare-fun mapIsEmpty!2182 () Bool)

(declare-fun mapRes!2181 () Bool)

(assert (=> mapIsEmpty!2182 mapRes!2181))

(declare-fun b!288016 () Bool)

(declare-fun res!238110 () Bool)

(assert (=> b!288016 (=> (not res!238110) (not e!204919))))

(assert (=> b!288016 (= res!238110 (and (= (select (arr!8324 a1!596) to!689) (select (arr!8324 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2181 () Bool)

(declare-fun tp!2182 () Bool)

(declare-fun tp_is_empty!675 () Bool)

(assert (=> mapNonEmpty!2181 (= mapRes!2181 (and tp!2182 tp_is_empty!675))))

(declare-fun mapRest!2182 () (Array (_ BitVec 32) T!52401))

(declare-fun mapValue!2181 () T!52401)

(declare-fun mapKey!2182 () (_ BitVec 32))

(assert (=> mapNonEmpty!2181 (= (arr!8324 a1!596) (store mapRest!2182 mapKey!2182 mapValue!2181))))

(declare-fun b!288017 () Bool)

(declare-fun e!204920 () Bool)

(assert (=> b!288017 (= e!204920 (and tp_is_empty!675 mapRes!2182))))

(declare-fun condMapEmpty!2181 () Bool)

(declare-fun mapDefault!2182 () T!52401)

(assert (=> b!288017 (= condMapEmpty!2181 (= (arr!8324 a2!596) ((as const (Array (_ BitVec 32) T!52401)) mapDefault!2182)))))

(declare-fun b!288018 () Bool)

(declare-fun res!238106 () Bool)

(assert (=> b!288018 (=> (not res!238106) (not e!204919))))

(assert (=> b!288018 (= res!238106 (arrayRangesEq!1444 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288019 () Bool)

(declare-fun e!204918 () Bool)

(assert (=> b!288019 (= e!204919 (not e!204918))))

(declare-fun res!238111 () Bool)

(assert (=> b!288019 (=> res!238111 e!204918)))

(assert (=> b!288019 (= res!238111 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!288019 (= (select (arr!8324 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8324 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19997 0))(
  ( (Unit!19998) )
))
(declare-fun lt!418820 () Unit!19997)

(declare-fun arrayRangesEqImpliesEq!204 (array!16957 array!16957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19997)

(assert (=> b!288019 (= lt!418820 (arrayRangesEqImpliesEq!204 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapNonEmpty!2182 () Bool)

(declare-fun tp!2181 () Bool)

(assert (=> mapNonEmpty!2182 (= mapRes!2182 (and tp!2181 tp_is_empty!675))))

(declare-fun mapValue!2182 () T!52401)

(declare-fun mapRest!2181 () (Array (_ BitVec 32) T!52401))

(declare-fun mapKey!2181 () (_ BitVec 32))

(assert (=> mapNonEmpty!2182 (= (arr!8324 a2!596) (store mapRest!2181 mapKey!2181 mapValue!2182))))

(declare-fun b!288015 () Bool)

(assert (=> b!288015 (= e!204918 true)))

(assert (=> b!288015 (arrayRangesEq!1444 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun lt!418821 () Unit!19997)

(declare-fun rec!84 (array!16957 array!16957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19997)

(assert (=> b!288015 (= lt!418821 (rec!84 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun res!238105 () Bool)

(assert (=> start!64254 (=> (not res!238105) (not e!204919))))

(assert (=> start!64254 (= res!238105 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7328 a1!596) (size!7328 a2!596)) (bvslt to!689 (size!7328 a1!596))))))

(assert (=> start!64254 e!204919))

(declare-fun e!204917 () Bool)

(declare-fun array_inv!6957 (array!16957) Bool)

(assert (=> start!64254 (and (array_inv!6957 a1!596) e!204917)))

(assert (=> start!64254 (and (array_inv!6957 a2!596) e!204920)))

(assert (=> start!64254 true))

(declare-fun b!288020 () Bool)

(assert (=> b!288020 (= e!204917 (and tp_is_empty!675 mapRes!2181))))

(declare-fun condMapEmpty!2182 () Bool)

(declare-fun mapDefault!2181 () T!52401)

(assert (=> b!288020 (= condMapEmpty!2182 (= (arr!8324 a1!596) ((as const (Array (_ BitVec 32) T!52401)) mapDefault!2181)))))

(declare-fun b!288021 () Bool)

(declare-fun res!238107 () Bool)

(assert (=> b!288021 (=> res!238107 e!204918)))

(assert (=> b!288021 (= res!238107 (not (arrayRangesEq!1444 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(assert (= (and start!64254 res!238105) b!288013))

(assert (= (and b!288013 res!238109) b!288016))

(assert (= (and b!288016 res!238110) b!288018))

(assert (= (and b!288018 res!238106) b!288014))

(assert (= (and b!288014 res!238108) b!288019))

(assert (= (and b!288019 (not res!238111)) b!288021))

(assert (= (and b!288021 (not res!238107)) b!288015))

(assert (= (and b!288020 condMapEmpty!2182) mapIsEmpty!2182))

(assert (= (and b!288020 (not condMapEmpty!2182)) mapNonEmpty!2181))

(assert (= start!64254 b!288020))

(assert (= (and b!288017 condMapEmpty!2181) mapIsEmpty!2181))

(assert (= (and b!288017 (not condMapEmpty!2181)) mapNonEmpty!2182))

(assert (= start!64254 b!288017))

(declare-fun m!420719 () Bool)

(assert (=> start!64254 m!420719))

(declare-fun m!420721 () Bool)

(assert (=> start!64254 m!420721))

(declare-fun m!420723 () Bool)

(assert (=> b!288015 m!420723))

(declare-fun m!420725 () Bool)

(assert (=> b!288015 m!420725))

(declare-fun m!420727 () Bool)

(assert (=> mapNonEmpty!2182 m!420727))

(declare-fun m!420729 () Bool)

(assert (=> b!288019 m!420729))

(declare-fun m!420731 () Bool)

(assert (=> b!288019 m!420731))

(declare-fun m!420733 () Bool)

(assert (=> b!288019 m!420733))

(declare-fun m!420735 () Bool)

(assert (=> b!288013 m!420735))

(declare-fun m!420737 () Bool)

(assert (=> b!288016 m!420737))

(declare-fun m!420739 () Bool)

(assert (=> b!288016 m!420739))

(declare-fun m!420741 () Bool)

(assert (=> b!288021 m!420741))

(declare-fun m!420743 () Bool)

(assert (=> b!288018 m!420743))

(declare-fun m!420745 () Bool)

(assert (=> mapNonEmpty!2181 m!420745))

(check-sat (not b!288019) tp_is_empty!675 (not mapNonEmpty!2181) (not mapNonEmpty!2182) (not b!288015) (not b!288021) (not b!288018) (not start!64254) (not b!288013))
(check-sat)

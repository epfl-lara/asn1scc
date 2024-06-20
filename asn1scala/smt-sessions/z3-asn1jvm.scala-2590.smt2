; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64338 () Bool)

(assert start!64338)

(declare-fun b!288835 () Bool)

(declare-fun res!238691 () Bool)

(declare-fun e!205314 () Bool)

(assert (=> b!288835 (=> (not res!238691) (not e!205314))))

(declare-datatypes ((T!52739 0))(
  ( (T!52740 (val!376 Int)) )
))
(declare-datatypes ((array!17036 0))(
  ( (array!17037 (arr!8363 (Array (_ BitVec 32) T!52739)) (size!7367 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17036)

(declare-fun a2!596 () array!17036)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1471 (array!17036 array!17036 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288835 (= res!238691 (arrayRangesEq!1471 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun res!238694 () Bool)

(assert (=> start!64338 (=> (not res!238694) (not e!205314))))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> start!64338 (= res!238694 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7367 a1!596) (size!7367 a2!596)) (bvslt to!689 (size!7367 a1!596))))))

(assert (=> start!64338 e!205314))

(declare-fun e!205315 () Bool)

(declare-fun array_inv!6980 (array!17036) Bool)

(assert (=> start!64338 (and (array_inv!6980 a1!596) e!205315)))

(declare-fun e!205317 () Bool)

(assert (=> start!64338 (and (array_inv!6980 a2!596) e!205317)))

(assert (=> start!64338 true))

(declare-fun b!288836 () Bool)

(declare-fun tp_is_empty!753 () Bool)

(declare-fun mapRes!2420 () Bool)

(assert (=> b!288836 (= e!205317 (and tp_is_empty!753 mapRes!2420))))

(declare-fun condMapEmpty!2419 () Bool)

(declare-fun mapDefault!2419 () T!52739)

(assert (=> b!288836 (= condMapEmpty!2419 (= (arr!8363 a2!596) ((as const (Array (_ BitVec 32) T!52739)) mapDefault!2419)))))

(declare-fun b!288837 () Bool)

(declare-fun mapRes!2419 () Bool)

(assert (=> b!288837 (= e!205315 (and tp_is_empty!753 mapRes!2419))))

(declare-fun condMapEmpty!2420 () Bool)

(declare-fun mapDefault!2420 () T!52739)

(assert (=> b!288837 (= condMapEmpty!2420 (= (arr!8363 a1!596) ((as const (Array (_ BitVec 32) T!52739)) mapDefault!2420)))))

(declare-fun b!288838 () Bool)

(declare-fun res!238693 () Bool)

(assert (=> b!288838 (=> (not res!238693) (not e!205314))))

(assert (=> b!288838 (= res!238693 (not (= i!953 from!722)))))

(declare-fun b!288839 () Bool)

(declare-fun res!238692 () Bool)

(declare-fun e!205316 () Bool)

(assert (=> b!288839 (=> res!238692 e!205316)))

(assert (=> b!288839 (= res!238692 (not (arrayRangesEq!1471 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun mapIsEmpty!2419 () Bool)

(assert (=> mapIsEmpty!2419 mapRes!2419))

(declare-fun b!288840 () Bool)

(assert (=> b!288840 (= e!205316 true)))

(assert (=> b!288840 (arrayRangesEq!1471 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-datatypes ((Unit!20017 0))(
  ( (Unit!20018) )
))
(declare-fun lt!418895 () Unit!20017)

(declare-fun rec!88 (array!17036 array!17036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20017)

(assert (=> b!288840 (= lt!418895 (rec!88 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun b!288841 () Bool)

(declare-fun res!238697 () Bool)

(assert (=> b!288841 (=> (not res!238697) (not e!205314))))

(assert (=> b!288841 (= res!238697 (arrayRangesEq!1471 a1!596 a2!596 from!722 to!689))))

(declare-fun mapNonEmpty!2419 () Bool)

(declare-fun tp!2420 () Bool)

(assert (=> mapNonEmpty!2419 (= mapRes!2419 (and tp!2420 tp_is_empty!753))))

(declare-fun mapKey!2420 () (_ BitVec 32))

(declare-fun mapValue!2419 () T!52739)

(declare-fun mapRest!2419 () (Array (_ BitVec 32) T!52739))

(assert (=> mapNonEmpty!2419 (= (arr!8363 a1!596) (store mapRest!2419 mapKey!2420 mapValue!2419))))

(declare-fun b!288842 () Bool)

(assert (=> b!288842 (= e!205314 (not e!205316))))

(declare-fun res!238696 () Bool)

(assert (=> b!288842 (=> res!238696 e!205316)))

(assert (=> b!288842 (= res!238696 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!288842 (= (select (arr!8363 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8363 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun lt!418896 () Unit!20017)

(declare-fun arrayRangesEqImpliesEq!213 (array!17036 array!17036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20017)

(assert (=> b!288842 (= lt!418896 (arrayRangesEqImpliesEq!213 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapIsEmpty!2420 () Bool)

(assert (=> mapIsEmpty!2420 mapRes!2420))

(declare-fun mapNonEmpty!2420 () Bool)

(declare-fun tp!2419 () Bool)

(assert (=> mapNonEmpty!2420 (= mapRes!2420 (and tp!2419 tp_is_empty!753))))

(declare-fun mapKey!2419 () (_ BitVec 32))

(declare-fun mapValue!2420 () T!52739)

(declare-fun mapRest!2420 () (Array (_ BitVec 32) T!52739))

(assert (=> mapNonEmpty!2420 (= (arr!8363 a2!596) (store mapRest!2420 mapKey!2419 mapValue!2420))))

(declare-fun b!288843 () Bool)

(declare-fun res!238695 () Bool)

(assert (=> b!288843 (=> (not res!238695) (not e!205314))))

(assert (=> b!288843 (= res!238695 (and (= (select (arr!8363 a1!596) to!689) (select (arr!8363 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(assert (= (and start!64338 res!238694) b!288841))

(assert (= (and b!288841 res!238697) b!288843))

(assert (= (and b!288843 res!238695) b!288835))

(assert (= (and b!288835 res!238691) b!288838))

(assert (= (and b!288838 res!238693) b!288842))

(assert (= (and b!288842 (not res!238696)) b!288839))

(assert (= (and b!288839 (not res!238692)) b!288840))

(assert (= (and b!288837 condMapEmpty!2420) mapIsEmpty!2419))

(assert (= (and b!288837 (not condMapEmpty!2420)) mapNonEmpty!2419))

(assert (= start!64338 b!288837))

(assert (= (and b!288836 condMapEmpty!2419) mapIsEmpty!2420))

(assert (= (and b!288836 (not condMapEmpty!2419)) mapNonEmpty!2420))

(assert (= start!64338 b!288836))

(declare-fun m!421519 () Bool)

(assert (=> b!288841 m!421519))

(declare-fun m!421521 () Bool)

(assert (=> mapNonEmpty!2419 m!421521))

(declare-fun m!421523 () Bool)

(assert (=> mapNonEmpty!2420 m!421523))

(declare-fun m!421525 () Bool)

(assert (=> b!288843 m!421525))

(declare-fun m!421527 () Bool)

(assert (=> b!288843 m!421527))

(declare-fun m!421529 () Bool)

(assert (=> start!64338 m!421529))

(declare-fun m!421531 () Bool)

(assert (=> start!64338 m!421531))

(declare-fun m!421533 () Bool)

(assert (=> b!288835 m!421533))

(declare-fun m!421535 () Bool)

(assert (=> b!288842 m!421535))

(declare-fun m!421537 () Bool)

(assert (=> b!288842 m!421537))

(declare-fun m!421539 () Bool)

(assert (=> b!288842 m!421539))

(declare-fun m!421541 () Bool)

(assert (=> b!288840 m!421541))

(declare-fun m!421543 () Bool)

(assert (=> b!288840 m!421543))

(declare-fun m!421545 () Bool)

(assert (=> b!288839 m!421545))

(check-sat (not b!288842) (not start!64338) (not mapNonEmpty!2419) (not b!288840) (not b!288841) (not mapNonEmpty!2420) tp_is_empty!753 (not b!288835) (not b!288839))
(check-sat)

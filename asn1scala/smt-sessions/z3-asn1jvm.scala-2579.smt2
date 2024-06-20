; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64266 () Bool)

(assert start!64266)

(declare-fun b!288115 () Bool)

(declare-fun e!204977 () Bool)

(declare-fun tp_is_empty!687 () Bool)

(declare-fun mapRes!2217 () Bool)

(assert (=> b!288115 (= e!204977 (and tp_is_empty!687 mapRes!2217))))

(declare-fun condMapEmpty!2217 () Bool)

(declare-datatypes ((T!52453 0))(
  ( (T!52454 (val!343 Int)) )
))
(declare-datatypes ((array!16969 0))(
  ( (array!16970 (arr!8330 (Array (_ BitVec 32) T!52453)) (size!7334 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16969)

(declare-fun mapDefault!2218 () T!52453)

(assert (=> b!288115 (= condMapEmpty!2217 (= (arr!8330 a2!596) ((as const (Array (_ BitVec 32) T!52453)) mapDefault!2218)))))

(declare-fun b!288116 () Bool)

(declare-fun e!204975 () Bool)

(declare-fun mapRes!2218 () Bool)

(assert (=> b!288116 (= e!204975 (and tp_is_empty!687 mapRes!2218))))

(declare-fun condMapEmpty!2218 () Bool)

(declare-fun a1!596 () array!16969)

(declare-fun mapDefault!2217 () T!52453)

(assert (=> b!288116 (= condMapEmpty!2218 (= (arr!8330 a1!596) ((as const (Array (_ BitVec 32) T!52453)) mapDefault!2217)))))

(declare-fun b!288117 () Bool)

(declare-fun res!238173 () Bool)

(declare-fun e!204976 () Bool)

(assert (=> b!288117 (=> (not res!238173) (not e!204976))))

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!288117 (= res!238173 (and (= (select (arr!8330 a1!596) to!689) (select (arr!8330 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288118 () Bool)

(declare-fun res!238172 () Bool)

(assert (=> b!288118 (=> (not res!238172) (not e!204976))))

(declare-fun arrayRangesEq!1447 (array!16969 array!16969 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288118 (= res!238172 (arrayRangesEq!1447 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288119 () Bool)

(assert (=> b!288119 (= e!204976 (bvslt i!953 #b00000000000000000000000000000000))))

(declare-fun res!238171 () Bool)

(assert (=> start!64266 (=> (not res!238171) (not e!204976))))

(assert (=> start!64266 (= res!238171 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7334 a1!596) (size!7334 a2!596)) (bvslt to!689 (size!7334 a1!596))))))

(assert (=> start!64266 e!204976))

(declare-fun array_inv!6961 (array!16969) Bool)

(assert (=> start!64266 (and (array_inv!6961 a1!596) e!204975)))

(assert (=> start!64266 (and (array_inv!6961 a2!596) e!204977)))

(assert (=> start!64266 true))

(declare-fun mapIsEmpty!2217 () Bool)

(assert (=> mapIsEmpty!2217 mapRes!2218))

(declare-fun mapIsEmpty!2218 () Bool)

(assert (=> mapIsEmpty!2218 mapRes!2217))

(declare-fun mapNonEmpty!2217 () Bool)

(declare-fun tp!2217 () Bool)

(assert (=> mapNonEmpty!2217 (= mapRes!2218 (and tp!2217 tp_is_empty!687))))

(declare-fun mapKey!2217 () (_ BitVec 32))

(declare-fun mapRest!2217 () (Array (_ BitVec 32) T!52453))

(declare-fun mapValue!2217 () T!52453)

(assert (=> mapNonEmpty!2217 (= (arr!8330 a1!596) (store mapRest!2217 mapKey!2217 mapValue!2217))))

(declare-fun b!288120 () Bool)

(declare-fun res!238174 () Bool)

(assert (=> b!288120 (=> (not res!238174) (not e!204976))))

(assert (=> b!288120 (= res!238174 (arrayRangesEq!1447 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2218 () Bool)

(declare-fun tp!2218 () Bool)

(assert (=> mapNonEmpty!2218 (= mapRes!2217 (and tp!2218 tp_is_empty!687))))

(declare-fun mapRest!2218 () (Array (_ BitVec 32) T!52453))

(declare-fun mapKey!2218 () (_ BitVec 32))

(declare-fun mapValue!2218 () T!52453)

(assert (=> mapNonEmpty!2218 (= (arr!8330 a2!596) (store mapRest!2218 mapKey!2218 mapValue!2218))))

(assert (= (and start!64266 res!238171) b!288118))

(assert (= (and b!288118 res!238172) b!288117))

(assert (= (and b!288117 res!238173) b!288120))

(assert (= (and b!288120 res!238174) b!288119))

(assert (= (and b!288116 condMapEmpty!2218) mapIsEmpty!2217))

(assert (= (and b!288116 (not condMapEmpty!2218)) mapNonEmpty!2217))

(assert (= start!64266 b!288116))

(assert (= (and b!288115 condMapEmpty!2217) mapIsEmpty!2218))

(assert (= (and b!288115 (not condMapEmpty!2217)) mapNonEmpty!2218))

(assert (= start!64266 b!288115))

(declare-fun m!420833 () Bool)

(assert (=> b!288118 m!420833))

(declare-fun m!420835 () Bool)

(assert (=> start!64266 m!420835))

(declare-fun m!420837 () Bool)

(assert (=> start!64266 m!420837))

(declare-fun m!420839 () Bool)

(assert (=> mapNonEmpty!2218 m!420839))

(declare-fun m!420841 () Bool)

(assert (=> b!288120 m!420841))

(declare-fun m!420843 () Bool)

(assert (=> b!288117 m!420843))

(declare-fun m!420845 () Bool)

(assert (=> b!288117 m!420845))

(declare-fun m!420847 () Bool)

(assert (=> mapNonEmpty!2217 m!420847))

(check-sat tp_is_empty!687 (not b!288118) (not mapNonEmpty!2217) (not start!64266) (not b!288120) (not mapNonEmpty!2218))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64302 () Bool)

(assert start!64302)

(declare-fun b!288453 () Bool)

(declare-fun res!238403 () Bool)

(declare-fun e!205137 () Bool)

(assert (=> b!288453 (=> (not res!238403) (not e!205137))))

(declare-datatypes ((T!52609 0))(
  ( (T!52610 (val!361 Int)) )
))
(declare-datatypes ((array!17005 0))(
  ( (array!17006 (arr!8348 (Array (_ BitVec 32) T!52609)) (size!7352 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17005)

(declare-fun a2!596 () array!17005)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1458 (array!17005 array!17005 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288453 (= res!238403 (arrayRangesEq!1458 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2325 () Bool)

(declare-fun mapRes!2326 () Bool)

(declare-fun tp!2326 () Bool)

(declare-fun tp_is_empty!723 () Bool)

(assert (=> mapNonEmpty!2325 (= mapRes!2326 (and tp!2326 tp_is_empty!723))))

(declare-fun mapRest!2325 () (Array (_ BitVec 32) T!52609))

(declare-fun mapKey!2326 () (_ BitVec 32))

(declare-fun mapValue!2326 () T!52609)

(assert (=> mapNonEmpty!2325 (= (arr!8348 a1!596) (store mapRest!2325 mapKey!2326 mapValue!2326))))

(declare-fun res!238404 () Bool)

(assert (=> start!64302 (=> (not res!238404) (not e!205137))))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> start!64302 (= res!238404 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7352 a1!596) (size!7352 a2!596)) (bvslt to!689 (size!7352 a1!596))))))

(assert (=> start!64302 e!205137))

(declare-fun e!205138 () Bool)

(declare-fun array_inv!6971 (array!17005) Bool)

(assert (=> start!64302 (and (array_inv!6971 a1!596) e!205138)))

(declare-fun e!205139 () Bool)

(assert (=> start!64302 (and (array_inv!6971 a2!596) e!205139)))

(assert (=> start!64302 true))

(declare-fun b!288454 () Bool)

(declare-fun res!238402 () Bool)

(assert (=> b!288454 (=> (not res!238402) (not e!205137))))

(assert (=> b!288454 (= res!238402 (not (= i!953 from!722)))))

(declare-fun b!288455 () Bool)

(declare-fun res!238401 () Bool)

(assert (=> b!288455 (=> (not res!238401) (not e!205137))))

(assert (=> b!288455 (= res!238401 (arrayRangesEq!1458 a1!596 a2!596 from!722 to!689))))

(declare-fun mapIsEmpty!2325 () Bool)

(declare-fun mapRes!2325 () Bool)

(assert (=> mapIsEmpty!2325 mapRes!2325))

(declare-fun b!288456 () Bool)

(assert (=> b!288456 (= e!205139 (and tp_is_empty!723 mapRes!2325))))

(declare-fun condMapEmpty!2326 () Bool)

(declare-fun mapDefault!2326 () T!52609)

(assert (=> b!288456 (= condMapEmpty!2326 (= (arr!8348 a2!596) ((as const (Array (_ BitVec 32) T!52609)) mapDefault!2326)))))

(declare-fun b!288457 () Bool)

(declare-fun res!238405 () Bool)

(assert (=> b!288457 (=> (not res!238405) (not e!205137))))

(assert (=> b!288457 (= res!238405 (and (= (select (arr!8348 a1!596) to!689) (select (arr!8348 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288458 () Bool)

(assert (=> b!288458 (= e!205138 (and tp_is_empty!723 mapRes!2326))))

(declare-fun condMapEmpty!2325 () Bool)

(declare-fun mapDefault!2325 () T!52609)

(assert (=> b!288458 (= condMapEmpty!2325 (= (arr!8348 a1!596) ((as const (Array (_ BitVec 32) T!52609)) mapDefault!2325)))))

(declare-fun mapIsEmpty!2326 () Bool)

(assert (=> mapIsEmpty!2326 mapRes!2326))

(declare-fun mapNonEmpty!2326 () Bool)

(declare-fun tp!2325 () Bool)

(assert (=> mapNonEmpty!2326 (= mapRes!2325 (and tp!2325 tp_is_empty!723))))

(declare-fun mapKey!2325 () (_ BitVec 32))

(declare-fun mapValue!2325 () T!52609)

(declare-fun mapRest!2326 () (Array (_ BitVec 32) T!52609))

(assert (=> mapNonEmpty!2326 (= (arr!8348 a2!596) (store mapRest!2326 mapKey!2325 mapValue!2325))))

(declare-fun b!288459 () Bool)

(assert (=> b!288459 (= e!205137 (not (or (= (bvand i!953 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand i!953 #b10000000000000000000000000000000) (bvand (bvsub i!953 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!288459 (= (select (arr!8348 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8348 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19999 0))(
  ( (Unit!20000) )
))
(declare-fun lt!418833 () Unit!19999)

(declare-fun arrayRangesEqImpliesEq!205 (array!17005 array!17005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19999)

(assert (=> b!288459 (= lt!418833 (arrayRangesEqImpliesEq!205 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(assert (= (and start!64302 res!238404) b!288455))

(assert (= (and b!288455 res!238401) b!288457))

(assert (= (and b!288457 res!238405) b!288453))

(assert (= (and b!288453 res!238403) b!288454))

(assert (= (and b!288454 res!238402) b!288459))

(assert (= (and b!288458 condMapEmpty!2325) mapIsEmpty!2326))

(assert (= (and b!288458 (not condMapEmpty!2325)) mapNonEmpty!2325))

(assert (= start!64302 b!288458))

(assert (= (and b!288456 condMapEmpty!2326) mapIsEmpty!2325))

(assert (= (and b!288456 (not condMapEmpty!2326)) mapNonEmpty!2326))

(assert (= start!64302 b!288456))

(declare-fun m!421133 () Bool)

(assert (=> start!64302 m!421133))

(declare-fun m!421135 () Bool)

(assert (=> start!64302 m!421135))

(declare-fun m!421137 () Bool)

(assert (=> b!288459 m!421137))

(declare-fun m!421139 () Bool)

(assert (=> b!288459 m!421139))

(declare-fun m!421141 () Bool)

(assert (=> b!288459 m!421141))

(declare-fun m!421143 () Bool)

(assert (=> b!288453 m!421143))

(declare-fun m!421145 () Bool)

(assert (=> b!288457 m!421145))

(declare-fun m!421147 () Bool)

(assert (=> b!288457 m!421147))

(declare-fun m!421149 () Bool)

(assert (=> b!288455 m!421149))

(declare-fun m!421151 () Bool)

(assert (=> mapNonEmpty!2325 m!421151))

(declare-fun m!421153 () Bool)

(assert (=> mapNonEmpty!2326 m!421153))

(check-sat (not b!288453) (not start!64302) tp_is_empty!723 (not b!288459) (not mapNonEmpty!2326) (not mapNonEmpty!2325) (not b!288455))
(check-sat)

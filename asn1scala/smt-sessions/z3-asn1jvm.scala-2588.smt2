; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64326 () Bool)

(assert start!64326)

(declare-fun mapIsEmpty!2383 () Bool)

(declare-fun mapRes!2383 () Bool)

(assert (=> mapIsEmpty!2383 mapRes!2383))

(declare-fun b!288673 () Bool)

(declare-fun e!205243 () Bool)

(declare-fun tp_is_empty!741 () Bool)

(assert (=> b!288673 (= e!205243 (and tp_is_empty!741 mapRes!2383))))

(declare-fun condMapEmpty!2383 () Bool)

(declare-datatypes ((T!52687 0))(
  ( (T!52688 (val!370 Int)) )
))
(declare-datatypes ((array!17024 0))(
  ( (array!17025 (arr!8357 (Array (_ BitVec 32) T!52687)) (size!7361 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17024)

(declare-fun mapDefault!2384 () T!52687)

(assert (=> b!288673 (= condMapEmpty!2383 (= (arr!8357 a1!596) ((as const (Array (_ BitVec 32) T!52687)) mapDefault!2384)))))

(declare-fun b!288674 () Bool)

(declare-fun res!238570 () Bool)

(declare-fun e!205244 () Bool)

(assert (=> b!288674 (=> (not res!238570) (not e!205244))))

(declare-fun a2!596 () array!17024)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!288674 (= res!238570 (and (= (select (arr!8357 a1!596) to!689) (select (arr!8357 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288675 () Bool)

(declare-fun res!238569 () Bool)

(assert (=> b!288675 (=> (not res!238569) (not e!205244))))

(assert (=> b!288675 (= res!238569 (not (= i!953 from!722)))))

(declare-fun b!288676 () Bool)

(declare-fun res!238567 () Bool)

(assert (=> b!288676 (=> (not res!238567) (not e!205244))))

(declare-fun arrayRangesEq!1466 (array!17024 array!17024 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288676 (= res!238567 (arrayRangesEq!1466 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288677 () Bool)

(declare-fun e!205245 () Bool)

(assert (=> b!288677 (= e!205244 (not e!205245))))

(declare-fun res!238571 () Bool)

(assert (=> b!288677 (=> res!238571 e!205245)))

(assert (=> b!288677 (= res!238571 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!288677 (= (select (arr!8357 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8357 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!20007 0))(
  ( (Unit!20008) )
))
(declare-fun lt!418863 () Unit!20007)

(declare-fun arrayRangesEqImpliesEq!209 (array!17024 array!17024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20007)

(assert (=> b!288677 (= lt!418863 (arrayRangesEqImpliesEq!209 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun b!288678 () Bool)

(declare-fun e!205242 () Bool)

(declare-fun mapRes!2384 () Bool)

(assert (=> b!288678 (= e!205242 (and tp_is_empty!741 mapRes!2384))))

(declare-fun condMapEmpty!2384 () Bool)

(declare-fun mapDefault!2383 () T!52687)

(assert (=> b!288678 (= condMapEmpty!2384 (= (arr!8357 a2!596) ((as const (Array (_ BitVec 32) T!52687)) mapDefault!2383)))))

(declare-fun b!288679 () Bool)

(declare-fun res!238568 () Bool)

(assert (=> b!288679 (=> res!238568 e!205245)))

(assert (=> b!288679 (= res!238568 (not (arrayRangesEq!1466 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!288680 () Bool)

(declare-fun res!238566 () Bool)

(assert (=> b!288680 (=> (not res!238566) (not e!205244))))

(assert (=> b!288680 (= res!238566 (arrayRangesEq!1466 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288681 () Bool)

(assert (=> b!288681 (= e!205245 (bvslt (bvsub i!953 #b00000000000000000000000000000001) i!953))))

(declare-fun mapIsEmpty!2384 () Bool)

(assert (=> mapIsEmpty!2384 mapRes!2384))

(declare-fun mapNonEmpty!2384 () Bool)

(declare-fun tp!2383 () Bool)

(assert (=> mapNonEmpty!2384 (= mapRes!2383 (and tp!2383 tp_is_empty!741))))

(declare-fun mapRest!2383 () (Array (_ BitVec 32) T!52687))

(declare-fun mapKey!2384 () (_ BitVec 32))

(declare-fun mapValue!2384 () T!52687)

(assert (=> mapNonEmpty!2384 (= (arr!8357 a1!596) (store mapRest!2383 mapKey!2384 mapValue!2384))))

(declare-fun res!238565 () Bool)

(assert (=> start!64326 (=> (not res!238565) (not e!205244))))

(assert (=> start!64326 (= res!238565 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7361 a1!596) (size!7361 a2!596)) (bvslt to!689 (size!7361 a1!596))))))

(assert (=> start!64326 e!205244))

(declare-fun array_inv!6975 (array!17024) Bool)

(assert (=> start!64326 (and (array_inv!6975 a1!596) e!205243)))

(assert (=> start!64326 (and (array_inv!6975 a2!596) e!205242)))

(assert (=> start!64326 true))

(declare-fun mapNonEmpty!2383 () Bool)

(declare-fun tp!2384 () Bool)

(assert (=> mapNonEmpty!2383 (= mapRes!2384 (and tp!2384 tp_is_empty!741))))

(declare-fun mapValue!2383 () T!52687)

(declare-fun mapKey!2383 () (_ BitVec 32))

(declare-fun mapRest!2384 () (Array (_ BitVec 32) T!52687))

(assert (=> mapNonEmpty!2383 (= (arr!8357 a2!596) (store mapRest!2384 mapKey!2383 mapValue!2383))))

(assert (= (and start!64326 res!238565) b!288676))

(assert (= (and b!288676 res!238567) b!288674))

(assert (= (and b!288674 res!238570) b!288680))

(assert (= (and b!288680 res!238566) b!288675))

(assert (= (and b!288675 res!238569) b!288677))

(assert (= (and b!288677 (not res!238571)) b!288679))

(assert (= (and b!288679 (not res!238568)) b!288681))

(assert (= (and b!288673 condMapEmpty!2383) mapIsEmpty!2383))

(assert (= (and b!288673 (not condMapEmpty!2383)) mapNonEmpty!2384))

(assert (= start!64326 b!288673))

(assert (= (and b!288678 condMapEmpty!2384) mapIsEmpty!2384))

(assert (= (and b!288678 (not condMapEmpty!2384)) mapNonEmpty!2383))

(assert (= start!64326 b!288678))

(declare-fun m!421359 () Bool)

(assert (=> mapNonEmpty!2384 m!421359))

(declare-fun m!421361 () Bool)

(assert (=> b!288680 m!421361))

(declare-fun m!421363 () Bool)

(assert (=> b!288674 m!421363))

(declare-fun m!421365 () Bool)

(assert (=> b!288674 m!421365))

(declare-fun m!421367 () Bool)

(assert (=> b!288679 m!421367))

(declare-fun m!421369 () Bool)

(assert (=> b!288677 m!421369))

(declare-fun m!421371 () Bool)

(assert (=> b!288677 m!421371))

(declare-fun m!421373 () Bool)

(assert (=> b!288677 m!421373))

(declare-fun m!421375 () Bool)

(assert (=> start!64326 m!421375))

(declare-fun m!421377 () Bool)

(assert (=> start!64326 m!421377))

(declare-fun m!421379 () Bool)

(assert (=> b!288676 m!421379))

(declare-fun m!421381 () Bool)

(assert (=> mapNonEmpty!2383 m!421381))

(check-sat (not b!288680) (not b!288676) (not start!64326) (not b!288677) (not mapNonEmpty!2384) (not mapNonEmpty!2383) (not b!288679) tp_is_empty!741)
(check-sat)

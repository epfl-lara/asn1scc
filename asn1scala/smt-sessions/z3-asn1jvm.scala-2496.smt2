; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63234 () Bool)

(assert start!63234)

(declare-fun b!283422 () Bool)

(declare-fun e!202336 () Bool)

(declare-fun tp_is_empty!387 () Bool)

(declare-fun mapRes!1009 () Bool)

(assert (=> b!283422 (= e!202336 (and tp_is_empty!387 mapRes!1009))))

(declare-fun condMapEmpty!1008 () Bool)

(declare-datatypes ((T!50493 0))(
  ( (T!50494 (val!193 Int)) )
))
(declare-datatypes ((array!16422 0))(
  ( (array!16423 (arr!8090 (Array (_ BitVec 32) T!50493)) (size!7094 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16422)

(declare-fun mapDefault!1008 () T!50493)

(assert (=> b!283422 (= condMapEmpty!1008 (= (arr!8090 a2!471) ((as const (Array (_ BitVec 32) T!50493)) mapDefault!1008)))))

(declare-fun res!234947 () Bool)

(declare-fun e!202335 () Bool)

(assert (=> start!63234 (=> (not res!234947) (not e!202335))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(declare-fun a1!471 () array!16422)

(assert (=> start!63234 (= res!234947 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7094 a1!471)) (= (size!7094 a1!471) (size!7094 a2!471))))))

(assert (=> start!63234 e!202335))

(declare-fun e!202337 () Bool)

(declare-fun array_inv!6789 (array!16422) Bool)

(assert (=> start!63234 (and (array_inv!6789 a1!471) e!202337)))

(assert (=> start!63234 true))

(assert (=> start!63234 (and (array_inv!6789 a2!471) e!202336)))

(declare-fun b!283423 () Bool)

(declare-fun res!234946 () Bool)

(assert (=> b!283423 (=> (not res!234946) (not e!202335))))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun arrayRangesEq!1342 (array!16422 array!16422 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283423 (= res!234946 (arrayRangesEq!1342 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283424 () Bool)

(declare-fun res!234949 () Bool)

(assert (=> b!283424 (=> (not res!234949) (not e!202335))))

(assert (=> b!283424 (= res!234949 (arrayRangesEq!1342 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283425 () Bool)

(assert (=> b!283425 (= e!202335 (not (bvslt (bvsub i!913 #b00000000000000000000000000000001) i!913)))))

(assert (=> b!283425 (= (select (arr!8090 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8090 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19840 0))(
  ( (Unit!19841) )
))
(declare-fun lt!417912 () Unit!19840)

(declare-fun arrayRangesEqImpliesEq!195 (array!16422 array!16422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19840)

(assert (=> b!283425 (= lt!417912 (arrayRangesEqImpliesEq!195 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun mapNonEmpty!1008 () Bool)

(declare-fun tp!1009 () Bool)

(assert (=> mapNonEmpty!1008 (= mapRes!1009 (and tp!1009 tp_is_empty!387))))

(declare-fun mapRest!1009 () (Array (_ BitVec 32) T!50493))

(declare-fun mapValue!1008 () T!50493)

(declare-fun mapKey!1009 () (_ BitVec 32))

(assert (=> mapNonEmpty!1008 (= (arr!8090 a2!471) (store mapRest!1009 mapKey!1009 mapValue!1008))))

(declare-fun b!283426 () Bool)

(declare-fun mapRes!1008 () Bool)

(assert (=> b!283426 (= e!202337 (and tp_is_empty!387 mapRes!1008))))

(declare-fun condMapEmpty!1009 () Bool)

(declare-fun mapDefault!1009 () T!50493)

(assert (=> b!283426 (= condMapEmpty!1009 (= (arr!8090 a1!471) ((as const (Array (_ BitVec 32) T!50493)) mapDefault!1009)))))

(declare-fun b!283427 () Bool)

(declare-fun res!234948 () Bool)

(assert (=> b!283427 (=> (not res!234948) (not e!202335))))

(assert (=> b!283427 (= res!234948 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun mapNonEmpty!1009 () Bool)

(declare-fun tp!1008 () Bool)

(assert (=> mapNonEmpty!1009 (= mapRes!1008 (and tp!1008 tp_is_empty!387))))

(declare-fun mapRest!1008 () (Array (_ BitVec 32) T!50493))

(declare-fun mapValue!1009 () T!50493)

(declare-fun mapKey!1008 () (_ BitVec 32))

(assert (=> mapNonEmpty!1009 (= (arr!8090 a1!471) (store mapRest!1008 mapKey!1008 mapValue!1009))))

(declare-fun mapIsEmpty!1008 () Bool)

(assert (=> mapIsEmpty!1008 mapRes!1008))

(declare-fun b!283428 () Bool)

(declare-fun res!234945 () Bool)

(assert (=> b!283428 (=> (not res!234945) (not e!202335))))

(assert (=> b!283428 (= res!234945 (not (= i!913 from!597)))))

(declare-fun mapIsEmpty!1009 () Bool)

(assert (=> mapIsEmpty!1009 mapRes!1009))

(assert (= (and start!63234 res!234947) b!283424))

(assert (= (and b!283424 res!234949) b!283427))

(assert (= (and b!283427 res!234948) b!283423))

(assert (= (and b!283423 res!234946) b!283428))

(assert (= (and b!283428 res!234945) b!283425))

(assert (= (and b!283426 condMapEmpty!1009) mapIsEmpty!1008))

(assert (= (and b!283426 (not condMapEmpty!1009)) mapNonEmpty!1009))

(assert (= start!63234 b!283426))

(assert (= (and b!283422 condMapEmpty!1008) mapIsEmpty!1009))

(assert (= (and b!283422 (not condMapEmpty!1008)) mapNonEmpty!1008))

(assert (= start!63234 b!283422))

(declare-fun m!416423 () Bool)

(assert (=> mapNonEmpty!1009 m!416423))

(declare-fun m!416425 () Bool)

(assert (=> start!63234 m!416425))

(declare-fun m!416427 () Bool)

(assert (=> start!63234 m!416427))

(declare-fun m!416429 () Bool)

(assert (=> b!283425 m!416429))

(declare-fun m!416431 () Bool)

(assert (=> b!283425 m!416431))

(declare-fun m!416433 () Bool)

(assert (=> b!283425 m!416433))

(declare-fun m!416435 () Bool)

(assert (=> b!283424 m!416435))

(declare-fun m!416437 () Bool)

(assert (=> b!283423 m!416437))

(declare-fun m!416439 () Bool)

(assert (=> mapNonEmpty!1008 m!416439))

(check-sat (not mapNonEmpty!1009) (not b!283423) (not b!283425) tp_is_empty!387 (not mapNonEmpty!1008) (not b!283424) (not start!63234))
(check-sat)

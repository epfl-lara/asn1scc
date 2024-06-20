; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63192 () Bool)

(assert start!63192)

(declare-fun b!283008 () Bool)

(declare-fun e!202147 () Bool)

(declare-fun tp_is_empty!345 () Bool)

(declare-fun mapRes!882 () Bool)

(assert (=> b!283008 (= e!202147 (and tp_is_empty!345 mapRes!882))))

(declare-fun condMapEmpty!882 () Bool)

(declare-datatypes ((T!50311 0))(
  ( (T!50312 (val!172 Int)) )
))
(declare-datatypes ((array!16380 0))(
  ( (array!16381 (arr!8069 (Array (_ BitVec 32) T!50311)) (size!7073 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16380)

(declare-fun mapDefault!883 () T!50311)

(assert (=> b!283008 (= condMapEmpty!882 (= (arr!8069 a1!471) ((as const (Array (_ BitVec 32) T!50311)) mapDefault!883)))))

(declare-fun b!283009 () Bool)

(declare-fun res!234661 () Bool)

(declare-fun e!202148 () Bool)

(assert (=> b!283009 (=> (not res!234661) (not e!202148))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16380)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1328 (array!16380 array!16380 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283009 (= res!234661 (arrayRangesEq!1328 a1!471 a2!471 from!597 to!564))))

(declare-fun mapIsEmpty!882 () Bool)

(assert (=> mapIsEmpty!882 mapRes!882))

(declare-fun b!283010 () Bool)

(declare-fun res!234659 () Bool)

(assert (=> b!283010 (=> (not res!234659) (not e!202148))))

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!283010 (= res!234659 (not (= i!913 from!597)))))

(declare-fun mapIsEmpty!883 () Bool)

(declare-fun mapRes!883 () Bool)

(assert (=> mapIsEmpty!883 mapRes!883))

(declare-fun res!234658 () Bool)

(assert (=> start!63192 (=> (not res!234658) (not e!202148))))

(assert (=> start!63192 (= res!234658 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7073 a1!471)) (= (size!7073 a1!471) (size!7073 a2!471))))))

(assert (=> start!63192 e!202148))

(declare-fun array_inv!6779 (array!16380) Bool)

(assert (=> start!63192 (and (array_inv!6779 a1!471) e!202147)))

(assert (=> start!63192 true))

(declare-fun e!202146 () Bool)

(assert (=> start!63192 (and (array_inv!6779 a2!471) e!202146)))

(declare-fun b!283011 () Bool)

(assert (=> b!283011 (= e!202146 (and tp_is_empty!345 mapRes!883))))

(declare-fun condMapEmpty!883 () Bool)

(declare-fun mapDefault!882 () T!50311)

(assert (=> b!283011 (= condMapEmpty!883 (= (arr!8069 a2!471) ((as const (Array (_ BitVec 32) T!50311)) mapDefault!882)))))

(declare-fun b!283012 () Bool)

(declare-fun res!234657 () Bool)

(assert (=> b!283012 (=> (not res!234657) (not e!202148))))

(assert (=> b!283012 (= res!234657 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283013 () Bool)

(assert (=> b!283013 (= e!202148 (not (bvsle (size!7073 a2!471) (size!7073 a1!471))))))

(declare-datatypes ((Unit!19828 0))(
  ( (Unit!19829) )
))
(declare-fun lt!417873 () Unit!19828)

(declare-fun rec!53 (array!16380 array!16380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19828)

(assert (=> b!283013 (= lt!417873 (rec!53 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)))))

(assert (=> b!283013 (= (select (arr!8069 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8069 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun lt!417872 () Unit!19828)

(declare-fun arrayRangesEqImpliesEq!189 (array!16380 array!16380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19828)

(assert (=> b!283013 (= lt!417872 (arrayRangesEqImpliesEq!189 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun mapNonEmpty!882 () Bool)

(declare-fun tp!882 () Bool)

(assert (=> mapNonEmpty!882 (= mapRes!883 (and tp!882 tp_is_empty!345))))

(declare-fun mapKey!882 () (_ BitVec 32))

(declare-fun mapRest!882 () (Array (_ BitVec 32) T!50311))

(declare-fun mapValue!882 () T!50311)

(assert (=> mapNonEmpty!882 (= (arr!8069 a2!471) (store mapRest!882 mapKey!882 mapValue!882))))

(declare-fun b!283014 () Bool)

(declare-fun res!234660 () Bool)

(assert (=> b!283014 (=> (not res!234660) (not e!202148))))

(assert (=> b!283014 (= res!234660 (arrayRangesEq!1328 a2!471 a1!471 i!913 to!564))))

(declare-fun mapNonEmpty!883 () Bool)

(declare-fun tp!883 () Bool)

(assert (=> mapNonEmpty!883 (= mapRes!882 (and tp!883 tp_is_empty!345))))

(declare-fun mapRest!883 () (Array (_ BitVec 32) T!50311))

(declare-fun mapValue!883 () T!50311)

(declare-fun mapKey!883 () (_ BitVec 32))

(assert (=> mapNonEmpty!883 (= (arr!8069 a1!471) (store mapRest!883 mapKey!883 mapValue!883))))

(assert (= (and start!63192 res!234658) b!283009))

(assert (= (and b!283009 res!234661) b!283012))

(assert (= (and b!283012 res!234657) b!283014))

(assert (= (and b!283014 res!234660) b!283010))

(assert (= (and b!283010 res!234659) b!283013))

(assert (= (and b!283008 condMapEmpty!882) mapIsEmpty!882))

(assert (= (and b!283008 (not condMapEmpty!882)) mapNonEmpty!883))

(assert (= start!63192 b!283008))

(assert (= (and b!283011 condMapEmpty!883) mapIsEmpty!883))

(assert (= (and b!283011 (not condMapEmpty!883)) mapNonEmpty!882))

(assert (= start!63192 b!283011))

(declare-fun m!416101 () Bool)

(assert (=> mapNonEmpty!882 m!416101))

(declare-fun m!416103 () Bool)

(assert (=> b!283009 m!416103))

(declare-fun m!416105 () Bool)

(assert (=> start!63192 m!416105))

(declare-fun m!416107 () Bool)

(assert (=> start!63192 m!416107))

(declare-fun m!416109 () Bool)

(assert (=> mapNonEmpty!883 m!416109))

(declare-fun m!416111 () Bool)

(assert (=> b!283014 m!416111))

(declare-fun m!416113 () Bool)

(assert (=> b!283013 m!416113))

(declare-fun m!416115 () Bool)

(assert (=> b!283013 m!416115))

(declare-fun m!416117 () Bool)

(assert (=> b!283013 m!416117))

(declare-fun m!416119 () Bool)

(assert (=> b!283013 m!416119))

(check-sat (not mapNonEmpty!883) tp_is_empty!345 (not start!63192) (not mapNonEmpty!882) (not b!283009) (not b!283014) (not b!283013))
(check-sat)

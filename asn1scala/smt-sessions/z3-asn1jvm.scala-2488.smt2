; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63186 () Bool)

(assert start!63186)

(declare-fun b!282945 () Bool)

(declare-fun res!234613 () Bool)

(declare-fun e!202120 () Bool)

(assert (=> b!282945 (=> (not res!234613) (not e!202120))))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!282945 (= res!234613 (not (= i!913 from!597)))))

(declare-fun mapNonEmpty!864 () Bool)

(declare-fun mapRes!864 () Bool)

(declare-fun tp!865 () Bool)

(declare-fun tp_is_empty!339 () Bool)

(assert (=> mapNonEmpty!864 (= mapRes!864 (and tp!865 tp_is_empty!339))))

(declare-datatypes ((T!50285 0))(
  ( (T!50286 (val!169 Int)) )
))
(declare-fun mapValue!864 () T!50285)

(declare-fun mapKey!864 () (_ BitVec 32))

(declare-datatypes ((array!16374 0))(
  ( (array!16375 (arr!8066 (Array (_ BitVec 32) T!50285)) (size!7070 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16374)

(declare-fun mapRest!864 () (Array (_ BitVec 32) T!50285))

(assert (=> mapNonEmpty!864 (= (arr!8066 a2!471) (store mapRest!864 mapKey!864 mapValue!864))))

(declare-fun mapIsEmpty!864 () Bool)

(declare-fun mapRes!865 () Bool)

(assert (=> mapIsEmpty!864 mapRes!865))

(declare-fun b!282946 () Bool)

(declare-fun res!234616 () Bool)

(assert (=> b!282946 (=> (not res!234616) (not e!202120))))

(declare-fun a1!471 () array!16374)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun arrayRangesEq!1326 (array!16374 array!16374 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282946 (= res!234616 (arrayRangesEq!1326 a1!471 a2!471 from!597 to!564))))

(declare-fun res!234614 () Bool)

(assert (=> start!63186 (=> (not res!234614) (not e!202120))))

(assert (=> start!63186 (= res!234614 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7070 a1!471)) (= (size!7070 a1!471) (size!7070 a2!471))))))

(assert (=> start!63186 e!202120))

(declare-fun e!202121 () Bool)

(declare-fun array_inv!6778 (array!16374) Bool)

(assert (=> start!63186 (and (array_inv!6778 a1!471) e!202121)))

(assert (=> start!63186 true))

(declare-fun e!202119 () Bool)

(assert (=> start!63186 (and (array_inv!6778 a2!471) e!202119)))

(declare-fun mapIsEmpty!865 () Bool)

(assert (=> mapIsEmpty!865 mapRes!864))

(declare-fun mapNonEmpty!865 () Bool)

(declare-fun tp!864 () Bool)

(assert (=> mapNonEmpty!865 (= mapRes!865 (and tp!864 tp_is_empty!339))))

(declare-fun mapKey!865 () (_ BitVec 32))

(declare-fun mapValue!865 () T!50285)

(declare-fun mapRest!865 () (Array (_ BitVec 32) T!50285))

(assert (=> mapNonEmpty!865 (= (arr!8066 a1!471) (store mapRest!865 mapKey!865 mapValue!865))))

(declare-fun b!282947 () Bool)

(declare-fun res!234615 () Bool)

(assert (=> b!282947 (=> (not res!234615) (not e!202120))))

(assert (=> b!282947 (= res!234615 (arrayRangesEq!1326 a2!471 a1!471 i!913 to!564))))

(declare-fun b!282948 () Bool)

(assert (=> b!282948 (= e!202119 (and tp_is_empty!339 mapRes!864))))

(declare-fun condMapEmpty!864 () Bool)

(declare-fun mapDefault!864 () T!50285)

(assert (=> b!282948 (= condMapEmpty!864 (= (arr!8066 a2!471) ((as const (Array (_ BitVec 32) T!50285)) mapDefault!864)))))

(declare-fun b!282949 () Bool)

(assert (=> b!282949 (= e!202121 (and tp_is_empty!339 mapRes!865))))

(declare-fun condMapEmpty!865 () Bool)

(declare-fun mapDefault!865 () T!50285)

(assert (=> b!282949 (= condMapEmpty!865 (= (arr!8066 a1!471) ((as const (Array (_ BitVec 32) T!50285)) mapDefault!865)))))

(declare-fun b!282950 () Bool)

(declare-fun res!234612 () Bool)

(assert (=> b!282950 (=> (not res!234612) (not e!202120))))

(assert (=> b!282950 (= res!234612 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!282951 () Bool)

(assert (=> b!282951 (= e!202120 (not true))))

(declare-datatypes ((Unit!19826 0))(
  ( (Unit!19827) )
))
(declare-fun lt!417855 () Unit!19826)

(declare-fun rec!52 (array!16374 array!16374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19826)

(assert (=> b!282951 (= lt!417855 (rec!52 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)))))

(assert (=> b!282951 (= (select (arr!8066 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8066 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun lt!417854 () Unit!19826)

(declare-fun arrayRangesEqImpliesEq!188 (array!16374 array!16374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19826)

(assert (=> b!282951 (= lt!417854 (arrayRangesEqImpliesEq!188 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(assert (= (and start!63186 res!234614) b!282946))

(assert (= (and b!282946 res!234616) b!282950))

(assert (= (and b!282950 res!234612) b!282947))

(assert (= (and b!282947 res!234615) b!282945))

(assert (= (and b!282945 res!234613) b!282951))

(assert (= (and b!282949 condMapEmpty!865) mapIsEmpty!864))

(assert (= (and b!282949 (not condMapEmpty!865)) mapNonEmpty!865))

(assert (= start!63186 b!282949))

(assert (= (and b!282948 condMapEmpty!864) mapIsEmpty!865))

(assert (= (and b!282948 (not condMapEmpty!864)) mapNonEmpty!864))

(assert (= start!63186 b!282948))

(declare-fun m!416041 () Bool)

(assert (=> mapNonEmpty!864 m!416041))

(declare-fun m!416043 () Bool)

(assert (=> start!63186 m!416043))

(declare-fun m!416045 () Bool)

(assert (=> start!63186 m!416045))

(declare-fun m!416047 () Bool)

(assert (=> b!282946 m!416047))

(declare-fun m!416049 () Bool)

(assert (=> b!282951 m!416049))

(declare-fun m!416051 () Bool)

(assert (=> b!282951 m!416051))

(declare-fun m!416053 () Bool)

(assert (=> b!282951 m!416053))

(declare-fun m!416055 () Bool)

(assert (=> b!282951 m!416055))

(declare-fun m!416057 () Bool)

(assert (=> b!282947 m!416057))

(declare-fun m!416059 () Bool)

(assert (=> mapNonEmpty!865 m!416059))

(check-sat tp_is_empty!339 (not b!282946) (not b!282947) (not mapNonEmpty!864) (not start!63186) (not mapNonEmpty!865) (not b!282951))
(check-sat)

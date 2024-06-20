; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4046 () Bool)

(assert start!4046)

(declare-datatypes ((T!4087 0))(
  ( (T!4088 (val!10 Int)) )
))
(declare-datatypes ((array!1039 0))(
  ( (array!1040 (arr!869 (Array (_ BitVec 32) T!4087)) (size!440 (_ BitVec 32))) )
))
(declare-fun dst!20 () array!1039)

(declare-fun len!1 () (_ BitVec 32))

(declare-fun fromDst!6 () (_ BitVec 32))

(declare-fun fromSrc!6 () (_ BitVec 32))

(declare-fun src!6 () array!1039)

(assert (=> start!4046 (and (bvsle #b00000000000000000000000000000000 len!1) (bvsle len!1 (size!440 src!6)) (bvsle len!1 (size!440 dst!20)) (bvsle #b00000000000000000000000000000000 fromSrc!6) (bvsle fromSrc!6 (bvsub (size!440 src!6) len!1)) (bvsle #b00000000000000000000000000000000 fromDst!6) (not (= (bvand (size!440 dst!20) #b10000000000000000000000000000000) (bvand len!1 #b10000000000000000000000000000000))) (not (= (bvand (size!440 dst!20) #b10000000000000000000000000000000) (bvand (bvsub (size!440 dst!20) len!1) #b10000000000000000000000000000000))))))

(declare-fun e!10904 () Bool)

(declare-fun array_inv!427 (array!1039) Bool)

(assert (=> start!4046 (and (array_inv!427 dst!20) e!10904)))

(assert (=> start!4046 true))

(declare-fun e!10905 () Bool)

(assert (=> start!4046 (and (array_inv!427 src!6) e!10905)))

(declare-fun b!17179 () Bool)

(declare-fun tp_is_empty!21 () Bool)

(declare-fun mapRes!50 () Bool)

(assert (=> b!17179 (= e!10904 (and tp_is_empty!21 mapRes!50))))

(declare-fun condMapEmpty!50 () Bool)

(declare-fun mapDefault!50 () T!4087)

(assert (=> b!17179 (= condMapEmpty!50 (= (arr!869 dst!20) ((as const (Array (_ BitVec 32) T!4087)) mapDefault!50)))))

(declare-fun mapNonEmpty!50 () Bool)

(declare-fun tp!50 () Bool)

(assert (=> mapNonEmpty!50 (= mapRes!50 (and tp!50 tp_is_empty!21))))

(declare-fun mapRest!51 () (Array (_ BitVec 32) T!4087))

(declare-fun mapKey!51 () (_ BitVec 32))

(declare-fun mapValue!51 () T!4087)

(assert (=> mapNonEmpty!50 (= (arr!869 dst!20) (store mapRest!51 mapKey!51 mapValue!51))))

(declare-fun mapIsEmpty!50 () Bool)

(assert (=> mapIsEmpty!50 mapRes!50))

(declare-fun mapIsEmpty!51 () Bool)

(declare-fun mapRes!51 () Bool)

(assert (=> mapIsEmpty!51 mapRes!51))

(declare-fun b!17180 () Bool)

(assert (=> b!17180 (= e!10905 (and tp_is_empty!21 mapRes!51))))

(declare-fun condMapEmpty!51 () Bool)

(declare-fun mapDefault!51 () T!4087)

(assert (=> b!17180 (= condMapEmpty!51 (= (arr!869 src!6) ((as const (Array (_ BitVec 32) T!4087)) mapDefault!51)))))

(declare-fun mapNonEmpty!51 () Bool)

(declare-fun tp!51 () Bool)

(assert (=> mapNonEmpty!51 (= mapRes!51 (and tp!51 tp_is_empty!21))))

(declare-fun mapKey!50 () (_ BitVec 32))

(declare-fun mapValue!50 () T!4087)

(declare-fun mapRest!50 () (Array (_ BitVec 32) T!4087))

(assert (=> mapNonEmpty!51 (= (arr!869 src!6) (store mapRest!50 mapKey!50 mapValue!50))))

(assert (= (and b!17179 condMapEmpty!50) mapIsEmpty!50))

(assert (= (and b!17179 (not condMapEmpty!50)) mapNonEmpty!50))

(assert (= start!4046 b!17179))

(assert (= (and b!17180 condMapEmpty!51) mapIsEmpty!51))

(assert (= (and b!17180 (not condMapEmpty!51)) mapNonEmpty!51))

(assert (= start!4046 b!17180))

(declare-fun m!23379 () Bool)

(assert (=> start!4046 m!23379))

(declare-fun m!23381 () Bool)

(assert (=> start!4046 m!23381))

(declare-fun m!23383 () Bool)

(assert (=> mapNonEmpty!50 m!23383))

(declare-fun m!23385 () Bool)

(assert (=> mapNonEmpty!51 m!23385))

(check-sat (not start!4046) (not mapNonEmpty!50) (not mapNonEmpty!51) tp_is_empty!21)
(check-sat)

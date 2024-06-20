; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4052 () Bool)

(assert start!4052)

(declare-fun b!17197 () Bool)

(declare-fun e!10923 () Bool)

(declare-fun tp_is_empty!27 () Bool)

(declare-fun mapRes!69 () Bool)

(assert (=> b!17197 (= e!10923 (and tp_is_empty!27 mapRes!69))))

(declare-fun condMapEmpty!68 () Bool)

(declare-datatypes ((T!4113 0))(
  ( (T!4114 (val!13 Int)) )
))
(declare-datatypes ((array!1045 0))(
  ( (array!1046 (arr!872 (Array (_ BitVec 32) T!4113)) (size!443 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1045)

(declare-fun mapDefault!68 () T!4113)

(assert (=> b!17197 (= condMapEmpty!68 (= (arr!872 src!6) ((as const (Array (_ BitVec 32) T!4113)) mapDefault!68)))))

(declare-fun mapNonEmpty!68 () Bool)

(declare-fun tp!69 () Bool)

(assert (=> mapNonEmpty!68 (= mapRes!69 (and tp!69 tp_is_empty!27))))

(declare-fun mapKey!69 () (_ BitVec 32))

(declare-fun mapRest!68 () (Array (_ BitVec 32) T!4113))

(declare-fun mapValue!68 () T!4113)

(assert (=> mapNonEmpty!68 (= (arr!872 src!6) (store mapRest!68 mapKey!69 mapValue!68))))

(declare-fun mapIsEmpty!68 () Bool)

(declare-fun mapRes!68 () Bool)

(assert (=> mapIsEmpty!68 mapRes!68))

(declare-fun dst!20 () array!1045)

(declare-fun len!1 () (_ BitVec 32))

(declare-fun fromDst!6 () (_ BitVec 32))

(declare-fun fromSrc!6 () (_ BitVec 32))

(assert (=> start!4052 (and (bvsle #b00000000000000000000000000000000 len!1) (bvsle len!1 (size!443 src!6)) (bvsle len!1 (size!443 dst!20)) (bvsle #b00000000000000000000000000000000 fromSrc!6) (bvsle fromSrc!6 (bvsub (size!443 src!6) len!1)) (bvsle #b00000000000000000000000000000000 fromDst!6) (bvsle fromDst!6 (bvsub (size!443 dst!20) len!1)) (= (bvand fromSrc!6 #b10000000000000000000000000000000) (bvand len!1 #b10000000000000000000000000000000)) (not (= (bvand fromSrc!6 #b10000000000000000000000000000000) (bvand (bvadd fromSrc!6 len!1) #b10000000000000000000000000000000))))))

(declare-fun e!10922 () Bool)

(declare-fun array_inv!428 (array!1045) Bool)

(assert (=> start!4052 (and (array_inv!428 dst!20) e!10922)))

(assert (=> start!4052 true))

(assert (=> start!4052 (and (array_inv!428 src!6) e!10923)))

(declare-fun mapIsEmpty!69 () Bool)

(assert (=> mapIsEmpty!69 mapRes!69))

(declare-fun mapNonEmpty!69 () Bool)

(declare-fun tp!68 () Bool)

(assert (=> mapNonEmpty!69 (= mapRes!68 (and tp!68 tp_is_empty!27))))

(declare-fun mapValue!69 () T!4113)

(declare-fun mapRest!69 () (Array (_ BitVec 32) T!4113))

(declare-fun mapKey!68 () (_ BitVec 32))

(assert (=> mapNonEmpty!69 (= (arr!872 dst!20) (store mapRest!69 mapKey!68 mapValue!69))))

(declare-fun b!17198 () Bool)

(assert (=> b!17198 (= e!10922 (and tp_is_empty!27 mapRes!68))))

(declare-fun condMapEmpty!69 () Bool)

(declare-fun mapDefault!69 () T!4113)

(assert (=> b!17198 (= condMapEmpty!69 (= (arr!872 dst!20) ((as const (Array (_ BitVec 32) T!4113)) mapDefault!69)))))

(assert (= (and b!17198 condMapEmpty!69) mapIsEmpty!68))

(assert (= (and b!17198 (not condMapEmpty!69)) mapNonEmpty!69))

(assert (= start!4052 b!17198))

(assert (= (and b!17197 condMapEmpty!68) mapIsEmpty!69))

(assert (= (and b!17197 (not condMapEmpty!68)) mapNonEmpty!68))

(assert (= start!4052 b!17197))

(declare-fun m!23403 () Bool)

(assert (=> mapNonEmpty!68 m!23403))

(declare-fun m!23405 () Bool)

(assert (=> start!4052 m!23405))

(declare-fun m!23407 () Bool)

(assert (=> start!4052 m!23407))

(declare-fun m!23409 () Bool)

(assert (=> mapNonEmpty!69 m!23409))

(check-sat (not start!4052) (not mapNonEmpty!69) (not mapNonEmpty!68) tp_is_empty!27)
(check-sat)

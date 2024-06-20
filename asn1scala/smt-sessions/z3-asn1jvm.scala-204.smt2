; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4116 () Bool)

(assert start!4116)

(declare-fun mapNonEmpty!237 () Bool)

(declare-fun mapRes!238 () Bool)

(declare-fun tp!238 () Bool)

(declare-fun tp_is_empty!81 () Bool)

(assert (=> mapNonEmpty!237 (= mapRes!238 (and tp!238 tp_is_empty!81))))

(declare-fun mapKey!237 () (_ BitVec 32))

(declare-datatypes ((T!4347 0))(
  ( (T!4348 (val!40 Int)) )
))
(declare-fun mapRest!237 () (Array (_ BitVec 32) T!4347))

(declare-datatypes ((array!1103 0))(
  ( (array!1104 (arr!899 (Array (_ BitVec 32) T!4347)) (size!470 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1103)

(declare-fun mapValue!237 () T!4347)

(assert (=> mapNonEmpty!237 (= (arr!899 src!2) (store mapRest!237 mapKey!237 mapValue!237))))

(declare-fun b!17373 () Bool)

(declare-fun e!11087 () Bool)

(declare-fun mapRes!237 () Bool)

(assert (=> b!17373 (= e!11087 (and tp_is_empty!81 mapRes!237))))

(declare-fun condMapEmpty!238 () Bool)

(declare-fun dst!10 () array!1103)

(declare-fun mapDefault!238 () T!4347)

(assert (=> b!17373 (= condMapEmpty!238 (= (arr!899 dst!10) ((as const (Array (_ BitVec 32) T!4347)) mapDefault!238)))))

(declare-fun mapNonEmpty!238 () Bool)

(declare-fun tp!237 () Bool)

(assert (=> mapNonEmpty!238 (= mapRes!237 (and tp!237 tp_is_empty!81))))

(declare-fun mapRest!238 () (Array (_ BitVec 32) T!4347))

(declare-fun mapKey!238 () (_ BitVec 32))

(declare-fun mapValue!238 () T!4347)

(assert (=> mapNonEmpty!238 (= (arr!899 dst!10) (store mapRest!238 mapKey!238 mapValue!238))))

(declare-fun b!17374 () Bool)

(declare-fun e!11088 () Bool)

(assert (=> b!17374 (= e!11088 (and tp_is_empty!81 mapRes!238))))

(declare-fun condMapEmpty!237 () Bool)

(declare-fun mapDefault!237 () T!4347)

(assert (=> b!17374 (= condMapEmpty!237 (= (arr!899 src!2) ((as const (Array (_ BitVec 32) T!4347)) mapDefault!237)))))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4116 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!470 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!470 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (= (bvand fromSrc!2 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand fromSrc!2 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 fromSrc!2) #b10000000000000000000000000000000))))))

(declare-fun array_inv!442 (array!1103) Bool)

(assert (=> start!4116 (and (array_inv!442 dst!10) e!11087)))

(assert (=> start!4116 true))

(assert (=> start!4116 (and (array_inv!442 src!2) e!11088)))

(declare-fun mapIsEmpty!237 () Bool)

(assert (=> mapIsEmpty!237 mapRes!238))

(declare-fun mapIsEmpty!238 () Bool)

(assert (=> mapIsEmpty!238 mapRes!237))

(assert (= (and b!17373 condMapEmpty!238) mapIsEmpty!238))

(assert (= (and b!17373 (not condMapEmpty!238)) mapNonEmpty!238))

(assert (= start!4116 b!17373))

(assert (= (and b!17374 condMapEmpty!237) mapIsEmpty!237))

(assert (= (and b!17374 (not condMapEmpty!237)) mapNonEmpty!237))

(assert (= start!4116 b!17374))

(declare-fun m!23635 () Bool)

(assert (=> mapNonEmpty!237 m!23635))

(declare-fun m!23637 () Bool)

(assert (=> mapNonEmpty!238 m!23637))

(declare-fun m!23639 () Bool)

(assert (=> start!4116 m!23639))

(declare-fun m!23641 () Bool)

(assert (=> start!4116 m!23641))

(check-sat (not start!4116) (not mapNonEmpty!238) (not mapNonEmpty!237) tp_is_empty!81)
(check-sat)

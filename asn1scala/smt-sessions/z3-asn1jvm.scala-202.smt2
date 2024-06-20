; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4102 () Bool)

(assert start!4102)

(declare-fun mapIsEmpty!197 () Bool)

(declare-fun mapRes!198 () Bool)

(assert (=> mapIsEmpty!197 mapRes!198))

(declare-fun mapNonEmpty!197 () Bool)

(declare-fun mapRes!197 () Bool)

(declare-fun tp!198 () Bool)

(declare-fun tp_is_empty!69 () Bool)

(assert (=> mapNonEmpty!197 (= mapRes!197 (and tp!198 tp_is_empty!69))))

(declare-datatypes ((T!4295 0))(
  ( (T!4296 (val!34 Int)) )
))
(declare-fun mapRest!197 () (Array (_ BitVec 32) T!4295))

(declare-fun mapKey!198 () (_ BitVec 32))

(declare-fun mapValue!198 () T!4295)

(declare-datatypes ((array!1090 0))(
  ( (array!1091 (arr!893 (Array (_ BitVec 32) T!4295)) (size!464 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1090)

(assert (=> mapNonEmpty!197 (= (arr!893 src!2) (store mapRest!197 mapKey!198 mapValue!198))))

(declare-fun mapNonEmpty!198 () Bool)

(declare-fun tp!197 () Bool)

(assert (=> mapNonEmpty!198 (= mapRes!198 (and tp!197 tp_is_empty!69))))

(declare-fun dst!10 () array!1090)

(declare-fun mapKey!197 () (_ BitVec 32))

(declare-fun mapRest!198 () (Array (_ BitVec 32) T!4295))

(declare-fun mapValue!197 () T!4295)

(assert (=> mapNonEmpty!198 (= (arr!893 dst!10) (store mapRest!198 mapKey!197 mapValue!197))))

(declare-fun b!17335 () Bool)

(declare-fun e!11051 () Bool)

(assert (=> b!17335 (= e!11051 (and tp_is_empty!69 mapRes!197))))

(declare-fun condMapEmpty!198 () Bool)

(declare-fun mapDefault!198 () T!4295)

(assert (=> b!17335 (= condMapEmpty!198 (= (arr!893 src!2) ((as const (Array (_ BitVec 32) T!4295)) mapDefault!198)))))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4102 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!464 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!464 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsge fromSrc!2 (size!464 src!2)))))

(declare-fun e!11052 () Bool)

(declare-fun array_inv!440 (array!1090) Bool)

(assert (=> start!4102 (and (array_inv!440 dst!10) e!11052)))

(assert (=> start!4102 true))

(assert (=> start!4102 (and (array_inv!440 src!2) e!11051)))

(declare-fun mapIsEmpty!198 () Bool)

(assert (=> mapIsEmpty!198 mapRes!197))

(declare-fun b!17336 () Bool)

(assert (=> b!17336 (= e!11052 (and tp_is_empty!69 mapRes!198))))

(declare-fun condMapEmpty!197 () Bool)

(declare-fun mapDefault!197 () T!4295)

(assert (=> b!17336 (= condMapEmpty!197 (= (arr!893 dst!10) ((as const (Array (_ BitVec 32) T!4295)) mapDefault!197)))))

(assert (= (and b!17336 condMapEmpty!197) mapIsEmpty!197))

(assert (= (and b!17336 (not condMapEmpty!197)) mapNonEmpty!198))

(assert (= start!4102 b!17336))

(assert (= (and b!17335 condMapEmpty!198) mapIsEmpty!198))

(assert (= (and b!17335 (not condMapEmpty!198)) mapNonEmpty!197))

(assert (= start!4102 b!17335))

(declare-fun m!23583 () Bool)

(assert (=> mapNonEmpty!197 m!23583))

(declare-fun m!23585 () Bool)

(assert (=> mapNonEmpty!198 m!23585))

(declare-fun m!23587 () Bool)

(assert (=> start!4102 m!23587))

(declare-fun m!23589 () Bool)

(assert (=> start!4102 m!23589))

(check-sat (not start!4102) (not mapNonEmpty!197) (not mapNonEmpty!198) tp_is_empty!69)
(check-sat)

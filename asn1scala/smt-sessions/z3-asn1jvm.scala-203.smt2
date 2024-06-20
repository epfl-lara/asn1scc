; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4108 () Bool)

(assert start!4108)

(declare-fun mapIsEmpty!215 () Bool)

(declare-fun mapRes!215 () Bool)

(assert (=> mapIsEmpty!215 mapRes!215))

(declare-datatypes ((T!4321 0))(
  ( (T!4322 (val!37 Int)) )
))
(declare-datatypes ((array!1096 0))(
  ( (array!1097 (arr!896 (Array (_ BitVec 32) T!4321)) (size!467 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1096)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1096)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4108 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!467 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!467 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsge fromDst!2 (size!467 dst!10)))))

(declare-fun e!11070 () Bool)

(declare-fun array_inv!441 (array!1096) Bool)

(assert (=> start!4108 (and (array_inv!441 dst!10) e!11070)))

(assert (=> start!4108 true))

(declare-fun e!11069 () Bool)

(assert (=> start!4108 (and (array_inv!441 src!2) e!11069)))

(declare-fun b!17353 () Bool)

(declare-fun tp_is_empty!75 () Bool)

(assert (=> b!17353 (= e!11069 (and tp_is_empty!75 mapRes!215))))

(declare-fun condMapEmpty!216 () Bool)

(declare-fun mapDefault!216 () T!4321)

(assert (=> b!17353 (= condMapEmpty!216 (= (arr!896 src!2) ((as const (Array (_ BitVec 32) T!4321)) mapDefault!216)))))

(declare-fun mapNonEmpty!215 () Bool)

(declare-fun tp!216 () Bool)

(assert (=> mapNonEmpty!215 (= mapRes!215 (and tp!216 tp_is_empty!75))))

(declare-fun mapRest!216 () (Array (_ BitVec 32) T!4321))

(declare-fun mapValue!215 () T!4321)

(declare-fun mapKey!215 () (_ BitVec 32))

(assert (=> mapNonEmpty!215 (= (arr!896 src!2) (store mapRest!216 mapKey!215 mapValue!215))))

(declare-fun mapIsEmpty!216 () Bool)

(declare-fun mapRes!216 () Bool)

(assert (=> mapIsEmpty!216 mapRes!216))

(declare-fun mapNonEmpty!216 () Bool)

(declare-fun tp!215 () Bool)

(assert (=> mapNonEmpty!216 (= mapRes!216 (and tp!215 tp_is_empty!75))))

(declare-fun mapValue!216 () T!4321)

(declare-fun mapKey!216 () (_ BitVec 32))

(declare-fun mapRest!215 () (Array (_ BitVec 32) T!4321))

(assert (=> mapNonEmpty!216 (= (arr!896 dst!10) (store mapRest!215 mapKey!216 mapValue!216))))

(declare-fun b!17354 () Bool)

(assert (=> b!17354 (= e!11070 (and tp_is_empty!75 mapRes!216))))

(declare-fun condMapEmpty!215 () Bool)

(declare-fun mapDefault!215 () T!4321)

(assert (=> b!17354 (= condMapEmpty!215 (= (arr!896 dst!10) ((as const (Array (_ BitVec 32) T!4321)) mapDefault!215)))))

(assert (= (and b!17354 condMapEmpty!215) mapIsEmpty!216))

(assert (= (and b!17354 (not condMapEmpty!215)) mapNonEmpty!216))

(assert (= start!4108 b!17354))

(assert (= (and b!17353 condMapEmpty!216) mapIsEmpty!215))

(assert (= (and b!17353 (not condMapEmpty!216)) mapNonEmpty!215))

(assert (= start!4108 b!17353))

(declare-fun m!23607 () Bool)

(assert (=> start!4108 m!23607))

(declare-fun m!23609 () Bool)

(assert (=> start!4108 m!23609))

(declare-fun m!23611 () Bool)

(assert (=> mapNonEmpty!215 m!23611))

(declare-fun m!23613 () Bool)

(assert (=> mapNonEmpty!216 m!23613))

(check-sat (not start!4108) (not mapNonEmpty!215) (not mapNonEmpty!216) tp_is_empty!75)
(check-sat)
(get-model)

(declare-fun d!5660 () Bool)

(assert (=> d!5660 (= (array_inv!441 dst!10) (bvsge (size!467 dst!10) #b00000000000000000000000000000000))))

(assert (=> start!4108 d!5660))

(declare-fun d!5662 () Bool)

(assert (=> d!5662 (= (array_inv!441 src!2) (bvsge (size!467 src!2) #b00000000000000000000000000000000))))

(assert (=> start!4108 d!5662))

(declare-fun condMapEmpty!225 () Bool)

(declare-fun mapDefault!225 () T!4321)

(assert (=> mapNonEmpty!215 (= condMapEmpty!225 (= mapRest!216 ((as const (Array (_ BitVec 32) T!4321)) mapDefault!225)))))

(declare-fun mapRes!225 () Bool)

(assert (=> mapNonEmpty!215 (= tp!216 (and tp_is_empty!75 mapRes!225))))

(declare-fun mapIsEmpty!225 () Bool)

(assert (=> mapIsEmpty!225 mapRes!225))

(declare-fun mapNonEmpty!225 () Bool)

(declare-fun tp!225 () Bool)

(assert (=> mapNonEmpty!225 (= mapRes!225 (and tp!225 tp_is_empty!75))))

(declare-fun mapValue!225 () T!4321)

(declare-fun mapKey!225 () (_ BitVec 32))

(declare-fun mapRest!225 () (Array (_ BitVec 32) T!4321))

(assert (=> mapNonEmpty!225 (= mapRest!216 (store mapRest!225 mapKey!225 mapValue!225))))

(assert (= (and mapNonEmpty!215 condMapEmpty!225) mapIsEmpty!225))

(assert (= (and mapNonEmpty!215 (not condMapEmpty!225)) mapNonEmpty!225))

(declare-fun m!23623 () Bool)

(assert (=> mapNonEmpty!225 m!23623))

(declare-fun condMapEmpty!226 () Bool)

(declare-fun mapDefault!226 () T!4321)

(assert (=> mapNonEmpty!216 (= condMapEmpty!226 (= mapRest!215 ((as const (Array (_ BitVec 32) T!4321)) mapDefault!226)))))

(declare-fun mapRes!226 () Bool)

(assert (=> mapNonEmpty!216 (= tp!215 (and tp_is_empty!75 mapRes!226))))

(declare-fun mapIsEmpty!226 () Bool)

(assert (=> mapIsEmpty!226 mapRes!226))

(declare-fun mapNonEmpty!226 () Bool)

(declare-fun tp!226 () Bool)

(assert (=> mapNonEmpty!226 (= mapRes!226 (and tp!226 tp_is_empty!75))))

(declare-fun mapValue!226 () T!4321)

(declare-fun mapRest!226 () (Array (_ BitVec 32) T!4321))

(declare-fun mapKey!226 () (_ BitVec 32))

(assert (=> mapNonEmpty!226 (= mapRest!215 (store mapRest!226 mapKey!226 mapValue!226))))

(assert (= (and mapNonEmpty!216 condMapEmpty!226) mapIsEmpty!226))

(assert (= (and mapNonEmpty!216 (not condMapEmpty!226)) mapNonEmpty!226))

(declare-fun m!23625 () Bool)

(assert (=> mapNonEmpty!226 m!23625))

(check-sat (not mapNonEmpty!225) (not mapNonEmpty!226) tp_is_empty!75)
(check-sat)

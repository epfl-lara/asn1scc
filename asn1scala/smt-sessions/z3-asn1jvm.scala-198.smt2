; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4074 () Bool)

(assert start!4074)

(declare-fun mapIsEmpty!126 () Bool)

(declare-fun mapRes!126 () Bool)

(assert (=> mapIsEmpty!126 mapRes!126))

(declare-datatypes ((T!4191 0))(
  ( (T!4192 (val!22 Int)) )
))
(declare-datatypes ((array!1064 0))(
  ( (array!1065 (arr!881 (Array (_ BitVec 32) T!4191)) (size!452 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1064)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1064)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4074 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!452 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!452 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromSrc!2)) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromDst!2)))))

(declare-fun e!10989 () Bool)

(declare-fun array_inv!432 (array!1064) Bool)

(assert (=> start!4074 (and (array_inv!432 dst!10) e!10989)))

(assert (=> start!4074 true))

(declare-fun e!10988 () Bool)

(assert (=> start!4074 (and (array_inv!432 src!2) e!10988)))

(declare-fun mapNonEmpty!126 () Bool)

(declare-fun mapRes!127 () Bool)

(declare-fun tp!127 () Bool)

(declare-fun tp_is_empty!45 () Bool)

(assert (=> mapNonEmpty!126 (= mapRes!127 (and tp!127 tp_is_empty!45))))

(declare-fun mapRest!126 () (Array (_ BitVec 32) T!4191))

(declare-fun mapKey!127 () (_ BitVec 32))

(declare-fun mapValue!126 () T!4191)

(assert (=> mapNonEmpty!126 (= (arr!881 src!2) (store mapRest!126 mapKey!127 mapValue!126))))

(declare-fun b!17268 () Bool)

(assert (=> b!17268 (= e!10988 (and tp_is_empty!45 mapRes!127))))

(declare-fun condMapEmpty!127 () Bool)

(declare-fun mapDefault!127 () T!4191)

(assert (=> b!17268 (= condMapEmpty!127 (= (arr!881 src!2) ((as const (Array (_ BitVec 32) T!4191)) mapDefault!127)))))

(declare-fun mapNonEmpty!127 () Bool)

(declare-fun tp!126 () Bool)

(assert (=> mapNonEmpty!127 (= mapRes!126 (and tp!126 tp_is_empty!45))))

(declare-fun mapRest!127 () (Array (_ BitVec 32) T!4191))

(declare-fun mapKey!126 () (_ BitVec 32))

(declare-fun mapValue!127 () T!4191)

(assert (=> mapNonEmpty!127 (= (arr!881 dst!10) (store mapRest!127 mapKey!126 mapValue!127))))

(declare-fun mapIsEmpty!127 () Bool)

(assert (=> mapIsEmpty!127 mapRes!127))

(declare-fun b!17269 () Bool)

(assert (=> b!17269 (= e!10989 (and tp_is_empty!45 mapRes!126))))

(declare-fun condMapEmpty!126 () Bool)

(declare-fun mapDefault!126 () T!4191)

(assert (=> b!17269 (= condMapEmpty!126 (= (arr!881 dst!10) ((as const (Array (_ BitVec 32) T!4191)) mapDefault!126)))))

(assert (= (and b!17269 condMapEmpty!126) mapIsEmpty!126))

(assert (= (and b!17269 (not condMapEmpty!126)) mapNonEmpty!127))

(assert (= start!4074 b!17269))

(assert (= (and b!17268 condMapEmpty!127) mapIsEmpty!127))

(assert (= (and b!17268 (not condMapEmpty!127)) mapNonEmpty!126))

(assert (= start!4074 b!17268))

(declare-fun m!23491 () Bool)

(assert (=> start!4074 m!23491))

(declare-fun m!23493 () Bool)

(assert (=> start!4074 m!23493))

(declare-fun m!23495 () Bool)

(assert (=> mapNonEmpty!126 m!23495))

(declare-fun m!23497 () Bool)

(assert (=> mapNonEmpty!127 m!23497))

(check-sat (not start!4074) (not mapNonEmpty!126) (not mapNonEmpty!127) tp_is_empty!45)
(check-sat)
(get-model)

(declare-fun d!5642 () Bool)

(assert (=> d!5642 (= (array_inv!432 dst!10) (bvsge (size!452 dst!10) #b00000000000000000000000000000000))))

(assert (=> start!4074 d!5642))

(declare-fun d!5644 () Bool)

(assert (=> d!5644 (= (array_inv!432 src!2) (bvsge (size!452 src!2) #b00000000000000000000000000000000))))

(assert (=> start!4074 d!5644))

(declare-fun condMapEmpty!136 () Bool)

(declare-fun mapDefault!136 () T!4191)

(assert (=> mapNonEmpty!126 (= condMapEmpty!136 (= mapRest!126 ((as const (Array (_ BitVec 32) T!4191)) mapDefault!136)))))

(declare-fun mapRes!136 () Bool)

(assert (=> mapNonEmpty!126 (= tp!127 (and tp_is_empty!45 mapRes!136))))

(declare-fun mapIsEmpty!136 () Bool)

(assert (=> mapIsEmpty!136 mapRes!136))

(declare-fun mapNonEmpty!136 () Bool)

(declare-fun tp!136 () Bool)

(assert (=> mapNonEmpty!136 (= mapRes!136 (and tp!136 tp_is_empty!45))))

(declare-fun mapRest!136 () (Array (_ BitVec 32) T!4191))

(declare-fun mapKey!136 () (_ BitVec 32))

(declare-fun mapValue!136 () T!4191)

(assert (=> mapNonEmpty!136 (= mapRest!126 (store mapRest!136 mapKey!136 mapValue!136))))

(assert (= (and mapNonEmpty!126 condMapEmpty!136) mapIsEmpty!136))

(assert (= (and mapNonEmpty!126 (not condMapEmpty!136)) mapNonEmpty!136))

(declare-fun m!23507 () Bool)

(assert (=> mapNonEmpty!136 m!23507))

(declare-fun condMapEmpty!137 () Bool)

(declare-fun mapDefault!137 () T!4191)

(assert (=> mapNonEmpty!127 (= condMapEmpty!137 (= mapRest!127 ((as const (Array (_ BitVec 32) T!4191)) mapDefault!137)))))

(declare-fun mapRes!137 () Bool)

(assert (=> mapNonEmpty!127 (= tp!126 (and tp_is_empty!45 mapRes!137))))

(declare-fun mapIsEmpty!137 () Bool)

(assert (=> mapIsEmpty!137 mapRes!137))

(declare-fun mapNonEmpty!137 () Bool)

(declare-fun tp!137 () Bool)

(assert (=> mapNonEmpty!137 (= mapRes!137 (and tp!137 tp_is_empty!45))))

(declare-fun mapValue!137 () T!4191)

(declare-fun mapKey!137 () (_ BitVec 32))

(declare-fun mapRest!137 () (Array (_ BitVec 32) T!4191))

(assert (=> mapNonEmpty!137 (= mapRest!127 (store mapRest!137 mapKey!137 mapValue!137))))

(assert (= (and mapNonEmpty!127 condMapEmpty!137) mapIsEmpty!137))

(assert (= (and mapNonEmpty!127 (not condMapEmpty!137)) mapNonEmpty!137))

(declare-fun m!23509 () Bool)

(assert (=> mapNonEmpty!137 m!23509))

(check-sat (not mapNonEmpty!136) (not mapNonEmpty!137) tp_is_empty!45)
(check-sat)

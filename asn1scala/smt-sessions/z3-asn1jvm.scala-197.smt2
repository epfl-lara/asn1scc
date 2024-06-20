; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4068 () Bool)

(assert start!4068)

(declare-fun mapIsEmpty!108 () Bool)

(declare-fun mapRes!109 () Bool)

(assert (=> mapIsEmpty!108 mapRes!109))

(declare-fun b!17250 () Bool)

(declare-fun e!10970 () Bool)

(declare-fun tp_is_empty!39 () Bool)

(assert (=> b!17250 (= e!10970 (and tp_is_empty!39 mapRes!109))))

(declare-fun condMapEmpty!108 () Bool)

(declare-datatypes ((T!4165 0))(
  ( (T!4166 (val!19 Int)) )
))
(declare-datatypes ((array!1058 0))(
  ( (array!1059 (arr!878 (Array (_ BitVec 32) T!4165)) (size!449 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1058)

(declare-fun mapDefault!108 () T!4165)

(assert (=> b!17250 (= condMapEmpty!108 (= (arr!878 src!2) ((as const (Array (_ BitVec 32) T!4165)) mapDefault!108)))))

(declare-fun b!17251 () Bool)

(declare-fun e!10971 () Bool)

(declare-fun mapRes!108 () Bool)

(assert (=> b!17251 (= e!10971 (and tp_is_empty!39 mapRes!108))))

(declare-fun condMapEmpty!109 () Bool)

(declare-fun dst!10 () array!1058)

(declare-fun mapDefault!109 () T!4165)

(assert (=> b!17251 (= condMapEmpty!109 (= (arr!878 dst!10) ((as const (Array (_ BitVec 32) T!4165)) mapDefault!109)))))

(declare-fun mapNonEmpty!108 () Bool)

(declare-fun tp!108 () Bool)

(assert (=> mapNonEmpty!108 (= mapRes!109 (and tp!108 tp_is_empty!39))))

(declare-fun mapValue!109 () T!4165)

(declare-fun mapRest!109 () (Array (_ BitVec 32) T!4165))

(declare-fun mapKey!108 () (_ BitVec 32))

(assert (=> mapNonEmpty!108 (= (arr!878 src!2) (store mapRest!109 mapKey!108 mapValue!109))))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4068 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!449 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!449 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromSrc!2)))))

(declare-fun array_inv!430 (array!1058) Bool)

(assert (=> start!4068 (and (array_inv!430 dst!10) e!10971)))

(assert (=> start!4068 true))

(assert (=> start!4068 (and (array_inv!430 src!2) e!10970)))

(declare-fun mapNonEmpty!109 () Bool)

(declare-fun tp!109 () Bool)

(assert (=> mapNonEmpty!109 (= mapRes!108 (and tp!109 tp_is_empty!39))))

(declare-fun mapRest!108 () (Array (_ BitVec 32) T!4165))

(declare-fun mapKey!109 () (_ BitVec 32))

(declare-fun mapValue!108 () T!4165)

(assert (=> mapNonEmpty!109 (= (arr!878 dst!10) (store mapRest!108 mapKey!109 mapValue!108))))

(declare-fun mapIsEmpty!109 () Bool)

(assert (=> mapIsEmpty!109 mapRes!108))

(assert (= (and b!17251 condMapEmpty!109) mapIsEmpty!109))

(assert (= (and b!17251 (not condMapEmpty!109)) mapNonEmpty!109))

(assert (= start!4068 b!17251))

(assert (= (and b!17250 condMapEmpty!108) mapIsEmpty!108))

(assert (= (and b!17250 (not condMapEmpty!108)) mapNonEmpty!108))

(assert (= start!4068 b!17250))

(declare-fun m!23467 () Bool)

(assert (=> mapNonEmpty!108 m!23467))

(declare-fun m!23469 () Bool)

(assert (=> start!4068 m!23469))

(declare-fun m!23471 () Bool)

(assert (=> start!4068 m!23471))

(declare-fun m!23473 () Bool)

(assert (=> mapNonEmpty!109 m!23473))

(check-sat (not start!4068) (not mapNonEmpty!109) (not mapNonEmpty!108) tp_is_empty!39)
(check-sat)

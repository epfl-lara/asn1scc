; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4136 () Bool)

(assert start!4136)

(declare-fun mapNonEmpty!295 () Bool)

(declare-fun mapRes!295 () Bool)

(declare-fun tp!296 () Bool)

(declare-fun tp_is_empty!99 () Bool)

(assert (=> mapNonEmpty!295 (= mapRes!295 (and tp!296 tp_is_empty!99))))

(declare-datatypes ((T!4425 0))(
  ( (T!4426 (val!49 Int)) )
))
(declare-datatypes ((array!1122 0))(
  ( (array!1123 (arr!908 (Array (_ BitVec 32) T!4425)) (size!479 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1122)

(declare-fun mapKey!295 () (_ BitVec 32))

(declare-fun mapValue!295 () T!4425)

(declare-fun mapRest!296 () (Array (_ BitVec 32) T!4425))

(assert (=> mapNonEmpty!295 (= (arr!908 src!2) (store mapRest!296 mapKey!295 mapValue!295))))

(declare-fun b!17434 () Bool)

(declare-fun e!11147 () Bool)

(assert (=> b!17434 (= e!11147 (and tp_is_empty!99 mapRes!295))))

(declare-fun condMapEmpty!296 () Bool)

(declare-fun mapDefault!296 () T!4425)

(assert (=> b!17434 (= condMapEmpty!296 (= (arr!908 src!2) ((as const (Array (_ BitVec 32) T!4425)) mapDefault!296)))))

(declare-fun mapNonEmpty!296 () Bool)

(declare-fun mapRes!296 () Bool)

(declare-fun tp!295 () Bool)

(assert (=> mapNonEmpty!296 (= mapRes!296 (and tp!295 tp_is_empty!99))))

(declare-fun dst!10 () array!1122)

(declare-fun mapValue!296 () T!4425)

(declare-fun mapRest!295 () (Array (_ BitVec 32) T!4425))

(declare-fun mapKey!296 () (_ BitVec 32))

(assert (=> mapNonEmpty!296 (= (arr!908 dst!10) (store mapRest!295 mapKey!296 mapValue!296))))

(declare-fun mapIsEmpty!295 () Bool)

(assert (=> mapIsEmpty!295 mapRes!296))

(declare-fun mapIsEmpty!296 () Bool)

(assert (=> mapIsEmpty!296 mapRes!295))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun b!17436 () Bool)

(declare-fun e!11146 () Bool)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(declare-datatypes ((Unit!1567 0))(
  ( (Unit!1568) )
))
(declare-datatypes ((tuple2!2044 0))(
  ( (tuple2!2045 (_1!1083 Unit!1567) (_2!1083 array!1122)) )
))
(declare-fun arrayCopyOffset!3 (array!1122 array!1122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!2044)

(assert (=> b!17436 (= e!11146 (not (= (size!479 dst!10) (size!479 (_2!1083 (arrayCopyOffset!3 src!2 (array!1123 (store (arr!908 dst!10) fromDst!2 (select (arr!908 src!2) fromSrc!2)) (size!479 dst!10)) (bvadd #b00000000000000000000000000000001 fromSrc!2) toSrc!1 (bvadd #b00000000000000000000000000000001 fromDst!2)))))))))

(declare-fun b!17435 () Bool)

(declare-fun e!11148 () Bool)

(assert (=> b!17435 (= e!11148 (and tp_is_empty!99 mapRes!296))))

(declare-fun condMapEmpty!295 () Bool)

(declare-fun mapDefault!295 () T!4425)

(assert (=> b!17435 (= condMapEmpty!295 (= (arr!908 dst!10) ((as const (Array (_ BitVec 32) T!4425)) mapDefault!295)))))

(declare-fun res!15428 () Bool)

(assert (=> start!4136 (=> (not res!15428) (not e!11146))))

(assert (=> start!4136 (= res!15428 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!479 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!479 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1)))))

(assert (=> start!4136 e!11146))

(declare-fun array_inv!449 (array!1122) Bool)

(assert (=> start!4136 (and (array_inv!449 dst!10) e!11148)))

(assert (=> start!4136 true))

(assert (=> start!4136 (and (array_inv!449 src!2) e!11147)))

(assert (= (and start!4136 res!15428) b!17436))

(assert (= (and b!17435 condMapEmpty!295) mapIsEmpty!295))

(assert (= (and b!17435 (not condMapEmpty!295)) mapNonEmpty!296))

(assert (= start!4136 b!17435))

(assert (= (and b!17434 condMapEmpty!296) mapIsEmpty!296))

(assert (= (and b!17434 (not condMapEmpty!296)) mapNonEmpty!295))

(assert (= start!4136 b!17434))

(declare-fun m!23717 () Bool)

(assert (=> mapNonEmpty!295 m!23717))

(declare-fun m!23719 () Bool)

(assert (=> mapNonEmpty!296 m!23719))

(declare-fun m!23721 () Bool)

(assert (=> b!17436 m!23721))

(declare-fun m!23723 () Bool)

(assert (=> b!17436 m!23723))

(declare-fun m!23725 () Bool)

(assert (=> b!17436 m!23725))

(declare-fun m!23727 () Bool)

(assert (=> start!4136 m!23727))

(declare-fun m!23729 () Bool)

(assert (=> start!4136 m!23729))

(check-sat tp_is_empty!99 (not mapNonEmpty!295) (not mapNonEmpty!296) (not b!17436) (not start!4136))
(check-sat)
(get-model)

(declare-fun d!5676 () Bool)

(assert (=> d!5676 (= (array_inv!449 dst!10) (bvsge (size!479 dst!10) #b00000000000000000000000000000000))))

(assert (=> start!4136 d!5676))

(declare-fun d!5678 () Bool)

(assert (=> d!5678 (= (array_inv!449 src!2) (bvsge (size!479 src!2) #b00000000000000000000000000000000))))

(assert (=> start!4136 d!5678))

(declare-fun d!5680 () Bool)

(declare-fun lt!25275 () tuple2!2044)

(assert (=> d!5680 (= (size!479 (array!1123 (store (arr!908 dst!10) fromDst!2 (select (arr!908 src!2) fromSrc!2)) (size!479 dst!10))) (size!479 (_2!1083 lt!25275)))))

(declare-fun e!11160 () tuple2!2044)

(assert (=> d!5680 (= lt!25275 e!11160)))

(declare-fun c!1315 () Bool)

(assert (=> d!5680 (= c!1315 (bvslt (bvadd #b00000000000000000000000000000001 fromSrc!2) toSrc!1))))

(assert (=> d!5680 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromSrc!2)) (bvsle (bvadd #b00000000000000000000000000000001 fromSrc!2) toSrc!1))))

(assert (=> d!5680 (= (arrayCopyOffset!3 src!2 (array!1123 (store (arr!908 dst!10) fromDst!2 (select (arr!908 src!2) fromSrc!2)) (size!479 dst!10)) (bvadd #b00000000000000000000000000000001 fromSrc!2) toSrc!1 (bvadd #b00000000000000000000000000000001 fromDst!2)) lt!25275)))

(declare-fun b!17450 () Bool)

(declare-fun lt!25276 () tuple2!2044)

(assert (=> b!17450 (= e!11160 (tuple2!2045 (_1!1083 lt!25276) (_2!1083 lt!25276)))))

(assert (=> b!17450 (= lt!25276 (arrayCopyOffset!3 src!2 (array!1123 (store (arr!908 (array!1123 (store (arr!908 dst!10) fromDst!2 (select (arr!908 src!2) fromSrc!2)) (size!479 dst!10))) (bvadd #b00000000000000000000000000000001 fromDst!2) (select (arr!908 src!2) (bvadd #b00000000000000000000000000000001 fromSrc!2))) (size!479 (array!1123 (store (arr!908 dst!10) fromDst!2 (select (arr!908 src!2) fromSrc!2)) (size!479 dst!10)))) (bvadd #b00000000000000000000000000000001 fromSrc!2 #b00000000000000000000000000000001) toSrc!1 (bvadd #b00000000000000000000000000000001 fromDst!2 #b00000000000000000000000000000001)))))

(declare-fun b!17451 () Bool)

(declare-fun Unit!1571 () Unit!1567)

(assert (=> b!17451 (= e!11160 (tuple2!2045 Unit!1571 (array!1123 (store (arr!908 dst!10) fromDst!2 (select (arr!908 src!2) fromSrc!2)) (size!479 dst!10))))))

(assert (= (and d!5680 c!1315) b!17450))

(assert (= (and d!5680 (not c!1315)) b!17451))

(declare-fun m!23745 () Bool)

(assert (=> b!17450 m!23745))

(declare-fun m!23747 () Bool)

(assert (=> b!17450 m!23747))

(declare-fun m!23749 () Bool)

(assert (=> b!17450 m!23749))

(assert (=> b!17436 d!5680))

(declare-fun condMapEmpty!305 () Bool)

(declare-fun mapDefault!305 () T!4425)

(assert (=> mapNonEmpty!296 (= condMapEmpty!305 (= mapRest!295 ((as const (Array (_ BitVec 32) T!4425)) mapDefault!305)))))

(declare-fun mapRes!305 () Bool)

(assert (=> mapNonEmpty!296 (= tp!295 (and tp_is_empty!99 mapRes!305))))

(declare-fun mapIsEmpty!305 () Bool)

(assert (=> mapIsEmpty!305 mapRes!305))

(declare-fun mapNonEmpty!305 () Bool)

(declare-fun tp!305 () Bool)

(assert (=> mapNonEmpty!305 (= mapRes!305 (and tp!305 tp_is_empty!99))))

(declare-fun mapValue!305 () T!4425)

(declare-fun mapKey!305 () (_ BitVec 32))

(declare-fun mapRest!305 () (Array (_ BitVec 32) T!4425))

(assert (=> mapNonEmpty!305 (= mapRest!295 (store mapRest!305 mapKey!305 mapValue!305))))

(assert (= (and mapNonEmpty!296 condMapEmpty!305) mapIsEmpty!305))

(assert (= (and mapNonEmpty!296 (not condMapEmpty!305)) mapNonEmpty!305))

(declare-fun m!23751 () Bool)

(assert (=> mapNonEmpty!305 m!23751))

(declare-fun condMapEmpty!306 () Bool)

(declare-fun mapDefault!306 () T!4425)

(assert (=> mapNonEmpty!295 (= condMapEmpty!306 (= mapRest!296 ((as const (Array (_ BitVec 32) T!4425)) mapDefault!306)))))

(declare-fun mapRes!306 () Bool)

(assert (=> mapNonEmpty!295 (= tp!296 (and tp_is_empty!99 mapRes!306))))

(declare-fun mapIsEmpty!306 () Bool)

(assert (=> mapIsEmpty!306 mapRes!306))

(declare-fun mapNonEmpty!306 () Bool)

(declare-fun tp!306 () Bool)

(assert (=> mapNonEmpty!306 (= mapRes!306 (and tp!306 tp_is_empty!99))))

(declare-fun mapKey!306 () (_ BitVec 32))

(declare-fun mapRest!306 () (Array (_ BitVec 32) T!4425))

(declare-fun mapValue!306 () T!4425)

(assert (=> mapNonEmpty!306 (= mapRest!296 (store mapRest!306 mapKey!306 mapValue!306))))

(assert (= (and mapNonEmpty!295 condMapEmpty!306) mapIsEmpty!306))

(assert (= (and mapNonEmpty!295 (not condMapEmpty!306)) mapNonEmpty!306))

(declare-fun m!23753 () Bool)

(assert (=> mapNonEmpty!306 m!23753))

(check-sat (not b!17450) (not mapNonEmpty!305) (not mapNonEmpty!306) tp_is_empty!99)
(check-sat)

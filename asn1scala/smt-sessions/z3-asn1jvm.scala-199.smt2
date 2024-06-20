; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4082 () Bool)

(assert start!4082)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-datatypes ((T!4217 0))(
  ( (T!4218 (val!25 Int)) )
))
(declare-datatypes ((array!1071 0))(
  ( (array!1072 (arr!884 (Array (_ BitVec 32) T!4217)) (size!455 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1071)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4082 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!455 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand fromSrc!2 #b10000000000000000000000000000000))) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand (bvsub toSrc!1 fromSrc!2) #b10000000000000000000000000000000))))))

(assert (=> start!4082 true))

(declare-fun e!11001 () Bool)

(declare-fun array_inv!435 (array!1071) Bool)

(assert (=> start!4082 (and (array_inv!435 src!2) e!11001)))

(declare-fun b!17283 () Bool)

(declare-fun tp_is_empty!51 () Bool)

(declare-fun mapRes!143 () Bool)

(assert (=> b!17283 (= e!11001 (and tp_is_empty!51 mapRes!143))))

(declare-fun condMapEmpty!143 () Bool)

(declare-fun mapDefault!143 () T!4217)

(assert (=> b!17283 (= condMapEmpty!143 (= (arr!884 src!2) ((as const (Array (_ BitVec 32) T!4217)) mapDefault!143)))))

(declare-fun mapIsEmpty!143 () Bool)

(assert (=> mapIsEmpty!143 mapRes!143))

(declare-fun mapNonEmpty!143 () Bool)

(declare-fun tp!143 () Bool)

(assert (=> mapNonEmpty!143 (= mapRes!143 (and tp!143 tp_is_empty!51))))

(declare-fun mapKey!143 () (_ BitVec 32))

(declare-fun mapRest!143 () (Array (_ BitVec 32) T!4217))

(declare-fun mapValue!143 () T!4217)

(assert (=> mapNonEmpty!143 (= (arr!884 src!2) (store mapRest!143 mapKey!143 mapValue!143))))

(assert (= (and b!17283 condMapEmpty!143) mapIsEmpty!143))

(assert (= (and b!17283 (not condMapEmpty!143)) mapNonEmpty!143))

(assert (= start!4082 b!17283))

(declare-fun m!23515 () Bool)

(assert (=> start!4082 m!23515))

(declare-fun m!23517 () Bool)

(assert (=> mapNonEmpty!143 m!23517))

(check-sat (not start!4082) (not mapNonEmpty!143) tp_is_empty!51)
(check-sat)

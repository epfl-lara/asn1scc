; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24540 () Bool)

(assert start!24540)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-datatypes ((T!16923 0))(
  ( (T!16924 (val!58 Int)) )
))
(declare-datatypes ((array!5507 0))(
  ( (array!5508 (arr!3085 (Array (_ BitVec 32) T!16923)) (size!2492 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5507)

(assert (=> start!24540 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2492 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand fromA1!7 #b10000000000000000000000000000000))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand (bvsub toA1!7 fromA1!7) #b10000000000000000000000000000000))))))

(assert (=> start!24540 true))

(declare-fun e!81746 () Bool)

(declare-fun array_inv!2293 (array!5507) Bool)

(assert (=> start!24540 (and (array_inv!2293 a1!447) e!81746)))

(declare-fun b!124610 () Bool)

(declare-fun tp_is_empty!117 () Bool)

(declare-fun mapRes!352 () Bool)

(assert (=> b!124610 (= e!81746 (and tp_is_empty!117 mapRes!352))))

(declare-fun condMapEmpty!352 () Bool)

(declare-fun mapDefault!352 () T!16923)

(assert (=> b!124610 (= condMapEmpty!352 (= (arr!3085 a1!447) ((as const (Array (_ BitVec 32) T!16923)) mapDefault!352)))))

(declare-fun mapIsEmpty!352 () Bool)

(assert (=> mapIsEmpty!352 mapRes!352))

(declare-fun mapNonEmpty!352 () Bool)

(declare-fun tp!352 () Bool)

(assert (=> mapNonEmpty!352 (= mapRes!352 (and tp!352 tp_is_empty!117))))

(declare-fun mapValue!352 () T!16923)

(declare-fun mapRest!352 () (Array (_ BitVec 32) T!16923))

(declare-fun mapKey!352 () (_ BitVec 32))

(assert (=> mapNonEmpty!352 (= (arr!3085 a1!447) (store mapRest!352 mapKey!352 mapValue!352))))

(assert (= (and b!124610 condMapEmpty!352) mapIsEmpty!352))

(assert (= (and b!124610 (not condMapEmpty!352)) mapNonEmpty!352))

(assert (= start!24540 b!124610))

(declare-fun m!189865 () Bool)

(assert (=> start!24540 m!189865))

(declare-fun m!189867 () Bool)

(assert (=> mapNonEmpty!352 m!189867))

(check-sat (not start!24540) (not mapNonEmpty!352) tp_is_empty!117)
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24554 () Bool)

(assert start!24554)

(declare-datatypes ((T!16975 0))(
  ( (T!16976 (val!64 Int)) )
))
(declare-datatypes ((array!5520 0))(
  ( (array!5521 (arr!3091 (Array (_ BitVec 32) T!16975)) (size!2498 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5520)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5520)

(assert (=> start!24554 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2498 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2498 a2!447) (bvsub toA1!7 fromA1!7))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand fromA1!7 #b10000000000000000000000000000000))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand (bvsub toA1!7 fromA1!7) #b10000000000000000000000000000000))))))

(declare-fun e!81778 () Bool)

(declare-fun array_inv!2297 (array!5520) Bool)

(assert (=> start!24554 (and (array_inv!2297 a2!447) e!81778)))

(assert (=> start!24554 true))

(declare-fun e!81779 () Bool)

(assert (=> start!24554 (and (array_inv!2297 a1!447) e!81779)))

(declare-fun mapIsEmpty!388 () Bool)

(declare-fun mapRes!388 () Bool)

(assert (=> mapIsEmpty!388 mapRes!388))

(declare-fun mapNonEmpty!388 () Bool)

(declare-fun tp!389 () Bool)

(declare-fun tp_is_empty!129 () Bool)

(assert (=> mapNonEmpty!388 (= mapRes!388 (and tp!389 tp_is_empty!129))))

(declare-fun mapValue!389 () T!16975)

(declare-fun mapRest!389 () (Array (_ BitVec 32) T!16975))

(declare-fun mapKey!388 () (_ BitVec 32))

(assert (=> mapNonEmpty!388 (= (arr!3091 a1!447) (store mapRest!389 mapKey!388 mapValue!389))))

(declare-fun mapIsEmpty!389 () Bool)

(declare-fun mapRes!389 () Bool)

(assert (=> mapIsEmpty!389 mapRes!389))

(declare-fun mapNonEmpty!389 () Bool)

(declare-fun tp!388 () Bool)

(assert (=> mapNonEmpty!389 (= mapRes!389 (and tp!388 tp_is_empty!129))))

(declare-fun mapRest!388 () (Array (_ BitVec 32) T!16975))

(declare-fun mapValue!388 () T!16975)

(declare-fun mapKey!389 () (_ BitVec 32))

(assert (=> mapNonEmpty!389 (= (arr!3091 a2!447) (store mapRest!388 mapKey!389 mapValue!388))))

(declare-fun b!124644 () Bool)

(assert (=> b!124644 (= e!81779 (and tp_is_empty!129 mapRes!388))))

(declare-fun condMapEmpty!389 () Bool)

(declare-fun mapDefault!389 () T!16975)

(assert (=> b!124644 (= condMapEmpty!389 (= (arr!3091 a1!447) ((as const (Array (_ BitVec 32) T!16975)) mapDefault!389)))))

(declare-fun b!124645 () Bool)

(assert (=> b!124645 (= e!81778 (and tp_is_empty!129 mapRes!389))))

(declare-fun condMapEmpty!388 () Bool)

(declare-fun mapDefault!388 () T!16975)

(assert (=> b!124645 (= condMapEmpty!388 (= (arr!3091 a2!447) ((as const (Array (_ BitVec 32) T!16975)) mapDefault!388)))))

(assert (= (and b!124645 condMapEmpty!388) mapIsEmpty!389))

(assert (= (and b!124645 (not condMapEmpty!388)) mapNonEmpty!389))

(assert (= start!24554 b!124645))

(assert (= (and b!124644 condMapEmpty!389) mapIsEmpty!388))

(assert (= (and b!124644 (not condMapEmpty!389)) mapNonEmpty!388))

(assert (= start!24554 b!124644))

(declare-fun m!189909 () Bool)

(assert (=> start!24554 m!189909))

(declare-fun m!189911 () Bool)

(assert (=> start!24554 m!189911))

(declare-fun m!189913 () Bool)

(assert (=> mapNonEmpty!388 m!189913))

(declare-fun m!189915 () Bool)

(assert (=> mapNonEmpty!389 m!189915))

(check-sat (not start!24554) (not mapNonEmpty!388) (not mapNonEmpty!389) tp_is_empty!129)
(check-sat)

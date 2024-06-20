; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24526 () Bool)

(assert start!24526)

(declare-datatypes ((T!16871 0))(
  ( (T!16872 (val!52 Int)) )
))
(declare-datatypes ((array!5494 0))(
  ( (array!5495 (arr!3079 (Array (_ BitVec 32) T!16871)) (size!2486 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5494)

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5494)

(declare-fun fromA2!7 () (_ BitVec 32))

(assert (=> start!24526 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2486 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2486 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3079 a1!447) fromA1!7) (select (arr!3079 a2!447) fromA2!7)) (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA1!7)) (bvsgt (bvadd #b00000000000000000000000000000001 fromA1!7) toA1!7)))))

(declare-fun e!81716 () Bool)

(declare-fun array_inv!2287 (array!5494) Bool)

(assert (=> start!24526 (and (array_inv!2287 a2!447) e!81716)))

(assert (=> start!24526 true))

(declare-fun e!81715 () Bool)

(assert (=> start!24526 (and (array_inv!2287 a1!447) e!81715)))

(declare-fun mapIsEmpty!317 () Bool)

(declare-fun mapRes!318 () Bool)

(assert (=> mapIsEmpty!317 mapRes!318))

(declare-fun mapNonEmpty!317 () Bool)

(declare-fun mapRes!317 () Bool)

(declare-fun tp!317 () Bool)

(declare-fun tp_is_empty!105 () Bool)

(assert (=> mapNonEmpty!317 (= mapRes!317 (and tp!317 tp_is_empty!105))))

(declare-fun mapRest!318 () (Array (_ BitVec 32) T!16871))

(declare-fun mapValue!317 () T!16871)

(declare-fun mapKey!318 () (_ BitVec 32))

(assert (=> mapNonEmpty!317 (= (arr!3079 a1!447) (store mapRest!318 mapKey!318 mapValue!317))))

(declare-fun b!124577 () Bool)

(assert (=> b!124577 (= e!81716 (and tp_is_empty!105 mapRes!318))))

(declare-fun condMapEmpty!318 () Bool)

(declare-fun mapDefault!317 () T!16871)

(assert (=> b!124577 (= condMapEmpty!318 (= (arr!3079 a2!447) ((as const (Array (_ BitVec 32) T!16871)) mapDefault!317)))))

(declare-fun mapIsEmpty!318 () Bool)

(assert (=> mapIsEmpty!318 mapRes!317))

(declare-fun b!124578 () Bool)

(assert (=> b!124578 (= e!81715 (and tp_is_empty!105 mapRes!317))))

(declare-fun condMapEmpty!317 () Bool)

(declare-fun mapDefault!318 () T!16871)

(assert (=> b!124578 (= condMapEmpty!317 (= (arr!3079 a1!447) ((as const (Array (_ BitVec 32) T!16871)) mapDefault!318)))))

(declare-fun mapNonEmpty!318 () Bool)

(declare-fun tp!318 () Bool)

(assert (=> mapNonEmpty!318 (= mapRes!318 (and tp!318 tp_is_empty!105))))

(declare-fun mapValue!318 () T!16871)

(declare-fun mapRest!317 () (Array (_ BitVec 32) T!16871))

(declare-fun mapKey!317 () (_ BitVec 32))

(assert (=> mapNonEmpty!318 (= (arr!3079 a2!447) (store mapRest!317 mapKey!317 mapValue!318))))

(assert (= (and b!124577 condMapEmpty!318) mapIsEmpty!317))

(assert (= (and b!124577 (not condMapEmpty!318)) mapNonEmpty!318))

(assert (= start!24526 b!124577))

(assert (= (and b!124578 condMapEmpty!317) mapIsEmpty!318))

(assert (= (and b!124578 (not condMapEmpty!317)) mapNonEmpty!317))

(assert (= start!24526 b!124578))

(declare-fun m!189797 () Bool)

(assert (=> start!24526 m!189797))

(declare-fun m!189799 () Bool)

(assert (=> start!24526 m!189799))

(declare-fun m!189801 () Bool)

(assert (=> start!24526 m!189801))

(declare-fun m!189803 () Bool)

(assert (=> start!24526 m!189803))

(declare-fun m!189805 () Bool)

(assert (=> mapNonEmpty!317 m!189805))

(declare-fun m!189807 () Bool)

(assert (=> mapNonEmpty!318 m!189807))

(check-sat (not start!24526) (not mapNonEmpty!317) (not mapNonEmpty!318) tp_is_empty!105)
(check-sat)

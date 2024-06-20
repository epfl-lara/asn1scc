; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24560 () Bool)

(assert start!24560)

(declare-fun mapIsEmpty!406 () Bool)

(declare-fun mapRes!406 () Bool)

(assert (=> mapIsEmpty!406 mapRes!406))

(declare-fun b!124662 () Bool)

(declare-fun e!81797 () Bool)

(declare-fun tp_is_empty!135 () Bool)

(assert (=> b!124662 (= e!81797 (and tp_is_empty!135 mapRes!406))))

(declare-fun condMapEmpty!406 () Bool)

(declare-datatypes ((T!17001 0))(
  ( (T!17002 (val!67 Int)) )
))
(declare-datatypes ((array!5526 0))(
  ( (array!5527 (arr!3094 (Array (_ BitVec 32) T!17001)) (size!2501 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5526)

(declare-fun mapDefault!406 () T!17001)

(assert (=> b!124662 (= condMapEmpty!406 (= (arr!3094 a1!447) ((as const (Array (_ BitVec 32) T!17001)) mapDefault!406)))))

(declare-fun mapIsEmpty!407 () Bool)

(declare-fun mapRes!407 () Bool)

(assert (=> mapIsEmpty!407 mapRes!407))

(declare-fun a2!447 () array!5526)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(assert (=> start!24560 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2501 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2501 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (bvsge fromA1!7 (size!2501 a1!447)))))

(declare-fun e!81796 () Bool)

(declare-fun array_inv!2298 (array!5526) Bool)

(assert (=> start!24560 (and (array_inv!2298 a2!447) e!81796)))

(assert (=> start!24560 true))

(assert (=> start!24560 (and (array_inv!2298 a1!447) e!81797)))

(declare-fun mapNonEmpty!406 () Bool)

(declare-fun tp!406 () Bool)

(assert (=> mapNonEmpty!406 (= mapRes!407 (and tp!406 tp_is_empty!135))))

(declare-fun mapRest!407 () (Array (_ BitVec 32) T!17001))

(declare-fun mapValue!407 () T!17001)

(declare-fun mapKey!407 () (_ BitVec 32))

(assert (=> mapNonEmpty!406 (= (arr!3094 a2!447) (store mapRest!407 mapKey!407 mapValue!407))))

(declare-fun b!124663 () Bool)

(assert (=> b!124663 (= e!81796 (and tp_is_empty!135 mapRes!407))))

(declare-fun condMapEmpty!407 () Bool)

(declare-fun mapDefault!407 () T!17001)

(assert (=> b!124663 (= condMapEmpty!407 (= (arr!3094 a2!447) ((as const (Array (_ BitVec 32) T!17001)) mapDefault!407)))))

(declare-fun mapNonEmpty!407 () Bool)

(declare-fun tp!407 () Bool)

(assert (=> mapNonEmpty!407 (= mapRes!406 (and tp!407 tp_is_empty!135))))

(declare-fun mapValue!406 () T!17001)

(declare-fun mapRest!406 () (Array (_ BitVec 32) T!17001))

(declare-fun mapKey!406 () (_ BitVec 32))

(assert (=> mapNonEmpty!407 (= (arr!3094 a1!447) (store mapRest!406 mapKey!406 mapValue!406))))

(assert (= (and b!124663 condMapEmpty!407) mapIsEmpty!407))

(assert (= (and b!124663 (not condMapEmpty!407)) mapNonEmpty!406))

(assert (= start!24560 b!124663))

(assert (= (and b!124662 condMapEmpty!406) mapIsEmpty!406))

(assert (= (and b!124662 (not condMapEmpty!406)) mapNonEmpty!407))

(assert (= start!24560 b!124662))

(declare-fun m!189933 () Bool)

(assert (=> start!24560 m!189933))

(declare-fun m!189935 () Bool)

(assert (=> start!24560 m!189935))

(declare-fun m!189937 () Bool)

(assert (=> mapNonEmpty!406 m!189937))

(declare-fun m!189939 () Bool)

(assert (=> mapNonEmpty!407 m!189939))

(check-sat (not start!24560) (not mapNonEmpty!407) (not mapNonEmpty!406) tp_is_empty!135)
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24588 () Bool)

(assert start!24588)

(declare-datatypes ((T!17105 0))(
  ( (T!17106 (val!79 Int)) )
))
(declare-datatypes ((array!5552 0))(
  ( (array!5553 (arr!3106 (Array (_ BitVec 32) T!17105)) (size!2513 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5552)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5552)

(assert (=> start!24588 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2513 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2513 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3106 a1!447) fromA1!7) (select (arr!3106 a2!447) fromA2!7)) (bvsge (bvsub toA1!7 (bvadd #b00000000000000000000000000000001 fromA1!7)) (bvsub toA1!7 fromA1!7)))))

(declare-fun e!81868 () Bool)

(declare-fun array_inv!2303 (array!5552) Bool)

(assert (=> start!24588 (and (array_inv!2303 a2!447) e!81868)))

(assert (=> start!24588 true))

(declare-fun e!81869 () Bool)

(assert (=> start!24588 (and (array_inv!2303 a1!447) e!81869)))

(declare-fun mapIsEmpty!486 () Bool)

(declare-fun mapRes!486 () Bool)

(assert (=> mapIsEmpty!486 mapRes!486))

(declare-fun mapNonEmpty!486 () Bool)

(declare-fun tp!487 () Bool)

(declare-fun tp_is_empty!159 () Bool)

(assert (=> mapNonEmpty!486 (= mapRes!486 (and tp!487 tp_is_empty!159))))

(declare-fun mapRest!486 () (Array (_ BitVec 32) T!17105))

(declare-fun mapKey!487 () (_ BitVec 32))

(declare-fun mapValue!486 () T!17105)

(assert (=> mapNonEmpty!486 (= (arr!3106 a1!447) (store mapRest!486 mapKey!487 mapValue!486))))

(declare-fun b!124738 () Bool)

(assert (=> b!124738 (= e!81869 (and tp_is_empty!159 mapRes!486))))

(declare-fun condMapEmpty!487 () Bool)

(declare-fun mapDefault!486 () T!17105)

(assert (=> b!124738 (= condMapEmpty!487 (= (arr!3106 a1!447) ((as const (Array (_ BitVec 32) T!17105)) mapDefault!486)))))

(declare-fun b!124739 () Bool)

(declare-fun mapRes!487 () Bool)

(assert (=> b!124739 (= e!81868 (and tp_is_empty!159 mapRes!487))))

(declare-fun condMapEmpty!486 () Bool)

(declare-fun mapDefault!487 () T!17105)

(assert (=> b!124739 (= condMapEmpty!486 (= (arr!3106 a2!447) ((as const (Array (_ BitVec 32) T!17105)) mapDefault!487)))))

(declare-fun mapIsEmpty!487 () Bool)

(assert (=> mapIsEmpty!487 mapRes!487))

(declare-fun mapNonEmpty!487 () Bool)

(declare-fun tp!486 () Bool)

(assert (=> mapNonEmpty!487 (= mapRes!487 (and tp!486 tp_is_empty!159))))

(declare-fun mapKey!486 () (_ BitVec 32))

(declare-fun mapValue!487 () T!17105)

(declare-fun mapRest!487 () (Array (_ BitVec 32) T!17105))

(assert (=> mapNonEmpty!487 (= (arr!3106 a2!447) (store mapRest!487 mapKey!486 mapValue!487))))

(assert (= (and b!124739 condMapEmpty!486) mapIsEmpty!487))

(assert (= (and b!124739 (not condMapEmpty!486)) mapNonEmpty!487))

(assert (= start!24588 b!124739))

(assert (= (and b!124738 condMapEmpty!487) mapIsEmpty!486))

(assert (= (and b!124738 (not condMapEmpty!487)) mapNonEmpty!486))

(assert (= start!24588 b!124738))

(declare-fun m!190065 () Bool)

(assert (=> start!24588 m!190065))

(declare-fun m!190067 () Bool)

(assert (=> start!24588 m!190067))

(declare-fun m!190069 () Bool)

(assert (=> start!24588 m!190069))

(declare-fun m!190071 () Bool)

(assert (=> start!24588 m!190071))

(declare-fun m!190073 () Bool)

(assert (=> mapNonEmpty!486 m!190073))

(declare-fun m!190075 () Bool)

(assert (=> mapNonEmpty!487 m!190075))

(check-sat (not start!24588) (not mapNonEmpty!487) (not mapNonEmpty!486) tp_is_empty!159)
(check-sat)

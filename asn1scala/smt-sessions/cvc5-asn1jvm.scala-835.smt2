; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24564 () Bool)

(assert start!24564)

(declare-datatypes ((T!17025 0))(
  ( (T!17026 (val!69 Int)) )
))
(declare-datatypes ((array!5530 0))(
  ( (array!5531 (arr!3096 (Array (_ BitVec 32) T!17025)) (size!2503 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5530)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5530)

(assert (=> start!24564 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2503 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2503 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (bvsge fromA2!7 (size!2503 a2!447)))))

(declare-fun e!81808 () Bool)

(declare-fun array_inv!2299 (array!5530) Bool)

(assert (=> start!24564 (and (array_inv!2299 a2!447) e!81808)))

(assert (=> start!24564 true))

(declare-fun e!81809 () Bool)

(assert (=> start!24564 (and (array_inv!2299 a1!447) e!81809)))

(declare-fun mapIsEmpty!418 () Bool)

(declare-fun mapRes!418 () Bool)

(assert (=> mapIsEmpty!418 mapRes!418))

(declare-fun mapIsEmpty!419 () Bool)

(declare-fun mapRes!419 () Bool)

(assert (=> mapIsEmpty!419 mapRes!419))

(declare-fun mapNonEmpty!418 () Bool)

(declare-fun tp!418 () Bool)

(declare-fun tp_is_empty!139 () Bool)

(assert (=> mapNonEmpty!418 (= mapRes!419 (and tp!418 tp_is_empty!139))))

(declare-fun mapKey!418 () (_ BitVec 32))

(declare-fun mapValue!418 () T!17025)

(declare-fun mapRest!418 () (Array (_ BitVec 32) T!17025))

(assert (=> mapNonEmpty!418 (= (arr!3096 a1!447) (store mapRest!418 mapKey!418 mapValue!418))))

(declare-fun mapNonEmpty!419 () Bool)

(declare-fun tp!419 () Bool)

(assert (=> mapNonEmpty!419 (= mapRes!418 (and tp!419 tp_is_empty!139))))

(declare-fun mapValue!419 () T!17025)

(declare-fun mapRest!419 () (Array (_ BitVec 32) T!17025))

(declare-fun mapKey!419 () (_ BitVec 32))

(assert (=> mapNonEmpty!419 (= (arr!3096 a2!447) (store mapRest!419 mapKey!419 mapValue!419))))

(declare-fun b!124674 () Bool)

(assert (=> b!124674 (= e!81808 (and tp_is_empty!139 mapRes!418))))

(declare-fun condMapEmpty!419 () Bool)

(declare-fun mapDefault!418 () T!17025)


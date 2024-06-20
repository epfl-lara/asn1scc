; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24530 () Bool)

(assert start!24530)

(declare-fun mapIsEmpty!329 () Bool)

(declare-fun mapRes!329 () Bool)

(assert (=> mapIsEmpty!329 mapRes!329))

(declare-fun mapNonEmpty!329 () Bool)

(declare-fun mapRes!330 () Bool)

(declare-fun tp!329 () Bool)

(declare-fun tp_is_empty!109 () Bool)

(assert (=> mapNonEmpty!329 (= mapRes!330 (and tp!329 tp_is_empty!109))))

(declare-datatypes ((T!16895 0))(
  ( (T!16896 (val!54 Int)) )
))
(declare-fun mapValue!330 () T!16895)

(declare-datatypes ((array!5498 0))(
  ( (array!5499 (arr!3081 (Array (_ BitVec 32) T!16895)) (size!2488 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5498)

(declare-fun mapKey!330 () (_ BitVec 32))

(declare-fun mapRest!330 () (Array (_ BitVec 32) T!16895))

(assert (=> mapNonEmpty!329 (= (arr!3081 a2!447) (store mapRest!330 mapKey!330 mapValue!330))))

(declare-fun mapNonEmpty!330 () Bool)

(declare-fun tp!330 () Bool)

(assert (=> mapNonEmpty!330 (= mapRes!329 (and tp!330 tp_is_empty!109))))

(declare-fun mapKey!329 () (_ BitVec 32))

(declare-fun a1!447 () array!5498)

(declare-fun mapValue!329 () T!16895)

(declare-fun mapRest!329 () (Array (_ BitVec 32) T!16895))

(assert (=> mapNonEmpty!330 (= (arr!3081 a1!447) (store mapRest!329 mapKey!329 mapValue!329))))

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(assert (=> start!24530 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2488 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2488 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3081 a1!447) fromA1!7) (select (arr!3081 a2!447) fromA2!7)) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA1!7)) (bvsle (bvadd #b00000000000000000000000000000001 fromA1!7) toA1!7) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA2!7)))))

(declare-fun e!81728 () Bool)

(declare-fun array_inv!2289 (array!5498) Bool)

(assert (=> start!24530 (and (array_inv!2289 a2!447) e!81728)))

(assert (=> start!24530 true))

(declare-fun e!81727 () Bool)

(assert (=> start!24530 (and (array_inv!2289 a1!447) e!81727)))

(declare-fun mapIsEmpty!330 () Bool)

(assert (=> mapIsEmpty!330 mapRes!330))

(declare-fun b!124589 () Bool)

(assert (=> b!124589 (= e!81728 (and tp_is_empty!109 mapRes!330))))

(declare-fun condMapEmpty!330 () Bool)

(declare-fun mapDefault!330 () T!16895)


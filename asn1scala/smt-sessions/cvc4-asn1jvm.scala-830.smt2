; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24534 () Bool)

(assert start!24534)

(declare-datatypes ((T!16899 0))(
  ( (T!16900 (val!56 Int)) )
))
(declare-datatypes ((array!5502 0))(
  ( (array!5503 (arr!3083 (Array (_ BitVec 32) T!16899)) (size!2490 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5502)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5502)

(assert (=> start!24534 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2490 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2490 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3083 a1!447) fromA1!7) (select (arr!3083 a2!447) fromA2!7)) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA1!7)) (bvsle (bvadd #b00000000000000000000000000000001 fromA1!7) toA1!7) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA2!7)))))

(declare-fun e!81739 () Bool)

(declare-fun array_inv!2291 (array!5502) Bool)

(assert (=> start!24534 (and (array_inv!2291 a2!447) e!81739)))

(assert (=> start!24534 true))

(declare-fun e!81740 () Bool)

(assert (=> start!24534 (and (array_inv!2291 a1!447) e!81740)))

(declare-fun mapIsEmpty!341 () Bool)

(declare-fun mapRes!341 () Bool)

(assert (=> mapIsEmpty!341 mapRes!341))

(declare-fun mapNonEmpty!341 () Bool)

(declare-fun mapRes!342 () Bool)

(declare-fun tp!342 () Bool)

(declare-fun tp_is_empty!113 () Bool)

(assert (=> mapNonEmpty!341 (= mapRes!342 (and tp!342 tp_is_empty!113))))

(declare-fun mapKey!341 () (_ BitVec 32))

(declare-fun mapRest!342 () (Array (_ BitVec 32) T!16899))

(declare-fun mapValue!342 () T!16899)

(assert (=> mapNonEmpty!341 (= (arr!3083 a1!447) (store mapRest!342 mapKey!341 mapValue!342))))

(declare-fun mapNonEmpty!342 () Bool)

(declare-fun tp!341 () Bool)

(assert (=> mapNonEmpty!342 (= mapRes!341 (and tp!341 tp_is_empty!113))))

(declare-fun mapKey!342 () (_ BitVec 32))

(declare-fun mapValue!341 () T!16899)

(declare-fun mapRest!341 () (Array (_ BitVec 32) T!16899))

(assert (=> mapNonEmpty!342 (= (arr!3083 a2!447) (store mapRest!341 mapKey!342 mapValue!341))))

(declare-fun b!124601 () Bool)

(assert (=> b!124601 (= e!81740 (and tp_is_empty!113 mapRes!342))))

(declare-fun condMapEmpty!342 () Bool)

(declare-fun mapDefault!341 () T!16899)


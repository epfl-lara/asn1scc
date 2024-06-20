; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24528 () Bool)

(assert start!24528)

(declare-datatypes ((T!16873 0))(
  ( (T!16874 (val!53 Int)) )
))
(declare-datatypes ((array!5496 0))(
  ( (array!5497 (arr!3080 (Array (_ BitVec 32) T!16873)) (size!2487 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5496)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5496)

(assert (=> start!24528 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2487 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2487 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3080 a1!447) fromA1!7) (select (arr!3080 a2!447) fromA2!7)) (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA1!7)) (bvsgt (bvadd #b00000000000000000000000000000001 fromA1!7) toA1!7)))))

(declare-fun e!81721 () Bool)

(declare-fun array_inv!2288 (array!5496) Bool)

(assert (=> start!24528 (and (array_inv!2288 a2!447) e!81721)))

(assert (=> start!24528 true))

(declare-fun e!81722 () Bool)

(assert (=> start!24528 (and (array_inv!2288 a1!447) e!81722)))

(declare-fun b!124583 () Bool)

(declare-fun tp_is_empty!107 () Bool)

(declare-fun mapRes!323 () Bool)

(assert (=> b!124583 (= e!81721 (and tp_is_empty!107 mapRes!323))))

(declare-fun condMapEmpty!324 () Bool)

(declare-fun mapDefault!323 () T!16873)


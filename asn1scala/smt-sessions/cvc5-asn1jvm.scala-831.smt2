; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24538 () Bool)

(assert start!24538)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-datatypes ((T!16921 0))(
  ( (T!16922 (val!57 Int)) )
))
(declare-datatypes ((array!5505 0))(
  ( (array!5506 (arr!3084 (Array (_ BitVec 32) T!16921)) (size!2491 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5505)

(assert (=> start!24538 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2491 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand fromA1!7 #b10000000000000000000000000000000))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand (bvsub toA1!7 fromA1!7) #b10000000000000000000000000000000))))))

(assert (=> start!24538 true))

(declare-fun e!81743 () Bool)

(declare-fun array_inv!2292 (array!5505) Bool)

(assert (=> start!24538 (and (array_inv!2292 a1!447) e!81743)))

(declare-fun b!124607 () Bool)

(declare-fun tp_is_empty!115 () Bool)

(declare-fun mapRes!349 () Bool)

(assert (=> b!124607 (= e!81743 (and tp_is_empty!115 mapRes!349))))

(declare-fun condMapEmpty!349 () Bool)

(declare-fun mapDefault!349 () T!16921)


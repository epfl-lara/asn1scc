; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24542 () Bool)

(assert start!24542)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-datatypes ((T!16925 0))(
  ( (T!16926 (val!59 Int)) )
))
(declare-datatypes ((array!5509 0))(
  ( (array!5510 (arr!3086 (Array (_ BitVec 32) T!16925)) (size!2493 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5509)

(assert (=> start!24542 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2493 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand fromA1!7 #b10000000000000000000000000000000))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand (bvsub toA1!7 fromA1!7) #b10000000000000000000000000000000))))))

(assert (=> start!24542 true))

(declare-fun e!81749 () Bool)

(declare-fun array_inv!2294 (array!5509) Bool)

(assert (=> start!24542 (and (array_inv!2294 a1!447) e!81749)))

(declare-fun b!124613 () Bool)

(declare-fun tp_is_empty!119 () Bool)

(declare-fun mapRes!355 () Bool)

(assert (=> b!124613 (= e!81749 (and tp_is_empty!119 mapRes!355))))

(declare-fun condMapEmpty!355 () Bool)

(declare-fun mapDefault!355 () T!16925)


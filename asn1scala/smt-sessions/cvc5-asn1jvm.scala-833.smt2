; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24552 () Bool)

(assert start!24552)

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-datatypes ((T!16973 0))(
  ( (T!16974 (val!63 Int)) )
))
(declare-datatypes ((array!5518 0))(
  ( (array!5519 (arr!3090 (Array (_ BitVec 32) T!16973)) (size!2497 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5518)

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5518)

(assert (=> start!24552 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2497 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2497 a2!447) (bvsub toA1!7 fromA1!7))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand fromA1!7 #b10000000000000000000000000000000))) (not (= (bvand toA1!7 #b10000000000000000000000000000000) (bvand (bvsub toA1!7 fromA1!7) #b10000000000000000000000000000000))))))

(declare-fun e!81773 () Bool)

(declare-fun array_inv!2296 (array!5518) Bool)

(assert (=> start!24552 (and (array_inv!2296 a2!447) e!81773)))

(assert (=> start!24552 true))

(declare-fun e!81772 () Bool)

(assert (=> start!24552 (and (array_inv!2296 a1!447) e!81772)))

(declare-fun mapNonEmpty!382 () Bool)

(declare-fun mapRes!382 () Bool)

(declare-fun tp!383 () Bool)

(declare-fun tp_is_empty!127 () Bool)

(assert (=> mapNonEmpty!382 (= mapRes!382 (and tp!383 tp_is_empty!127))))

(declare-fun mapRest!383 () (Array (_ BitVec 32) T!16973))

(declare-fun mapKey!383 () (_ BitVec 32))

(declare-fun mapValue!383 () T!16973)

(assert (=> mapNonEmpty!382 (= (arr!3090 a1!447) (store mapRest!383 mapKey!383 mapValue!383))))

(declare-fun b!124638 () Bool)

(declare-fun mapRes!383 () Bool)

(assert (=> b!124638 (= e!81773 (and tp_is_empty!127 mapRes!383))))

(declare-fun condMapEmpty!383 () Bool)

(declare-fun mapDefault!383 () T!16973)


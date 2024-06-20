; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4080 () Bool)

(assert start!4080)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-datatypes ((T!4215 0))(
  ( (T!4216 (val!24 Int)) )
))
(declare-datatypes ((array!1069 0))(
  ( (array!1070 (arr!883 (Array (_ BitVec 32) T!4215)) (size!454 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1069)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4080 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!454 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand fromSrc!2 #b10000000000000000000000000000000))) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand (bvsub toSrc!1 fromSrc!2) #b10000000000000000000000000000000))))))

(assert (=> start!4080 true))

(declare-fun e!10998 () Bool)

(declare-fun array_inv!434 (array!1069) Bool)

(assert (=> start!4080 (and (array_inv!434 src!2) e!10998)))

(declare-fun b!17280 () Bool)

(declare-fun tp_is_empty!49 () Bool)

(declare-fun mapRes!140 () Bool)

(assert (=> b!17280 (= e!10998 (and tp_is_empty!49 mapRes!140))))

(declare-fun condMapEmpty!140 () Bool)

(declare-fun mapDefault!140 () T!4215)


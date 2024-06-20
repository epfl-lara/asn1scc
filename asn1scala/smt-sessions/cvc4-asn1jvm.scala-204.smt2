; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4118 () Bool)

(assert start!4118)

(declare-fun mapIsEmpty!243 () Bool)

(declare-fun mapRes!243 () Bool)

(assert (=> mapIsEmpty!243 mapRes!243))

(declare-datatypes ((T!4349 0))(
  ( (T!4350 (val!41 Int)) )
))
(declare-datatypes ((array!1105 0))(
  ( (array!1106 (arr!900 (Array (_ BitVec 32) T!4349)) (size!471 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1105)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1105)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4118 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!471 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!471 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (= (bvand fromSrc!2 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand fromSrc!2 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 fromSrc!2) #b10000000000000000000000000000000))))))

(declare-fun e!11093 () Bool)

(declare-fun array_inv!443 (array!1105) Bool)

(assert (=> start!4118 (and (array_inv!443 dst!10) e!11093)))

(assert (=> start!4118 true))

(declare-fun e!11094 () Bool)

(assert (=> start!4118 (and (array_inv!443 src!2) e!11094)))

(declare-fun b!17379 () Bool)

(declare-fun tp_is_empty!83 () Bool)

(assert (=> b!17379 (= e!11093 (and tp_is_empty!83 mapRes!243))))

(declare-fun condMapEmpty!244 () Bool)

(declare-fun mapDefault!244 () T!4349)


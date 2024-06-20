; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4084 () Bool)

(assert start!4084)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-datatypes ((T!4219 0))(
  ( (T!4220 (val!26 Int)) )
))
(declare-datatypes ((array!1073 0))(
  ( (array!1074 (arr!885 (Array (_ BitVec 32) T!4219)) (size!456 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1073)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4084 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!456 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand fromSrc!2 #b10000000000000000000000000000000))) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand (bvsub toSrc!1 fromSrc!2) #b10000000000000000000000000000000))))))

(assert (=> start!4084 true))

(declare-fun e!11004 () Bool)

(declare-fun array_inv!436 (array!1073) Bool)

(assert (=> start!4084 (and (array_inv!436 src!2) e!11004)))

(declare-fun b!17286 () Bool)

(declare-fun tp_is_empty!53 () Bool)

(declare-fun mapRes!146 () Bool)

(assert (=> b!17286 (= e!11004 (and tp_is_empty!53 mapRes!146))))

(declare-fun condMapEmpty!146 () Bool)

(declare-fun mapDefault!146 () T!4219)


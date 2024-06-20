; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4128 () Bool)

(assert start!4128)

(declare-datatypes ((T!4397 0))(
  ( (T!4398 (val!45 Int)) )
))
(declare-datatypes ((array!1114 0))(
  ( (array!1115 (arr!904 (Array (_ BitVec 32) T!4397)) (size!475 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1114)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1114)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4128 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!475 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!475 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsge (bvsub toSrc!1 (bvadd #b00000000000000000000000000000001 fromSrc!2)) (bvsub toSrc!1 fromSrc!2)))))

(declare-fun e!11118 () Bool)

(declare-fun array_inv!446 (array!1114) Bool)

(assert (=> start!4128 (and (array_inv!446 dst!10) e!11118)))

(assert (=> start!4128 true))

(declare-fun e!11117 () Bool)

(assert (=> start!4128 (and (array_inv!446 src!2) e!11117)))

(declare-fun mapIsEmpty!271 () Bool)

(declare-fun mapRes!271 () Bool)

(assert (=> mapIsEmpty!271 mapRes!271))

(declare-fun b!17405 () Bool)

(declare-fun tp_is_empty!91 () Bool)

(declare-fun mapRes!272 () Bool)

(assert (=> b!17405 (= e!11117 (and tp_is_empty!91 mapRes!272))))

(declare-fun condMapEmpty!271 () Bool)

(declare-fun mapDefault!271 () T!4397)


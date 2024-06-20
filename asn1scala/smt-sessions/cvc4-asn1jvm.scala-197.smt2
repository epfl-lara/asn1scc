; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4070 () Bool)

(assert start!4070)

(declare-datatypes ((T!4167 0))(
  ( (T!4168 (val!20 Int)) )
))
(declare-datatypes ((array!1060 0))(
  ( (array!1061 (arr!879 (Array (_ BitVec 32) T!4167)) (size!450 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1060)

(declare-fun src!2 () array!1060)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(declare-fun toSrc!1 () (_ BitVec 32))

(assert (=> start!4070 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!450 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!450 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromSrc!2)))))

(declare-fun e!10976 () Bool)

(declare-fun array_inv!431 (array!1060) Bool)

(assert (=> start!4070 (and (array_inv!431 dst!10) e!10976)))

(assert (=> start!4070 true))

(declare-fun e!10977 () Bool)

(assert (=> start!4070 (and (array_inv!431 src!2) e!10977)))

(declare-fun mapIsEmpty!114 () Bool)

(declare-fun mapRes!115 () Bool)

(assert (=> mapIsEmpty!114 mapRes!115))

(declare-fun mapNonEmpty!114 () Bool)

(declare-fun tp!115 () Bool)

(declare-fun tp_is_empty!41 () Bool)

(assert (=> mapNonEmpty!114 (= mapRes!115 (and tp!115 tp_is_empty!41))))

(declare-fun mapKey!115 () (_ BitVec 32))

(declare-fun mapRest!115 () (Array (_ BitVec 32) T!4167))

(declare-fun mapValue!114 () T!4167)

(assert (=> mapNonEmpty!114 (= (arr!879 src!2) (store mapRest!115 mapKey!115 mapValue!114))))

(declare-fun b!17256 () Bool)

(declare-fun mapRes!114 () Bool)

(assert (=> b!17256 (= e!10976 (and tp_is_empty!41 mapRes!114))))

(declare-fun condMapEmpty!115 () Bool)

(declare-fun mapDefault!114 () T!4167)


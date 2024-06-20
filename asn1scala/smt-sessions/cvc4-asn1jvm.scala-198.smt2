; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4076 () Bool)

(assert start!4076)

(declare-datatypes ((T!4193 0))(
  ( (T!4194 (val!23 Int)) )
))
(declare-datatypes ((array!1066 0))(
  ( (array!1067 (arr!882 (Array (_ BitVec 32) T!4193)) (size!453 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1066)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1066)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4076 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!453 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!453 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromSrc!2)) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromDst!2)))))

(declare-fun e!10995 () Bool)

(declare-fun array_inv!433 (array!1066) Bool)

(assert (=> start!4076 (and (array_inv!433 dst!10) e!10995)))

(assert (=> start!4076 true))

(declare-fun e!10994 () Bool)

(assert (=> start!4076 (and (array_inv!433 src!2) e!10994)))

(declare-fun mapNonEmpty!132 () Bool)

(declare-fun mapRes!133 () Bool)

(declare-fun tp!133 () Bool)

(declare-fun tp_is_empty!47 () Bool)

(assert (=> mapNonEmpty!132 (= mapRes!133 (and tp!133 tp_is_empty!47))))

(declare-fun mapValue!133 () T!4193)

(declare-fun mapRest!132 () (Array (_ BitVec 32) T!4193))

(declare-fun mapKey!132 () (_ BitVec 32))

(assert (=> mapNonEmpty!132 (= (arr!882 dst!10) (store mapRest!132 mapKey!132 mapValue!133))))

(declare-fun mapIsEmpty!132 () Bool)

(assert (=> mapIsEmpty!132 mapRes!133))

(declare-fun mapIsEmpty!133 () Bool)

(declare-fun mapRes!132 () Bool)

(assert (=> mapIsEmpty!133 mapRes!132))

(declare-fun b!17274 () Bool)

(assert (=> b!17274 (= e!10995 (and tp_is_empty!47 mapRes!133))))

(declare-fun condMapEmpty!132 () Bool)

(declare-fun mapDefault!132 () T!4193)


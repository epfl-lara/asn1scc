; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4124 () Bool)

(assert start!4124)

(declare-fun mapNonEmpty!261 () Bool)

(declare-fun mapRes!262 () Bool)

(declare-fun tp!262 () Bool)

(declare-fun tp_is_empty!89 () Bool)

(assert (=> mapNonEmpty!261 (= mapRes!262 (and tp!262 tp_is_empty!89))))

(declare-datatypes ((T!4375 0))(
  ( (T!4376 (val!44 Int)) )
))
(declare-datatypes ((array!1111 0))(
  ( (array!1112 (arr!903 (Array (_ BitVec 32) T!4375)) (size!474 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1111)

(declare-fun mapRest!261 () (Array (_ BitVec 32) T!4375))

(declare-fun mapValue!261 () T!4375)

(declare-fun mapKey!261 () (_ BitVec 32))

(assert (=> mapNonEmpty!261 (= (arr!903 dst!10) (store mapRest!261 mapKey!261 mapValue!261))))

(declare-fun b!17397 () Bool)

(declare-fun e!11112 () Bool)

(declare-fun mapRes!261 () Bool)

(assert (=> b!17397 (= e!11112 (and tp_is_empty!89 mapRes!261))))

(declare-fun condMapEmpty!262 () Bool)

(declare-fun src!2 () array!1111)

(declare-fun mapDefault!261 () T!4375)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4072 () Bool)

(assert start!4072)

(declare-fun mapNonEmpty!120 () Bool)

(declare-fun mapRes!120 () Bool)

(declare-fun tp!121 () Bool)

(declare-fun tp_is_empty!43 () Bool)

(assert (=> mapNonEmpty!120 (= mapRes!120 (and tp!121 tp_is_empty!43))))

(declare-fun mapKey!120 () (_ BitVec 32))

(declare-datatypes ((T!4189 0))(
  ( (T!4190 (val!21 Int)) )
))
(declare-datatypes ((array!1062 0))(
  ( (array!1063 (arr!880 (Array (_ BitVec 32) T!4189)) (size!451 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1062)

(declare-fun mapValue!121 () T!4189)

(declare-fun mapRest!120 () (Array (_ BitVec 32) T!4189))

(assert (=> mapNonEmpty!120 (= (arr!880 src!2) (store mapRest!120 mapKey!120 mapValue!121))))

(declare-fun mapNonEmpty!121 () Bool)

(declare-fun mapRes!121 () Bool)

(declare-fun tp!120 () Bool)

(assert (=> mapNonEmpty!121 (= mapRes!121 (and tp!120 tp_is_empty!43))))

(declare-fun mapRest!121 () (Array (_ BitVec 32) T!4189))

(declare-fun mapValue!120 () T!4189)

(declare-fun mapKey!121 () (_ BitVec 32))

(declare-fun dst!10 () array!1062)

(assert (=> mapNonEmpty!121 (= (arr!880 dst!10) (store mapRest!121 mapKey!121 mapValue!120))))

(declare-fun mapIsEmpty!120 () Bool)

(assert (=> mapIsEmpty!120 mapRes!120))

(declare-fun b!17262 () Bool)

(declare-fun e!10982 () Bool)

(assert (=> b!17262 (= e!10982 (and tp_is_empty!43 mapRes!121))))

(declare-fun condMapEmpty!120 () Bool)

(declare-fun mapDefault!121 () T!4189)


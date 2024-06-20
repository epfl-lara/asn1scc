; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4104 () Bool)

(assert start!4104)

(declare-fun mapIsEmpty!203 () Bool)

(declare-fun mapRes!203 () Bool)

(assert (=> mapIsEmpty!203 mapRes!203))

(declare-fun mapNonEmpty!203 () Bool)

(declare-fun tp!203 () Bool)

(declare-fun tp_is_empty!71 () Bool)

(assert (=> mapNonEmpty!203 (= mapRes!203 (and tp!203 tp_is_empty!71))))

(declare-datatypes ((T!4297 0))(
  ( (T!4298 (val!35 Int)) )
))
(declare-fun mapValue!203 () T!4297)

(declare-fun mapKey!203 () (_ BitVec 32))

(declare-datatypes ((array!1092 0))(
  ( (array!1093 (arr!894 (Array (_ BitVec 32) T!4297)) (size!465 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1092)

(declare-fun mapRest!204 () (Array (_ BitVec 32) T!4297))

(assert (=> mapNonEmpty!203 (= (arr!894 src!2) (store mapRest!204 mapKey!203 mapValue!203))))

(declare-fun b!17341 () Bool)

(declare-fun e!11058 () Bool)

(assert (=> b!17341 (= e!11058 (and tp_is_empty!71 mapRes!203))))

(declare-fun condMapEmpty!204 () Bool)

(declare-fun mapDefault!204 () T!4297)


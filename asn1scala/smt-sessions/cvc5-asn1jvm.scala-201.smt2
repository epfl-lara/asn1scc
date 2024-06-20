; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4094 () Bool)

(assert start!4094)

(declare-fun mapNonEmpty!173 () Bool)

(declare-fun mapRes!174 () Bool)

(declare-fun tp!173 () Bool)

(declare-fun tp_is_empty!61 () Bool)

(assert (=> mapNonEmpty!173 (= mapRes!174 (and tp!173 tp_is_empty!61))))

(declare-datatypes ((T!4267 0))(
  ( (T!4268 (val!30 Int)) )
))
(declare-fun mapValue!174 () T!4267)

(declare-fun mapKey!173 () (_ BitVec 32))

(declare-fun mapRest!173 () (Array (_ BitVec 32) T!4267))

(declare-datatypes ((array!1082 0))(
  ( (array!1083 (arr!889 (Array (_ BitVec 32) T!4267)) (size!460 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1082)

(assert (=> mapNonEmpty!173 (= (arr!889 src!2) (store mapRest!173 mapKey!173 mapValue!174))))

(declare-fun b!17311 () Bool)

(declare-fun e!11028 () Bool)

(assert (=> b!17311 (= e!11028 (and tp_is_empty!61 mapRes!174))))

(declare-fun condMapEmpty!173 () Bool)

(declare-fun mapDefault!174 () T!4267)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4054 () Bool)

(assert start!4054)

(declare-fun mapNonEmpty!74 () Bool)

(declare-fun mapRes!75 () Bool)

(declare-fun tp!75 () Bool)

(declare-fun tp_is_empty!29 () Bool)

(assert (=> mapNonEmpty!74 (= mapRes!75 (and tp!75 tp_is_empty!29))))

(declare-datatypes ((T!4115 0))(
  ( (T!4116 (val!14 Int)) )
))
(declare-fun mapValue!74 () T!4115)

(declare-fun mapRest!75 () (Array (_ BitVec 32) T!4115))

(declare-datatypes ((array!1047 0))(
  ( (array!1048 (arr!873 (Array (_ BitVec 32) T!4115)) (size!444 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1047)

(declare-fun mapKey!74 () (_ BitVec 32))

(assert (=> mapNonEmpty!74 (= (arr!873 src!6) (store mapRest!75 mapKey!74 mapValue!74))))

(declare-fun mapNonEmpty!75 () Bool)

(declare-fun mapRes!74 () Bool)

(declare-fun tp!74 () Bool)

(assert (=> mapNonEmpty!75 (= mapRes!74 (and tp!74 tp_is_empty!29))))

(declare-fun dst!20 () array!1047)

(declare-fun mapRest!74 () (Array (_ BitVec 32) T!4115))

(declare-fun mapValue!75 () T!4115)

(declare-fun mapKey!75 () (_ BitVec 32))

(assert (=> mapNonEmpty!75 (= (arr!873 dst!20) (store mapRest!74 mapKey!75 mapValue!75))))

(declare-fun b!17203 () Bool)

(declare-fun e!10928 () Bool)

(assert (=> b!17203 (= e!10928 (and tp_is_empty!29 mapRes!75))))

(declare-fun condMapEmpty!74 () Bool)

(declare-fun mapDefault!75 () T!4115)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4056 () Bool)

(assert start!4056)

(declare-fun mapNonEmpty!80 () Bool)

(declare-fun mapRes!80 () Bool)

(declare-fun tp!80 () Bool)

(declare-fun tp_is_empty!31 () Bool)

(assert (=> mapNonEmpty!80 (= mapRes!80 (and tp!80 tp_is_empty!31))))

(declare-datatypes ((T!4137 0))(
  ( (T!4138 (val!15 Int)) )
))
(declare-fun mapValue!80 () T!4137)

(declare-fun mapKey!80 () (_ BitVec 32))

(declare-datatypes ((array!1049 0))(
  ( (array!1050 (arr!874 (Array (_ BitVec 32) T!4137)) (size!445 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1049)

(declare-fun mapRest!80 () (Array (_ BitVec 32) T!4137))

(assert (=> mapNonEmpty!80 (= (arr!874 src!6) (store mapRest!80 mapKey!80 mapValue!80))))

(declare-fun b!17211 () Bool)

(declare-fun e!10936 () Bool)

(assert (=> b!17211 (= e!10936 (and tp_is_empty!31 mapRes!80))))

(declare-fun condMapEmpty!80 () Bool)

(declare-fun mapDefault!80 () T!4137)


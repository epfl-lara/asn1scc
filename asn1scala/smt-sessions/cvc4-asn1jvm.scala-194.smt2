; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4048 () Bool)

(assert start!4048)

(declare-fun mapIsEmpty!56 () Bool)

(declare-fun mapRes!56 () Bool)

(assert (=> mapIsEmpty!56 mapRes!56))

(declare-fun mapNonEmpty!56 () Bool)

(declare-fun tp!57 () Bool)

(declare-fun tp_is_empty!23 () Bool)

(assert (=> mapNonEmpty!56 (= mapRes!56 (and tp!57 tp_is_empty!23))))

(declare-datatypes ((T!4089 0))(
  ( (T!4090 (val!11 Int)) )
))
(declare-fun mapValue!57 () T!4089)

(declare-fun mapRest!57 () (Array (_ BitVec 32) T!4089))

(declare-fun mapKey!56 () (_ BitVec 32))

(declare-datatypes ((array!1041 0))(
  ( (array!1042 (arr!870 (Array (_ BitVec 32) T!4089)) (size!441 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1041)

(assert (=> mapNonEmpty!56 (= (arr!870 src!6) (store mapRest!57 mapKey!56 mapValue!57))))

(declare-fun mapNonEmpty!57 () Bool)

(declare-fun mapRes!57 () Bool)

(declare-fun tp!56 () Bool)

(assert (=> mapNonEmpty!57 (= mapRes!57 (and tp!56 tp_is_empty!23))))

(declare-fun mapValue!56 () T!4089)

(declare-fun mapRest!56 () (Array (_ BitVec 32) T!4089))

(declare-fun dst!20 () array!1041)

(declare-fun mapKey!57 () (_ BitVec 32))

(assert (=> mapNonEmpty!57 (= (arr!870 dst!20) (store mapRest!56 mapKey!57 mapValue!56))))

(declare-fun mapIsEmpty!57 () Bool)

(assert (=> mapIsEmpty!57 mapRes!57))

(declare-fun b!17185 () Bool)

(declare-fun e!10911 () Bool)

(assert (=> b!17185 (= e!10911 (and tp_is_empty!23 mapRes!56))))

(declare-fun condMapEmpty!57 () Bool)

(declare-fun mapDefault!57 () T!4089)


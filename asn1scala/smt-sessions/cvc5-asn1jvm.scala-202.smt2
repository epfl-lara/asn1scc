; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4100 () Bool)

(assert start!4100)

(declare-fun mapIsEmpty!191 () Bool)

(declare-fun mapRes!191 () Bool)

(assert (=> mapIsEmpty!191 mapRes!191))

(declare-fun mapIsEmpty!192 () Bool)

(declare-fun mapRes!192 () Bool)

(assert (=> mapIsEmpty!192 mapRes!192))

(declare-fun mapNonEmpty!191 () Bool)

(declare-fun tp!191 () Bool)

(declare-fun tp_is_empty!67 () Bool)

(assert (=> mapNonEmpty!191 (= mapRes!191 (and tp!191 tp_is_empty!67))))

(declare-datatypes ((T!4293 0))(
  ( (T!4294 (val!33 Int)) )
))
(declare-fun mapRest!191 () (Array (_ BitVec 32) T!4293))

(declare-fun mapKey!192 () (_ BitVec 32))

(declare-fun mapValue!191 () T!4293)

(declare-datatypes ((array!1088 0))(
  ( (array!1089 (arr!892 (Array (_ BitVec 32) T!4293)) (size!463 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1088)

(assert (=> mapNonEmpty!191 (= (arr!892 src!2) (store mapRest!191 mapKey!192 mapValue!191))))

(declare-fun mapNonEmpty!192 () Bool)

(declare-fun tp!192 () Bool)

(assert (=> mapNonEmpty!192 (= mapRes!192 (and tp!192 tp_is_empty!67))))

(declare-fun dst!10 () array!1088)

(declare-fun mapRest!192 () (Array (_ BitVec 32) T!4293))

(declare-fun mapValue!192 () T!4293)

(declare-fun mapKey!191 () (_ BitVec 32))

(assert (=> mapNonEmpty!192 (= (arr!892 dst!10) (store mapRest!192 mapKey!191 mapValue!192))))

(declare-fun b!17330 () Bool)

(declare-fun e!11046 () Bool)

(assert (=> b!17330 (= e!11046 (and tp_is_empty!67 mapRes!192))))

(declare-fun condMapEmpty!191 () Bool)

(declare-fun mapDefault!191 () T!4293)


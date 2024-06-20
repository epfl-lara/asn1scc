; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4038 () Bool)

(assert start!4038)

(declare-fun mapNonEmpty!26 () Bool)

(declare-fun mapRes!27 () Bool)

(declare-fun tp!27 () Bool)

(declare-fun tp_is_empty!13 () Bool)

(assert (=> mapNonEmpty!26 (= mapRes!27 (and tp!27 tp_is_empty!13))))

(declare-datatypes ((T!4059 0))(
  ( (T!4060 (val!6 Int)) )
))
(declare-datatypes ((array!1031 0))(
  ( (array!1032 (arr!865 (Array (_ BitVec 32) T!4059)) (size!436 (_ BitVec 32))) )
))
(declare-fun dst!20 () array!1031)

(declare-fun mapRest!27 () (Array (_ BitVec 32) T!4059))

(declare-fun mapKey!26 () (_ BitVec 32))

(declare-fun mapValue!26 () T!4059)

(assert (=> mapNonEmpty!26 (= (arr!865 dst!20) (store mapRest!27 mapKey!26 mapValue!26))))

(declare-fun mapNonEmpty!27 () Bool)

(declare-fun mapRes!26 () Bool)

(declare-fun tp!26 () Bool)

(assert (=> mapNonEmpty!27 (= mapRes!26 (and tp!26 tp_is_empty!13))))

(declare-fun mapKey!27 () (_ BitVec 32))

(declare-fun mapRest!26 () (Array (_ BitVec 32) T!4059))

(declare-fun mapValue!27 () T!4059)

(declare-fun src!6 () array!1031)

(assert (=> mapNonEmpty!27 (= (arr!865 src!6) (store mapRest!26 mapKey!27 mapValue!27))))

(declare-fun mapIsEmpty!27 () Bool)

(assert (=> mapIsEmpty!27 mapRes!26))

(declare-fun b!17155 () Bool)

(declare-fun e!10881 () Bool)

(assert (=> b!17155 (= e!10881 (and tp_is_empty!13 mapRes!26))))

(declare-fun condMapEmpty!27 () Bool)

(declare-fun mapDefault!27 () T!4059)


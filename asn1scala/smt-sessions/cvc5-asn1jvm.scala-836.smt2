; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24572 () Bool)

(assert start!24572)

(declare-fun mapIsEmpty!440 () Bool)

(declare-fun mapRes!441 () Bool)

(assert (=> mapIsEmpty!440 mapRes!441))

(declare-fun mapNonEmpty!440 () Bool)

(declare-fun mapRes!440 () Bool)

(declare-fun tp!441 () Bool)

(declare-fun tp_is_empty!145 () Bool)

(assert (=> mapNonEmpty!440 (= mapRes!440 (and tp!441 tp_is_empty!145))))

(declare-datatypes ((T!17051 0))(
  ( (T!17052 (val!72 Int)) )
))
(declare-datatypes ((array!5537 0))(
  ( (array!5538 (arr!3099 (Array (_ BitVec 32) T!17051)) (size!2506 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5537)

(declare-fun mapKey!441 () (_ BitVec 32))

(declare-fun mapRest!441 () (Array (_ BitVec 32) T!17051))

(declare-fun mapValue!441 () T!17051)

(assert (=> mapNonEmpty!440 (= (arr!3099 a2!447) (store mapRest!441 mapKey!441 mapValue!441))))

(declare-fun mapIsEmpty!441 () Bool)

(assert (=> mapIsEmpty!441 mapRes!440))

(declare-fun mapNonEmpty!441 () Bool)

(declare-fun tp!440 () Bool)

(assert (=> mapNonEmpty!441 (= mapRes!441 (and tp!440 tp_is_empty!145))))

(declare-fun a1!447 () array!5537)

(declare-fun mapKey!440 () (_ BitVec 32))

(declare-fun mapRest!440 () (Array (_ BitVec 32) T!17051))

(declare-fun mapValue!440 () T!17051)

(assert (=> mapNonEmpty!441 (= (arr!3099 a1!447) (store mapRest!440 mapKey!440 mapValue!440))))

(declare-fun b!124694 () Bool)

(declare-fun e!81827 () Bool)

(assert (=> b!124694 (= e!81827 (and tp_is_empty!145 mapRes!441))))

(declare-fun condMapEmpty!440 () Bool)

(declare-fun mapDefault!441 () T!17051)


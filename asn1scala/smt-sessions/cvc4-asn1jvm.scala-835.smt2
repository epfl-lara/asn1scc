; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24568 () Bool)

(assert start!24568)

(declare-fun mapNonEmpty!430 () Bool)

(declare-fun mapRes!431 () Bool)

(declare-fun tp!431 () Bool)

(declare-fun tp_is_empty!143 () Bool)

(assert (=> mapNonEmpty!430 (= mapRes!431 (and tp!431 tp_is_empty!143))))

(declare-datatypes ((T!17029 0))(
  ( (T!17030 (val!71 Int)) )
))
(declare-datatypes ((array!5534 0))(
  ( (array!5535 (arr!3098 (Array (_ BitVec 32) T!17029)) (size!2505 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5534)

(declare-fun mapRest!430 () (Array (_ BitVec 32) T!17029))

(declare-fun mapKey!430 () (_ BitVec 32))

(declare-fun mapValue!430 () T!17029)

(assert (=> mapNonEmpty!430 (= (arr!3098 a1!447) (store mapRest!430 mapKey!430 mapValue!430))))

(declare-fun mapIsEmpty!430 () Bool)

(assert (=> mapIsEmpty!430 mapRes!431))

(declare-fun mapNonEmpty!431 () Bool)

(declare-fun mapRes!430 () Bool)

(declare-fun tp!430 () Bool)

(assert (=> mapNonEmpty!431 (= mapRes!430 (and tp!430 tp_is_empty!143))))

(declare-fun a2!447 () array!5534)

(declare-fun mapRest!431 () (Array (_ BitVec 32) T!17029))

(declare-fun mapValue!431 () T!17029)

(declare-fun mapKey!431 () (_ BitVec 32))

(assert (=> mapNonEmpty!431 (= (arr!3098 a2!447) (store mapRest!431 mapKey!431 mapValue!431))))

(declare-fun b!124686 () Bool)

(declare-fun e!81820 () Bool)

(assert (=> b!124686 (= e!81820 (and tp_is_empty!143 mapRes!430))))

(declare-fun condMapEmpty!430 () Bool)

(declare-fun mapDefault!431 () T!17029)


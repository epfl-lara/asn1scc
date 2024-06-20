; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24578 () Bool)

(assert start!24578)

(declare-fun mapNonEmpty!459 () Bool)

(declare-fun mapRes!459 () Bool)

(declare-fun tp!459 () Bool)

(declare-fun tp_is_empty!151 () Bool)

(assert (=> mapNonEmpty!459 (= mapRes!459 (and tp!459 tp_is_empty!151))))

(declare-datatypes ((T!17077 0))(
  ( (T!17078 (val!75 Int)) )
))
(declare-datatypes ((array!5543 0))(
  ( (array!5544 (arr!3102 (Array (_ BitVec 32) T!17077)) (size!2509 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5543)

(declare-fun mapRest!459 () (Array (_ BitVec 32) T!17077))

(declare-fun mapValue!459 () T!17077)

(declare-fun mapKey!458 () (_ BitVec 32))

(assert (=> mapNonEmpty!459 (= (arr!3102 a1!447) (store mapRest!459 mapKey!458 mapValue!459))))

(declare-fun b!124712 () Bool)

(declare-fun e!81844 () Bool)

(assert (=> b!124712 (= e!81844 (and tp_is_empty!151 mapRes!459))))

(declare-fun condMapEmpty!458 () Bool)

(declare-fun mapDefault!459 () T!17077)


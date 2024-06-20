; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64268 () Bool)

(assert start!64268)

(declare-fun mapNonEmpty!2223 () Bool)

(declare-fun mapRes!2223 () Bool)

(declare-fun tp!2223 () Bool)

(declare-fun tp_is_empty!689 () Bool)

(assert (=> mapNonEmpty!2223 (= mapRes!2223 (and tp!2223 tp_is_empty!689))))

(declare-datatypes ((T!52455 0))(
  ( (T!52456 (val!344 Int)) )
))
(declare-datatypes ((array!16971 0))(
  ( (array!16972 (arr!8331 (Array (_ BitVec 32) T!52455)) (size!7335 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16971)

(declare-fun mapValue!2223 () T!52455)

(declare-fun mapRest!2224 () (Array (_ BitVec 32) T!52455))

(declare-fun mapKey!2224 () (_ BitVec 32))

(assert (=> mapNonEmpty!2223 (= (arr!8331 a2!596) (store mapRest!2224 mapKey!2224 mapValue!2223))))

(declare-fun b!288133 () Bool)

(declare-fun e!204986 () Bool)

(assert (=> b!288133 (= e!204986 (and tp_is_empty!689 mapRes!2223))))

(declare-fun condMapEmpty!2223 () Bool)

(declare-fun mapDefault!2224 () T!52455)


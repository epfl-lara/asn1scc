; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64222 () Bool)

(assert start!64222)

(declare-fun b!287638 () Bool)

(declare-fun e!204752 () Bool)

(declare-fun tp_is_empty!643 () Bool)

(declare-fun mapRes!2086 () Bool)

(assert (=> b!287638 (= e!204752 (and tp_is_empty!643 mapRes!2086))))

(declare-fun condMapEmpty!2086 () Bool)

(declare-datatypes ((T!52269 0))(
  ( (T!52270 (val!321 Int)) )
))
(declare-datatypes ((array!16925 0))(
  ( (array!16926 (arr!8308 (Array (_ BitVec 32) T!52269)) (size!7312 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16925)

(declare-fun mapDefault!2086 () T!52269)


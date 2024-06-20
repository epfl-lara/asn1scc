; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64300 () Bool)

(assert start!64300)

(declare-fun b!288432 () Bool)

(declare-fun e!205129 () Bool)

(declare-fun tp_is_empty!721 () Bool)

(declare-fun mapRes!2320 () Bool)

(assert (=> b!288432 (= e!205129 (and tp_is_empty!721 mapRes!2320))))

(declare-fun condMapEmpty!2320 () Bool)

(declare-datatypes ((T!52607 0))(
  ( (T!52608 (val!360 Int)) )
))
(declare-datatypes ((array!17003 0))(
  ( (array!17004 (arr!8347 (Array (_ BitVec 32) T!52607)) (size!7351 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17003)

(declare-fun mapDefault!2320 () T!52607)


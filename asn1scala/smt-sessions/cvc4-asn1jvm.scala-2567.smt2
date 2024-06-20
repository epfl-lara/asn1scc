; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64192 () Bool)

(assert start!64192)

(declare-fun b!287419 () Bool)

(declare-fun e!204621 () Bool)

(declare-fun tp_is_empty!617 () Bool)

(declare-fun mapRes!2002 () Bool)

(assert (=> b!287419 (= e!204621 (and tp_is_empty!617 mapRes!2002))))

(declare-fun condMapEmpty!2001 () Bool)

(declare-datatypes ((T!52143 0))(
  ( (T!52144 (val!308 Int)) )
))
(declare-datatypes ((array!16898 0))(
  ( (array!16899 (arr!8295 (Array (_ BitVec 32) T!52143)) (size!7299 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16898)

(declare-fun mapDefault!2001 () T!52143)


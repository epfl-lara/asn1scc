; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64158 () Bool)

(assert start!64158)

(declare-fun b!287175 () Bool)

(declare-fun e!204476 () Bool)

(declare-fun tp_is_empty!583 () Bool)

(declare-fun mapRes!1900 () Bool)

(assert (=> b!287175 (= e!204476 (and tp_is_empty!583 mapRes!1900))))

(declare-fun condMapEmpty!1900 () Bool)

(declare-datatypes ((T!52009 0))(
  ( (T!52010 (val!291 Int)) )
))
(declare-datatypes ((array!16864 0))(
  ( (array!16865 (arr!8278 (Array (_ BitVec 32) T!52009)) (size!7282 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16864)

(declare-fun mapDefault!1900 () T!52009)


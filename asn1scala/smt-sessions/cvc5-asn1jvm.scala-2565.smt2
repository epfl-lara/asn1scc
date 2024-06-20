; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64176 () Bool)

(assert start!64176)

(declare-fun b!287309 () Bool)

(declare-fun e!204550 () Bool)

(declare-fun tp_is_empty!601 () Bool)

(declare-fun mapRes!1954 () Bool)

(assert (=> b!287309 (= e!204550 (and tp_is_empty!601 mapRes!1954))))

(declare-fun condMapEmpty!1953 () Bool)

(declare-datatypes ((T!52087 0))(
  ( (T!52088 (val!300 Int)) )
))
(declare-datatypes ((array!16882 0))(
  ( (array!16883 (arr!8287 (Array (_ BitVec 32) T!52087)) (size!7291 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16882)

(declare-fun mapDefault!1954 () T!52087)


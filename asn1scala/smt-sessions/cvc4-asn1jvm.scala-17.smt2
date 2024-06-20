; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!536 () Bool)

(assert start!536)

(declare-fun b!1590 () Bool)

(declare-fun e!1007 () Bool)

(declare-fun tp_is_empty!5 () Bool)

(declare-fun mapRes!17 () Bool)

(assert (=> b!1590 (= e!1007 (and tp_is_empty!5 mapRes!17))))

(declare-fun condMapEmpty!17 () Bool)

(declare-datatypes ((T!537 0))(
  ( (T!538 (val!2 Int)) )
))
(declare-datatypes ((array!136 0))(
  ( (array!137 (arr!438 (Array (_ BitVec 32) T!537)) (size!51 (_ BitVec 32))) )
))
(declare-fun a1!444 () array!136)

(declare-fun mapDefault!16 () T!537)


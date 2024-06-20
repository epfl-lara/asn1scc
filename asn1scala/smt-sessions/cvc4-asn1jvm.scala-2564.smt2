; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64174 () Bool)

(assert start!64174)

(declare-fun b!287291 () Bool)

(declare-fun e!204541 () Bool)

(declare-fun tp_is_empty!599 () Bool)

(declare-fun mapRes!1947 () Bool)

(assert (=> b!287291 (= e!204541 (and tp_is_empty!599 mapRes!1947))))

(declare-fun condMapEmpty!1948 () Bool)

(declare-datatypes ((T!52065 0))(
  ( (T!52066 (val!299 Int)) )
))
(declare-datatypes ((array!16880 0))(
  ( (array!16881 (arr!8286 (Array (_ BitVec 32) T!52065)) (size!7290 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16880)

(declare-fun mapDefault!1947 () T!52065)


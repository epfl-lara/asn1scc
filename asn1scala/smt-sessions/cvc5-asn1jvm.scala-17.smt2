; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!532 () Bool)

(assert start!532)

(declare-fun b!1578 () Bool)

(declare-fun e!995 () Bool)

(declare-fun tp_is_empty!1 () Bool)

(declare-fun mapRes!4 () Bool)

(assert (=> b!1578 (= e!995 (and tp_is_empty!1 mapRes!4))))

(declare-fun condMapEmpty!4 () Bool)

(declare-datatypes ((T!533 0))(
  ( (T!534 (val!0 Int)) )
))
(declare-datatypes ((array!132 0))(
  ( (array!133 (arr!436 (Array (_ BitVec 32) T!533)) (size!49 (_ BitVec 32))) )
))
(declare-fun a1!444 () array!132)

(declare-fun mapDefault!4 () T!533)


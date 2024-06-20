; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63964 () Bool)

(assert start!63964)

(declare-fun b!284391 () Bool)

(declare-fun e!203305 () Bool)

(declare-fun tp_is_empty!409 () Bool)

(declare-fun mapRes!1098 () Bool)

(assert (=> b!284391 (= e!203305 (and tp_is_empty!409 mapRes!1098))))

(declare-fun condMapEmpty!1098 () Bool)

(declare-datatypes ((T!51255 0))(
  ( (T!51256 (val!204 Int)) )
))
(declare-datatypes ((array!16686 0))(
  ( (array!16687 (arr!8191 (Array (_ BitVec 32) T!51255)) (size!7195 (_ BitVec 32))) )
))
(declare-fun a3!63 () array!16686)

(declare-fun mapDefault!1099 () T!51255)


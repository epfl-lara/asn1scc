; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64002 () Bool)

(assert start!64002)

(declare-fun b!284750 () Bool)

(declare-fun e!203518 () Bool)

(declare-fun tp_is_empty!443 () Bool)

(declare-fun mapRes!1258 () Bool)

(assert (=> b!284750 (= e!203518 (and tp_is_empty!443 mapRes!1258))))

(declare-fun condMapEmpty!1256 () Bool)

(declare-datatypes ((T!51389 0))(
  ( (T!51390 (val!221 Int)) )
))
(declare-datatypes ((array!16721 0))(
  ( (array!16722 (arr!8208 (Array (_ BitVec 32) T!51389)) (size!7212 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16721)

(declare-fun mapDefault!1258 () T!51389)


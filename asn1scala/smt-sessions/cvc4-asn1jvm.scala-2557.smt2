; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64120 () Bool)

(assert start!64120)

(declare-fun mapNonEmpty!1774 () Bool)

(declare-fun mapRes!1776 () Bool)

(declare-fun tp!1775 () Bool)

(declare-fun tp_is_empty!557 () Bool)

(assert (=> mapNonEmpty!1774 (= mapRes!1776 (and tp!1775 tp_is_empty!557))))

(declare-datatypes ((T!51883 0))(
  ( (T!51884 (val!278 Int)) )
))
(declare-fun mapValue!1774 () T!51883)

(declare-fun mapRest!1775 () (Array (_ BitVec 32) T!51883))

(declare-datatypes ((array!16836 0))(
  ( (array!16837 (arr!8265 (Array (_ BitVec 32) T!51883)) (size!7269 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16836)

(declare-fun mapKey!1775 () (_ BitVec 32))

(assert (=> mapNonEmpty!1774 (= (arr!8265 a2!647) (store mapRest!1775 mapKey!1775 mapValue!1774))))

(declare-fun b!286643 () Bool)

(declare-fun e!204254 () Bool)

(declare-fun e!204252 () Bool)

(assert (=> b!286643 (= e!204254 (not e!204252))))

(declare-fun res!237140 () Bool)

(assert (=> b!286643 (=> res!237140 e!204252)))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286643 (= res!237140 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun a1!647 () array!16836)

(declare-fun a3!68 () array!16836)

(declare-fun arrayRangesEq!1406 (array!16836 array!16836 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286643 (arrayRangesEq!1406 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19949 0))(
  ( (Unit!19950) )
))
(declare-fun lt!418659 () Unit!19949)

(declare-fun arrayRangesEqAppend!16 (array!16836 array!16836 (_ BitVec 32) (_ BitVec 32)) Unit!19949)

(assert (=> b!286643 (= lt!418659 (arrayRangesEqAppend!16 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286644 () Bool)

(declare-fun e!204253 () Bool)

(declare-fun mapRes!1775 () Bool)

(assert (=> b!286644 (= e!204253 (and tp_is_empty!557 mapRes!1775))))

(declare-fun condMapEmpty!1775 () Bool)

(declare-fun mapDefault!1775 () T!51883)


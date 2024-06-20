; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64164 () Bool)

(assert start!64164)

(declare-fun mapIsEmpty!1917 () Bool)

(declare-fun mapRes!1917 () Bool)

(assert (=> mapIsEmpty!1917 mapRes!1917))

(declare-fun b!287201 () Bool)

(declare-fun e!204495 () Bool)

(declare-fun from!706 () (_ BitVec 32))

(declare-fun to!673 () (_ BitVec 32))

(assert (=> b!287201 (= e!204495 (not (bvsle from!706 (bvadd #b00000000000000000000000000000001 to!673))))))

(declare-datatypes ((T!52035 0))(
  ( (T!52036 (val!294 Int)) )
))
(declare-datatypes ((array!16870 0))(
  ( (array!16871 (arr!8281 (Array (_ BitVec 32) T!52035)) (size!7285 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16870)

(declare-fun a1!580 () array!16870)

(declare-fun arrayRangesEq!1417 (array!16870 array!16870 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287201 (arrayRangesEq!1417 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19963 0))(
  ( (Unit!19964) )
))
(declare-fun lt!418713 () Unit!19963)

(declare-fun rec!70 (array!16870 array!16870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19963)

(assert (=> b!287201 (= lt!418713 (rec!70 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun mapIsEmpty!1918 () Bool)

(declare-fun mapRes!1918 () Bool)

(assert (=> mapIsEmpty!1918 mapRes!1918))

(declare-fun mapNonEmpty!1917 () Bool)

(declare-fun tp!1917 () Bool)

(declare-fun tp_is_empty!589 () Bool)

(assert (=> mapNonEmpty!1917 (= mapRes!1917 (and tp!1917 tp_is_empty!589))))

(declare-fun mapValue!1918 () T!52035)

(declare-fun mapKey!1917 () (_ BitVec 32))

(declare-fun mapRest!1917 () (Array (_ BitVec 32) T!52035))

(assert (=> mapNonEmpty!1917 (= (arr!8281 a1!580) (store mapRest!1917 mapKey!1917 mapValue!1918))))

(declare-fun b!287203 () Bool)

(declare-fun e!204496 () Bool)

(assert (=> b!287203 (= e!204496 (and tp_is_empty!589 mapRes!1918))))

(declare-fun condMapEmpty!1917 () Bool)

(declare-fun mapDefault!1917 () T!52035)


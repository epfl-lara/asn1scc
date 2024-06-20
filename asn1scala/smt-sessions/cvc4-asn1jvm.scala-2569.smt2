; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64208 () Bool)

(assert start!64208)

(declare-fun mapNonEmpty!2043 () Bool)

(declare-fun mapRes!2044 () Bool)

(declare-fun tp!2043 () Bool)

(declare-fun tp_is_empty!629 () Bool)

(assert (=> mapNonEmpty!2043 (= mapRes!2044 (and tp!2043 tp_is_empty!629))))

(declare-fun mapKey!2043 () (_ BitVec 32))

(declare-datatypes ((T!52195 0))(
  ( (T!52196 (val!314 Int)) )
))
(declare-fun mapValue!2044 () T!52195)

(declare-fun mapRest!2043 () (Array (_ BitVec 32) T!52195))

(declare-datatypes ((array!16911 0))(
  ( (array!16912 (arr!8301 (Array (_ BitVec 32) T!52195)) (size!7305 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16911)

(assert (=> mapNonEmpty!2043 (= (arr!8301 a1!580) (store mapRest!2043 mapKey!2043 mapValue!2044))))

(declare-fun res!237762 () Bool)

(declare-fun e!204689 () Bool)

(assert (=> start!64208 (=> (not res!237762) (not e!204689))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun a2!580 () array!16911)

(assert (=> start!64208 (= res!237762 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7305 a1!580) (size!7305 a2!580)) (bvslt to!673 (size!7305 a1!580))))))

(assert (=> start!64208 e!204689))

(assert (=> start!64208 true))

(declare-fun e!204688 () Bool)

(declare-fun array_inv!6943 (array!16911) Bool)

(assert (=> start!64208 (and (array_inv!6943 a1!580) e!204688)))

(declare-fun e!204687 () Bool)

(assert (=> start!64208 (and (array_inv!6943 a2!580) e!204687)))

(declare-fun b!287530 () Bool)

(assert (=> b!287530 (= e!204689 (not (or (not (= (bvand to!673 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand to!673 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!673) #b10000000000000000000000000000000)))))))

(declare-fun arrayRangesEq!1428 (array!16911 array!16911 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287530 (arrayRangesEq!1428 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19975 0))(
  ( (Unit!19976) )
))
(declare-fun lt!418746 () Unit!19975)

(declare-fun rec!76 (array!16911 array!16911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19975)

(assert (=> b!287530 (= lt!418746 (rec!76 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun b!287531 () Bool)

(declare-fun mapRes!2043 () Bool)

(assert (=> b!287531 (= e!204687 (and tp_is_empty!629 mapRes!2043))))

(declare-fun condMapEmpty!2044 () Bool)

(declare-fun mapDefault!2043 () T!52195)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64246 () Bool)

(assert start!64246)

(declare-fun mapIsEmpty!2157 () Bool)

(declare-fun mapRes!2157 () Bool)

(assert (=> mapIsEmpty!2157 mapRes!2157))

(declare-fun res!238027 () Bool)

(declare-fun e!204872 () Bool)

(assert (=> start!64246 (=> (not res!238027) (not e!204872))))

(declare-datatypes ((T!52373 0))(
  ( (T!52374 (val!333 Int)) )
))
(declare-datatypes ((array!16949 0))(
  ( (array!16950 (arr!8320 (Array (_ BitVec 32) T!52373)) (size!7324 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16949)

(declare-fun a2!596 () array!16949)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64246 (= res!238027 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7324 a1!596) (size!7324 a2!596)) (bvslt to!689 (size!7324 a1!596))))))

(assert (=> start!64246 e!204872))

(declare-fun e!204871 () Bool)

(declare-fun array_inv!6955 (array!16949) Bool)

(assert (=> start!64246 (and (array_inv!6955 a1!596) e!204871)))

(declare-fun e!204870 () Bool)

(assert (=> start!64246 (and (array_inv!6955 a2!596) e!204870)))

(assert (=> start!64246 true))

(declare-fun mapNonEmpty!2157 () Bool)

(declare-fun tp!2157 () Bool)

(declare-fun tp_is_empty!667 () Bool)

(assert (=> mapNonEmpty!2157 (= mapRes!2157 (and tp!2157 tp_is_empty!667))))

(declare-fun mapRest!2158 () (Array (_ BitVec 32) T!52373))

(declare-fun mapValue!2158 () T!52373)

(declare-fun mapKey!2158 () (_ BitVec 32))

(assert (=> mapNonEmpty!2157 (= (arr!8320 a2!596) (store mapRest!2158 mapKey!2158 mapValue!2158))))

(declare-fun b!287905 () Bool)

(declare-fun e!204869 () Bool)

(assert (=> b!287905 (= e!204872 (not e!204869))))

(declare-fun res!238026 () Bool)

(assert (=> b!287905 (=> res!238026 e!204869)))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!287905 (= res!238026 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!287905 (= (select (arr!8320 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8320 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19993 0))(
  ( (Unit!19994) )
))
(declare-fun lt!418796 () Unit!19993)

(declare-fun arrayRangesEqImpliesEq!202 (array!16949 array!16949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19993)

(assert (=> b!287905 (= lt!418796 (arrayRangesEqImpliesEq!202 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun b!287906 () Bool)

(declare-fun res!238022 () Bool)

(assert (=> b!287906 (=> res!238022 e!204869)))

(declare-fun arrayRangesEq!1442 (array!16949 array!16949 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287906 (= res!238022 (not (arrayRangesEq!1442 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun mapNonEmpty!2158 () Bool)

(declare-fun mapRes!2158 () Bool)

(declare-fun tp!2158 () Bool)

(assert (=> mapNonEmpty!2158 (= mapRes!2158 (and tp!2158 tp_is_empty!667))))

(declare-fun mapValue!2157 () T!52373)

(declare-fun mapKey!2157 () (_ BitVec 32))

(declare-fun mapRest!2157 () (Array (_ BitVec 32) T!52373))

(assert (=> mapNonEmpty!2158 (= (arr!8320 a1!596) (store mapRest!2157 mapKey!2157 mapValue!2157))))

(declare-fun b!287907 () Bool)

(declare-fun res!238024 () Bool)

(assert (=> b!287907 (=> (not res!238024) (not e!204872))))

(assert (=> b!287907 (= res!238024 (arrayRangesEq!1442 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!287908 () Bool)

(assert (=> b!287908 (= e!204869 true)))

(assert (=> b!287908 (arrayRangesEq!1442 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun lt!418797 () Unit!19993)

(declare-fun rec!82 (array!16949 array!16949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19993)

(assert (=> b!287908 (= lt!418797 (rec!82 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun b!287909 () Bool)

(declare-fun res!238023 () Bool)

(assert (=> b!287909 (=> (not res!238023) (not e!204872))))

(assert (=> b!287909 (= res!238023 (not (= i!953 from!722)))))

(declare-fun b!287910 () Bool)

(assert (=> b!287910 (= e!204871 (and tp_is_empty!667 mapRes!2158))))

(declare-fun condMapEmpty!2157 () Bool)

(declare-fun mapDefault!2158 () T!52373)


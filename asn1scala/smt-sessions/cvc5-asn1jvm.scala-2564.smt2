; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64170 () Bool)

(assert start!64170)

(declare-fun b!287255 () Bool)

(declare-fun e!204524 () Bool)

(assert (=> b!287255 (= e!204524 (not true))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-datatypes ((T!52061 0))(
  ( (T!52062 (val!297 Int)) )
))
(declare-datatypes ((array!16876 0))(
  ( (array!16877 (arr!8284 (Array (_ BitVec 32) T!52061)) (size!7288 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16876)

(declare-fun a1!580 () array!16876)

(declare-fun arrayRangesEq!1420 (array!16876 array!16876 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287255 (arrayRangesEq!1420 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19967 0))(
  ( (Unit!19968) )
))
(declare-fun lt!418722 () Unit!19967)

(declare-fun rec!72 (array!16876 array!16876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19967)

(assert (=> b!287255 (= lt!418722 (rec!72 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun mapNonEmpty!1935 () Bool)

(declare-fun mapRes!1936 () Bool)

(declare-fun tp!1936 () Bool)

(declare-fun tp_is_empty!595 () Bool)

(assert (=> mapNonEmpty!1935 (= mapRes!1936 (and tp!1936 tp_is_empty!595))))

(declare-fun mapRest!1935 () (Array (_ BitVec 32) T!52061))

(declare-fun mapValue!1935 () T!52061)

(declare-fun mapKey!1935 () (_ BitVec 32))

(assert (=> mapNonEmpty!1935 (= (arr!8284 a2!580) (store mapRest!1935 mapKey!1935 mapValue!1935))))

(declare-fun mapIsEmpty!1935 () Bool)

(assert (=> mapIsEmpty!1935 mapRes!1936))

(declare-fun mapIsEmpty!1936 () Bool)

(declare-fun mapRes!1935 () Bool)

(assert (=> mapIsEmpty!1936 mapRes!1935))

(declare-fun b!287256 () Bool)

(declare-fun res!237589 () Bool)

(assert (=> b!287256 (=> (not res!237589) (not e!204524))))

(assert (=> b!287256 (= res!237589 (arrayRangesEq!1420 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun b!287257 () Bool)

(declare-fun res!237591 () Bool)

(assert (=> b!287257 (=> (not res!237591) (not e!204524))))

(assert (=> b!287257 (= res!237591 (arrayRangesEq!1420 a1!580 a2!580 from!706 to!673))))

(declare-fun b!287258 () Bool)

(declare-fun e!204522 () Bool)

(assert (=> b!287258 (= e!204522 (and tp_is_empty!595 mapRes!1935))))

(declare-fun condMapEmpty!1935 () Bool)

(declare-fun mapDefault!1936 () T!52061)


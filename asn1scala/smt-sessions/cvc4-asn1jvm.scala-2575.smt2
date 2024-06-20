; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64244 () Bool)

(assert start!64244)

(declare-fun b!287878 () Bool)

(declare-fun res!238001 () Bool)

(declare-fun e!204858 () Bool)

(assert (=> b!287878 (=> (not res!238001) (not e!204858))))

(declare-datatypes ((T!52351 0))(
  ( (T!52352 (val!332 Int)) )
))
(declare-datatypes ((array!16947 0))(
  ( (array!16948 (arr!8319 (Array (_ BitVec 32) T!52351)) (size!7323 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16947)

(declare-fun a2!596 () array!16947)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1441 (array!16947 array!16947 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287878 (= res!238001 (arrayRangesEq!1441 a1!596 a2!596 from!722 to!689))))

(declare-fun b!287879 () Bool)

(declare-fun e!204860 () Bool)

(assert (=> b!287879 (= e!204860 (bvsle from!722 (bvadd #b00000000000000000000000000000001 to!689)))))

(assert (=> b!287879 (arrayRangesEq!1441 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun i!953 () (_ BitVec 32))

(declare-datatypes ((Unit!19991 0))(
  ( (Unit!19992) )
))
(declare-fun lt!418791 () Unit!19991)

(declare-fun rec!81 (array!16947 array!16947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19991)

(assert (=> b!287879 (= lt!418791 (rec!81 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun b!287880 () Bool)

(declare-fun res!238003 () Bool)

(assert (=> b!287880 (=> res!238003 e!204860)))

(assert (=> b!287880 (= res!238003 (not (arrayRangesEq!1441 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!287881 () Bool)

(declare-fun res!238005 () Bool)

(assert (=> b!287881 (=> (not res!238005) (not e!204858))))

(assert (=> b!287881 (= res!238005 (not (= i!953 from!722)))))

(declare-fun b!287883 () Bool)

(declare-fun res!238004 () Bool)

(assert (=> b!287883 (=> (not res!238004) (not e!204858))))

(assert (=> b!287883 (= res!238004 (arrayRangesEq!1441 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!287884 () Bool)

(declare-fun e!204859 () Bool)

(declare-fun tp_is_empty!665 () Bool)

(declare-fun mapRes!2152 () Bool)

(assert (=> b!287884 (= e!204859 (and tp_is_empty!665 mapRes!2152))))

(declare-fun condMapEmpty!2151 () Bool)

(declare-fun mapDefault!2152 () T!52351)


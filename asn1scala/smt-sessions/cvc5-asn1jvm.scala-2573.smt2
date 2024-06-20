; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64228 () Bool)

(assert start!64228)

(declare-fun b!287694 () Bool)

(declare-fun res!237867 () Bool)

(declare-fun e!204779 () Bool)

(assert (=> b!287694 (=> (not res!237867) (not e!204779))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!287694 (= res!237867 (not (= i!953 from!722)))))

(declare-fun b!287695 () Bool)

(declare-fun e!204777 () Bool)

(declare-fun tp_is_empty!649 () Bool)

(declare-fun mapRes!2103 () Bool)

(assert (=> b!287695 (= e!204777 (and tp_is_empty!649 mapRes!2103))))

(declare-fun condMapEmpty!2104 () Bool)

(declare-datatypes ((T!52295 0))(
  ( (T!52296 (val!324 Int)) )
))
(declare-datatypes ((array!16931 0))(
  ( (array!16932 (arr!8311 (Array (_ BitVec 32) T!52295)) (size!7315 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16931)

(declare-fun mapDefault!2103 () T!52295)


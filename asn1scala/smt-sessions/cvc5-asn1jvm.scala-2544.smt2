; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64034 () Bool)

(assert start!64034)

(declare-fun b!285230 () Bool)

(declare-fun res!236097 () Bool)

(declare-fun e!203711 () Bool)

(assert (=> b!285230 (=> (not res!236097) (not e!203711))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285230 (= res!236097 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285231 () Bool)

(declare-fun e!203710 () Bool)

(declare-fun tp_is_empty!475 () Bool)

(declare-fun mapRes!1402 () Bool)

(assert (=> b!285231 (= e!203710 (and tp_is_empty!475 mapRes!1402))))

(declare-fun condMapEmpty!1402 () Bool)

(declare-datatypes ((T!51541 0))(
  ( (T!51542 (val!237 Int)) )
))
(declare-datatypes ((array!16753 0))(
  ( (array!16754 (arr!8224 (Array (_ BitVec 32) T!51541)) (size!7228 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16753)

(declare-fun mapDefault!1400 () T!51541)


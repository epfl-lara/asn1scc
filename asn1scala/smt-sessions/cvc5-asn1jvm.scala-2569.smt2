; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64204 () Bool)

(assert start!64204)

(declare-fun mapIsEmpty!2031 () Bool)

(declare-fun mapRes!2031 () Bool)

(assert (=> mapIsEmpty!2031 mapRes!2031))

(declare-fun b!287494 () Bool)

(declare-fun res!237736 () Bool)

(declare-fun e!204671 () Bool)

(assert (=> b!287494 (=> (not res!237736) (not e!204671))))

(declare-fun to!673 () (_ BitVec 32))

(declare-datatypes ((T!52191 0))(
  ( (T!52192 (val!312 Int)) )
))
(declare-datatypes ((array!16907 0))(
  ( (array!16908 (arr!8299 (Array (_ BitVec 32) T!52191)) (size!7303 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16907)

(declare-fun a1!580 () array!16907)

(declare-fun arrayRangesEq!1426 (array!16907 array!16907 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287494 (= res!237736 (arrayRangesEq!1426 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun b!287495 () Bool)

(declare-fun e!204670 () Bool)

(declare-fun tp_is_empty!625 () Bool)

(declare-fun mapRes!2032 () Bool)

(assert (=> b!287495 (= e!204670 (and tp_is_empty!625 mapRes!2032))))

(declare-fun condMapEmpty!2031 () Bool)

(declare-fun mapDefault!2032 () T!52191)


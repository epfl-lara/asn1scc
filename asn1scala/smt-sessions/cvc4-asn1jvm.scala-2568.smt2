; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64198 () Bool)

(assert start!64198)

(declare-fun b!287463 () Bool)

(declare-fun res!237713 () Bool)

(declare-fun e!204650 () Bool)

(assert (=> b!287463 (=> (not res!237713) (not e!204650))))

(declare-fun to!673 () (_ BitVec 32))

(declare-datatypes ((T!52169 0))(
  ( (T!52170 (val!311 Int)) )
))
(declare-datatypes ((array!16904 0))(
  ( (array!16905 (arr!8298 (Array (_ BitVec 32) T!52169)) (size!7302 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16904)

(declare-fun a1!580 () array!16904)

(assert (=> b!287463 (= res!237713 (= (select (arr!8298 a1!580) to!673) (select (arr!8298 a2!580) to!673)))))

(declare-fun b!287464 () Bool)

(declare-fun e!204648 () Bool)

(declare-fun tp_is_empty!623 () Bool)

(declare-fun mapRes!2019 () Bool)

(assert (=> b!287464 (= e!204648 (and tp_is_empty!623 mapRes!2019))))

(declare-fun condMapEmpty!2019 () Bool)

(declare-fun mapDefault!2020 () T!52169)


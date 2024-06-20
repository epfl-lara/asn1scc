; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64180 () Bool)

(assert start!64180)

(declare-fun res!237651 () Bool)

(declare-fun e!204568 () Bool)

(assert (=> start!64180 (=> (not res!237651) (not e!204568))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-datatypes ((T!52091 0))(
  ( (T!52092 (val!302 Int)) )
))
(declare-datatypes ((array!16886 0))(
  ( (array!16887 (arr!8289 (Array (_ BitVec 32) T!52091)) (size!7293 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16886)

(declare-fun a1!580 () array!16886)

(assert (=> start!64180 (= res!237651 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7293 a1!580) (size!7293 a2!580)) (bvslt to!673 (size!7293 a1!580))))))

(assert (=> start!64180 e!204568))

(assert (=> start!64180 true))

(declare-fun e!204569 () Bool)

(declare-fun array_inv!6937 (array!16886) Bool)

(assert (=> start!64180 (and (array_inv!6937 a1!580) e!204569)))

(declare-fun e!204567 () Bool)

(assert (=> start!64180 (and (array_inv!6937 a2!580) e!204567)))

(declare-fun b!287345 () Bool)

(declare-fun res!237650 () Bool)

(assert (=> b!287345 (=> (not res!237650) (not e!204568))))

(assert (=> b!287345 (= res!237650 (= (select (arr!8289 a1!580) to!673) (select (arr!8289 a2!580) to!673)))))

(declare-fun b!287346 () Bool)

(declare-fun tp_is_empty!605 () Bool)

(declare-fun mapRes!1965 () Bool)

(assert (=> b!287346 (= e!204567 (and tp_is_empty!605 mapRes!1965))))

(declare-fun condMapEmpty!1965 () Bool)

(declare-fun mapDefault!1966 () T!52091)


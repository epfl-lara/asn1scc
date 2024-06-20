; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64168 () Bool)

(assert start!64168)

(declare-fun b!287237 () Bool)

(declare-fun res!237580 () Bool)

(declare-fun e!204514 () Bool)

(assert (=> b!287237 (=> (not res!237580) (not e!204514))))

(declare-fun to!673 () (_ BitVec 32))

(declare-datatypes ((T!52039 0))(
  ( (T!52040 (val!296 Int)) )
))
(declare-datatypes ((array!16874 0))(
  ( (array!16875 (arr!8283 (Array (_ BitVec 32) T!52039)) (size!7287 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16874)

(declare-fun a1!580 () array!16874)

(declare-fun arrayRangesEq!1419 (array!16874 array!16874 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287237 (= res!237580 (arrayRangesEq!1419 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun res!237579 () Bool)

(assert (=> start!64168 (=> (not res!237579) (not e!204514))))

(declare-fun from!706 () (_ BitVec 32))

(assert (=> start!64168 (= res!237579 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7287 a1!580) (size!7287 a2!580)) (bvslt to!673 (size!7287 a1!580))))))

(assert (=> start!64168 e!204514))

(assert (=> start!64168 true))

(declare-fun e!204515 () Bool)

(declare-fun array_inv!6934 (array!16874) Bool)

(assert (=> start!64168 (and (array_inv!6934 a1!580) e!204515)))

(declare-fun e!204513 () Bool)

(assert (=> start!64168 (and (array_inv!6934 a2!580) e!204513)))

(declare-fun b!287238 () Bool)

(declare-fun res!237577 () Bool)

(assert (=> b!287238 (=> (not res!237577) (not e!204514))))

(assert (=> b!287238 (= res!237577 (arrayRangesEq!1419 a1!580 a2!580 from!706 to!673))))

(declare-fun b!287239 () Bool)

(declare-fun res!237578 () Bool)

(assert (=> b!287239 (=> (not res!237578) (not e!204514))))

(assert (=> b!287239 (= res!237578 (= (select (arr!8283 a1!580) to!673) (select (arr!8283 a2!580) to!673)))))

(declare-fun mapNonEmpty!1929 () Bool)

(declare-fun mapRes!1930 () Bool)

(declare-fun tp!1930 () Bool)

(declare-fun tp_is_empty!593 () Bool)

(assert (=> mapNonEmpty!1929 (= mapRes!1930 (and tp!1930 tp_is_empty!593))))

(declare-fun mapKey!1929 () (_ BitVec 32))

(declare-fun mapValue!1930 () T!52039)

(declare-fun mapRest!1929 () (Array (_ BitVec 32) T!52039))

(assert (=> mapNonEmpty!1929 (= (arr!8283 a1!580) (store mapRest!1929 mapKey!1929 mapValue!1930))))

(declare-fun b!287240 () Bool)

(assert (=> b!287240 (= e!204515 (and tp_is_empty!593 mapRes!1930))))

(declare-fun condMapEmpty!1929 () Bool)

(declare-fun mapDefault!1930 () T!52039)


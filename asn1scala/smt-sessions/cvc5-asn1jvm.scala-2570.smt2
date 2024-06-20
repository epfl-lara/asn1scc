; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64210 () Bool)

(assert start!64210)

(declare-fun mapNonEmpty!2049 () Bool)

(declare-fun mapRes!2050 () Bool)

(declare-fun tp!2049 () Bool)

(declare-fun tp_is_empty!631 () Bool)

(assert (=> mapNonEmpty!2049 (= mapRes!2050 (and tp!2049 tp_is_empty!631))))

(declare-datatypes ((T!52217 0))(
  ( (T!52218 (val!315 Int)) )
))
(declare-fun mapValue!2049 () T!52217)

(declare-fun mapKey!2049 () (_ BitVec 32))

(declare-fun mapRest!2050 () (Array (_ BitVec 32) T!52217))

(declare-datatypes ((array!16913 0))(
  ( (array!16914 (arr!8302 (Array (_ BitVec 32) T!52217)) (size!7306 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16913)

(assert (=> mapNonEmpty!2049 (= (arr!8302 a1!580) (store mapRest!2050 mapKey!2049 mapValue!2049))))

(declare-fun mapIsEmpty!2049 () Bool)

(declare-fun mapRes!2049 () Bool)

(assert (=> mapIsEmpty!2049 mapRes!2049))

(declare-fun res!237775 () Bool)

(declare-fun e!204696 () Bool)

(assert (=> start!64210 (=> (not res!237775) (not e!204696))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun a2!580 () array!16913)

(assert (=> start!64210 (= res!237775 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7306 a1!580) (size!7306 a2!580)) (bvslt to!673 (size!7306 a1!580))))))

(assert (=> start!64210 e!204696))

(assert (=> start!64210 true))

(declare-fun e!204698 () Bool)

(declare-fun array_inv!6944 (array!16913) Bool)

(assert (=> start!64210 (and (array_inv!6944 a1!580) e!204698)))

(declare-fun e!204697 () Bool)

(assert (=> start!64210 (and (array_inv!6944 a2!580) e!204697)))

(declare-fun b!287548 () Bool)

(declare-fun res!237774 () Bool)

(assert (=> b!287548 (=> (not res!237774) (not e!204696))))

(declare-fun arrayRangesEq!1429 (array!16913 array!16913 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287548 (= res!237774 (arrayRangesEq!1429 a1!580 a2!580 from!706 to!673))))

(declare-fun b!287549 () Bool)

(assert (=> b!287549 (= e!204697 (and tp_is_empty!631 mapRes!2049))))

(declare-fun condMapEmpty!2049 () Bool)

(declare-fun mapDefault!2050 () T!52217)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64186 () Bool)

(assert start!64186)

(declare-fun mapIsEmpty!1983 () Bool)

(declare-fun mapRes!1983 () Bool)

(assert (=> mapIsEmpty!1983 mapRes!1983))

(declare-fun mapNonEmpty!1983 () Bool)

(declare-fun tp!1983 () Bool)

(declare-fun tp_is_empty!611 () Bool)

(assert (=> mapNonEmpty!1983 (= mapRes!1983 (and tp!1983 tp_is_empty!611))))

(declare-datatypes ((T!52117 0))(
  ( (T!52118 (val!305 Int)) )
))
(declare-fun mapValue!1984 () T!52117)

(declare-datatypes ((array!16892 0))(
  ( (array!16893 (arr!8292 (Array (_ BitVec 32) T!52117)) (size!7296 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16892)

(declare-fun mapRest!1984 () (Array (_ BitVec 32) T!52117))

(declare-fun mapKey!1984 () (_ BitVec 32))

(assert (=> mapNonEmpty!1983 (= (arr!8292 a1!580) (store mapRest!1984 mapKey!1984 mapValue!1984))))

(declare-fun res!237669 () Bool)

(declare-fun e!204595 () Bool)

(assert (=> start!64186 (=> (not res!237669) (not e!204595))))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun a2!580 () array!16892)

(declare-fun to!673 () (_ BitVec 32))

(assert (=> start!64186 (= res!237669 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7296 a1!580) (size!7296 a2!580)) (bvslt to!673 (size!7296 a1!580))))))

(assert (=> start!64186 e!204595))

(assert (=> start!64186 true))

(declare-fun e!204594 () Bool)

(declare-fun array_inv!6939 (array!16892) Bool)

(assert (=> start!64186 (and (array_inv!6939 a1!580) e!204594)))

(declare-fun e!204596 () Bool)

(assert (=> start!64186 (and (array_inv!6939 a2!580) e!204596)))

(declare-fun b!287383 () Bool)

(declare-fun mapRes!1984 () Bool)

(assert (=> b!287383 (= e!204596 (and tp_is_empty!611 mapRes!1984))))

(declare-fun condMapEmpty!1983 () Bool)

(declare-fun mapDefault!1984 () T!52117)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64214 () Bool)

(assert start!64214)

(declare-fun res!237797 () Bool)

(declare-fun e!204714 () Bool)

(assert (=> start!64214 (=> (not res!237797) (not e!204714))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-datatypes ((T!52221 0))(
  ( (T!52222 (val!317 Int)) )
))
(declare-datatypes ((array!16917 0))(
  ( (array!16918 (arr!8304 (Array (_ BitVec 32) T!52221)) (size!7308 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16917)

(declare-fun a1!580 () array!16917)

(assert (=> start!64214 (= res!237797 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7308 a1!580) (size!7308 a2!580)) (bvslt to!673 (size!7308 a1!580))))))

(assert (=> start!64214 e!204714))

(assert (=> start!64214 true))

(declare-fun e!204716 () Bool)

(declare-fun array_inv!6946 (array!16917) Bool)

(assert (=> start!64214 (and (array_inv!6946 a1!580) e!204716)))

(declare-fun e!204715 () Bool)

(assert (=> start!64214 (and (array_inv!6946 a2!580) e!204715)))

(declare-fun mapNonEmpty!2061 () Bool)

(declare-fun mapRes!2061 () Bool)

(declare-fun tp!2062 () Bool)

(declare-fun tp_is_empty!635 () Bool)

(assert (=> mapNonEmpty!2061 (= mapRes!2061 (and tp!2062 tp_is_empty!635))))

(declare-fun mapValue!2061 () T!52221)

(declare-fun mapRest!2062 () (Array (_ BitVec 32) T!52221))

(declare-fun mapKey!2062 () (_ BitVec 32))

(assert (=> mapNonEmpty!2061 (= (arr!8304 a2!580) (store mapRest!2062 mapKey!2062 mapValue!2061))))

(declare-fun mapIsEmpty!2061 () Bool)

(assert (=> mapIsEmpty!2061 mapRes!2061))

(declare-fun b!287584 () Bool)

(assert (=> b!287584 (= e!204714 (not true))))

(declare-fun arrayRangesEq!1431 (array!16917 array!16917 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287584 (arrayRangesEq!1431 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19979 0))(
  ( (Unit!19980) )
))
(declare-fun lt!418755 () Unit!19979)

(declare-fun rec!78 (array!16917 array!16917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19979)

(assert (=> b!287584 (= lt!418755 (rec!78 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun mapIsEmpty!2062 () Bool)

(declare-fun mapRes!2062 () Bool)

(assert (=> mapIsEmpty!2062 mapRes!2062))

(declare-fun b!287585 () Bool)

(declare-fun res!237798 () Bool)

(assert (=> b!287585 (=> (not res!237798) (not e!204714))))

(assert (=> b!287585 (= res!237798 (arrayRangesEq!1431 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun b!287586 () Bool)

(assert (=> b!287586 (= e!204716 (and tp_is_empty!635 mapRes!2062))))

(declare-fun condMapEmpty!2061 () Bool)

(declare-fun mapDefault!2062 () T!52221)


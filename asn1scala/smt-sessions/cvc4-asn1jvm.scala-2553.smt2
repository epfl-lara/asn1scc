; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64092 () Bool)

(assert start!64092)

(declare-fun res!236835 () Bool)

(declare-fun e!204088 () Bool)

(assert (=> start!64092 (=> (not res!236835) (not e!204088))))

(declare-datatypes ((T!51779 0))(
  ( (T!51780 (val!266 Int)) )
))
(declare-datatypes ((array!16811 0))(
  ( (array!16812 (arr!8253 (Array (_ BitVec 32) T!51779)) (size!7257 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16811)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16811)

(declare-fun a3!68 () array!16811)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64092 (= res!236835 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7257 a1!647) (size!7257 a2!647)) (bvsle (size!7257 a2!647) (size!7257 a3!68)) (bvsle mid!71 (size!7257 a1!647)) (bvsle to!740 (size!7257 a2!647))))))

(assert (=> start!64092 e!204088))

(declare-fun e!204086 () Bool)

(declare-fun array_inv!6915 (array!16811) Bool)

(assert (=> start!64092 (and (array_inv!6915 a2!647) e!204086)))

(assert (=> start!64092 true))

(declare-fun e!204087 () Bool)

(assert (=> start!64092 (and (array_inv!6915 a1!647) e!204087)))

(declare-fun e!204085 () Bool)

(assert (=> start!64092 (and (array_inv!6915 a3!68) e!204085)))

(declare-fun b!286233 () Bool)

(declare-fun res!236834 () Bool)

(assert (=> b!286233 (=> (not res!236834) (not e!204088))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!286233 (= res!236834 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1661 () Bool)

(declare-fun mapRes!1662 () Bool)

(declare-fun tp!1662 () Bool)

(declare-fun tp_is_empty!533 () Bool)

(assert (=> mapNonEmpty!1661 (= mapRes!1662 (and tp!1662 tp_is_empty!533))))

(declare-fun mapKey!1661 () (_ BitVec 32))

(declare-fun mapValue!1662 () T!51779)

(declare-fun mapRest!1661 () (Array (_ BitVec 32) T!51779))

(assert (=> mapNonEmpty!1661 (= (arr!8253 a1!647) (store mapRest!1661 mapKey!1661 mapValue!1662))))

(declare-fun mapIsEmpty!1661 () Bool)

(assert (=> mapIsEmpty!1661 mapRes!1662))

(declare-fun b!286234 () Bool)

(declare-fun res!236836 () Bool)

(assert (=> b!286234 (=> (not res!236836) (not e!204088))))

(declare-fun arrayRangesEq!1396 (array!16811 array!16811 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286234 (= res!236836 (arrayRangesEq!1396 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapIsEmpty!1662 () Bool)

(declare-fun mapRes!1661 () Bool)

(assert (=> mapIsEmpty!1662 mapRes!1661))

(declare-fun b!286235 () Bool)

(declare-fun res!236832 () Bool)

(assert (=> b!286235 (=> (not res!236832) (not e!204088))))

(assert (=> b!286235 (= res!236832 (arrayRangesEq!1396 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!286236 () Bool)

(assert (=> b!286236 (= e!204087 (and tp_is_empty!533 mapRes!1662))))

(declare-fun condMapEmpty!1663 () Bool)

(declare-fun mapDefault!1663 () T!51779)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64132 () Bool)

(assert start!64132)

(declare-fun mapIsEmpty!1806 () Bool)

(declare-fun mapRes!1806 () Bool)

(assert (=> mapIsEmpty!1806 mapRes!1806))

(declare-fun mapIsEmpty!1807 () Bool)

(declare-fun mapRes!1808 () Bool)

(assert (=> mapIsEmpty!1807 mapRes!1808))

(declare-fun res!237242 () Bool)

(declare-fun e!204319 () Bool)

(assert (=> start!64132 (=> (not res!237242) (not e!204319))))

(declare-datatypes ((T!51909 0))(
  ( (T!51910 (val!281 Int)) )
))
(declare-datatypes ((array!16843 0))(
  ( (array!16844 (arr!8268 (Array (_ BitVec 32) T!51909)) (size!7272 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16843)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16843)

(declare-fun a3!68 () array!16843)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64132 (= res!237242 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7272 a1!647) (size!7272 a2!647)) (bvsle (size!7272 a2!647) (size!7272 a3!68)) (bvsle mid!71 (size!7272 a1!647)) (bvsle to!740 (size!7272 a2!647))))))

(assert (=> start!64132 e!204319))

(declare-fun e!204317 () Bool)

(declare-fun array_inv!6924 (array!16843) Bool)

(assert (=> start!64132 (and (array_inv!6924 a2!647) e!204317)))

(assert (=> start!64132 true))

(declare-fun e!204321 () Bool)

(assert (=> start!64132 (and (array_inv!6924 a1!647) e!204321)))

(declare-fun e!204320 () Bool)

(assert (=> start!64132 (and (array_inv!6924 a3!68) e!204320)))

(declare-fun b!286782 () Bool)

(declare-fun tp_is_empty!563 () Bool)

(declare-fun mapRes!1807 () Bool)

(assert (=> b!286782 (= e!204320 (and tp_is_empty!563 mapRes!1807))))

(declare-fun condMapEmpty!1808 () Bool)

(declare-fun mapDefault!1807 () T!51909)


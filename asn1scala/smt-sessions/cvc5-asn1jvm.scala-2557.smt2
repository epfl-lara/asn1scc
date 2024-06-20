; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64116 () Bool)

(assert start!64116)

(declare-fun mapIsEmpty!1756 () Bool)

(declare-fun mapRes!1756 () Bool)

(assert (=> mapIsEmpty!1756 mapRes!1756))

(declare-fun res!237084 () Bool)

(declare-fun e!204225 () Bool)

(assert (=> start!64116 (=> (not res!237084) (not e!204225))))

(declare-datatypes ((T!51879 0))(
  ( (T!51880 (val!276 Int)) )
))
(declare-datatypes ((array!16832 0))(
  ( (array!16833 (arr!8263 (Array (_ BitVec 32) T!51879)) (size!7267 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16832)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16832)

(declare-fun a3!68 () array!16832)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64116 (= res!237084 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7267 a1!647) (size!7267 a2!647)) (bvsle (size!7267 a2!647) (size!7267 a3!68)) (bvsle mid!71 (size!7267 a1!647)) (bvsle to!740 (size!7267 a2!647))))))

(assert (=> start!64116 e!204225))

(declare-fun e!204222 () Bool)

(declare-fun array_inv!6921 (array!16832) Bool)

(assert (=> start!64116 (and (array_inv!6921 a2!647) e!204222)))

(assert (=> start!64116 true))

(declare-fun e!204224 () Bool)

(assert (=> start!64116 (and (array_inv!6921 a1!647) e!204224)))

(declare-fun e!204221 () Bool)

(assert (=> start!64116 (and (array_inv!6921 a3!68) e!204221)))

(declare-fun b!286571 () Bool)

(declare-fun res!237081 () Bool)

(assert (=> b!286571 (=> (not res!237081) (not e!204225))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!286571 (= res!237081 (not (= i!964 mid!71)))))

(declare-fun b!286572 () Bool)

(declare-fun tp_is_empty!553 () Bool)

(declare-fun mapRes!1757 () Bool)

(assert (=> b!286572 (= e!204221 (and tp_is_empty!553 mapRes!1757))))

(declare-fun condMapEmpty!1756 () Bool)

(declare-fun mapDefault!1758 () T!51879)


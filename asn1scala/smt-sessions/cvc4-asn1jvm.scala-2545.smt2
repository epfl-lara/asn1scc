; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64044 () Bool)

(assert start!64044)

(declare-fun mapIsEmpty!1445 () Bool)

(declare-fun mapRes!1445 () Bool)

(assert (=> mapIsEmpty!1445 mapRes!1445))

(declare-fun b!285395 () Bool)

(declare-fun res!236211 () Bool)

(declare-fun e!203772 () Bool)

(assert (=> b!285395 (=> (not res!236211) (not e!203772))))

(declare-datatypes ((T!51571 0))(
  ( (T!51572 (val!242 Int)) )
))
(declare-datatypes ((array!16763 0))(
  ( (array!16764 (arr!8229 (Array (_ BitVec 32) T!51571)) (size!7233 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16763)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16763)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1375 (array!16763 array!16763 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285395 (= res!236211 (arrayRangesEq!1375 a2!647 a3!68 from!773 to!740))))

(declare-fun res!236210 () Bool)

(assert (=> start!64044 (=> (not res!236210) (not e!203772))))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun a1!647 () array!16763)

(assert (=> start!64044 (= res!236210 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7233 a1!647) (size!7233 a2!647)) (bvsle (size!7233 a2!647) (size!7233 a3!68)) (bvsle mid!71 (size!7233 a1!647)) (bvsle to!740 (size!7233 a2!647))))))

(assert (=> start!64044 e!203772))

(declare-fun e!203770 () Bool)

(declare-fun array_inv!6902 (array!16763) Bool)

(assert (=> start!64044 (and (array_inv!6902 a2!647) e!203770)))

(assert (=> start!64044 true))

(declare-fun e!203771 () Bool)

(assert (=> start!64044 (and (array_inv!6902 a1!647) e!203771)))

(declare-fun e!203773 () Bool)

(assert (=> start!64044 (and (array_inv!6902 a3!68) e!203773)))

(declare-fun b!285396 () Bool)

(declare-fun res!236214 () Bool)

(assert (=> b!285396 (=> (not res!236214) (not e!203772))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!285396 (= res!236214 (not (= i!964 mid!71)))))

(declare-fun b!285397 () Bool)

(declare-fun tp_is_empty!485 () Bool)

(declare-fun mapRes!1447 () Bool)

(assert (=> b!285397 (= e!203773 (and tp_is_empty!485 mapRes!1447))))

(declare-fun condMapEmpty!1445 () Bool)

(declare-fun mapDefault!1445 () T!51571)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64150 () Bool)

(assert start!64150)

(declare-fun res!237443 () Bool)

(declare-fun e!204425 () Bool)

(assert (=> start!64150 (=> (not res!237443) (not e!204425))))

(declare-datatypes ((T!51961 0))(
  ( (T!51962 (val!287 Int)) )
))
(declare-datatypes ((array!16856 0))(
  ( (array!16857 (arr!8274 (Array (_ BitVec 32) T!51961)) (size!7278 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16856)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16856)

(declare-fun a3!68 () array!16856)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64150 (= res!237443 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7278 a1!647) (size!7278 a2!647)) (bvsle (size!7278 a2!647) (size!7278 a3!68)) (bvsle mid!71 (size!7278 a1!647)) (bvsle to!740 (size!7278 a2!647))))))

(assert (=> start!64150 e!204425))

(declare-fun e!204424 () Bool)

(declare-fun array_inv!6929 (array!16856) Bool)

(assert (=> start!64150 (and (array_inv!6929 a2!647) e!204424)))

(assert (=> start!64150 true))

(declare-fun e!204421 () Bool)

(assert (=> start!64150 (and (array_inv!6929 a1!647) e!204421)))

(declare-fun e!204423 () Bool)

(assert (=> start!64150 (and (array_inv!6929 a3!68) e!204423)))

(declare-fun b!287031 () Bool)

(declare-fun res!237438 () Bool)

(assert (=> b!287031 (=> (not res!237438) (not e!204425))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!287031 (= res!237438 (not (= i!964 mid!71)))))

(declare-fun mapIsEmpty!1865 () Bool)

(declare-fun mapRes!1865 () Bool)

(assert (=> mapIsEmpty!1865 mapRes!1865))

(declare-fun b!287032 () Bool)

(declare-fun res!237441 () Bool)

(assert (=> b!287032 (=> (not res!237441) (not e!204425))))

(assert (=> b!287032 (= res!237441 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!287033 () Bool)

(declare-fun res!237439 () Bool)

(assert (=> b!287033 (=> (not res!237439) (not e!204425))))

(declare-fun arrayRangesEq!1413 (array!16856 array!16856 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287033 (= res!237439 (arrayRangesEq!1413 a2!647 a3!68 i!964 to!740))))

(declare-fun mapNonEmpty!1865 () Bool)

(declare-fun mapRes!1866 () Bool)

(declare-fun tp!1866 () Bool)

(declare-fun tp_is_empty!575 () Bool)

(assert (=> mapNonEmpty!1865 (= mapRes!1866 (and tp!1866 tp_is_empty!575))))

(declare-fun mapValue!1867 () T!51961)

(declare-fun mapRest!1866 () (Array (_ BitVec 32) T!51961))

(declare-fun mapKey!1867 () (_ BitVec 32))

(assert (=> mapNonEmpty!1865 (= (arr!8274 a1!647) (store mapRest!1866 mapKey!1867 mapValue!1867))))

(declare-fun mapIsEmpty!1866 () Bool)

(assert (=> mapIsEmpty!1866 mapRes!1866))

(declare-fun b!287034 () Bool)

(declare-fun res!237435 () Bool)

(assert (=> b!287034 (=> (not res!237435) (not e!204425))))

(assert (=> b!287034 (= res!237435 (arrayRangesEq!1413 a2!647 a3!68 from!773 to!740))))

(declare-fun b!287035 () Bool)

(assert (=> b!287035 (= e!204424 (and tp_is_empty!575 mapRes!1865))))

(declare-fun condMapEmpty!1866 () Bool)

(declare-fun mapDefault!1866 () T!51961)


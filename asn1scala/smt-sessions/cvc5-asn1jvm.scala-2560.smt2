; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64146 () Bool)

(assert start!64146)

(declare-fun b!286947 () Bool)

(declare-fun res!237374 () Bool)

(declare-fun e!204393 () Bool)

(assert (=> b!286947 (=> (not res!237374) (not e!204393))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286947 (= res!237374 (not (= i!964 mid!71)))))

(declare-fun b!286948 () Bool)

(declare-fun res!237373 () Bool)

(assert (=> b!286948 (=> (not res!237373) (not e!204393))))

(declare-fun from!773 () (_ BitVec 32))

(declare-datatypes ((T!51957 0))(
  ( (T!51958 (val!285 Int)) )
))
(declare-datatypes ((array!16852 0))(
  ( (array!16853 (arr!8272 (Array (_ BitVec 32) T!51957)) (size!7276 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16852)

(declare-fun a2!647 () array!16852)

(declare-fun arrayRangesEq!1411 (array!16852 array!16852 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286948 (= res!237373 (arrayRangesEq!1411 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapIsEmpty!1847 () Bool)

(declare-fun mapRes!1848 () Bool)

(assert (=> mapIsEmpty!1847 mapRes!1848))

(declare-fun b!286949 () Bool)

(declare-fun res!237376 () Bool)

(assert (=> b!286949 (=> (not res!237376) (not e!204393))))

(declare-fun a3!68 () array!16852)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286949 (= res!237376 (arrayRangesEq!1411 a2!647 a3!68 from!773 to!740))))

(declare-fun mapNonEmpty!1847 () Bool)

(declare-fun mapRes!1847 () Bool)

(declare-fun tp!1847 () Bool)

(declare-fun tp_is_empty!571 () Bool)

(assert (=> mapNonEmpty!1847 (= mapRes!1847 (and tp!1847 tp_is_empty!571))))

(declare-fun mapRest!1847 () (Array (_ BitVec 32) T!51957))

(declare-fun mapValue!1847 () T!51957)

(declare-fun mapKey!1849 () (_ BitVec 32))

(assert (=> mapNonEmpty!1847 (= (arr!8272 a3!68) (store mapRest!1847 mapKey!1849 mapValue!1847))))

(declare-fun res!237379 () Bool)

(assert (=> start!64146 (=> (not res!237379) (not e!204393))))

(assert (=> start!64146 (= res!237379 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7276 a1!647) (size!7276 a2!647)) (bvsle (size!7276 a2!647) (size!7276 a3!68)) (bvsle mid!71 (size!7276 a1!647)) (bvsle to!740 (size!7276 a2!647))))))

(assert (=> start!64146 e!204393))

(declare-fun e!204395 () Bool)

(declare-fun array_inv!6927 (array!16852) Bool)

(assert (=> start!64146 (and (array_inv!6927 a2!647) e!204395)))

(assert (=> start!64146 true))

(declare-fun e!204391 () Bool)

(assert (=> start!64146 (and (array_inv!6927 a1!647) e!204391)))

(declare-fun e!204392 () Bool)

(assert (=> start!64146 (and (array_inv!6927 a3!68) e!204392)))

(declare-fun b!286950 () Bool)

(declare-fun e!204394 () Bool)

(assert (=> b!286950 (= e!204394 (bvslt (bvsub to!740 (bvadd #b00000000000000000000000000000001 i!964)) (bvsub to!740 i!964)))))

(declare-fun b!286951 () Bool)

(declare-fun mapRes!1849 () Bool)

(assert (=> b!286951 (= e!204395 (and tp_is_empty!571 mapRes!1849))))

(declare-fun condMapEmpty!1849 () Bool)

(declare-fun mapDefault!1849 () T!51957)


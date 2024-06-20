; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64020 () Bool)

(assert start!64020)

(declare-fun res!235926 () Bool)

(declare-fun e!203629 () Bool)

(assert (=> start!64020 (=> (not res!235926) (not e!203629))))

(declare-datatypes ((T!51467 0))(
  ( (T!51468 (val!230 Int)) )
))
(declare-datatypes ((array!16739 0))(
  ( (array!16740 (arr!8217 (Array (_ BitVec 32) T!51467)) (size!7221 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16739)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16739)

(declare-fun a3!68 () array!16739)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64020 (= res!235926 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7221 a1!647) (size!7221 a2!647)) (bvsle (size!7221 a2!647) (size!7221 a3!68)) (bvsle mid!71 (size!7221 a1!647)) (bvsle to!740 (size!7221 a2!647))))))

(assert (=> start!64020 e!203629))

(declare-fun e!203626 () Bool)

(declare-fun array_inv!6897 (array!16739) Bool)

(assert (=> start!64020 (and (array_inv!6897 a2!647) e!203626)))

(assert (=> start!64020 true))

(declare-fun e!203627 () Bool)

(assert (=> start!64020 (and (array_inv!6897 a1!647) e!203627)))

(declare-fun e!203628 () Bool)

(assert (=> start!64020 (and (array_inv!6897 a3!68) e!203628)))

(declare-fun b!285000 () Bool)

(declare-fun res!235924 () Bool)

(assert (=> b!285000 (=> (not res!235924) (not e!203629))))

(declare-fun arrayRangesEq!1365 (array!16739 array!16739 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285000 (= res!235924 (arrayRangesEq!1365 a2!647 a3!68 from!773 to!740))))

(declare-fun mapNonEmpty!1337 () Bool)

(declare-fun mapRes!1339 () Bool)

(declare-fun tp!1339 () Bool)

(declare-fun tp_is_empty!461 () Bool)

(assert (=> mapNonEmpty!1337 (= mapRes!1339 (and tp!1339 tp_is_empty!461))))

(declare-fun mapValue!1337 () T!51467)

(declare-fun mapRest!1338 () (Array (_ BitVec 32) T!51467))

(declare-fun mapKey!1338 () (_ BitVec 32))

(assert (=> mapNonEmpty!1337 (= (arr!8217 a2!647) (store mapRest!1338 mapKey!1338 mapValue!1337))))

(declare-fun mapNonEmpty!1338 () Bool)

(declare-fun mapRes!1337 () Bool)

(declare-fun tp!1338 () Bool)

(assert (=> mapNonEmpty!1338 (= mapRes!1337 (and tp!1338 tp_is_empty!461))))

(declare-fun mapKey!1337 () (_ BitVec 32))

(declare-fun mapValue!1339 () T!51467)

(declare-fun mapRest!1337 () (Array (_ BitVec 32) T!51467))

(assert (=> mapNonEmpty!1338 (= (arr!8217 a1!647) (store mapRest!1337 mapKey!1337 mapValue!1339))))

(declare-fun b!285001 () Bool)

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!285001 (= e!203629 (and (= i!964 mid!71) (bvsgt (size!7221 a1!647) (size!7221 a3!68))))))

(declare-fun b!285002 () Bool)

(declare-fun res!235928 () Bool)

(assert (=> b!285002 (=> (not res!235928) (not e!203629))))

(assert (=> b!285002 (= res!235928 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285003 () Bool)

(declare-fun res!235927 () Bool)

(assert (=> b!285003 (=> (not res!235927) (not e!203629))))

(assert (=> b!285003 (= res!235927 (arrayRangesEq!1365 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285004 () Bool)

(assert (=> b!285004 (= e!203626 (and tp_is_empty!461 mapRes!1339))))

(declare-fun condMapEmpty!1337 () Bool)

(declare-fun mapDefault!1338 () T!51467)


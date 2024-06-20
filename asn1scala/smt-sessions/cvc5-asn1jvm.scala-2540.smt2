; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64010 () Bool)

(assert start!64010)

(declare-fun mapIsEmpty!1292 () Bool)

(declare-fun mapRes!1292 () Bool)

(assert (=> mapIsEmpty!1292 mapRes!1292))

(declare-fun b!284857 () Bool)

(declare-fun res!235825 () Bool)

(declare-fun e!203566 () Bool)

(assert (=> b!284857 (=> (not res!235825) (not e!203566))))

(declare-datatypes ((T!51437 0))(
  ( (T!51438 (val!225 Int)) )
))
(declare-datatypes ((array!16729 0))(
  ( (array!16730 (arr!8212 (Array (_ BitVec 32) T!51437)) (size!7216 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16729)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16729)

(declare-fun arrayRangesEq!1361 (array!16729 array!16729 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284857 (= res!235825 (arrayRangesEq!1361 a1!647 a2!647 from!773 mid!71))))

(declare-fun res!235826 () Bool)

(assert (=> start!64010 (=> (not res!235826) (not e!203566))))

(declare-fun a3!68 () array!16729)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64010 (= res!235826 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7216 a1!647) (size!7216 a2!647)) (bvsle (size!7216 a2!647) (size!7216 a3!68)) (bvsle mid!71 (size!7216 a1!647)) (bvsle to!740 (size!7216 a2!647))))))

(assert (=> start!64010 e!203566))

(declare-fun e!203568 () Bool)

(declare-fun array_inv!6894 (array!16729) Bool)

(assert (=> start!64010 (and (array_inv!6894 a2!647) e!203568)))

(assert (=> start!64010 true))

(declare-fun e!203569 () Bool)

(assert (=> start!64010 (and (array_inv!6894 a1!647) e!203569)))

(declare-fun e!203567 () Bool)

(assert (=> start!64010 (and (array_inv!6894 a3!68) e!203567)))

(declare-fun mapNonEmpty!1292 () Bool)

(declare-fun mapRes!1294 () Bool)

(declare-fun tp!1292 () Bool)

(declare-fun tp_is_empty!451 () Bool)

(assert (=> mapNonEmpty!1292 (= mapRes!1294 (and tp!1292 tp_is_empty!451))))

(declare-fun mapValue!1292 () T!51437)

(declare-fun mapRest!1293 () (Array (_ BitVec 32) T!51437))

(declare-fun mapKey!1293 () (_ BitVec 32))

(assert (=> mapNonEmpty!1292 (= (arr!8212 a2!647) (store mapRest!1293 mapKey!1293 mapValue!1292))))

(declare-fun b!284858 () Bool)

(declare-fun res!235829 () Bool)

(assert (=> b!284858 (=> (not res!235829) (not e!203566))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!284858 (= res!235829 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!284859 () Bool)

(declare-fun res!235827 () Bool)

(assert (=> b!284859 (=> (not res!235827) (not e!203566))))

(assert (=> b!284859 (= res!235827 (arrayRangesEq!1361 a2!647 a3!68 from!773 to!740))))

(declare-fun b!284860 () Bool)

(declare-fun res!235828 () Bool)

(assert (=> b!284860 (=> (not res!235828) (not e!203566))))

(assert (=> b!284860 (= res!235828 (arrayRangesEq!1361 a2!647 a3!68 i!964 to!740))))

(declare-fun mapIsEmpty!1293 () Bool)

(declare-fun mapRes!1293 () Bool)

(assert (=> mapIsEmpty!1293 mapRes!1293))

(declare-fun b!284861 () Bool)

(assert (=> b!284861 (= e!203567 (and tp_is_empty!451 mapRes!1292))))

(declare-fun condMapEmpty!1293 () Bool)

(declare-fun mapDefault!1292 () T!51437)


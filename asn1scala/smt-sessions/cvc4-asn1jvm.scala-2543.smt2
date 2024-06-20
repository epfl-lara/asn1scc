; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64032 () Bool)

(assert start!64032)

(declare-fun mapIsEmpty!1391 () Bool)

(declare-fun mapRes!1391 () Bool)

(assert (=> mapIsEmpty!1391 mapRes!1391))

(declare-fun b!285197 () Bool)

(declare-fun res!236071 () Bool)

(declare-fun e!203699 () Bool)

(assert (=> b!285197 (=> (not res!236071) (not e!203699))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285197 (= res!236071 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1392 () Bool)

(declare-fun mapRes!1392 () Bool)

(assert (=> mapIsEmpty!1392 mapRes!1392))

(declare-fun b!285198 () Bool)

(declare-fun e!203701 () Bool)

(declare-fun tp_is_empty!473 () Bool)

(assert (=> b!285198 (= e!203701 (and tp_is_empty!473 mapRes!1391))))

(declare-fun condMapEmpty!1392 () Bool)

(declare-datatypes ((T!51519 0))(
  ( (T!51520 (val!236 Int)) )
))
(declare-datatypes ((array!16751 0))(
  ( (array!16752 (arr!8223 (Array (_ BitVec 32) T!51519)) (size!7227 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16751)

(declare-fun mapDefault!1393 () T!51519)


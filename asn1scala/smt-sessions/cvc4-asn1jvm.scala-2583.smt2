; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64292 () Bool)

(assert start!64292)

(declare-fun res!238336 () Bool)

(declare-fun e!205093 () Bool)

(assert (=> start!64292 (=> (not res!238336) (not e!205093))))

(declare-datatypes ((T!52559 0))(
  ( (T!52560 (val!356 Int)) )
))
(declare-datatypes ((array!16995 0))(
  ( (array!16996 (arr!8343 (Array (_ BitVec 32) T!52559)) (size!7347 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16995)

(declare-fun a2!596 () array!16995)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64292 (= res!238336 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7347 a1!596) (size!7347 a2!596)) (bvslt to!689 (size!7347 a1!596))))))

(assert (=> start!64292 e!205093))

(declare-fun e!205092 () Bool)

(declare-fun array_inv!6969 (array!16995) Bool)

(assert (=> start!64292 (and (array_inv!6969 a1!596) e!205092)))

(declare-fun e!205094 () Bool)

(assert (=> start!64292 (and (array_inv!6969 a2!596) e!205094)))

(assert (=> start!64292 true))

(declare-fun mapNonEmpty!2295 () Bool)

(declare-fun mapRes!2296 () Bool)

(declare-fun tp!2296 () Bool)

(declare-fun tp_is_empty!713 () Bool)

(assert (=> mapNonEmpty!2295 (= mapRes!2296 (and tp!2296 tp_is_empty!713))))

(declare-fun mapValue!2295 () T!52559)

(declare-fun mapKey!2296 () (_ BitVec 32))

(declare-fun mapRest!2295 () (Array (_ BitVec 32) T!52559))

(assert (=> mapNonEmpty!2295 (= (arr!8343 a2!596) (store mapRest!2295 mapKey!2296 mapValue!2295))))

(declare-fun mapIsEmpty!2295 () Bool)

(declare-fun mapRes!2295 () Bool)

(assert (=> mapIsEmpty!2295 mapRes!2295))

(declare-fun b!288358 () Bool)

(declare-fun res!238337 () Bool)

(assert (=> b!288358 (=> (not res!238337) (not e!205093))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun arrayRangesEq!1455 (array!16995 array!16995 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288358 (= res!238337 (arrayRangesEq!1455 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2296 () Bool)

(declare-fun tp!2295 () Bool)

(assert (=> mapNonEmpty!2296 (= mapRes!2295 (and tp!2295 tp_is_empty!713))))

(declare-fun mapRest!2296 () (Array (_ BitVec 32) T!52559))

(declare-fun mapKey!2295 () (_ BitVec 32))

(declare-fun mapValue!2296 () T!52559)

(assert (=> mapNonEmpty!2296 (= (arr!8343 a1!596) (store mapRest!2296 mapKey!2295 mapValue!2296))))

(declare-fun b!288359 () Bool)

(assert (=> b!288359 (= e!205092 (and tp_is_empty!713 mapRes!2295))))

(declare-fun condMapEmpty!2295 () Bool)

(declare-fun mapDefault!2295 () T!52559)


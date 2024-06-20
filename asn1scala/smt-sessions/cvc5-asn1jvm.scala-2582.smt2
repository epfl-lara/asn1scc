; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64282 () Bool)

(assert start!64282)

(declare-fun mapIsEmpty!2265 () Bool)

(declare-fun mapRes!2265 () Bool)

(assert (=> mapIsEmpty!2265 mapRes!2265))

(declare-fun b!288268 () Bool)

(declare-fun res!238276 () Bool)

(declare-fun e!205047 () Bool)

(assert (=> b!288268 (=> (not res!238276) (not e!205047))))

(declare-datatypes ((T!52529 0))(
  ( (T!52530 (val!351 Int)) )
))
(declare-datatypes ((array!16985 0))(
  ( (array!16986 (arr!8338 (Array (_ BitVec 32) T!52529)) (size!7342 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16985)

(declare-fun a2!596 () array!16985)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1451 (array!16985 array!16985 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288268 (= res!238276 (arrayRangesEq!1451 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2265 () Bool)

(declare-fun mapRes!2266 () Bool)

(declare-fun tp!2266 () Bool)

(declare-fun tp_is_empty!703 () Bool)

(assert (=> mapNonEmpty!2265 (= mapRes!2266 (and tp!2266 tp_is_empty!703))))

(declare-fun mapRest!2266 () (Array (_ BitVec 32) T!52529))

(declare-fun mapKey!2265 () (_ BitVec 32))

(declare-fun mapValue!2266 () T!52529)

(assert (=> mapNonEmpty!2265 (= (arr!8338 a1!596) (store mapRest!2266 mapKey!2265 mapValue!2266))))

(declare-fun mapIsEmpty!2266 () Bool)

(assert (=> mapIsEmpty!2266 mapRes!2266))

(declare-fun b!288269 () Bool)

(declare-fun res!238277 () Bool)

(assert (=> b!288269 (=> (not res!238277) (not e!205047))))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288269 (= res!238277 (and (= (select (arr!8338 a1!596) to!689) (select (arr!8338 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288270 () Bool)

(declare-fun res!238279 () Bool)

(assert (=> b!288270 (=> (not res!238279) (not e!205047))))

(assert (=> b!288270 (= res!238279 (arrayRangesEq!1451 a1!596 a2!596 from!722 to!689))))

(declare-fun res!238278 () Bool)

(assert (=> start!64282 (=> (not res!238278) (not e!205047))))

(assert (=> start!64282 (= res!238278 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7342 a1!596) (size!7342 a2!596)) (bvslt to!689 (size!7342 a1!596))))))

(assert (=> start!64282 e!205047))

(declare-fun e!205048 () Bool)

(declare-fun array_inv!6965 (array!16985) Bool)

(assert (=> start!64282 (and (array_inv!6965 a1!596) e!205048)))

(declare-fun e!205049 () Bool)

(assert (=> start!64282 (and (array_inv!6965 a2!596) e!205049)))

(assert (=> start!64282 true))

(declare-fun b!288271 () Bool)

(assert (=> b!288271 (= e!205048 (and tp_is_empty!703 mapRes!2266))))

(declare-fun condMapEmpty!2266 () Bool)

(declare-fun mapDefault!2265 () T!52529)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64328 () Bool)

(assert start!64328)

(declare-fun b!288700 () Bool)

(declare-fun e!205257 () Bool)

(declare-fun e!205256 () Bool)

(assert (=> b!288700 (= e!205257 (not e!205256))))

(declare-fun res!238591 () Bool)

(assert (=> b!288700 (=> res!238591 e!205256)))

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!288700 (= res!238591 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(declare-datatypes ((T!52689 0))(
  ( (T!52690 (val!371 Int)) )
))
(declare-datatypes ((array!17026 0))(
  ( (array!17027 (arr!8358 (Array (_ BitVec 32) T!52689)) (size!7362 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17026)

(declare-fun a2!596 () array!17026)

(assert (=> b!288700 (= (select (arr!8358 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8358 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!20009 0))(
  ( (Unit!20010) )
))
(declare-fun lt!418866 () Unit!20009)

(declare-fun arrayRangesEqImpliesEq!210 (array!17026 array!17026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20009)

(assert (=> b!288700 (= lt!418866 (arrayRangesEqImpliesEq!210 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun b!288701 () Bool)

(declare-fun res!238592 () Bool)

(assert (=> b!288701 (=> (not res!238592) (not e!205257))))

(declare-fun arrayRangesEq!1467 (array!17026 array!17026 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288701 (= res!238592 (arrayRangesEq!1467 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapIsEmpty!2389 () Bool)

(declare-fun mapRes!2390 () Bool)

(assert (=> mapIsEmpty!2389 mapRes!2390))

(declare-fun b!288702 () Bool)

(declare-fun res!238590 () Bool)

(assert (=> b!288702 (=> (not res!238590) (not e!205257))))

(assert (=> b!288702 (= res!238590 (not (= i!953 from!722)))))

(declare-fun res!238589 () Bool)

(assert (=> start!64328 (=> (not res!238589) (not e!205257))))

(assert (=> start!64328 (= res!238589 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7362 a1!596) (size!7362 a2!596)) (bvslt to!689 (size!7362 a1!596))))))

(assert (=> start!64328 e!205257))

(declare-fun e!205255 () Bool)

(declare-fun array_inv!6976 (array!17026) Bool)

(assert (=> start!64328 (and (array_inv!6976 a1!596) e!205255)))

(declare-fun e!205254 () Bool)

(assert (=> start!64328 (and (array_inv!6976 a2!596) e!205254)))

(assert (=> start!64328 true))

(declare-fun b!288703 () Bool)

(declare-fun res!238586 () Bool)

(assert (=> b!288703 (=> (not res!238586) (not e!205257))))

(assert (=> b!288703 (= res!238586 (and (= (select (arr!8358 a1!596) to!689) (select (arr!8358 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288704 () Bool)

(declare-fun tp_is_empty!743 () Bool)

(assert (=> b!288704 (= e!205254 (and tp_is_empty!743 mapRes!2390))))

(declare-fun condMapEmpty!2390 () Bool)

(declare-fun mapDefault!2390 () T!52689)


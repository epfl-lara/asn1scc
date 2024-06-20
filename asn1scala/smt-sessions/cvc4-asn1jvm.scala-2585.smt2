; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64304 () Bool)

(assert start!64304)

(declare-fun mapNonEmpty!2331 () Bool)

(declare-fun mapRes!2331 () Bool)

(declare-fun tp!2332 () Bool)

(declare-fun tp_is_empty!725 () Bool)

(assert (=> mapNonEmpty!2331 (= mapRes!2331 (and tp!2332 tp_is_empty!725))))

(declare-fun mapKey!2331 () (_ BitVec 32))

(declare-datatypes ((T!52611 0))(
  ( (T!52612 (val!362 Int)) )
))
(declare-fun mapRest!2332 () (Array (_ BitVec 32) T!52611))

(declare-datatypes ((array!17007 0))(
  ( (array!17008 (arr!8349 (Array (_ BitVec 32) T!52611)) (size!7353 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17007)

(declare-fun mapValue!2331 () T!52611)

(assert (=> mapNonEmpty!2331 (= (arr!8349 a1!596) (store mapRest!2332 mapKey!2331 mapValue!2331))))

(declare-fun b!288474 () Bool)

(declare-fun res!238418 () Bool)

(declare-fun e!205146 () Bool)

(assert (=> b!288474 (=> (not res!238418) (not e!205146))))

(declare-fun a2!596 () array!17007)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1459 (array!17007 array!17007 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288474 (= res!238418 (arrayRangesEq!1459 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288475 () Bool)

(declare-fun e!205147 () Bool)

(assert (=> b!288475 (= e!205147 (and tp_is_empty!725 mapRes!2331))))

(declare-fun condMapEmpty!2331 () Bool)

(declare-fun mapDefault!2332 () T!52611)


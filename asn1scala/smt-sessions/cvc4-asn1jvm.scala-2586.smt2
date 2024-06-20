; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64310 () Bool)

(assert start!64310)

(declare-fun b!288537 () Bool)

(declare-fun res!238464 () Bool)

(declare-fun e!205173 () Bool)

(assert (=> b!288537 (=> (not res!238464) (not e!205173))))

(declare-datatypes ((T!52637 0))(
  ( (T!52638 (val!365 Int)) )
))
(declare-datatypes ((array!17013 0))(
  ( (array!17014 (arr!8352 (Array (_ BitVec 32) T!52637)) (size!7356 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17013)

(declare-fun a2!596 () array!17013)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1462 (array!17013 array!17013 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288537 (= res!238464 (arrayRangesEq!1462 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288538 () Bool)

(declare-fun e!205175 () Bool)

(declare-fun tp_is_empty!731 () Bool)

(declare-fun mapRes!2349 () Bool)

(assert (=> b!288538 (= e!205175 (and tp_is_empty!731 mapRes!2349))))

(declare-fun condMapEmpty!2350 () Bool)

(declare-fun mapDefault!2350 () T!52637)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64324 () Bool)

(assert start!64324)

(declare-fun b!288646 () Bool)

(declare-fun res!238548 () Bool)

(declare-fun e!205230 () Bool)

(assert (=> b!288646 (=> res!238548 e!205230)))

(declare-datatypes ((T!52685 0))(
  ( (T!52686 (val!369 Int)) )
))
(declare-datatypes ((array!17022 0))(
  ( (array!17023 (arr!8356 (Array (_ BitVec 32) T!52685)) (size!7360 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17022)

(declare-fun a2!596 () array!17022)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1465 (array!17022 array!17022 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288646 (= res!238548 (not (arrayRangesEq!1465 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!288648 () Bool)

(assert (=> b!288648 (= e!205230 (bvslt (bvsub i!953 #b00000000000000000000000000000001) i!953))))

(declare-fun b!288649 () Bool)

(declare-fun res!238545 () Bool)

(declare-fun e!205231 () Bool)

(assert (=> b!288649 (=> (not res!238545) (not e!205231))))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288649 (= res!238545 (arrayRangesEq!1465 a1!596 a2!596 from!722 to!689))))

(declare-fun mapIsEmpty!2377 () Bool)

(declare-fun mapRes!2378 () Bool)

(assert (=> mapIsEmpty!2377 mapRes!2378))

(declare-fun b!288650 () Bool)

(declare-fun e!205232 () Bool)

(declare-fun tp_is_empty!739 () Bool)

(assert (=> b!288650 (= e!205232 (and tp_is_empty!739 mapRes!2378))))

(declare-fun condMapEmpty!2377 () Bool)

(declare-fun mapDefault!2378 () T!52685)


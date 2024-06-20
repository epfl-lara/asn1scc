; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68512 () Bool)

(assert start!68512)

(declare-fun mapIsEmpty!2543 () Bool)

(declare-fun mapRes!2544 () Bool)

(assert (=> mapIsEmpty!2543 mapRes!2544))

(declare-fun b!307807 () Bool)

(declare-fun e!221745 () Bool)

(assert (=> b!307807 (= e!221745 (not true))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57639 0))(
  ( (T!57640 (val!396 Int)) )
))
(declare-datatypes ((array!18657 0))(
  ( (array!18658 (arr!9166 (Array (_ BitVec 32) T!57639)) (size!8083 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18657)

(declare-fun a2!506 () array!18657)

(declare-fun arrayRangesEq!1706 (array!18657 array!18657 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307807 (arrayRangesEq!1706 a1!506 a2!506 fromSlice!41 toSlice!41)))

(declare-fun from!632 () (_ BitVec 32))

(declare-datatypes ((Unit!21445 0))(
  ( (Unit!21446) )
))
(declare-fun lt!440262 () Unit!21445)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun rec!92 (array!18657 array!18657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21445)

(assert (=> b!307807 (= lt!440262 (rec!92 a1!506 a2!506 from!632 fromSlice!41 to!599 toSlice!41 to!599))))

(declare-fun mapIsEmpty!2544 () Bool)

(declare-fun mapRes!2543 () Bool)

(assert (=> mapIsEmpty!2544 mapRes!2543))

(declare-fun b!307808 () Bool)

(declare-fun res!252559 () Bool)

(assert (=> b!307808 (=> (not res!252559) (not e!221745))))

(assert (=> b!307808 (= res!252559 (arrayRangesEq!1706 a1!506 a2!506 to!599 to!599))))

(declare-fun b!307809 () Bool)

(declare-fun res!252555 () Bool)

(assert (=> b!307809 (=> (not res!252555) (not e!221745))))

(assert (=> b!307809 (= res!252555 (arrayRangesEq!1706 a1!506 a2!506 from!632 to!599))))

(declare-fun b!307810 () Bool)

(declare-fun res!252556 () Bool)

(assert (=> b!307810 (=> (not res!252556) (not e!221745))))

(declare-fun e!221744 () Bool)

(assert (=> b!307810 (= res!252556 e!221744)))

(declare-fun res!252560 () Bool)

(assert (=> b!307810 (=> res!252560 e!221744)))

(assert (=> b!307810 (= res!252560 (bvsgt to!599 toSlice!41))))

(declare-fun res!252557 () Bool)

(assert (=> start!68512 (=> (not res!252557) (not e!221745))))

(assert (=> start!68512 (= res!252557 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8083 a1!506) (size!8083 a2!506)) (bvsle to!599 (size!8083 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68512 e!221745))

(assert (=> start!68512 true))

(declare-fun e!221742 () Bool)

(declare-fun array_inv!7688 (array!18657) Bool)

(assert (=> start!68512 (and (array_inv!7688 a1!506) e!221742)))

(declare-fun e!221743 () Bool)

(assert (=> start!68512 (and (array_inv!7688 a2!506) e!221743)))

(declare-fun b!307811 () Bool)

(declare-fun tp_is_empty!793 () Bool)

(assert (=> b!307811 (= e!221742 (and tp_is_empty!793 mapRes!2543))))

(declare-fun condMapEmpty!2544 () Bool)

(declare-fun mapDefault!2543 () T!57639)


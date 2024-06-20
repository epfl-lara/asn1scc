; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68524 () Bool)

(assert start!68524)

(declare-fun b!307911 () Bool)

(declare-fun res!252625 () Bool)

(declare-fun e!221804 () Bool)

(assert (=> b!307911 (=> (not res!252625) (not e!221804))))

(declare-datatypes ((T!57691 0))(
  ( (T!57692 (val!402 Int)) )
))
(declare-datatypes ((array!18669 0))(
  ( (array!18670 (arr!9172 (Array (_ BitVec 32) T!57691)) (size!8089 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18669)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18669)

(declare-fun arrayRangesEq!1710 (array!18669 array!18669 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307911 (= res!252625 (arrayRangesEq!1710 a1!524 a2!524 from!650 to!617))))

(declare-fun mapIsEmpty!2579 () Bool)

(declare-fun mapRes!2579 () Bool)

(assert (=> mapIsEmpty!2579 mapRes!2579))

(declare-fun b!307912 () Bool)

(declare-fun e!221805 () Bool)

(declare-fun tp_is_empty!805 () Bool)

(assert (=> b!307912 (= e!221805 (and tp_is_empty!805 mapRes!2579))))

(declare-fun condMapEmpty!2579 () Bool)

(declare-fun mapDefault!2580 () T!57691)


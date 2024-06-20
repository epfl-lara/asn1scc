; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68596 () Bool)

(assert start!68596)

(declare-fun mapNonEmpty!2795 () Bool)

(declare-fun mapRes!2796 () Bool)

(declare-fun tp!2796 () Bool)

(declare-fun tp_is_empty!877 () Bool)

(assert (=> mapNonEmpty!2795 (= mapRes!2796 (and tp!2796 tp_is_empty!877))))

(declare-datatypes ((T!58003 0))(
  ( (T!58004 (val!438 Int)) )
))
(declare-fun mapRest!2796 () (Array (_ BitVec 32) T!58003))

(declare-fun mapKey!2796 () (_ BitVec 32))

(declare-datatypes ((array!18741 0))(
  ( (array!18742 (arr!9208 (Array (_ BitVec 32) T!58003)) (size!8125 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18741)

(declare-fun mapValue!2795 () T!58003)

(assert (=> mapNonEmpty!2795 (= (arr!9208 a1!524) (store mapRest!2796 mapKey!2796 mapValue!2795))))

(declare-fun mapIsEmpty!2795 () Bool)

(declare-fun mapRes!2795 () Bool)

(assert (=> mapIsEmpty!2795 mapRes!2795))

(declare-fun e!222276 () Bool)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun a2!524 () array!18741)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun b!308914 () Bool)

(declare-fun arrayRangesEq!1740 (array!18741 array!18741 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308914 (= e!222276 (arrayRangesEq!1740 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308915 () Bool)

(declare-fun res!253410 () Bool)

(declare-fun e!222275 () Bool)

(assert (=> b!308915 (=> (not res!253410) (not e!222275))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308915 (= res!253410 (arrayRangesEq!1740 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308916 () Bool)

(declare-fun e!222274 () Bool)

(assert (=> b!308916 (= e!222274 (and tp_is_empty!877 mapRes!2795))))

(declare-fun condMapEmpty!2795 () Bool)

(declare-fun mapDefault!2796 () T!58003)


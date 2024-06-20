; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68590 () Bool)

(assert start!68590)

(declare-fun mapNonEmpty!2777 () Bool)

(declare-fun mapRes!2777 () Bool)

(declare-fun tp!2778 () Bool)

(declare-fun tp_is_empty!871 () Bool)

(assert (=> mapNonEmpty!2777 (= mapRes!2777 (and tp!2778 tp_is_empty!871))))

(declare-fun mapKey!2778 () (_ BitVec 32))

(declare-datatypes ((T!57977 0))(
  ( (T!57978 (val!435 Int)) )
))
(declare-fun mapRest!2777 () (Array (_ BitVec 32) T!57977))

(declare-fun mapValue!2777 () T!57977)

(declare-datatypes ((array!18735 0))(
  ( (array!18736 (arr!9205 (Array (_ BitVec 32) T!57977)) (size!8122 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18735)

(assert (=> mapNonEmpty!2777 (= (arr!9205 a1!524) (store mapRest!2777 mapKey!2778 mapValue!2777))))

(declare-fun b!308835 () Bool)

(declare-fun res!253355 () Bool)

(declare-fun e!222238 () Bool)

(assert (=> b!308835 (=> (not res!253355) (not e!222238))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308835 (= res!253355 (= i!932 fromSlice!46))))

(declare-fun mapIsEmpty!2777 () Bool)

(assert (=> mapIsEmpty!2777 mapRes!2777))

(declare-fun b!308836 () Bool)

(declare-fun res!253351 () Bool)

(assert (=> b!308836 (=> (not res!253351) (not e!222238))))

(declare-fun a2!524 () array!18735)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1737 (array!18735 array!18735 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308836 (= res!253351 (arrayRangesEq!1737 a1!524 a2!524 i!932 to!617))))

(declare-fun mapIsEmpty!2778 () Bool)

(declare-fun mapRes!2778 () Bool)

(assert (=> mapIsEmpty!2778 mapRes!2778))

(declare-fun e!222237 () Bool)

(declare-fun b!308837 () Bool)

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308837 (= e!222237 (arrayRangesEq!1737 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308838 () Bool)

(declare-fun e!222240 () Bool)

(assert (=> b!308838 (= e!222240 (and tp_is_empty!871 mapRes!2778))))

(declare-fun condMapEmpty!2778 () Bool)

(declare-fun mapDefault!2778 () T!57977)


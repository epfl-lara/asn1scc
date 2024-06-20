; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68624 () Bool)

(assert start!68624)

(declare-fun mapIsEmpty!2879 () Bool)

(declare-fun mapRes!2879 () Bool)

(assert (=> mapIsEmpty!2879 mapRes!2879))

(declare-fun mapIsEmpty!2880 () Bool)

(declare-fun mapRes!2880 () Bool)

(assert (=> mapIsEmpty!2880 mapRes!2880))

(declare-fun b!309284 () Bool)

(declare-fun res!253703 () Bool)

(declare-fun e!222453 () Bool)

(assert (=> b!309284 (=> (not res!253703) (not e!222453))))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-datatypes ((T!58111 0))(
  ( (T!58112 (val!452 Int)) )
))
(declare-datatypes ((array!18769 0))(
  ( (array!18770 (arr!9222 (Array (_ BitVec 32) T!58111)) (size!8139 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18769)

(declare-fun a1!524 () array!18769)

(declare-fun arrayRangesEq!1751 (array!18769 array!18769 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309284 (= res!253703 (arrayRangesEq!1751 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309285 () Bool)

(declare-fun res!253697 () Bool)

(assert (=> b!309285 (=> (not res!253697) (not e!222453))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309285 (= res!253697 (not (= i!932 fromSlice!46)))))

(declare-fun mapNonEmpty!2879 () Bool)

(declare-fun tp!2879 () Bool)

(declare-fun tp_is_empty!905 () Bool)

(assert (=> mapNonEmpty!2879 (= mapRes!2880 (and tp!2879 tp_is_empty!905))))

(declare-fun mapRest!2879 () (Array (_ BitVec 32) T!58111))

(declare-fun mapKey!2880 () (_ BitVec 32))

(declare-fun mapValue!2880 () T!58111)

(assert (=> mapNonEmpty!2879 (= (arr!9222 a1!524) (store mapRest!2879 mapKey!2880 mapValue!2880))))

(declare-fun b!309286 () Bool)

(declare-fun e!222452 () Bool)

(assert (=> b!309286 (= e!222452 (and tp_is_empty!905 mapRes!2880))))

(declare-fun condMapEmpty!2880 () Bool)

(declare-fun mapDefault!2880 () T!58111)


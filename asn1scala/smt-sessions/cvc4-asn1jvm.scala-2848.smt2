; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68606 () Bool)

(assert start!68606)

(declare-fun b!309034 () Bool)

(declare-fun res!253505 () Bool)

(declare-fun e!222333 () Bool)

(assert (=> b!309034 (=> (not res!253505) (not e!222333))))

(declare-fun e!222336 () Bool)

(assert (=> b!309034 (= res!253505 e!222336)))

(declare-fun res!253500 () Bool)

(assert (=> b!309034 (=> res!253500 e!222336)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309034 (= res!253500 (bvsgt i!932 toSlice!46))))

(declare-fun mapNonEmpty!2825 () Bool)

(declare-fun mapRes!2825 () Bool)

(declare-fun tp!2825 () Bool)

(declare-fun tp_is_empty!887 () Bool)

(assert (=> mapNonEmpty!2825 (= mapRes!2825 (and tp!2825 tp_is_empty!887))))

(declare-datatypes ((T!58033 0))(
  ( (T!58034 (val!443 Int)) )
))
(declare-fun mapRest!2826 () (Array (_ BitVec 32) T!58033))

(declare-fun mapKey!2825 () (_ BitVec 32))

(declare-datatypes ((array!18751 0))(
  ( (array!18752 (arr!9213 (Array (_ BitVec 32) T!58033)) (size!8130 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18751)

(declare-fun mapValue!2825 () T!58033)

(assert (=> mapNonEmpty!2825 (= (arr!9213 a1!524) (store mapRest!2826 mapKey!2825 mapValue!2825))))

(declare-fun b!309035 () Bool)

(declare-fun res!253503 () Bool)

(assert (=> b!309035 (=> (not res!253503) (not e!222333))))

(declare-fun a2!524 () array!18751)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1744 (array!18751 array!18751 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309035 (= res!253503 (arrayRangesEq!1744 a1!524 a2!524 from!650 to!617))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun b!309036 () Bool)

(assert (=> b!309036 (= e!222333 (and (not (= i!932 fromSlice!46)) (bvsgt from!650 (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun res!253504 () Bool)

(assert (=> start!68606 (=> (not res!253504) (not e!222333))))

(assert (=> start!68606 (= res!253504 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8130 a1!524) (size!8130 a2!524)) (bvsle to!617 (size!8130 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68606 e!222333))

(assert (=> start!68606 true))

(declare-fun e!222335 () Bool)

(declare-fun array_inv!7715 (array!18751) Bool)

(assert (=> start!68606 (and (array_inv!7715 a2!524) e!222335)))

(declare-fun e!222334 () Bool)

(assert (=> start!68606 (and (array_inv!7715 a1!524) e!222334)))

(declare-fun b!309037 () Bool)

(declare-fun res!253501 () Bool)

(assert (=> b!309037 (=> (not res!253501) (not e!222333))))

(assert (=> b!309037 (= res!253501 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!309038 () Bool)

(assert (=> b!309038 (= e!222334 (and tp_is_empty!887 mapRes!2825))))

(declare-fun condMapEmpty!2826 () Bool)

(declare-fun mapDefault!2826 () T!58033)


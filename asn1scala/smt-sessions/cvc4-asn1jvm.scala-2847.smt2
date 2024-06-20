; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68600 () Bool)

(assert start!68600)

(declare-fun mapIsEmpty!2807 () Bool)

(declare-fun mapRes!2808 () Bool)

(assert (=> mapIsEmpty!2807 mapRes!2808))

(declare-fun b!308962 () Bool)

(declare-fun res!253446 () Bool)

(declare-fun e!222299 () Bool)

(assert (=> b!308962 (=> (not res!253446) (not e!222299))))

(declare-datatypes ((T!58007 0))(
  ( (T!58008 (val!440 Int)) )
))
(declare-datatypes ((array!18745 0))(
  ( (array!18746 (arr!9210 (Array (_ BitVec 32) T!58007)) (size!8127 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18745)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun a1!524 () array!18745)

(declare-fun arrayRangesEq!1742 (array!18745 array!18745 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308962 (= res!253446 (arrayRangesEq!1742 a1!524 a2!524 i!932 to!617))))

(declare-fun res!253447 () Bool)

(assert (=> start!68600 (=> (not res!253447) (not e!222299))))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> start!68600 (= res!253447 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8127 a1!524) (size!8127 a2!524)) (bvsle to!617 (size!8127 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68600 e!222299))

(assert (=> start!68600 true))

(declare-fun e!222297 () Bool)

(declare-fun array_inv!7712 (array!18745) Bool)

(assert (=> start!68600 (and (array_inv!7712 a2!524) e!222297)))

(declare-fun e!222298 () Bool)

(assert (=> start!68600 (and (array_inv!7712 a1!524) e!222298)))

(declare-fun e!222300 () Bool)

(declare-fun b!308963 () Bool)

(assert (=> b!308963 (= e!222300 (arrayRangesEq!1742 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308964 () Bool)

(assert (=> b!308964 (= e!222299 (and (not (= i!932 fromSlice!46)) (not (= (bvand i!932 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!932 #b10000000000000000000000000000000) (bvand (bvsub i!932 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!308965 () Bool)

(declare-fun tp_is_empty!881 () Bool)

(declare-fun mapRes!2807 () Bool)

(assert (=> b!308965 (= e!222298 (and tp_is_empty!881 mapRes!2807))))

(declare-fun condMapEmpty!2808 () Bool)

(declare-fun mapDefault!2808 () T!58007)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68594 () Bool)

(assert start!68594)

(declare-fun mapNonEmpty!2789 () Bool)

(declare-fun mapRes!2789 () Bool)

(declare-fun tp!2789 () Bool)

(declare-fun tp_is_empty!875 () Bool)

(assert (=> mapNonEmpty!2789 (= mapRes!2789 (and tp!2789 tp_is_empty!875))))

(declare-fun mapKey!2789 () (_ BitVec 32))

(declare-datatypes ((T!57981 0))(
  ( (T!57982 (val!437 Int)) )
))
(declare-fun mapValue!2790 () T!57981)

(declare-datatypes ((array!18739 0))(
  ( (array!18740 (arr!9207 (Array (_ BitVec 32) T!57981)) (size!8124 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18739)

(declare-fun mapRest!2789 () (Array (_ BitVec 32) T!57981))

(assert (=> mapNonEmpty!2789 (= (arr!9207 a2!524) (store mapRest!2789 mapKey!2789 mapValue!2790))))

(declare-fun b!308889 () Bool)

(declare-fun res!253397 () Bool)

(declare-fun e!222264 () Bool)

(assert (=> b!308889 (=> (not res!253397) (not e!222264))))

(declare-fun e!222261 () Bool)

(assert (=> b!308889 (= res!253397 e!222261)))

(declare-fun res!253394 () Bool)

(assert (=> b!308889 (=> res!253394 e!222261)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308889 (= res!253394 (bvsgt i!932 toSlice!46))))

(declare-fun b!308890 () Bool)

(declare-fun res!253391 () Bool)

(assert (=> b!308890 (=> (not res!253391) (not e!222264))))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308890 (= res!253391 (bvsle i!932 to!617))))

(declare-fun b!308891 () Bool)

(declare-fun res!253392 () Bool)

(assert (=> b!308891 (=> (not res!253392) (not e!222264))))

(declare-fun a1!524 () array!18739)

(declare-fun arrayRangesEq!1739 (array!18739 array!18739 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308891 (= res!253392 (arrayRangesEq!1739 a1!524 a2!524 i!932 to!617))))

(declare-fun res!253393 () Bool)

(assert (=> start!68594 (=> (not res!253393) (not e!222264))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun from!650 () (_ BitVec 32))

(assert (=> start!68594 (= res!253393 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8124 a1!524) (size!8124 a2!524)) (bvsle to!617 (size!8124 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68594 e!222264))

(assert (=> start!68594 true))

(declare-fun e!222263 () Bool)

(declare-fun array_inv!7710 (array!18739) Bool)

(assert (=> start!68594 (and (array_inv!7710 a2!524) e!222263)))

(declare-fun e!222262 () Bool)

(assert (=> start!68594 (and (array_inv!7710 a1!524) e!222262)))

(declare-fun mapIsEmpty!2789 () Bool)

(assert (=> mapIsEmpty!2789 mapRes!2789))

(declare-fun mapNonEmpty!2790 () Bool)

(declare-fun mapRes!2790 () Bool)

(declare-fun tp!2790 () Bool)

(assert (=> mapNonEmpty!2790 (= mapRes!2790 (and tp!2790 tp_is_empty!875))))

(declare-fun mapValue!2789 () T!57981)

(declare-fun mapKey!2790 () (_ BitVec 32))

(declare-fun mapRest!2790 () (Array (_ BitVec 32) T!57981))

(assert (=> mapNonEmpty!2790 (= (arr!9207 a1!524) (store mapRest!2790 mapKey!2790 mapValue!2789))))

(declare-fun b!308892 () Bool)

(declare-fun res!253395 () Bool)

(assert (=> b!308892 (=> (not res!253395) (not e!222264))))

(assert (=> b!308892 (= res!253395 (arrayRangesEq!1739 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308893 () Bool)

(assert (=> b!308893 (= e!222261 (arrayRangesEq!1739 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapIsEmpty!2790 () Bool)

(assert (=> mapIsEmpty!2790 mapRes!2790))

(declare-fun b!308894 () Bool)

(assert (=> b!308894 (= e!222264 (not (arrayRangesEq!1739 a1!524 a2!524 fromSlice!46 toSlice!46)))))

(declare-fun b!308895 () Bool)

(declare-fun res!253396 () Bool)

(assert (=> b!308895 (=> (not res!253396) (not e!222264))))

(assert (=> b!308895 (= res!253396 (= i!932 fromSlice!46))))

(declare-fun b!308896 () Bool)

(assert (=> b!308896 (= e!222262 (and tp_is_empty!875 mapRes!2790))))

(declare-fun condMapEmpty!2789 () Bool)

(declare-fun mapDefault!2789 () T!57981)


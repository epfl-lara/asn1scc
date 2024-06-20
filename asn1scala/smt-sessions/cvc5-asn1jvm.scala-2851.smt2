; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68620 () Bool)

(assert start!68620)

(declare-fun res!253651 () Bool)

(declare-fun e!222422 () Bool)

(assert (=> start!68620 (=> (not res!253651) (not e!222422))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!58107 0))(
  ( (T!58108 (val!450 Int)) )
))
(declare-datatypes ((array!18765 0))(
  ( (array!18766 (arr!9220 (Array (_ BitVec 32) T!58107)) (size!8137 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18765)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18765)

(assert (=> start!68620 (= res!253651 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8137 a1!524) (size!8137 a2!524)) (bvsle to!617 (size!8137 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68620 e!222422))

(assert (=> start!68620 true))

(declare-fun e!222423 () Bool)

(declare-fun array_inv!7718 (array!18765) Bool)

(assert (=> start!68620 (and (array_inv!7718 a2!524) e!222423)))

(declare-fun e!222421 () Bool)

(assert (=> start!68620 (and (array_inv!7718 a1!524) e!222421)))

(declare-fun b!309224 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun e!222419 () Bool)

(declare-fun arrayRangesEq!1749 (array!18765 array!18765 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309224 (= e!222419 (arrayRangesEq!1749 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapIsEmpty!2867 () Bool)

(declare-fun mapRes!2867 () Bool)

(assert (=> mapIsEmpty!2867 mapRes!2867))

(declare-fun b!309225 () Bool)

(declare-fun res!253648 () Bool)

(assert (=> b!309225 (=> (not res!253648) (not e!222422))))

(assert (=> b!309225 (= res!253648 e!222419)))

(declare-fun res!253650 () Bool)

(assert (=> b!309225 (=> res!253650 e!222419)))

(assert (=> b!309225 (= res!253650 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2868 () Bool)

(declare-fun mapRes!2868 () Bool)

(assert (=> mapIsEmpty!2868 mapRes!2868))

(declare-fun b!309226 () Bool)

(declare-fun res!253649 () Bool)

(assert (=> b!309226 (=> (not res!253649) (not e!222422))))

(assert (=> b!309226 (= res!253649 (not (= i!932 fromSlice!46)))))

(declare-fun mapNonEmpty!2867 () Bool)

(declare-fun tp!2868 () Bool)

(declare-fun tp_is_empty!901 () Bool)

(assert (=> mapNonEmpty!2867 (= mapRes!2868 (and tp!2868 tp_is_empty!901))))

(declare-fun mapRest!2867 () (Array (_ BitVec 32) T!58107))

(declare-fun mapValue!2867 () T!58107)

(declare-fun mapKey!2868 () (_ BitVec 32))

(assert (=> mapNonEmpty!2867 (= (arr!9220 a1!524) (store mapRest!2867 mapKey!2868 mapValue!2867))))

(declare-fun b!309227 () Bool)

(declare-fun res!253652 () Bool)

(assert (=> b!309227 (=> (not res!253652) (not e!222422))))

(assert (=> b!309227 (= res!253652 (arrayRangesEq!1749 a1!524 a2!524 from!650 to!617))))

(declare-fun b!309228 () Bool)

(assert (=> b!309228 (= e!222423 (and tp_is_empty!901 mapRes!2867))))

(declare-fun condMapEmpty!2867 () Bool)

(declare-fun mapDefault!2868 () T!58107)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68648 () Bool)

(assert start!68648)

(declare-fun b!309537 () Bool)

(declare-fun res!253914 () Bool)

(declare-fun e!222577 () Bool)

(assert (=> b!309537 (=> (not res!253914) (not e!222577))))

(declare-datatypes ((T!58163 0))(
  ( (T!58164 (val!458 Int)) )
))
(declare-datatypes ((array!18783 0))(
  ( (array!18784 (arr!9228 (Array (_ BitVec 32) T!58163)) (size!8145 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18783)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18783)

(declare-fun arrayRangesEq!1757 (array!18783 array!18783 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309537 (= res!253914 (arrayRangesEq!1757 a1!524 a2!524 from!650 to!617))))

(declare-fun b!309538 () Bool)

(declare-fun res!253917 () Bool)

(assert (=> b!309538 (=> (not res!253917) (not e!222577))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309538 (= res!253917 (not (= i!932 fromSlice!46)))))

(declare-fun mapNonEmpty!2923 () Bool)

(declare-fun mapRes!2924 () Bool)

(declare-fun tp!2923 () Bool)

(declare-fun tp_is_empty!917 () Bool)

(assert (=> mapNonEmpty!2923 (= mapRes!2924 (and tp!2923 tp_is_empty!917))))

(declare-fun mapKey!2924 () (_ BitVec 32))

(declare-fun mapValue!2924 () T!58163)

(declare-fun mapRest!2923 () (Array (_ BitVec 32) T!58163))

(assert (=> mapNonEmpty!2923 (= (arr!9228 a1!524) (store mapRest!2923 mapKey!2924 mapValue!2924))))

(declare-fun b!309539 () Bool)

(declare-fun e!222575 () Bool)

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309539 (= e!222575 (not (arrayRangesEq!1757 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!309540 () Bool)

(declare-fun res!253908 () Bool)

(assert (=> b!309540 (=> (not res!253908) (not e!222577))))

(declare-fun e!222574 () Bool)

(assert (=> b!309540 (= res!253908 e!222574)))

(declare-fun res!253912 () Bool)

(assert (=> b!309540 (=> res!253912 e!222574)))

(assert (=> b!309540 (= res!253912 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2923 () Bool)

(assert (=> mapIsEmpty!2923 mapRes!2924))

(declare-fun mapNonEmpty!2924 () Bool)

(declare-fun mapRes!2923 () Bool)

(declare-fun tp!2924 () Bool)

(assert (=> mapNonEmpty!2924 (= mapRes!2923 (and tp!2924 tp_is_empty!917))))

(declare-fun mapKey!2923 () (_ BitVec 32))

(declare-fun mapValue!2923 () T!58163)

(declare-fun mapRest!2924 () (Array (_ BitVec 32) T!58163))

(assert (=> mapNonEmpty!2924 (= (arr!9228 a2!524) (store mapRest!2924 mapKey!2923 mapValue!2923))))

(declare-fun b!309541 () Bool)

(declare-fun res!253915 () Bool)

(assert (=> b!309541 (=> (not res!253915) (not e!222577))))

(assert (=> b!309541 (= res!253915 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2924 () Bool)

(assert (=> mapIsEmpty!2924 mapRes!2923))

(declare-fun b!309542 () Bool)

(assert (=> b!309542 (= e!222574 (arrayRangesEq!1757 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309543 () Bool)

(declare-fun res!253910 () Bool)

(declare-fun e!222573 () Bool)

(assert (=> b!309543 (=> res!253910 e!222573)))

(assert (=> b!309543 (= res!253910 (not (arrayRangesEq!1757 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun b!309536 () Bool)

(assert (=> b!309536 (= e!222573 (bvslt (bvsub i!932 #b00000000000000000000000000000001) i!932))))

(declare-fun res!253911 () Bool)

(assert (=> start!68648 (=> (not res!253911) (not e!222577))))

(assert (=> start!68648 (= res!253911 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8145 a1!524) (size!8145 a2!524)) (bvsle to!617 (size!8145 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68648 e!222577))

(assert (=> start!68648 true))

(declare-fun e!222578 () Bool)

(declare-fun array_inv!7723 (array!18783) Bool)

(assert (=> start!68648 (and (array_inv!7723 a2!524) e!222578)))

(declare-fun e!222576 () Bool)

(assert (=> start!68648 (and (array_inv!7723 a1!524) e!222576)))

(declare-fun b!309544 () Bool)

(assert (=> b!309544 (= e!222576 (and tp_is_empty!917 mapRes!2924))))

(declare-fun condMapEmpty!2923 () Bool)

(declare-fun mapDefault!2923 () T!58163)


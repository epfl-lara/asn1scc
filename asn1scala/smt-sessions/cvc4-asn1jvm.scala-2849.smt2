; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68612 () Bool)

(assert start!68612)

(declare-fun mapNonEmpty!2843 () Bool)

(declare-fun mapRes!2843 () Bool)

(declare-fun tp!2844 () Bool)

(declare-fun tp_is_empty!893 () Bool)

(assert (=> mapNonEmpty!2843 (= mapRes!2843 (and tp!2844 tp_is_empty!893))))

(declare-datatypes ((T!58059 0))(
  ( (T!58060 (val!446 Int)) )
))
(declare-fun mapValue!2843 () T!58059)

(declare-fun mapKey!2844 () (_ BitVec 32))

(declare-datatypes ((array!18757 0))(
  ( (array!18758 (arr!9216 (Array (_ BitVec 32) T!58059)) (size!8133 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18757)

(declare-fun mapRest!2843 () (Array (_ BitVec 32) T!58059))

(assert (=> mapNonEmpty!2843 (= (arr!9216 a1!524) (store mapRest!2843 mapKey!2844 mapValue!2843))))

(declare-fun mapIsEmpty!2843 () Bool)

(assert (=> mapIsEmpty!2843 mapRes!2843))

(declare-fun b!309114 () Bool)

(declare-fun e!222372 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!309114 (= e!222372 (not (or (= (bvand i!932 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand i!932 #b10000000000000000000000000000000) (bvand (bvsub i!932 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun a2!524 () array!18757)

(assert (=> b!309114 (= (select (arr!9216 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9216 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-datatypes ((Unit!21477 0))(
  ( (Unit!21478) )
))
(declare-fun lt!440358 () Unit!21477)

(declare-fun arrayRangesEqImpliesEq!309 (array!18757 array!18757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21477)

(assert (=> b!309114 (= lt!440358 (arrayRangesEqImpliesEq!309 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!309115 () Bool)

(declare-fun res!253567 () Bool)

(assert (=> b!309115 (=> (not res!253567) (not e!222372))))

(declare-fun arrayRangesEq!1746 (array!18757 array!18757 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309115 (= res!253567 (arrayRangesEq!1746 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309116 () Bool)

(declare-fun e!222369 () Bool)

(assert (=> b!309116 (= e!222369 (and tp_is_empty!893 mapRes!2843))))

(declare-fun condMapEmpty!2844 () Bool)

(declare-fun mapDefault!2844 () T!58059)


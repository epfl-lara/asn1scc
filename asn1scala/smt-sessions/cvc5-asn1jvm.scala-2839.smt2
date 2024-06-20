; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68548 () Bool)

(assert start!68548)

(declare-fun mapIsEmpty!2651 () Bool)

(declare-fun mapRes!2652 () Bool)

(assert (=> mapIsEmpty!2651 mapRes!2652))

(declare-fun b!308169 () Bool)

(declare-fun res!252812 () Bool)

(declare-fun e!221934 () Bool)

(assert (=> b!308169 (=> (not res!252812) (not e!221934))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308169 (= res!252812 (not (= i!932 fromSlice!46)))))

(declare-fun mapIsEmpty!2652 () Bool)

(declare-fun mapRes!2651 () Bool)

(assert (=> mapIsEmpty!2652 mapRes!2651))

(declare-fun mapNonEmpty!2651 () Bool)

(declare-fun tp!2652 () Bool)

(declare-fun tp_is_empty!829 () Bool)

(assert (=> mapNonEmpty!2651 (= mapRes!2652 (and tp!2652 tp_is_empty!829))))

(declare-datatypes ((T!57795 0))(
  ( (T!57796 (val!414 Int)) )
))
(declare-fun mapRest!2651 () (Array (_ BitVec 32) T!57795))

(declare-datatypes ((array!18693 0))(
  ( (array!18694 (arr!9184 (Array (_ BitVec 32) T!57795)) (size!8101 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18693)

(declare-fun mapKey!2652 () (_ BitVec 32))

(declare-fun mapValue!2651 () T!57795)

(assert (=> mapNonEmpty!2651 (= (arr!9184 a2!524) (store mapRest!2651 mapKey!2652 mapValue!2651))))

(declare-fun b!308170 () Bool)

(assert (=> b!308170 (= e!221934 (not true))))

(declare-fun a1!524 () array!18693)

(assert (=> b!308170 (= (select (arr!9184 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9184 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21451 0))(
  ( (Unit!21452) )
))
(declare-fun lt!440271 () Unit!21451)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!298 (array!18693 array!18693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21451)

(assert (=> b!308170 (= lt!440271 (arrayRangesEqImpliesEq!298 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun mapNonEmpty!2652 () Bool)

(declare-fun tp!2651 () Bool)

(assert (=> mapNonEmpty!2652 (= mapRes!2651 (and tp!2651 tp_is_empty!829))))

(declare-fun mapValue!2652 () T!57795)

(declare-fun mapRest!2652 () (Array (_ BitVec 32) T!57795))

(declare-fun mapKey!2651 () (_ BitVec 32))

(assert (=> mapNonEmpty!2652 (= (arr!9184 a1!524) (store mapRest!2652 mapKey!2651 mapValue!2652))))

(declare-fun b!308171 () Bool)

(declare-fun res!252815 () Bool)

(assert (=> b!308171 (=> (not res!252815) (not e!221934))))

(assert (=> b!308171 (= res!252815 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun res!252813 () Bool)

(assert (=> start!68548 (=> (not res!252813) (not e!221934))))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> start!68548 (= res!252813 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8101 a1!524) (size!8101 a2!524)) (bvsle to!617 (size!8101 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68548 e!221934))

(assert (=> start!68548 true))

(declare-fun e!221931 () Bool)

(declare-fun array_inv!7698 (array!18693) Bool)

(assert (=> start!68548 (and (array_inv!7698 a2!524) e!221931)))

(declare-fun e!221933 () Bool)

(assert (=> start!68548 (and (array_inv!7698 a1!524) e!221933)))

(declare-fun b!308172 () Bool)

(declare-fun res!252809 () Bool)

(assert (=> b!308172 (=> (not res!252809) (not e!221934))))

(declare-fun arrayRangesEq!1720 (array!18693 array!18693 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308172 (= res!252809 (arrayRangesEq!1720 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308173 () Bool)

(assert (=> b!308173 (= e!221931 (and tp_is_empty!829 mapRes!2652))))

(declare-fun condMapEmpty!2651 () Bool)

(declare-fun mapDefault!2651 () T!57795)


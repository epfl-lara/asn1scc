; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68552 () Bool)

(assert start!68552)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun b!308223 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-datatypes ((T!57799 0))(
  ( (T!57800 (val!416 Int)) )
))
(declare-datatypes ((array!18697 0))(
  ( (array!18698 (arr!9186 (Array (_ BitVec 32) T!57799)) (size!8103 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18697)

(declare-fun a2!524 () array!18697)

(declare-fun e!221956 () Bool)

(declare-fun arrayRangesEq!1722 (array!18697 array!18697 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308223 (= e!221956 (arrayRangesEq!1722 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308224 () Bool)

(declare-fun res!252854 () Bool)

(declare-fun e!221955 () Bool)

(assert (=> b!308224 (=> (not res!252854) (not e!221955))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308224 (= res!252854 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapNonEmpty!2663 () Bool)

(declare-fun mapRes!2664 () Bool)

(declare-fun tp!2663 () Bool)

(declare-fun tp_is_empty!833 () Bool)

(assert (=> mapNonEmpty!2663 (= mapRes!2664 (and tp!2663 tp_is_empty!833))))

(declare-fun mapRest!2663 () (Array (_ BitVec 32) T!57799))

(declare-fun mapValue!2663 () T!57799)

(declare-fun mapKey!2663 () (_ BitVec 32))

(assert (=> mapNonEmpty!2663 (= (arr!9186 a2!524) (store mapRest!2663 mapKey!2663 mapValue!2663))))

(declare-fun b!308225 () Bool)

(declare-fun res!252855 () Bool)

(assert (=> b!308225 (=> (not res!252855) (not e!221955))))

(assert (=> b!308225 (= res!252855 e!221956)))

(declare-fun res!252851 () Bool)

(assert (=> b!308225 (=> res!252851 e!221956)))

(assert (=> b!308225 (= res!252851 (bvsgt i!932 toSlice!46))))

(declare-fun b!308226 () Bool)

(declare-fun e!221957 () Bool)

(declare-fun mapRes!2663 () Bool)

(assert (=> b!308226 (= e!221957 (and tp_is_empty!833 mapRes!2663))))

(declare-fun condMapEmpty!2664 () Bool)

(declare-fun mapDefault!2664 () T!57799)


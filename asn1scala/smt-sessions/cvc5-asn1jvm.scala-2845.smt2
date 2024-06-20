; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68584 () Bool)

(assert start!68584)

(declare-fun b!308761 () Bool)

(declare-fun res!253298 () Bool)

(declare-fun e!222204 () Bool)

(assert (=> b!308761 (=> (not res!253298) (not e!222204))))

(declare-datatypes ((T!57951 0))(
  ( (T!57952 (val!432 Int)) )
))
(declare-datatypes ((array!18729 0))(
  ( (array!18730 (arr!9202 (Array (_ BitVec 32) T!57951)) (size!8119 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18729)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun a1!524 () array!18729)

(declare-fun arrayRangesEq!1734 (array!18729 array!18729 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308761 (= res!253298 (arrayRangesEq!1734 a1!524 a2!524 i!932 to!617))))

(declare-fun mapIsEmpty!2759 () Bool)

(declare-fun mapRes!2760 () Bool)

(assert (=> mapIsEmpty!2759 mapRes!2760))

(declare-fun res!253297 () Bool)

(assert (=> start!68584 (=> (not res!253297) (not e!222204))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun from!650 () (_ BitVec 32))

(assert (=> start!68584 (= res!253297 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8119 a1!524) (size!8119 a2!524)) (bvsle to!617 (size!8119 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68584 e!222204))

(assert (=> start!68584 true))

(declare-fun e!222201 () Bool)

(declare-fun array_inv!7707 (array!18729) Bool)

(assert (=> start!68584 (and (array_inv!7707 a2!524) e!222201)))

(declare-fun e!222203 () Bool)

(assert (=> start!68584 (and (array_inv!7707 a1!524) e!222203)))

(declare-fun b!308762 () Bool)

(declare-fun e!222202 () Bool)

(assert (=> b!308762 (= e!222202 (arrayRangesEq!1734 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapIsEmpty!2760 () Bool)

(declare-fun mapRes!2759 () Bool)

(assert (=> mapIsEmpty!2760 mapRes!2759))

(declare-fun b!308763 () Bool)

(declare-fun res!253296 () Bool)

(assert (=> b!308763 (=> (not res!253296) (not e!222204))))

(assert (=> b!308763 (= res!253296 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!308764 () Bool)

(declare-fun tp_is_empty!865 () Bool)

(assert (=> b!308764 (= e!222203 (and tp_is_empty!865 mapRes!2760))))

(declare-fun condMapEmpty!2759 () Bool)

(declare-fun mapDefault!2760 () T!57951)


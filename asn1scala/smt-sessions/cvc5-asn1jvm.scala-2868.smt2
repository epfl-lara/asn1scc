; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68742 () Bool)

(assert start!68742)

(declare-fun b!310361 () Bool)

(declare-fun res!254471 () Bool)

(declare-fun e!223010 () Bool)

(assert (=> b!310361 (=> (not res!254471) (not e!223010))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!310361 (= res!254471 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun b!310362 () Bool)

(declare-datatypes ((T!58549 0))(
  ( (T!58550 (val!501 Int)) )
))
(declare-datatypes ((array!18871 0))(
  ( (array!18872 (arr!9271 (Array (_ BitVec 32) T!58549)) (size!8188 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18871)

(assert (=> b!310362 (= e!223010 (not (and (bvsge at!235 #b00000000000000000000000000000000) (bvslt at!235 (size!8188 a1!566)))))))

(declare-fun a2!566 () array!18871)

(assert (=> b!310362 (= (select (arr!9271 a1!566) at!235) (select (arr!9271 a2!566) at!235))))

(declare-datatypes ((Unit!21497 0))(
  ( (Unit!21498) )
))
(declare-fun lt!440448 () Unit!21497)

(declare-fun to!659 () (_ BitVec 32))

(declare-fun rec!106 (array!18871 array!18871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21497)

(assert (=> b!310362 (= lt!440448 (rec!106 a1!566 a2!566 at!235 from!692 to!659 (bvadd #b00000000000000000000000000000001 i!943)))))

(declare-fun b!310363 () Bool)

(declare-fun res!254473 () Bool)

(assert (=> b!310363 (=> (not res!254473) (not e!223010))))

(declare-fun arrayRangesEq!1784 (array!18871 array!18871 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310363 (= res!254473 (arrayRangesEq!1784 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310364 () Bool)

(declare-fun res!254476 () Bool)

(assert (=> b!310364 (=> (not res!254476) (not e!223010))))

(assert (=> b!310364 (= res!254476 (arrayRangesEq!1784 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(declare-fun b!310365 () Bool)

(declare-fun e!223009 () Bool)

(declare-fun tp_is_empty!1003 () Bool)

(declare-fun mapRes!3189 () Bool)

(assert (=> b!310365 (= e!223009 (and tp_is_empty!1003 mapRes!3189))))

(declare-fun condMapEmpty!3189 () Bool)

(declare-fun mapDefault!3190 () T!58549)


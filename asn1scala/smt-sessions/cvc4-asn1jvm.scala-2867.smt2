; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68740 () Bool)

(assert start!68740)

(declare-fun b!310337 () Bool)

(declare-fun res!254453 () Bool)

(declare-fun e!222999 () Bool)

(assert (=> b!310337 (=> (not res!254453) (not e!222999))))

(declare-datatypes ((T!58527 0))(
  ( (T!58528 (val!500 Int)) )
))
(declare-datatypes ((array!18869 0))(
  ( (array!18870 (arr!9270 (Array (_ BitVec 32) T!58527)) (size!8187 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18869)

(declare-fun a1!566 () array!18869)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun arrayRangesEq!1783 (array!18869 array!18869 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310337 (= res!254453 (arrayRangesEq!1783 a1!566 a2!566 from!692 to!659))))

(declare-fun b!310338 () Bool)

(declare-fun e!223000 () Bool)

(declare-fun tp_is_empty!1001 () Bool)

(declare-fun mapRes!3183 () Bool)

(assert (=> b!310338 (= e!223000 (and tp_is_empty!1001 mapRes!3183))))

(declare-fun condMapEmpty!3184 () Bool)

(declare-fun mapDefault!3184 () T!58527)


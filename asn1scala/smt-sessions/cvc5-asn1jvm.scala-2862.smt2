; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68698 () Bool)

(assert start!68698)

(declare-fun b!309984 () Bool)

(declare-fun res!254207 () Bool)

(declare-fun e!222830 () Bool)

(assert (=> b!309984 (=> (not res!254207) (not e!222830))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58393 0))(
  ( (T!58394 (val!483 Int)) )
))
(declare-datatypes ((array!18833 0))(
  ( (array!18834 (arr!9253 (Array (_ BitVec 32) T!58393)) (size!8170 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18833)

(declare-fun a1!566 () array!18833)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1773 (array!18833 array!18833 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309984 (= res!254207 (arrayRangesEq!1773 a1!566 a2!566 from!692 to!659))))

(declare-fun b!309985 () Bool)

(declare-fun res!254208 () Bool)

(assert (=> b!309985 (=> (not res!254208) (not e!222830))))

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!309985 (= res!254208 (arrayRangesEq!1773 a1!566 a2!566 i!943 to!659))))

(declare-fun b!309986 () Bool)

(declare-fun res!254209 () Bool)

(assert (=> b!309986 (=> (not res!254209) (not e!222830))))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> b!309986 (= res!254209 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!309987 () Bool)

(declare-fun e!222828 () Bool)

(declare-fun tp_is_empty!967 () Bool)

(declare-fun mapRes!3073 () Bool)

(assert (=> b!309987 (= e!222828 (and tp_is_empty!967 mapRes!3073))))

(declare-fun condMapEmpty!3074 () Bool)

(declare-fun mapDefault!3073 () T!58393)


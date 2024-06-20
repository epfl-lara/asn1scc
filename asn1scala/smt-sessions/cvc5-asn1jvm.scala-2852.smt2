; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68632 () Bool)

(assert start!68632)

(declare-fun mapIsEmpty!2889 () Bool)

(declare-fun mapRes!2890 () Bool)

(assert (=> mapIsEmpty!2889 mapRes!2890))

(declare-fun b!309332 () Bool)

(declare-fun res!253741 () Bool)

(declare-fun e!222479 () Bool)

(assert (=> b!309332 (=> (not res!253741) (not e!222479))))

(declare-datatypes ((T!58133 0))(
  ( (T!58134 (val!453 Int)) )
))
(declare-datatypes ((array!18772 0))(
  ( (array!18773 (arr!9223 (Array (_ BitVec 32) T!58133)) (size!8140 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18772)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun a1!524 () array!18772)

(declare-fun arrayRangesEq!1752 (array!18772 array!18772 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309332 (= res!253741 (arrayRangesEq!1752 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309333 () Bool)

(declare-fun e!222477 () Bool)

(declare-fun tp_is_empty!907 () Bool)

(assert (=> b!309333 (= e!222477 (and tp_is_empty!907 mapRes!2890))))

(declare-fun condMapEmpty!2890 () Bool)

(declare-fun mapDefault!2889 () T!58133)


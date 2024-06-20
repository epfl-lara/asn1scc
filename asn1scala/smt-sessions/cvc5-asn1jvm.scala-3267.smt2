; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74084 () Bool)

(assert start!74084)

(declare-fun b!326823 () Bool)

(declare-fun res!268320 () Bool)

(declare-fun e!236125 () Bool)

(assert (=> b!326823 (=> (not res!268320) (not e!236125))))

(declare-datatypes ((T!66619 0))(
  ( (T!66620 (val!546 Int)) )
))
(declare-datatypes ((array!21315 0))(
  ( (array!21316 (arr!10342 (Array (_ BitVec 32) T!66619)) (size!9250 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21315)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1862 (array!21315 array!21315 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326823 (= res!268320 (arrayRangesEq!1862 a!407 a!407 i!907 (size!9250 a!407)))))

(declare-fun b!326824 () Bool)

(assert (=> b!326824 (= e!236125 (and (= i!907 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (size!9250 a!407))))))

(declare-fun mapIsEmpty!3364 () Bool)

(declare-fun mapRes!3364 () Bool)

(assert (=> mapIsEmpty!3364 mapRes!3364))

(declare-fun b!326825 () Bool)

(declare-fun e!236126 () Bool)

(declare-fun tp_is_empty!1093 () Bool)

(assert (=> b!326825 (= e!236126 (and tp_is_empty!1093 mapRes!3364))))

(declare-fun condMapEmpty!3364 () Bool)

(declare-fun mapDefault!3364 () T!66619)


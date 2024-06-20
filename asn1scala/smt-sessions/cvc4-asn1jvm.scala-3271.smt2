; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74116 () Bool)

(assert start!74116)

(declare-fun b!326985 () Bool)

(declare-fun res!268437 () Bool)

(declare-fun e!236218 () Bool)

(assert (=> b!326985 (=> (not res!268437) (not e!236218))))

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!326985 (= res!268437 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun b!326986 () Bool)

(declare-fun res!268438 () Bool)

(assert (=> b!326986 (=> (not res!268438) (not e!236218))))

(declare-datatypes ((T!66727 0))(
  ( (T!66728 (val!560 Int)) )
))
(declare-datatypes ((array!21344 0))(
  ( (array!21345 (arr!10356 (Array (_ BitVec 32) T!66727)) (size!9264 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21344)

(declare-fun arrayRangesEq!1872 (array!21344 array!21344 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326986 (= res!268438 (arrayRangesEq!1872 a!407 a!407 i!907 (size!9264 a!407)))))

(declare-fun b!326987 () Bool)

(assert (=> b!326987 (= e!236218 false)))

(declare-datatypes ((Unit!22160 0))(
  ( (Unit!22161) )
))
(declare-fun lt!448682 () Unit!22160)

(declare-fun rec!126 (array!21344 (_ BitVec 32)) Unit!22160)

(assert (=> b!326987 (= lt!448682 (rec!126 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!326988 () Bool)

(declare-fun e!236217 () Bool)

(declare-fun tp_is_empty!1121 () Bool)

(declare-fun mapRes!3409 () Bool)

(assert (=> b!326988 (= e!236217 (and tp_is_empty!1121 mapRes!3409))))

(declare-fun condMapEmpty!3409 () Bool)

(declare-fun mapDefault!3409 () T!66727)


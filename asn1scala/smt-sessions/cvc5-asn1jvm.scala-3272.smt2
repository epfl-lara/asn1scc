; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74118 () Bool)

(assert start!74118)

(declare-fun res!268447 () Bool)

(declare-fun e!236224 () Bool)

(assert (=> start!74118 (=> (not res!268447) (not e!236224))))

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66749 0))(
  ( (T!66750 (val!561 Int)) )
))
(declare-datatypes ((array!21346 0))(
  ( (array!21347 (arr!10357 (Array (_ BitVec 32) T!66749)) (size!9265 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21346)

(assert (=> start!74118 (= res!268447 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9265 a!407))))))

(assert (=> start!74118 e!236224))

(assert (=> start!74118 true))

(declare-fun e!236223 () Bool)

(declare-fun array_inv!8809 (array!21346) Bool)

(assert (=> start!74118 (and (array_inv!8809 a!407) e!236223)))

(declare-fun b!326997 () Bool)

(declare-fun res!268446 () Bool)

(assert (=> b!326997 (=> (not res!268446) (not e!236224))))

(declare-fun arrayRangesEq!1873 (array!21346 array!21346 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326997 (= res!268446 (arrayRangesEq!1873 a!407 a!407 i!907 (size!9265 a!407)))))

(declare-fun mapIsEmpty!3412 () Bool)

(declare-fun mapRes!3412 () Bool)

(assert (=> mapIsEmpty!3412 mapRes!3412))

(declare-fun b!326998 () Bool)

(assert (=> b!326998 (= e!236224 false)))

(declare-datatypes ((Unit!22162 0))(
  ( (Unit!22163) )
))
(declare-fun lt!448685 () Unit!22162)

(declare-fun rec!127 (array!21346 (_ BitVec 32)) Unit!22162)

(assert (=> b!326998 (= lt!448685 (rec!127 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!326999 () Bool)

(declare-fun tp_is_empty!1123 () Bool)

(assert (=> b!326999 (= e!236223 (and tp_is_empty!1123 mapRes!3412))))

(declare-fun condMapEmpty!3412 () Bool)

(declare-fun mapDefault!3412 () T!66749)


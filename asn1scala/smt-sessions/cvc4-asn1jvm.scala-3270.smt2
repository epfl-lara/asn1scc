; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74110 () Bool)

(assert start!74110)

(declare-fun b!326949 () Bool)

(declare-fun e!236200 () Bool)

(declare-datatypes ((T!66701 0))(
  ( (T!66702 (val!557 Int)) )
))
(declare-datatypes ((array!21338 0))(
  ( (array!21339 (arr!10353 (Array (_ BitVec 32) T!66701)) (size!9261 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21338)

(assert (=> b!326949 (= e!236200 (bvsgt #b00000000000000000000000000000000 (size!9261 a!407)))))

(declare-datatypes ((Unit!22156 0))(
  ( (Unit!22157) )
))
(declare-fun lt!448673 () Unit!22156)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun rec!124 (array!21338 (_ BitVec 32)) Unit!22156)

(assert (=> b!326949 (= lt!448673 (rec!124 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!326950 () Bool)

(declare-fun e!236199 () Bool)

(declare-fun tp_is_empty!1115 () Bool)

(declare-fun mapRes!3400 () Bool)

(assert (=> b!326950 (= e!236199 (and tp_is_empty!1115 mapRes!3400))))

(declare-fun condMapEmpty!3400 () Bool)

(declare-fun mapDefault!3400 () T!66701)


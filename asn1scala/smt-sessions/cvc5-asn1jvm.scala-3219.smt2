; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73606 () Bool)

(assert start!73606)

(declare-fun res!267497 () Bool)

(declare-fun e!235052 () Bool)

(assert (=> start!73606 (=> (not res!267497) (not e!235052))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73606 (= res!267497 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73606 e!235052))

(assert (=> start!73606 true))

(declare-datatypes ((array!21098 0))(
  ( (array!21099 (arr!10249 (Array (_ BitVec 32) (_ BitVec 8))) (size!9157 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21098)

(declare-fun array_inv!8709 (array!21098) Bool)

(assert (=> start!73606 (array_inv!8709 a!445)))

(declare-fun b!325901 () Bool)

(declare-fun e!235053 () Bool)

(assert (=> b!325901 (= e!235052 e!235053)))

(declare-fun res!267498 () Bool)

(assert (=> b!325901 (=> (not res!267498) (not e!235053))))

(declare-fun lt!448364 () (_ BitVec 64))

(assert (=> b!325901 (= res!267498 (bvsle i!1031 lt!448364))))

(assert (=> b!325901 (= lt!448364 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9157 a!445))))))

(declare-fun b!325902 () Bool)

(declare-fun res!267499 () Bool)

(assert (=> b!325902 (=> (not res!267499) (not e!235053))))

(declare-fun arrayBitRangesEq!0 (array!21098 array!21098 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325902 (= res!267499 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448364))))

(declare-fun b!325903 () Bool)

(assert (=> b!325903 (= e!235053 (and (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= ((_ sign_extend 32) (size!9157 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448364 ((_ sign_extend 32) (size!9157 a!445)))))))))

(assert (= (and start!73606 res!267497) b!325901))

(assert (= (and b!325901 res!267498) b!325902))

(assert (= (and b!325902 res!267499) b!325903))

(declare-fun m!463759 () Bool)

(assert (=> start!73606 m!463759))

(declare-fun m!463761 () Bool)

(assert (=> b!325902 m!463761))

(push 1)

(assert (not start!73606))

(assert (not b!325902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


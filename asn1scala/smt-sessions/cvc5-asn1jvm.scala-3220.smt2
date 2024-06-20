; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73612 () Bool)

(assert start!73612)

(declare-fun b!325930 () Bool)

(declare-fun e!235080 () Bool)

(declare-fun e!235079 () Bool)

(assert (=> b!325930 (= e!235080 e!235079)))

(declare-fun res!267528 () Bool)

(assert (=> b!325930 (=> (not res!267528) (not e!235079))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448373 () (_ BitVec 64))

(assert (=> b!325930 (= res!267528 (bvsle i!1031 lt!448373))))

(declare-datatypes ((array!21104 0))(
  ( (array!21105 (arr!10252 (Array (_ BitVec 32) (_ BitVec 8))) (size!9160 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21104)

(assert (=> b!325930 (= lt!448373 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9160 a!445))))))

(declare-fun b!325933 () Bool)

(declare-fun arrayBitRangesEq!0 (array!21104 array!21104 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325933 (= e!235079 (not (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448373)))))

(declare-fun b!325931 () Bool)

(declare-fun res!267526 () Bool)

(assert (=> b!325931 (=> (not res!267526) (not e!235079))))

(assert (=> b!325931 (= res!267526 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448373))))

(declare-fun b!325932 () Bool)

(declare-fun res!267529 () Bool)

(assert (=> b!325932 (=> (not res!267529) (not e!235079))))

(assert (=> b!325932 (= res!267529 (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!267527 () Bool)

(assert (=> start!73612 (=> (not res!267527) (not e!235080))))

(assert (=> start!73612 (= res!267527 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73612 e!235080))

(assert (=> start!73612 true))

(declare-fun array_inv!8712 (array!21104) Bool)

(assert (=> start!73612 (array_inv!8712 a!445)))

(assert (= (and start!73612 res!267527) b!325930))

(assert (= (and b!325930 res!267528) b!325931))

(assert (= (and b!325931 res!267526) b!325932))

(assert (= (and b!325932 res!267529) b!325933))

(declare-fun m!463771 () Bool)

(assert (=> b!325933 m!463771))

(declare-fun m!463773 () Bool)

(assert (=> b!325931 m!463773))

(declare-fun m!463775 () Bool)

(assert (=> start!73612 m!463775))

(push 1)

(assert (not start!73612))

(assert (not b!325933))

(assert (not b!325931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


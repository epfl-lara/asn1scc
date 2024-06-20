; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73610 () Bool)

(assert start!73610)

(declare-fun res!267517 () Bool)

(declare-fun e!235070 () Bool)

(assert (=> start!73610 (=> (not res!267517) (not e!235070))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73610 (= res!267517 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73610 e!235070))

(assert (=> start!73610 true))

(declare-datatypes ((array!21102 0))(
  ( (array!21103 (arr!10251 (Array (_ BitVec 32) (_ BitVec 8))) (size!9159 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21102)

(declare-fun array_inv!8711 (array!21102) Bool)

(assert (=> start!73610 (array_inv!8711 a!445)))

(declare-fun b!325919 () Bool)

(declare-fun e!235071 () Bool)

(assert (=> b!325919 (= e!235070 e!235071)))

(declare-fun res!267516 () Bool)

(assert (=> b!325919 (=> (not res!267516) (not e!235071))))

(declare-fun lt!448370 () (_ BitVec 64))

(assert (=> b!325919 (= res!267516 (bvsle i!1031 lt!448370))))

(assert (=> b!325919 (= lt!448370 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9159 a!445))))))

(declare-fun b!325920 () Bool)

(declare-fun res!267515 () Bool)

(assert (=> b!325920 (=> (not res!267515) (not e!235071))))

(declare-fun arrayBitRangesEq!0 (array!21102 array!21102 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325920 (= res!267515 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448370))))

(declare-fun b!325921 () Bool)

(assert (=> b!325921 (= e!235071 (and (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= ((_ sign_extend 32) (size!9159 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448370 ((_ sign_extend 32) (size!9159 a!445)))))))))

(assert (= (and start!73610 res!267517) b!325919))

(assert (= (and b!325919 res!267516) b!325920))

(assert (= (and b!325920 res!267515) b!325921))

(declare-fun m!463767 () Bool)

(assert (=> start!73610 m!463767))

(declare-fun m!463769 () Bool)

(assert (=> b!325920 m!463769))

(push 1)

(assert (not b!325920))

(assert (not start!73610))

(check-sat)

(pop 1)

(push 1)

(check-sat)


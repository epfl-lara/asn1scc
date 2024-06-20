; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73616 () Bool)

(assert start!73616)

(declare-fun res!267552 () Bool)

(declare-fun e!235096 () Bool)

(assert (=> start!73616 (=> (not res!267552) (not e!235096))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73616 (= res!267552 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73616 e!235096))

(assert (=> start!73616 true))

(declare-datatypes ((array!21108 0))(
  ( (array!21109 (arr!10254 (Array (_ BitVec 32) (_ BitVec 8))) (size!9162 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21108)

(declare-fun array_inv!8714 (array!21108) Bool)

(assert (=> start!73616 (array_inv!8714 a!445)))

(declare-fun b!325957 () Bool)

(declare-fun e!235098 () Bool)

(declare-fun lt!448379 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!21108 array!21108 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325957 (= e!235098 (not (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448379)))))

(declare-fun b!325955 () Bool)

(declare-fun res!267553 () Bool)

(assert (=> b!325955 (=> (not res!267553) (not e!235098))))

(assert (=> b!325955 (= res!267553 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448379))))

(declare-fun b!325956 () Bool)

(declare-fun res!267551 () Bool)

(assert (=> b!325956 (=> (not res!267551) (not e!235098))))

(assert (=> b!325956 (= res!267551 (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325954 () Bool)

(assert (=> b!325954 (= e!235096 e!235098)))

(declare-fun res!267550 () Bool)

(assert (=> b!325954 (=> (not res!267550) (not e!235098))))

(assert (=> b!325954 (= res!267550 (bvsle i!1031 lt!448379))))

(assert (=> b!325954 (= lt!448379 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9162 a!445))))))

(assert (= (and start!73616 res!267552) b!325954))

(assert (= (and b!325954 res!267550) b!325955))

(assert (= (and b!325955 res!267553) b!325956))

(assert (= (and b!325956 res!267551) b!325957))

(declare-fun m!463783 () Bool)

(assert (=> start!73616 m!463783))

(declare-fun m!463785 () Bool)

(assert (=> b!325957 m!463785))

(declare-fun m!463787 () Bool)

(assert (=> b!325955 m!463787))

(push 1)

(assert (not b!325957))

(assert (not b!325955))

(assert (not start!73616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


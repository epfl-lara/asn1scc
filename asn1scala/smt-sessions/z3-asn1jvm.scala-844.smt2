; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24624 () Bool)

(assert start!24624)

(declare-fun b!124892 () Bool)

(declare-fun res!103400 () Bool)

(declare-fun e!82027 () Bool)

(assert (=> b!124892 (=> (not res!103400) (not e!82027))))

(declare-datatypes ((array!5588 0))(
  ( (array!5589 (arr!3124 (Array (_ BitVec 32) (_ BitVec 8))) (size!2531 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5588)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5588)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5588 array!5588 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124892 (= res!103400 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124895 () Bool)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!124895 (= e!82027 (and (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (or (bvslt atByte!11 #b00000000000000000000000000000000) (bvsge atByte!11 (size!2531 a1!934)))))))

(declare-fun res!103402 () Bool)

(assert (=> start!24624 (=> (not res!103402) (not e!82027))))

(assert (=> start!24624 (= res!103402 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2531 a1!934) (size!2531 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2531 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24624 e!82027))

(declare-fun array_inv!2320 (array!5588) Bool)

(assert (=> start!24624 (array_inv!2320 a2!934)))

(assert (=> start!24624 true))

(assert (=> start!24624 (array_inv!2320 a1!934)))

(declare-fun b!124894 () Bool)

(declare-fun res!103399 () Bool)

(assert (=> b!124894 (=> (not res!103399) (not e!82027))))

(assert (=> b!124894 (= res!103399 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124893 () Bool)

(declare-fun res!103401 () Bool)

(assert (=> b!124893 (=> (not res!103401) (not e!82027))))

(assert (=> b!124893 (= res!103401 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(assert (= (and start!24624 res!103402) b!124892))

(assert (= (and b!124892 res!103400) b!124893))

(assert (= (and b!124893 res!103401) b!124894))

(assert (= (and b!124894 res!103399) b!124895))

(declare-fun m!190199 () Bool)

(assert (=> b!124892 m!190199))

(declare-fun m!190201 () Bool)

(assert (=> start!24624 m!190201))

(declare-fun m!190203 () Bool)

(assert (=> start!24624 m!190203))

(declare-fun m!190205 () Bool)

(assert (=> b!124894 m!190205))

(check-sat (not b!124892) (not b!124894) (not start!24624))
(check-sat)

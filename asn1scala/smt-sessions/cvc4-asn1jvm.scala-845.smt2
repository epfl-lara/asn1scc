; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24632 () Bool)

(assert start!24632)

(declare-fun b!124940 () Bool)

(declare-fun res!103447 () Bool)

(declare-fun e!82064 () Bool)

(assert (=> b!124940 (=> (not res!103447) (not e!82064))))

(declare-datatypes ((array!5596 0))(
  ( (array!5597 (arr!3128 (Array (_ BitVec 32) (_ BitVec 8))) (size!2535 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5596)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5596)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5596 array!5596 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124940 (= res!103447 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124941 () Bool)

(declare-fun res!103450 () Bool)

(assert (=> b!124941 (=> (not res!103450) (not e!82064))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!124941 (= res!103450 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!124942 () Bool)

(declare-fun res!103449 () Bool)

(assert (=> b!124942 (=> (not res!103449) (not e!82064))))

(assert (=> b!124942 (= res!103449 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun res!103448 () Bool)

(assert (=> start!24632 (=> (not res!103448) (not e!82064))))

(assert (=> start!24632 (= res!103448 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2535 a1!934) (size!2535 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2535 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24632 e!82064))

(declare-fun array_inv!2324 (array!5596) Bool)

(assert (=> start!24632 (array_inv!2324 a2!934)))

(assert (=> start!24632 true))

(assert (=> start!24632 (array_inv!2324 a1!934)))

(declare-fun b!124943 () Bool)

(assert (=> b!124943 (= e!82064 (and (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (or (bvslt atByte!11 #b00000000000000000000000000000000) (bvsge atByte!11 (size!2535 a2!934)))))))

(assert (= (and start!24632 res!103448) b!124940))

(assert (= (and b!124940 res!103447) b!124941))

(assert (= (and b!124941 res!103450) b!124942))

(assert (= (and b!124942 res!103449) b!124943))

(declare-fun m!190231 () Bool)

(assert (=> b!124940 m!190231))

(declare-fun m!190233 () Bool)

(assert (=> b!124942 m!190233))

(declare-fun m!190235 () Bool)

(assert (=> start!24632 m!190235))

(declare-fun m!190237 () Bool)

(assert (=> start!24632 m!190237))

(push 1)

(assert (not b!124940))

(assert (not b!124942))

(assert (not start!24632))

(check-sat)

(pop 1)

(push 1)

(check-sat)


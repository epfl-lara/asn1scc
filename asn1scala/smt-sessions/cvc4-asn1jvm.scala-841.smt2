; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24608 () Bool)

(assert start!24608)

(declare-fun res!103305 () Bool)

(declare-fun e!81955 () Bool)

(assert (=> start!24608 (=> (not res!103305) (not e!81955))))

(declare-datatypes ((array!5572 0))(
  ( (array!5573 (arr!3116 (Array (_ BitVec 32) (_ BitVec 8))) (size!2523 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5572)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5572)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24608 (= res!103305 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2523 a1!934) (size!2523 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2523 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24608 e!81955))

(declare-fun array_inv!2312 (array!5572) Bool)

(assert (=> start!24608 (array_inv!2312 a2!934)))

(assert (=> start!24608 true))

(assert (=> start!24608 (array_inv!2312 a1!934)))

(declare-fun b!124798 () Bool)

(declare-fun res!103306 () Bool)

(assert (=> b!124798 (=> (not res!103306) (not e!81955))))

(declare-fun arrayBitRangesEq!0 (array!5572 array!5572 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124798 (= res!103306 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun b!124799 () Bool)

(assert (=> b!124799 (= e!81955 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (not (= ((_ sign_extend 32) atByte!11) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)) ((_ sign_extend 32) atByte!11))))))))

(assert (= (and start!24608 res!103305) b!124798))

(assert (= (and b!124798 res!103306) b!124799))

(declare-fun m!190137 () Bool)

(assert (=> start!24608 m!190137))

(declare-fun m!190139 () Bool)

(assert (=> start!24608 m!190139))

(declare-fun m!190141 () Bool)

(assert (=> b!124798 m!190141))

(push 1)

(assert (not b!124798))

(assert (not start!24608))

(check-sat)

(pop 1)

(push 1)

(check-sat)


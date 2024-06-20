; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24592 () Bool)

(assert start!24592)

(declare-fun res!103257 () Bool)

(declare-fun e!81884 () Bool)

(assert (=> start!24592 (=> (not res!103257) (not e!81884))))

(declare-datatypes ((array!5556 0))(
  ( (array!5557 (arr!3108 (Array (_ BitVec 32) (_ BitVec 8))) (size!2515 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5556)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5556)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24592 (= res!103257 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2515 a1!934) (size!2515 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2515 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24592 e!81884))

(declare-fun array_inv!2304 (array!5556) Bool)

(assert (=> start!24592 (array_inv!2304 a2!934)))

(assert (=> start!24592 true))

(assert (=> start!24592 (array_inv!2304 a1!934)))

(declare-fun b!124750 () Bool)

(declare-fun res!103258 () Bool)

(assert (=> b!124750 (=> (not res!103258) (not e!81884))))

(declare-fun arrayBitRangesEq!0 (array!5556 array!5556 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124750 (= res!103258 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun b!124751 () Bool)

(assert (=> b!124751 (= e!81884 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11))) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1051) (bvsgt i!1051 to!880))))))

(assert (= (and start!24592 res!103257) b!124750))

(assert (= (and b!124750 res!103258) b!124751))

(declare-fun m!190089 () Bool)

(assert (=> start!24592 m!190089))

(declare-fun m!190091 () Bool)

(assert (=> start!24592 m!190091))

(declare-fun m!190093 () Bool)

(assert (=> b!124750 m!190093))

(push 1)

(assert (not b!124750))

(assert (not start!24592))

(check-sat)

(pop 1)

(push 1)

(check-sat)


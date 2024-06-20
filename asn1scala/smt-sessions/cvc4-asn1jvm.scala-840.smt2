; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24602 () Bool)

(assert start!24602)

(declare-fun res!103287 () Bool)

(declare-fun e!81927 () Bool)

(assert (=> start!24602 (=> (not res!103287) (not e!81927))))

(declare-datatypes ((array!5566 0))(
  ( (array!5567 (arr!3113 (Array (_ BitVec 32) (_ BitVec 8))) (size!2520 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5566)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5566)

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> start!24602 (= res!103287 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2520 a1!934) (size!2520 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2520 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24602 e!81927))

(declare-fun array_inv!2309 (array!5566) Bool)

(assert (=> start!24602 (array_inv!2309 a2!934)))

(assert (=> start!24602 true))

(assert (=> start!24602 (array_inv!2309 a1!934)))

(declare-fun b!124780 () Bool)

(declare-fun res!103288 () Bool)

(assert (=> b!124780 (=> (not res!103288) (not e!81927))))

(declare-fun arrayBitRangesEq!0 (array!5566 array!5566 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124780 (= res!103288 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124781 () Bool)

(assert (=> b!124781 (= e!81927 (and (= (bvand from!913 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!24602 res!103287) b!124780))

(assert (= (and b!124780 res!103288) b!124781))

(declare-fun m!190119 () Bool)

(assert (=> start!24602 m!190119))

(declare-fun m!190121 () Bool)

(assert (=> start!24602 m!190121))

(declare-fun m!190123 () Bool)

(assert (=> b!124780 m!190123))

(push 1)

(assert (not b!124780))

(assert (not start!24602))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24598 () Bool)

(assert start!24598)

(declare-fun res!103276 () Bool)

(declare-fun e!81910 () Bool)

(assert (=> start!24598 (=> (not res!103276) (not e!81910))))

(declare-datatypes ((array!5562 0))(
  ( (array!5563 (arr!3111 (Array (_ BitVec 32) (_ BitVec 8))) (size!2518 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5562)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5562)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24598 (= res!103276 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2518 a1!934) (size!2518 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2518 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24598 e!81910))

(declare-fun array_inv!2307 (array!5562) Bool)

(assert (=> start!24598 (array_inv!2307 a2!934)))

(assert (=> start!24598 true))

(assert (=> start!24598 (array_inv!2307 a1!934)))

(declare-fun b!124768 () Bool)

(declare-fun res!103275 () Bool)

(assert (=> b!124768 (=> (not res!103275) (not e!81910))))

(declare-fun arrayBitRangesEq!0 (array!5562 array!5562 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124768 (= res!103275 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124769 () Bool)

(assert (=> b!124769 (= e!81910 (and (= (bvand from!913 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!24598 res!103276) b!124768))

(assert (= (and b!124768 res!103275) b!124769))

(declare-fun m!190107 () Bool)

(assert (=> start!24598 m!190107))

(declare-fun m!190109 () Bool)

(assert (=> start!24598 m!190109))

(declare-fun m!190111 () Bool)

(assert (=> b!124768 m!190111))

(push 1)

(assert (not b!124768))

(assert (not start!24598))

(check-sat)

(pop 1)

(push 1)

(check-sat)


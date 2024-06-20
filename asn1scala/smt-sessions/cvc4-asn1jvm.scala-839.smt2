; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24596 () Bool)

(assert start!24596)

(declare-fun res!103270 () Bool)

(declare-fun e!81900 () Bool)

(assert (=> start!24596 (=> (not res!103270) (not e!81900))))

(declare-datatypes ((array!5560 0))(
  ( (array!5561 (arr!3110 (Array (_ BitVec 32) (_ BitVec 8))) (size!2517 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5560)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5560)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24596 (= res!103270 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2517 a1!934) (size!2517 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2517 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24596 e!81900))

(declare-fun array_inv!2306 (array!5560) Bool)

(assert (=> start!24596 (array_inv!2306 a2!934)))

(assert (=> start!24596 true))

(assert (=> start!24596 (array_inv!2306 a1!934)))

(declare-fun b!124762 () Bool)

(declare-fun res!103269 () Bool)

(assert (=> b!124762 (=> (not res!103269) (not e!81900))))

(declare-fun arrayBitRangesEq!0 (array!5560 array!5560 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124762 (= res!103269 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124763 () Bool)

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!124763 (= e!81900 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11))) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1051) (bvsgt i!1051 to!880))))))

(assert (= (and start!24596 res!103270) b!124762))

(assert (= (and b!124762 res!103269) b!124763))

(declare-fun m!190101 () Bool)

(assert (=> start!24596 m!190101))

(declare-fun m!190103 () Bool)

(assert (=> start!24596 m!190103))

(declare-fun m!190105 () Bool)

(assert (=> b!124762 m!190105))

(push 1)

(assert (not b!124762))

(assert (not start!24596))

(check-sat)

(pop 1)

(push 1)

(check-sat)


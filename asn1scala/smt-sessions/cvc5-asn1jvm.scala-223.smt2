; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4600 () Bool)

(assert start!4600)

(declare-fun res!16305 () Bool)

(declare-fun e!11905 () Bool)

(assert (=> start!4600 (=> (not res!16305) (not e!11905))))

(declare-datatypes ((array!1250 0))(
  ( (array!1251 (arr!967 (Array (_ BitVec 32) (_ BitVec 8))) (size!526 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1250)

(declare-fun a1!923 () array!1250)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4600 (= res!16305 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!526 a1!923) (size!526 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!526 a1!923))))))))

(assert (=> start!4600 e!11905))

(declare-fun array_inv!496 (array!1250) Bool)

(assert (=> start!4600 (array_inv!496 a2!923)))

(assert (=> start!4600 (array_inv!496 a1!923)))

(assert (=> start!4600 true))

(declare-fun b!18588 () Bool)

(declare-fun e!11906 () Bool)

(assert (=> b!18588 (= e!11905 e!11906)))

(declare-fun res!16306 () Bool)

(assert (=> b!18588 (=> (not res!16306) (not e!11906))))

(declare-fun lt!26854 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(assert (=> b!18588 (= res!16306 (and (bvsle lt!26854 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18588 (= lt!26854 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18589 () Bool)

(declare-fun res!16307 () Bool)

(assert (=> b!18589 (=> (not res!16307) (not e!11906))))

(declare-fun arrayBitRangesEq!0 (array!1250 array!1250 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18589 (= res!16307 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18590 () Bool)

(assert (=> b!18590 (= e!11906 (or (bvsgt lt!26854 from!908) (bvsgt from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(assert (= (and start!4600 res!16305) b!18588))

(assert (= (and b!18588 res!16306) b!18589))

(assert (= (and b!18589 res!16307) b!18590))

(declare-fun m!25009 () Bool)

(assert (=> start!4600 m!25009))

(declare-fun m!25011 () Bool)

(assert (=> start!4600 m!25011))

(declare-fun m!25013 () Bool)

(assert (=> b!18589 m!25013))

(push 1)

(assert (not start!4600))

(assert (not b!18589))

(check-sat)

(pop 1)

(push 1)

(check-sat)


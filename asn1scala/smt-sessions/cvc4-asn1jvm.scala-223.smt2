; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4604 () Bool)

(assert start!4604)

(declare-fun res!16323 () Bool)

(declare-fun e!11929 () Bool)

(assert (=> start!4604 (=> (not res!16323) (not e!11929))))

(declare-datatypes ((array!1254 0))(
  ( (array!1255 (arr!969 (Array (_ BitVec 32) (_ BitVec 8))) (size!528 (_ BitVec 32))) )
))
(declare-fun a1!923 () array!1254)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(declare-fun a2!923 () array!1254)

(assert (=> start!4604 (= res!16323 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!528 a1!923) (size!528 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!528 a1!923))))))))

(assert (=> start!4604 e!11929))

(declare-fun array_inv!498 (array!1254) Bool)

(assert (=> start!4604 (array_inv!498 a2!923)))

(assert (=> start!4604 (array_inv!498 a1!923)))

(assert (=> start!4604 true))

(declare-fun b!18606 () Bool)

(declare-fun e!11930 () Bool)

(assert (=> b!18606 (= e!11929 e!11930)))

(declare-fun res!16325 () Bool)

(assert (=> b!18606 (=> (not res!16325) (not e!11930))))

(declare-fun lt!26860 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(assert (=> b!18606 (= res!16325 (and (bvsle lt!26860 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18606 (= lt!26860 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18607 () Bool)

(declare-fun res!16324 () Bool)

(assert (=> b!18607 (=> (not res!16324) (not e!11930))))

(declare-fun arrayBitRangesEq!0 (array!1254 array!1254 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18607 (= res!16324 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18608 () Bool)

(assert (=> b!18608 (= e!11930 (or (bvsgt lt!26860 from!908) (bvsgt from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(assert (= (and start!4604 res!16323) b!18606))

(assert (= (and b!18606 res!16325) b!18607))

(assert (= (and b!18607 res!16324) b!18608))

(declare-fun m!25021 () Bool)

(assert (=> start!4604 m!25021))

(declare-fun m!25023 () Bool)

(assert (=> start!4604 m!25023))

(declare-fun m!25025 () Bool)

(assert (=> b!18607 m!25025))

(push 1)

(assert (not b!18607))

(assert (not start!4604))

(check-sat)

(pop 1)

(push 1)

(check-sat)


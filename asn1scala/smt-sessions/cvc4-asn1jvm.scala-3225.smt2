; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73676 () Bool)

(assert start!73676)

(declare-fun b!326249 () Bool)

(declare-fun res!267822 () Bool)

(declare-fun e!235335 () Bool)

(assert (=> b!326249 (=> (not res!267822) (not e!235335))))

(declare-fun lt!448469 () (_ BitVec 64))

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21141 0))(
  ( (array!21142 (arr!10269 (Array (_ BitVec 32) (_ BitVec 8))) (size!9177 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21141)

(declare-fun arrayBitRangesEq!0 (array!21141 array!21141 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326249 (= res!267822 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448469))))

(declare-fun b!326250 () Bool)

(declare-fun res!267823 () Bool)

(assert (=> b!326250 (=> (not res!267823) (not e!235335))))

(assert (=> b!326250 (= res!267823 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448469)))))

(declare-fun b!326251 () Bool)

(declare-fun e!235337 () Bool)

(assert (=> b!326251 (= e!235337 e!235335)))

(declare-fun res!267825 () Bool)

(assert (=> b!326251 (=> (not res!267825) (not e!235335))))

(assert (=> b!326251 (= res!267825 (bvsle i!1031 lt!448469))))

(assert (=> b!326251 (= lt!448469 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9177 a!445))))))

(declare-fun b!326252 () Bool)

(declare-fun res!267821 () Bool)

(assert (=> b!326252 (=> (not res!267821) (not e!235335))))

(assert (=> b!326252 (= res!267821 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448469))))

(declare-fun b!326253 () Bool)

(assert (=> b!326253 (= e!235335 (not (or (= ((_ sign_extend 32) (size!9177 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448469 ((_ sign_extend 32) (size!9177 a!445)))))))))

(assert (=> b!326253 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448469)))

(declare-datatypes ((Unit!22120 0))(
  ( (Unit!22121) )
))
(declare-fun lt!448468 () Unit!22120)

(declare-fun rec!21 (array!21141 (_ BitVec 64)) Unit!22120)

(assert (=> b!326253 (= lt!448468 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!267824 () Bool)

(assert (=> start!73676 (=> (not res!267824) (not e!235337))))

(assert (=> start!73676 (= res!267824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73676 e!235337))

(assert (=> start!73676 true))

(declare-fun array_inv!8729 (array!21141) Bool)

(assert (=> start!73676 (array_inv!8729 a!445)))

(assert (= (and start!73676 res!267824) b!326251))

(assert (= (and b!326251 res!267825) b!326252))

(assert (= (and b!326252 res!267821) b!326250))

(assert (= (and b!326250 res!267823) b!326249))

(assert (= (and b!326249 res!267822) b!326253))

(declare-fun m!464023 () Bool)

(assert (=> b!326249 m!464023))

(declare-fun m!464025 () Bool)

(assert (=> b!326252 m!464025))

(declare-fun m!464027 () Bool)

(assert (=> b!326253 m!464027))

(declare-fun m!464029 () Bool)

(assert (=> b!326253 m!464029))

(declare-fun m!464031 () Bool)

(assert (=> start!73676 m!464031))

(push 1)

(assert (not start!73676))

(assert (not b!326249))

(assert (not b!326252))

(assert (not b!326253))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73608 () Bool)

(assert start!73608)

(declare-fun res!267506 () Bool)

(declare-fun e!235062 () Bool)

(assert (=> start!73608 (=> (not res!267506) (not e!235062))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73608 (= res!267506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73608 e!235062))

(assert (=> start!73608 true))

(declare-datatypes ((array!21100 0))(
  ( (array!21101 (arr!10250 (Array (_ BitVec 32) (_ BitVec 8))) (size!9158 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21100)

(declare-fun array_inv!8710 (array!21100) Bool)

(assert (=> start!73608 (array_inv!8710 a!445)))

(declare-fun b!325910 () Bool)

(declare-fun e!235060 () Bool)

(assert (=> b!325910 (= e!235062 e!235060)))

(declare-fun res!267508 () Bool)

(assert (=> b!325910 (=> (not res!267508) (not e!235060))))

(declare-fun lt!448367 () (_ BitVec 64))

(assert (=> b!325910 (= res!267508 (bvsle i!1031 lt!448367))))

(assert (=> b!325910 (= lt!448367 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9158 a!445))))))

(declare-fun b!325911 () Bool)

(declare-fun res!267507 () Bool)

(assert (=> b!325911 (=> (not res!267507) (not e!235060))))

(declare-fun arrayBitRangesEq!0 (array!21100 array!21100 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325911 (= res!267507 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448367))))

(declare-fun b!325912 () Bool)

(assert (=> b!325912 (= e!235060 (and (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= ((_ sign_extend 32) (size!9158 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448367 ((_ sign_extend 32) (size!9158 a!445)))))))))

(assert (= (and start!73608 res!267506) b!325910))

(assert (= (and b!325910 res!267508) b!325911))

(assert (= (and b!325911 res!267507) b!325912))

(declare-fun m!463763 () Bool)

(assert (=> start!73608 m!463763))

(declare-fun m!463765 () Bool)

(assert (=> b!325911 m!463765))

(check-sat (not b!325911) (not start!73608))
(check-sat)

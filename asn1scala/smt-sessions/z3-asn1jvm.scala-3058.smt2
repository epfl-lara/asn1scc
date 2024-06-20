; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70790 () Bool)

(assert start!70790)

(declare-fun res!263131 () Bool)

(declare-fun e!230412 () Bool)

(assert (=> start!70790 (=> (not res!263131) (not e!230412))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70790 (= res!263131 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70790 e!230412))

(assert (=> start!70790 true))

(declare-datatypes ((array!20107 0))(
  ( (array!20108 (arr!9854 (Array (_ BitVec 32) (_ BitVec 8))) (size!8762 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20107)

(declare-fun array_inv!8314 (array!20107) Bool)

(assert (=> start!70790 (array_inv!8314 a!425)))

(declare-fun b!320249 () Bool)

(declare-fun e!230410 () Bool)

(declare-fun lt!443885 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!20107 array!20107 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320249 (= e!230410 (not (arrayBitRangesEq!0 a!425 a!425 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443885)))))

(declare-fun b!320248 () Bool)

(declare-fun res!263128 () Bool)

(assert (=> b!320248 (=> (not res!263128) (not e!230410))))

(assert (=> b!320248 (= res!263128 (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320246 () Bool)

(assert (=> b!320246 (= e!230412 e!230410)))

(declare-fun res!263130 () Bool)

(assert (=> b!320246 (=> (not res!263130) (not e!230410))))

(assert (=> b!320246 (= res!263130 (bvsle i!979 lt!443885))))

(assert (=> b!320246 (= lt!443885 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8762 a!425))))))

(declare-fun b!320247 () Bool)

(declare-fun res!263129 () Bool)

(assert (=> b!320247 (=> (not res!263129) (not e!230410))))

(assert (=> b!320247 (= res!263129 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443885))))

(assert (= (and start!70790 res!263131) b!320246))

(assert (= (and b!320246 res!263130) b!320247))

(assert (= (and b!320247 res!263129) b!320248))

(assert (= (and b!320248 res!263128) b!320249))

(declare-fun m!458651 () Bool)

(assert (=> start!70790 m!458651))

(declare-fun m!458653 () Bool)

(assert (=> b!320249 m!458653))

(declare-fun m!458655 () Bool)

(assert (=> b!320247 m!458655))

(check-sat (not start!70790) (not b!320249) (not b!320247))

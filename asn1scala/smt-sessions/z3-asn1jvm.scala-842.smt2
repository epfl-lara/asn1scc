; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24612 () Bool)

(assert start!24612)

(declare-fun res!103330 () Bool)

(declare-fun e!81974 () Bool)

(assert (=> start!24612 (=> (not res!103330) (not e!81974))))

(declare-datatypes ((array!5576 0))(
  ( (array!5577 (arr!3118 (Array (_ BitVec 32) (_ BitVec 8))) (size!2525 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5576)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5576)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24612 (= res!103330 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2525 a1!934) (size!2525 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2525 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24612 e!81974))

(declare-fun array_inv!2314 (array!5576) Bool)

(assert (=> start!24612 (array_inv!2314 a2!934)))

(assert (=> start!24612 true))

(assert (=> start!24612 (array_inv!2314 a1!934)))

(declare-fun b!124822 () Bool)

(declare-fun res!103327 () Bool)

(assert (=> b!124822 (=> (not res!103327) (not e!81974))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5576 array!5576 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124822 (= res!103327 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124821 () Bool)

(declare-fun res!103328 () Bool)

(assert (=> b!124821 (=> (not res!103328) (not e!81974))))

(assert (=> b!124821 (= res!103328 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!124820 () Bool)

(declare-fun res!103329 () Bool)

(assert (=> b!124820 (=> (not res!103329) (not e!81974))))

(assert (=> b!124820 (= res!103329 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124823 () Bool)

(assert (=> b!124823 (= e!81974 (and (not (= (bvand to!880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!880 i!1051) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!24612 res!103330) b!124820))

(assert (= (and b!124820 res!103329) b!124821))

(assert (= (and b!124821 res!103328) b!124822))

(assert (= (and b!124822 res!103327) b!124823))

(declare-fun m!190151 () Bool)

(assert (=> start!24612 m!190151))

(declare-fun m!190153 () Bool)

(assert (=> start!24612 m!190153))

(declare-fun m!190155 () Bool)

(assert (=> b!124822 m!190155))

(declare-fun m!190157 () Bool)

(assert (=> b!124820 m!190157))

(check-sat (not b!124820) (not start!24612) (not b!124822))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19084 () Bool)

(assert start!19084)

(declare-fun b!95308 () Bool)

(declare-fun e!62462 () Bool)

(declare-datatypes ((array!4451 0))(
  ( (array!4452 (arr!2632 (Array (_ BitVec 32) (_ BitVec 8))) (size!2030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3552 0))(
  ( (BitStream!3553 (buf!2385 array!4451) (currentByte!4760 (_ BitVec 32)) (currentBit!4755 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3552)

(declare-fun array_inv!1841 (array!4451) Bool)

(assert (=> b!95308 (= e!62462 (array_inv!1841 (buf!2385 base!8)))))

(declare-fun b!95310 () Bool)

(declare-fun e!62457 () Bool)

(declare-fun bitStream1!8 () BitStream!3552)

(assert (=> b!95310 (= e!62457 (array_inv!1841 (buf!2385 bitStream1!8)))))

(declare-fun b!95311 () Bool)

(declare-fun res!78443 () Bool)

(declare-fun e!62458 () Bool)

(assert (=> b!95311 (=> (not res!78443) (not e!62458))))

(declare-fun bitStream2!8 () BitStream!3552)

(declare-fun isPrefixOf!0 (BitStream!3552 BitStream!3552) Bool)

(assert (=> b!95311 (= res!78443 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95312 () Bool)

(declare-fun res!78446 () Bool)

(assert (=> b!95312 (=> (not res!78446) (not e!62458))))

(assert (=> b!95312 (= res!78446 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95313 () Bool)

(declare-fun e!62463 () Bool)

(assert (=> b!95313 (= e!62463 (array_inv!1841 (buf!2385 bitStream2!8)))))

(declare-fun b!95314 () Bool)

(declare-fun res!78447 () Bool)

(assert (=> b!95314 (=> (not res!78447) (not e!62458))))

(assert (=> b!95314 (= res!78447 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun b!95315 () Bool)

(assert (=> b!95315 (= e!62458 (and (= (buf!2385 bitStream1!8) (buf!2385 bitStream2!8)) (= (buf!2385 bitStream1!8) (buf!2385 base!8)) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95309 () Bool)

(declare-fun res!78445 () Bool)

(assert (=> b!95309 (=> (not res!78445) (not e!62458))))

(declare-datatypes ((List!882 0))(
  ( (Nil!879) (Cons!878 (h!997 Bool) (t!1632 List!882)) )
))
(declare-fun listBits!13 () List!882)

(declare-fun length!473 (List!882) Int)

(assert (=> b!95309 (= res!78445 (> (length!473 listBits!13) 0))))

(declare-fun res!78444 () Bool)

(assert (=> start!19084 (=> (not res!78444) (not e!62458))))

(assert (=> start!19084 (= res!78444 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19084 e!62458))

(assert (=> start!19084 true))

(declare-fun inv!12 (BitStream!3552) Bool)

(assert (=> start!19084 (and (inv!12 bitStream1!8) e!62457)))

(assert (=> start!19084 (and (inv!12 bitStream2!8) e!62463)))

(assert (=> start!19084 (and (inv!12 base!8) e!62462)))

(assert (= (and start!19084 res!78444) b!95309))

(assert (= (and b!95309 res!78445) b!95312))

(assert (= (and b!95312 res!78446) b!95314))

(assert (= (and b!95314 res!78447) b!95311))

(assert (= (and b!95311 res!78443) b!95315))

(assert (= start!19084 b!95310))

(assert (= start!19084 b!95313))

(assert (= start!19084 b!95308))

(declare-fun m!138745 () Bool)

(assert (=> b!95313 m!138745))

(declare-fun m!138747 () Bool)

(assert (=> b!95312 m!138747))

(declare-fun m!138749 () Bool)

(assert (=> b!95308 m!138749))

(declare-fun m!138751 () Bool)

(assert (=> b!95311 m!138751))

(declare-fun m!138753 () Bool)

(assert (=> b!95310 m!138753))

(declare-fun m!138755 () Bool)

(assert (=> b!95309 m!138755))

(declare-fun m!138757 () Bool)

(assert (=> b!95314 m!138757))

(declare-fun m!138759 () Bool)

(assert (=> start!19084 m!138759))

(declare-fun m!138761 () Bool)

(assert (=> start!19084 m!138761))

(declare-fun m!138763 () Bool)

(assert (=> start!19084 m!138763))

(check-sat (not b!95311) (not b!95308) (not b!95310) (not b!95313) (not start!19084) (not b!95312) (not b!95309) (not b!95314))
(check-sat)

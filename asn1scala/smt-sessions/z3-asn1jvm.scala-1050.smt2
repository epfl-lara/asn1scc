; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30090 () Bool)

(assert start!30090)

(declare-fun b!154377 () Bool)

(declare-fun res!129212 () Bool)

(declare-fun e!103767 () Bool)

(assert (=> b!154377 (=> (not res!129212) (not e!103767))))

(declare-fun lt!240740 () (_ BitVec 64))

(declare-datatypes ((array!6985 0))(
  ( (array!6986 (arr!3969 (Array (_ BitVec 32) (_ BitVec 8))) (size!3146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5550 0))(
  ( (BitStream!5551 (buf!3649 array!6985) (currentByte!6671 (_ BitVec 32)) (currentBit!6666 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5550)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154377 (= res!129212 (bvsle lt!240740 (bitIndex!0 (size!3146 (buf!3649 bs2!18)) (currentByte!6671 bs2!18) (currentBit!6666 bs2!18))))))

(declare-fun b!154378 () Bool)

(declare-fun res!129210 () Bool)

(assert (=> b!154378 (=> (not res!129210) (not e!103767))))

(declare-fun bs1!10 () BitStream!5550)

(declare-fun arrayBitRangesEq!0 (array!6985 array!6985 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154378 (= res!129210 (arrayBitRangesEq!0 (buf!3649 bs1!10) (buf!3649 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240740))))

(declare-fun res!129213 () Bool)

(declare-fun e!103764 () Bool)

(assert (=> start!30090 (=> (not res!129213) (not e!103764))))

(assert (=> start!30090 (= res!129213 (= (size!3146 (buf!3649 bs1!10)) (size!3146 (buf!3649 bs2!18))))))

(assert (=> start!30090 e!103764))

(declare-fun e!103766 () Bool)

(declare-fun inv!12 (BitStream!5550) Bool)

(assert (=> start!30090 (and (inv!12 bs1!10) e!103766)))

(declare-fun e!103765 () Bool)

(assert (=> start!30090 (and (inv!12 bs2!18) e!103765)))

(declare-fun b!154379 () Bool)

(assert (=> b!154379 (= e!103764 e!103767)))

(declare-fun res!129211 () Bool)

(assert (=> b!154379 (=> (not res!129211) (not e!103767))))

(assert (=> b!154379 (= res!129211 (bvsle lt!240740 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3146 (buf!3649 bs1!10))))))))

(declare-fun lt!240742 () (_ BitVec 64))

(assert (=> b!154379 (= lt!240740 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240742))))

(assert (=> b!154379 (= lt!240742 (bitIndex!0 (size!3146 (buf!3649 bs1!10)) (currentByte!6671 bs1!10) (currentBit!6666 bs1!10)))))

(declare-fun b!154380 () Bool)

(declare-fun array_inv!2935 (array!6985) Bool)

(assert (=> b!154380 (= e!103765 (array_inv!2935 (buf!3649 bs2!18)))))

(declare-fun b!154381 () Bool)

(assert (=> b!154381 (= e!103766 (array_inv!2935 (buf!3649 bs1!10)))))

(declare-fun b!154382 () Bool)

(declare-fun lt!240741 () (_ BitVec 64))

(declare-fun lt!240744 () (_ BitVec 64))

(assert (=> b!154382 (= e!103767 (and (= lt!240741 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240741 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!240744) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!154382 (= lt!240741 (bvand lt!240744 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154382 (= lt!240744 (bvsdiv lt!240742 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13674 0))(
  ( (tuple2!13675 (_1!7236 BitStream!5550) (_2!7236 (_ BitVec 8))) )
))
(declare-fun lt!240745 () tuple2!13674)

(declare-fun readBytePure!0 (BitStream!5550) tuple2!13674)

(assert (=> b!154382 (= lt!240745 (readBytePure!0 (BitStream!5551 (buf!3649 bs2!18) (currentByte!6671 bs1!10) (currentBit!6666 bs1!10))))))

(declare-fun lt!240743 () tuple2!13674)

(assert (=> b!154382 (= lt!240743 (readBytePure!0 bs1!10))))

(assert (= (and start!30090 res!129213) b!154379))

(assert (= (and b!154379 res!129211) b!154377))

(assert (= (and b!154377 res!129212) b!154378))

(assert (= (and b!154378 res!129210) b!154382))

(assert (= start!30090 b!154381))

(assert (= start!30090 b!154380))

(declare-fun m!240343 () Bool)

(assert (=> b!154378 m!240343))

(declare-fun m!240345 () Bool)

(assert (=> start!30090 m!240345))

(declare-fun m!240347 () Bool)

(assert (=> start!30090 m!240347))

(declare-fun m!240349 () Bool)

(assert (=> b!154382 m!240349))

(declare-fun m!240351 () Bool)

(assert (=> b!154382 m!240351))

(declare-fun m!240353 () Bool)

(assert (=> b!154377 m!240353))

(declare-fun m!240355 () Bool)

(assert (=> b!154379 m!240355))

(declare-fun m!240357 () Bool)

(assert (=> b!154381 m!240357))

(declare-fun m!240359 () Bool)

(assert (=> b!154380 m!240359))

(check-sat (not start!30090) (not b!154378) (not b!154379) (not b!154377) (not b!154381) (not b!154382) (not b!154380))
(check-sat)

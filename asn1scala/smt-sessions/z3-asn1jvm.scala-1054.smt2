; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30204 () Bool)

(assert start!30204)

(declare-fun b!154854 () Bool)

(declare-fun res!129562 () Bool)

(declare-fun e!104176 () Bool)

(assert (=> b!154854 (=> (not res!129562) (not e!104176))))

(declare-fun lt!241230 () (_ BitVec 64))

(declare-datatypes ((array!7018 0))(
  ( (array!7019 (arr!3981 (Array (_ BitVec 32) (_ BitVec 8))) (size!3158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5574 0))(
  ( (BitStream!5575 (buf!3661 array!7018) (currentByte!6692 (_ BitVec 32)) (currentBit!6687 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5574)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154854 (= res!129562 (bvsle lt!241230 (bitIndex!0 (size!3158 (buf!3661 bs2!18)) (currentByte!6692 bs2!18) (currentBit!6687 bs2!18))))))

(declare-fun b!154855 () Bool)

(assert (=> b!154855 (= e!104176 false)))

(declare-datatypes ((tuple2!13716 0))(
  ( (tuple2!13717 (_1!7266 BitStream!5574) (_2!7266 (_ BitVec 8))) )
))
(declare-fun lt!241229 () tuple2!13716)

(declare-fun bs1!10 () BitStream!5574)

(declare-fun readBytePure!0 (BitStream!5574) tuple2!13716)

(assert (=> b!154855 (= lt!241229 (readBytePure!0 (BitStream!5575 (buf!3661 bs2!18) (currentByte!6692 bs1!10) (currentBit!6687 bs1!10))))))

(declare-fun lt!241231 () tuple2!13716)

(assert (=> b!154855 (= lt!241231 (readBytePure!0 bs1!10))))

(declare-fun b!154856 () Bool)

(declare-fun e!104179 () Bool)

(assert (=> b!154856 (= e!104179 e!104176)))

(declare-fun res!129564 () Bool)

(assert (=> b!154856 (=> (not res!129564) (not e!104176))))

(assert (=> b!154856 (= res!129564 (bvsle lt!241230 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3158 (buf!3661 bs1!10))))))))

(assert (=> b!154856 (= lt!241230 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3158 (buf!3661 bs1!10)) (currentByte!6692 bs1!10) (currentBit!6687 bs1!10))))))

(declare-fun b!154857 () Bool)

(declare-fun e!104180 () Bool)

(declare-fun array_inv!2947 (array!7018) Bool)

(assert (=> b!154857 (= e!104180 (array_inv!2947 (buf!3661 bs1!10)))))

(declare-fun res!129561 () Bool)

(assert (=> start!30204 (=> (not res!129561) (not e!104179))))

(assert (=> start!30204 (= res!129561 (= (size!3158 (buf!3661 bs1!10)) (size!3158 (buf!3661 bs2!18))))))

(assert (=> start!30204 e!104179))

(declare-fun inv!12 (BitStream!5574) Bool)

(assert (=> start!30204 (and (inv!12 bs1!10) e!104180)))

(declare-fun e!104181 () Bool)

(assert (=> start!30204 (and (inv!12 bs2!18) e!104181)))

(declare-fun b!154858 () Bool)

(declare-fun res!129563 () Bool)

(assert (=> b!154858 (=> (not res!129563) (not e!104176))))

(declare-fun arrayBitRangesEq!0 (array!7018 array!7018 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154858 (= res!129563 (arrayBitRangesEq!0 (buf!3661 bs1!10) (buf!3661 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241230))))

(declare-fun b!154859 () Bool)

(assert (=> b!154859 (= e!104181 (array_inv!2947 (buf!3661 bs2!18)))))

(assert (= (and start!30204 res!129561) b!154856))

(assert (= (and b!154856 res!129564) b!154854))

(assert (= (and b!154854 res!129562) b!154858))

(assert (= (and b!154858 res!129563) b!154855))

(assert (= start!30204 b!154857))

(assert (= start!30204 b!154859))

(declare-fun m!240811 () Bool)

(assert (=> start!30204 m!240811))

(declare-fun m!240813 () Bool)

(assert (=> start!30204 m!240813))

(declare-fun m!240815 () Bool)

(assert (=> b!154855 m!240815))

(declare-fun m!240817 () Bool)

(assert (=> b!154855 m!240817))

(declare-fun m!240819 () Bool)

(assert (=> b!154858 m!240819))

(declare-fun m!240821 () Bool)

(assert (=> b!154854 m!240821))

(declare-fun m!240823 () Bool)

(assert (=> b!154857 m!240823))

(declare-fun m!240825 () Bool)

(assert (=> b!154856 m!240825))

(declare-fun m!240827 () Bool)

(assert (=> b!154859 m!240827))

(check-sat (not b!154856) (not start!30204) (not b!154859) (not b!154854) (not b!154855) (not b!154857) (not b!154858))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30086 () Bool)

(assert start!30086)

(declare-fun b!154341 () Bool)

(declare-fun e!103730 () Bool)

(assert (=> b!154341 (= e!103730 false)))

(declare-datatypes ((array!6981 0))(
  ( (array!6982 (arr!3967 (Array (_ BitVec 32) (_ BitVec 8))) (size!3144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5546 0))(
  ( (BitStream!5547 (buf!3647 array!6981) (currentByte!6669 (_ BitVec 32)) (currentBit!6664 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13670 0))(
  ( (tuple2!13671 (_1!7234 BitStream!5546) (_2!7234 (_ BitVec 8))) )
))
(declare-fun lt!240707 () tuple2!13670)

(declare-fun bs2!18 () BitStream!5546)

(declare-fun bs1!10 () BitStream!5546)

(declare-fun readBytePure!0 (BitStream!5546) tuple2!13670)

(assert (=> b!154341 (= lt!240707 (readBytePure!0 (BitStream!5547 (buf!3647 bs2!18) (currentByte!6669 bs1!10) (currentBit!6664 bs1!10))))))

(declare-fun lt!240709 () tuple2!13670)

(assert (=> b!154341 (= lt!240709 (readBytePure!0 bs1!10))))

(declare-fun b!154342 () Bool)

(declare-fun res!129189 () Bool)

(assert (=> b!154342 (=> (not res!129189) (not e!103730))))

(declare-fun lt!240708 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154342 (= res!129189 (bvsle lt!240708 (bitIndex!0 (size!3144 (buf!3647 bs2!18)) (currentByte!6669 bs2!18) (currentBit!6664 bs2!18))))))

(declare-fun b!154343 () Bool)

(declare-fun e!103726 () Bool)

(assert (=> b!154343 (= e!103726 e!103730)))

(declare-fun res!129187 () Bool)

(assert (=> b!154343 (=> (not res!129187) (not e!103730))))

(assert (=> b!154343 (= res!129187 (bvsle lt!240708 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3144 (buf!3647 bs1!10))))))))

(assert (=> b!154343 (= lt!240708 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3144 (buf!3647 bs1!10)) (currentByte!6669 bs1!10) (currentBit!6664 bs1!10))))))

(declare-fun res!129188 () Bool)

(assert (=> start!30086 (=> (not res!129188) (not e!103726))))

(assert (=> start!30086 (= res!129188 (= (size!3144 (buf!3647 bs1!10)) (size!3144 (buf!3647 bs2!18))))))

(assert (=> start!30086 e!103726))

(declare-fun e!103729 () Bool)

(declare-fun inv!12 (BitStream!5546) Bool)

(assert (=> start!30086 (and (inv!12 bs1!10) e!103729)))

(declare-fun e!103731 () Bool)

(assert (=> start!30086 (and (inv!12 bs2!18) e!103731)))

(declare-fun b!154344 () Bool)

(declare-fun res!129186 () Bool)

(assert (=> b!154344 (=> (not res!129186) (not e!103730))))

(declare-fun arrayBitRangesEq!0 (array!6981 array!6981 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154344 (= res!129186 (arrayBitRangesEq!0 (buf!3647 bs1!10) (buf!3647 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240708))))

(declare-fun b!154345 () Bool)

(declare-fun array_inv!2933 (array!6981) Bool)

(assert (=> b!154345 (= e!103729 (array_inv!2933 (buf!3647 bs1!10)))))

(declare-fun b!154346 () Bool)

(assert (=> b!154346 (= e!103731 (array_inv!2933 (buf!3647 bs2!18)))))

(assert (= (and start!30086 res!129188) b!154343))

(assert (= (and b!154343 res!129187) b!154342))

(assert (= (and b!154342 res!129189) b!154344))

(assert (= (and b!154344 res!129186) b!154341))

(assert (= start!30086 b!154345))

(assert (= start!30086 b!154346))

(declare-fun m!240307 () Bool)

(assert (=> b!154346 m!240307))

(declare-fun m!240309 () Bool)

(assert (=> b!154345 m!240309))

(declare-fun m!240311 () Bool)

(assert (=> b!154344 m!240311))

(declare-fun m!240313 () Bool)

(assert (=> b!154342 m!240313))

(declare-fun m!240315 () Bool)

(assert (=> b!154343 m!240315))

(declare-fun m!240317 () Bool)

(assert (=> b!154341 m!240317))

(declare-fun m!240319 () Bool)

(assert (=> b!154341 m!240319))

(declare-fun m!240321 () Bool)

(assert (=> start!30086 m!240321))

(declare-fun m!240323 () Bool)

(assert (=> start!30086 m!240323))

(push 1)

(assert (not b!154344))

(assert (not b!154345))

(assert (not b!154341))

(assert (not start!30086))

(assert (not b!154343))

(assert (not b!154342))

(assert (not b!154346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


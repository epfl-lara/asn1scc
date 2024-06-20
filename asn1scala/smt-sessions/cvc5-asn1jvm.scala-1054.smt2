; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30202 () Bool)

(assert start!30202)

(declare-fun b!154836 () Bool)

(declare-fun e!104161 () Bool)

(assert (=> b!154836 (= e!104161 false)))

(declare-datatypes ((array!7016 0))(
  ( (array!7017 (arr!3980 (Array (_ BitVec 32) (_ BitVec 8))) (size!3157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5572 0))(
  ( (BitStream!5573 (buf!3660 array!7016) (currentByte!6691 (_ BitVec 32)) (currentBit!6686 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13714 0))(
  ( (tuple2!13715 (_1!7265 BitStream!5572) (_2!7265 (_ BitVec 8))) )
))
(declare-fun lt!241222 () tuple2!13714)

(declare-fun bs2!18 () BitStream!5572)

(declare-fun bs1!10 () BitStream!5572)

(declare-fun readBytePure!0 (BitStream!5572) tuple2!13714)

(assert (=> b!154836 (= lt!241222 (readBytePure!0 (BitStream!5573 (buf!3660 bs2!18) (currentByte!6691 bs1!10) (currentBit!6686 bs1!10))))))

(declare-fun lt!241220 () tuple2!13714)

(assert (=> b!154836 (= lt!241220 (readBytePure!0 bs1!10))))

(declare-fun b!154837 () Bool)

(declare-fun res!129549 () Bool)

(assert (=> b!154837 (=> (not res!129549) (not e!104161))))

(declare-fun lt!241221 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!7016 array!7016 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154837 (= res!129549 (arrayBitRangesEq!0 (buf!3660 bs1!10) (buf!3660 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241221))))

(declare-fun b!154838 () Bool)

(declare-fun res!129551 () Bool)

(assert (=> b!154838 (=> (not res!129551) (not e!104161))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154838 (= res!129551 (bvsle lt!241221 (bitIndex!0 (size!3157 (buf!3660 bs2!18)) (currentByte!6691 bs2!18) (currentBit!6686 bs2!18))))))

(declare-fun res!129552 () Bool)

(declare-fun e!104162 () Bool)

(assert (=> start!30202 (=> (not res!129552) (not e!104162))))

(assert (=> start!30202 (= res!129552 (= (size!3157 (buf!3660 bs1!10)) (size!3157 (buf!3660 bs2!18))))))

(assert (=> start!30202 e!104162))

(declare-fun e!104160 () Bool)

(declare-fun inv!12 (BitStream!5572) Bool)

(assert (=> start!30202 (and (inv!12 bs1!10) e!104160)))

(declare-fun e!104158 () Bool)

(assert (=> start!30202 (and (inv!12 bs2!18) e!104158)))

(declare-fun b!154839 () Bool)

(declare-fun array_inv!2946 (array!7016) Bool)

(assert (=> b!154839 (= e!104158 (array_inv!2946 (buf!3660 bs2!18)))))

(declare-fun b!154840 () Bool)

(assert (=> b!154840 (= e!104160 (array_inv!2946 (buf!3660 bs1!10)))))

(declare-fun b!154841 () Bool)

(assert (=> b!154841 (= e!104162 e!104161)))

(declare-fun res!129550 () Bool)

(assert (=> b!154841 (=> (not res!129550) (not e!104161))))

(assert (=> b!154841 (= res!129550 (bvsle lt!241221 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3157 (buf!3660 bs1!10))))))))

(assert (=> b!154841 (= lt!241221 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3157 (buf!3660 bs1!10)) (currentByte!6691 bs1!10) (currentBit!6686 bs1!10))))))

(assert (= (and start!30202 res!129552) b!154841))

(assert (= (and b!154841 res!129550) b!154838))

(assert (= (and b!154838 res!129551) b!154837))

(assert (= (and b!154837 res!129549) b!154836))

(assert (= start!30202 b!154840))

(assert (= start!30202 b!154839))

(declare-fun m!240793 () Bool)

(assert (=> b!154838 m!240793))

(declare-fun m!240795 () Bool)

(assert (=> b!154840 m!240795))

(declare-fun m!240797 () Bool)

(assert (=> b!154841 m!240797))

(declare-fun m!240799 () Bool)

(assert (=> b!154839 m!240799))

(declare-fun m!240801 () Bool)

(assert (=> b!154837 m!240801))

(declare-fun m!240803 () Bool)

(assert (=> b!154836 m!240803))

(declare-fun m!240805 () Bool)

(assert (=> b!154836 m!240805))

(declare-fun m!240807 () Bool)

(assert (=> start!30202 m!240807))

(declare-fun m!240809 () Bool)

(assert (=> start!30202 m!240809))

(push 1)

(assert (not b!154841))

(assert (not b!154836))

(assert (not start!30202))

(assert (not b!154837))

(assert (not b!154838))

(assert (not b!154839))

(assert (not b!154840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


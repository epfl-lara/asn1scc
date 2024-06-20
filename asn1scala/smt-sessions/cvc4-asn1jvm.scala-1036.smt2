; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29774 () Bool)

(assert start!29774)

(declare-fun b!153273 () Bool)

(declare-fun e!102711 () Bool)

(assert (=> b!153273 (= e!102711 false)))

(declare-datatypes ((array!6885 0))(
  ( (array!6886 (arr!3928 (Array (_ BitVec 32) (_ BitVec 8))) (size!3105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5468 0))(
  ( (BitStream!5469 (buf!3608 array!6885) (currentByte!6600 (_ BitVec 32)) (currentBit!6595 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13598 0))(
  ( (tuple2!13599 (_1!7189 BitStream!5468) (_2!7189 (_ BitVec 8))) )
))
(declare-fun lt!239679 () tuple2!13598)

(declare-fun bs2!18 () BitStream!5468)

(declare-fun bs1!10 () BitStream!5468)

(declare-fun readBytePure!0 (BitStream!5468) tuple2!13598)

(assert (=> b!153273 (= lt!239679 (readBytePure!0 (BitStream!5469 (buf!3608 bs2!18) (currentByte!6600 bs1!10) (currentBit!6595 bs1!10))))))

(declare-fun lt!239678 () tuple2!13598)

(assert (=> b!153273 (= lt!239678 (readBytePure!0 bs1!10))))

(declare-fun b!153274 () Bool)

(declare-fun e!102710 () Bool)

(declare-fun array_inv!2894 (array!6885) Bool)

(assert (=> b!153274 (= e!102710 (array_inv!2894 (buf!3608 bs1!10)))))

(declare-fun b!153275 () Bool)

(declare-fun e!102707 () Bool)

(assert (=> b!153275 (= e!102707 (array_inv!2894 (buf!3608 bs2!18)))))

(declare-fun res!128402 () Bool)

(declare-fun e!102706 () Bool)

(assert (=> start!29774 (=> (not res!128402) (not e!102706))))

(assert (=> start!29774 (= res!128402 (= (size!3105 (buf!3608 bs1!10)) (size!3105 (buf!3608 bs2!18))))))

(assert (=> start!29774 e!102706))

(declare-fun inv!12 (BitStream!5468) Bool)

(assert (=> start!29774 (and (inv!12 bs1!10) e!102710)))

(assert (=> start!29774 (and (inv!12 bs2!18) e!102707)))

(declare-fun b!153276 () Bool)

(declare-fun res!128401 () Bool)

(assert (=> b!153276 (=> (not res!128401) (not e!102711))))

(declare-fun lt!239680 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153276 (= res!128401 (bvsle lt!239680 (bitIndex!0 (size!3105 (buf!3608 bs2!18)) (currentByte!6600 bs2!18) (currentBit!6595 bs2!18))))))

(declare-fun b!153277 () Bool)

(assert (=> b!153277 (= e!102706 e!102711)))

(declare-fun res!128400 () Bool)

(assert (=> b!153277 (=> (not res!128400) (not e!102711))))

(assert (=> b!153277 (= res!128400 (bvsle lt!239680 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3105 (buf!3608 bs1!10))))))))

(assert (=> b!153277 (= lt!239680 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3105 (buf!3608 bs1!10)) (currentByte!6600 bs1!10) (currentBit!6595 bs1!10))))))

(declare-fun b!153278 () Bool)

(declare-fun res!128403 () Bool)

(assert (=> b!153278 (=> (not res!128403) (not e!102711))))

(declare-fun arrayBitRangesEq!0 (array!6885 array!6885 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153278 (= res!128403 (arrayBitRangesEq!0 (buf!3608 bs1!10) (buf!3608 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239680))))

(assert (= (and start!29774 res!128402) b!153277))

(assert (= (and b!153277 res!128400) b!153276))

(assert (= (and b!153276 res!128401) b!153278))

(assert (= (and b!153278 res!128403) b!153273))

(assert (= start!29774 b!153274))

(assert (= start!29774 b!153275))

(declare-fun m!239077 () Bool)

(assert (=> b!153274 m!239077))

(declare-fun m!239079 () Bool)

(assert (=> b!153277 m!239079))

(declare-fun m!239081 () Bool)

(assert (=> start!29774 m!239081))

(declare-fun m!239083 () Bool)

(assert (=> start!29774 m!239083))

(declare-fun m!239085 () Bool)

(assert (=> b!153273 m!239085))

(declare-fun m!239087 () Bool)

(assert (=> b!153273 m!239087))

(declare-fun m!239089 () Bool)

(assert (=> b!153276 m!239089))

(declare-fun m!239091 () Bool)

(assert (=> b!153275 m!239091))

(declare-fun m!239093 () Bool)

(assert (=> b!153278 m!239093))

(push 1)


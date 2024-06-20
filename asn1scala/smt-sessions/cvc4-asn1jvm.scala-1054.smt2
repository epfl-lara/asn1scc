; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30206 () Bool)

(assert start!30206)

(declare-fun b!154872 () Bool)

(declare-fun e!104194 () Bool)

(declare-datatypes ((array!7020 0))(
  ( (array!7021 (arr!3982 (Array (_ BitVec 32) (_ BitVec 8))) (size!3159 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5576 0))(
  ( (BitStream!5577 (buf!3662 array!7020) (currentByte!6693 (_ BitVec 32)) (currentBit!6688 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5576)

(declare-fun array_inv!2948 (array!7020) Bool)

(assert (=> b!154872 (= e!104194 (array_inv!2948 (buf!3662 bs2!18)))))

(declare-fun b!154873 () Bool)

(declare-fun res!129576 () Bool)

(declare-fun e!104195 () Bool)

(assert (=> b!154873 (=> (not res!129576) (not e!104195))))

(declare-fun lt!241240 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154873 (= res!129576 (bvsle lt!241240 (bitIndex!0 (size!3159 (buf!3662 bs2!18)) (currentByte!6693 bs2!18) (currentBit!6688 bs2!18))))))

(declare-fun b!154875 () Bool)

(declare-fun res!129575 () Bool)

(assert (=> b!154875 (=> (not res!129575) (not e!104195))))

(declare-fun bs1!10 () BitStream!5576)

(declare-fun arrayBitRangesEq!0 (array!7020 array!7020 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154875 (= res!129575 (arrayBitRangesEq!0 (buf!3662 bs1!10) (buf!3662 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241240))))

(declare-fun b!154876 () Bool)

(declare-fun e!104198 () Bool)

(assert (=> b!154876 (= e!104198 e!104195)))

(declare-fun res!129574 () Bool)

(assert (=> b!154876 (=> (not res!129574) (not e!104195))))

(assert (=> b!154876 (= res!129574 (bvsle lt!241240 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3159 (buf!3662 bs1!10))))))))

(assert (=> b!154876 (= lt!241240 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3159 (buf!3662 bs1!10)) (currentByte!6693 bs1!10) (currentBit!6688 bs1!10))))))

(declare-fun b!154877 () Bool)

(assert (=> b!154877 (= e!104195 false)))

(declare-datatypes ((tuple2!13718 0))(
  ( (tuple2!13719 (_1!7267 BitStream!5576) (_2!7267 (_ BitVec 8))) )
))
(declare-fun lt!241238 () tuple2!13718)

(declare-fun readBytePure!0 (BitStream!5576) tuple2!13718)

(assert (=> b!154877 (= lt!241238 (readBytePure!0 (BitStream!5577 (buf!3662 bs2!18) (currentByte!6693 bs1!10) (currentBit!6688 bs1!10))))))

(declare-fun lt!241239 () tuple2!13718)

(assert (=> b!154877 (= lt!241239 (readBytePure!0 bs1!10))))

(declare-fun b!154874 () Bool)

(declare-fun e!104199 () Bool)

(assert (=> b!154874 (= e!104199 (array_inv!2948 (buf!3662 bs1!10)))))

(declare-fun res!129573 () Bool)

(assert (=> start!30206 (=> (not res!129573) (not e!104198))))

(assert (=> start!30206 (= res!129573 (= (size!3159 (buf!3662 bs1!10)) (size!3159 (buf!3662 bs2!18))))))

(assert (=> start!30206 e!104198))

(declare-fun inv!12 (BitStream!5576) Bool)

(assert (=> start!30206 (and (inv!12 bs1!10) e!104199)))

(assert (=> start!30206 (and (inv!12 bs2!18) e!104194)))

(assert (= (and start!30206 res!129573) b!154876))

(assert (= (and b!154876 res!129574) b!154873))

(assert (= (and b!154873 res!129576) b!154875))

(assert (= (and b!154875 res!129575) b!154877))

(assert (= start!30206 b!154874))

(assert (= start!30206 b!154872))

(declare-fun m!240829 () Bool)

(assert (=> b!154872 m!240829))

(declare-fun m!240831 () Bool)

(assert (=> b!154876 m!240831))

(declare-fun m!240833 () Bool)

(assert (=> b!154874 m!240833))

(declare-fun m!240835 () Bool)

(assert (=> b!154875 m!240835))

(declare-fun m!240837 () Bool)

(assert (=> b!154877 m!240837))

(declare-fun m!240839 () Bool)

(assert (=> b!154877 m!240839))

(declare-fun m!240841 () Bool)

(assert (=> b!154873 m!240841))

(declare-fun m!240843 () Bool)

(assert (=> start!30206 m!240843))

(declare-fun m!240845 () Bool)

(assert (=> start!30206 m!240845))

(push 1)

(assert (not b!154875))

(assert (not b!154873))

(assert (not b!154876))

(assert (not b!154872))

(assert (not start!30206))

(assert (not b!154874))

(assert (not b!154877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


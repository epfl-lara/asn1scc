; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31604 () Bool)

(assert start!31604)

(declare-fun b!158140 () Bool)

(declare-fun e!107381 () Bool)

(declare-fun e!107383 () Bool)

(assert (=> b!158140 (= e!107381 e!107383)))

(declare-fun res!132111 () Bool)

(assert (=> b!158140 (=> (not res!132111) (not e!107383))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!158140 (= res!132111 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7346 0))(
  ( (array!7347 (arr!4232 (Array (_ BitVec 32) (_ BitVec 8))) (size!3323 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5838 0))(
  ( (BitStream!5839 (buf!3793 array!7346) (currentByte!6972 (_ BitVec 32)) (currentBit!6967 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5838)

(declare-fun lt!249269 () BitStream!5838)

(declare-datatypes ((tuple2!14400 0))(
  ( (tuple2!14401 (_1!7662 BitStream!5838) (_2!7662 array!7346)) )
))
(declare-fun lt!249267 () tuple2!14400)

(declare-fun arr!153 () array!7346)

(declare-fun readByteArrayLoopPure!0 (BitStream!5838 array!7346 (_ BitVec 32) (_ BitVec 32)) tuple2!14400)

(declare-datatypes ((tuple2!14402 0))(
  ( (tuple2!14403 (_1!7663 BitStream!5838) (_2!7663 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5838) tuple2!14402)

(assert (=> b!158140 (= lt!249267 (readByteArrayLoopPure!0 lt!249269 (array!7347 (store (arr!4232 arr!153) from!240 (_2!7663 (readBytePure!0 bs!65))) (size!3323 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5838 (_ BitVec 32)) BitStream!5838)

(assert (=> b!158140 (= lt!249269 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249270 () tuple2!14400)

(assert (=> b!158140 (= lt!249270 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158142 () Bool)

(declare-fun e!107385 () Bool)

(declare-fun array_inv!3082 (array!7346) Bool)

(assert (=> b!158142 (= e!107385 (array_inv!3082 (buf!3793 bs!65)))))

(declare-fun res!132112 () Bool)

(assert (=> start!31604 (=> (not res!132112) (not e!107381))))

(assert (=> start!31604 (= res!132112 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3323 arr!153))))))

(assert (=> start!31604 e!107381))

(assert (=> start!31604 true))

(assert (=> start!31604 (array_inv!3082 arr!153)))

(declare-fun inv!12 (BitStream!5838) Bool)

(assert (=> start!31604 (and (inv!12 bs!65) e!107385)))

(declare-fun b!158139 () Bool)

(declare-fun res!132113 () Bool)

(assert (=> b!158139 (=> (not res!132113) (not e!107381))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158139 (= res!132113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3323 (buf!3793 bs!65))) ((_ sign_extend 32) (currentByte!6972 bs!65)) ((_ sign_extend 32) (currentBit!6967 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158141 () Bool)

(assert (=> b!158141 (= e!107383 (not (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))))

(assert (=> b!158141 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3323 (buf!3793 lt!249269))) ((_ sign_extend 32) (currentByte!6972 lt!249269)) ((_ sign_extend 32) (currentBit!6967 lt!249269)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!10564 0))(
  ( (Unit!10565) )
))
(declare-fun lt!249268 () Unit!10564)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5838 BitStream!5838 (_ BitVec 64) (_ BitVec 32)) Unit!10564)

(assert (=> b!158141 (= lt!249268 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249269 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!249266 () tuple2!14402)

(assert (=> b!158141 (= lt!249266 (readBytePure!0 lt!249269))))

(assert (= (and start!31604 res!132112) b!158139))

(assert (= (and b!158139 res!132113) b!158140))

(assert (= (and b!158140 res!132111) b!158141))

(assert (= start!31604 b!158142))

(declare-fun m!247963 () Bool)

(assert (=> start!31604 m!247963))

(declare-fun m!247965 () Bool)

(assert (=> start!31604 m!247965))

(declare-fun m!247967 () Bool)

(assert (=> b!158139 m!247967))

(declare-fun m!247969 () Bool)

(assert (=> b!158140 m!247969))

(declare-fun m!247971 () Bool)

(assert (=> b!158140 m!247971))

(declare-fun m!247973 () Bool)

(assert (=> b!158140 m!247973))

(declare-fun m!247975 () Bool)

(assert (=> b!158140 m!247975))

(declare-fun m!247977 () Bool)

(assert (=> b!158140 m!247977))

(declare-fun m!247979 () Bool)

(assert (=> b!158141 m!247979))

(declare-fun m!247981 () Bool)

(assert (=> b!158141 m!247981))

(declare-fun m!247983 () Bool)

(assert (=> b!158141 m!247983))

(declare-fun m!247985 () Bool)

(assert (=> b!158142 m!247985))

(check-sat (not b!158140) (not b!158139) (not b!158141) (not start!31604) (not b!158142))
(check-sat)

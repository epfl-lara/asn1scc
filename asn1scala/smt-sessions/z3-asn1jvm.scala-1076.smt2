; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31032 () Bool)

(assert start!31032)

(declare-fun b!156605 () Bool)

(declare-fun e!105853 () Bool)

(declare-fun e!105856 () Bool)

(assert (=> b!156605 (= e!105853 e!105856)))

(declare-fun res!130885 () Bool)

(assert (=> b!156605 (=> (not res!130885) (not e!105856))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156605 (= res!130885 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7190 0))(
  ( (array!7191 (arr!4089 (Array (_ BitVec 32) (_ BitVec 8))) (size!3224 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5706 0))(
  ( (BitStream!5707 (buf!3727 array!7190) (currentByte!6854 (_ BitVec 32)) (currentBit!6849 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5706)

(declare-fun lt!245235 () BitStream!5706)

(declare-fun arr!153 () array!7190)

(declare-datatypes ((tuple2!14036 0))(
  ( (tuple2!14037 (_1!7462 BitStream!5706) (_2!7462 array!7190)) )
))
(declare-fun lt!245234 () tuple2!14036)

(declare-fun readByteArrayLoopPure!0 (BitStream!5706 array!7190 (_ BitVec 32) (_ BitVec 32)) tuple2!14036)

(declare-datatypes ((tuple2!14038 0))(
  ( (tuple2!14039 (_1!7463 BitStream!5706) (_2!7463 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5706) tuple2!14038)

(assert (=> b!156605 (= lt!245234 (readByteArrayLoopPure!0 lt!245235 (array!7191 (store (arr!4089 arr!153) from!240 (_2!7463 (readBytePure!0 bs!65))) (size!3224 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5706 (_ BitVec 32)) BitStream!5706)

(assert (=> b!156605 (= lt!245235 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245236 () tuple2!14036)

(assert (=> b!156605 (= lt!245236 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156606 () Bool)

(declare-fun e!105855 () Bool)

(assert (=> b!156606 (= e!105855 false)))

(declare-fun lt!245232 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156606 (= lt!245232 (bitIndex!0 (size!3224 (buf!3727 bs!65)) (currentByte!6854 bs!65) (currentBit!6849 bs!65)))))

(declare-fun b!156607 () Bool)

(declare-fun e!105857 () Bool)

(declare-fun array_inv!3013 (array!7190) Bool)

(assert (=> b!156607 (= e!105857 (array_inv!3013 (buf!3727 bs!65)))))

(declare-fun res!130889 () Bool)

(assert (=> start!31032 (=> (not res!130889) (not e!105853))))

(assert (=> start!31032 (= res!130889 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3224 arr!153))))))

(assert (=> start!31032 e!105853))

(assert (=> start!31032 true))

(assert (=> start!31032 (array_inv!3013 arr!153)))

(declare-fun inv!12 (BitStream!5706) Bool)

(assert (=> start!31032 (and (inv!12 bs!65) e!105857)))

(declare-fun b!156608 () Bool)

(declare-fun res!130888 () Bool)

(assert (=> b!156608 (=> (not res!130888) (not e!105855))))

(assert (=> b!156608 (= res!130888 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3224 (buf!3727 lt!245235)) (currentByte!6854 lt!245235) (currentBit!6849 lt!245235))))))

(declare-fun b!156609 () Bool)

(assert (=> b!156609 (= e!105856 e!105855)))

(declare-fun res!130887 () Bool)

(assert (=> b!156609 (=> (not res!130887) (not e!105855))))

(assert (=> b!156609 (= res!130887 (= (size!3224 (buf!3727 bs!65)) (size!3224 (buf!3727 lt!245235))))))

(declare-fun lt!245233 () tuple2!14038)

(assert (=> b!156609 (= lt!245233 (readBytePure!0 lt!245235))))

(declare-fun b!156610 () Bool)

(declare-fun res!130886 () Bool)

(assert (=> b!156610 (=> (not res!130886) (not e!105853))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156610 (= res!130886 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3224 (buf!3727 bs!65))) ((_ sign_extend 32) (currentByte!6854 bs!65)) ((_ sign_extend 32) (currentBit!6849 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31032 res!130889) b!156610))

(assert (= (and b!156610 res!130886) b!156605))

(assert (= (and b!156605 res!130885) b!156609))

(assert (= (and b!156609 res!130887) b!156608))

(assert (= (and b!156608 res!130888) b!156606))

(assert (= start!31032 b!156607))

(declare-fun m!244185 () Bool)

(assert (=> b!156610 m!244185))

(declare-fun m!244187 () Bool)

(assert (=> b!156608 m!244187))

(declare-fun m!244189 () Bool)

(assert (=> b!156606 m!244189))

(declare-fun m!244191 () Bool)

(assert (=> b!156607 m!244191))

(declare-fun m!244193 () Bool)

(assert (=> b!156609 m!244193))

(declare-fun m!244195 () Bool)

(assert (=> b!156605 m!244195))

(declare-fun m!244197 () Bool)

(assert (=> b!156605 m!244197))

(declare-fun m!244199 () Bool)

(assert (=> b!156605 m!244199))

(declare-fun m!244201 () Bool)

(assert (=> b!156605 m!244201))

(declare-fun m!244203 () Bool)

(assert (=> b!156605 m!244203))

(declare-fun m!244205 () Bool)

(assert (=> start!31032 m!244205))

(declare-fun m!244207 () Bool)

(assert (=> start!31032 m!244207))

(check-sat (not b!156609) (not b!156605) (not b!156610) (not b!156607) (not start!31032) (not b!156608) (not b!156606))

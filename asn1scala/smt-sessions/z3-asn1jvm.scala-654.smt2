; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18378 () Bool)

(assert start!18378)

(declare-fun b!91106 () Bool)

(declare-fun res!75195 () Bool)

(declare-fun e!59930 () Bool)

(assert (=> b!91106 (=> (not res!75195) (not e!59930))))

(declare-datatypes ((array!4262 0))(
  ( (array!4263 (arr!2557 (Array (_ BitVec 32) (_ BitVec 8))) (size!1920 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3402 0))(
  ( (BitStream!3403 (buf!2310 array!4262) (currentByte!4600 (_ BitVec 32)) (currentBit!4595 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3402)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91106 (= res!75195 (invariant!0 (currentBit!4595 thiss!1151) (currentByte!4600 thiss!1151) (size!1920 (buf!2310 thiss!1151))))))

(declare-fun b!91107 () Bool)

(declare-fun res!75188 () Bool)

(assert (=> b!91107 (=> (not res!75188) (not e!59930))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91107 (= res!75188 (validate_offset_bits!1 ((_ sign_extend 32) (size!1920 (buf!2310 thiss!1151))) ((_ sign_extend 32) (currentByte!4600 thiss!1151)) ((_ sign_extend 32) (currentBit!4595 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91108 () Bool)

(declare-fun res!75198 () Bool)

(assert (=> b!91108 (=> (not res!75198) (not e!59930))))

(declare-fun thiss!1152 () BitStream!3402)

(assert (=> b!91108 (= res!75198 (invariant!0 (currentBit!4595 thiss!1152) (currentByte!4600 thiss!1152) (size!1920 (buf!2310 thiss!1152))))))

(declare-fun res!75200 () Bool)

(assert (=> start!18378 (=> (not res!75200) (not e!59930))))

(assert (=> start!18378 (= res!75200 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18378 e!59930))

(declare-fun e!59923 () Bool)

(declare-fun inv!12 (BitStream!3402) Bool)

(assert (=> start!18378 (and (inv!12 thiss!1152) e!59923)))

(declare-fun e!59922 () Bool)

(assert (=> start!18378 (and (inv!12 thiss!1151) e!59922)))

(assert (=> start!18378 true))

(declare-fun b!91109 () Bool)

(declare-fun e!59928 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!91109 (= e!59928 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!576) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)) #b10000000000000000000000000000000))))))

(declare-fun b!91110 () Bool)

(declare-fun e!59931 () Bool)

(declare-fun e!59926 () Bool)

(assert (=> b!91110 (= e!59931 e!59926)))

(declare-fun res!75192 () Bool)

(assert (=> b!91110 (=> (not res!75192) (not e!59926))))

(declare-fun lt!137643 () (_ BitVec 64))

(declare-fun lt!137640 () (_ BitVec 64))

(assert (=> b!91110 (= res!75192 (= lt!137643 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137640)))))

(declare-datatypes ((Unit!5832 0))(
  ( (Unit!5833) )
))
(declare-datatypes ((tuple2!7580 0))(
  ( (tuple2!7581 (_1!4035 Unit!5832) (_2!4035 BitStream!3402)) )
))
(declare-fun lt!137638 () tuple2!7580)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91110 (= lt!137643 (bitIndex!0 (size!1920 (buf!2310 (_2!4035 lt!137638))) (currentByte!4600 (_2!4035 lt!137638)) (currentBit!4595 (_2!4035 lt!137638))))))

(declare-fun b!91111 () Bool)

(declare-fun res!75196 () Bool)

(assert (=> b!91111 (=> (not res!75196) (not e!59926))))

(declare-fun isPrefixOf!0 (BitStream!3402 BitStream!3402) Bool)

(assert (=> b!91111 (= res!75196 (isPrefixOf!0 thiss!1152 (_2!4035 lt!137638)))))

(declare-fun b!91112 () Bool)

(declare-fun e!59925 () Bool)

(assert (=> b!91112 (= e!59925 (not e!59928))))

(declare-fun res!75193 () Bool)

(assert (=> b!91112 (=> res!75193 e!59928)))

(assert (=> b!91112 (= res!75193 (not (invariant!0 (currentBit!4595 (_2!4035 lt!137638)) (currentByte!4600 (_2!4035 lt!137638)) (size!1920 (buf!2310 (_2!4035 lt!137638))))))))

(assert (=> b!91112 e!59931))

(declare-fun res!75201 () Bool)

(assert (=> b!91112 (=> (not res!75201) (not e!59931))))

(assert (=> b!91112 (= res!75201 (= (size!1920 (buf!2310 thiss!1152)) (size!1920 (buf!2310 (_2!4035 lt!137638)))))))

(declare-fun lt!137641 () Bool)

(declare-fun appendBit!0 (BitStream!3402 Bool) tuple2!7580)

(assert (=> b!91112 (= lt!137638 (appendBit!0 thiss!1152 lt!137641))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91112 (= lt!137641 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91113 () Bool)

(declare-fun res!75187 () Bool)

(assert (=> b!91113 (=> res!75187 e!59928)))

(declare-fun lt!137642 () (_ BitVec 64))

(assert (=> b!91113 (= res!75187 (not (= (bitIndex!0 (size!1920 (buf!2310 (_2!4035 lt!137638))) (currentByte!4600 (_2!4035 lt!137638)) (currentBit!4595 (_2!4035 lt!137638))) (bvadd lt!137642 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!91114 () Bool)

(declare-fun e!59927 () Bool)

(assert (=> b!91114 (= e!59926 e!59927)))

(declare-fun res!75194 () Bool)

(assert (=> b!91114 (=> (not res!75194) (not e!59927))))

(declare-datatypes ((tuple2!7582 0))(
  ( (tuple2!7583 (_1!4036 BitStream!3402) (_2!4036 Bool)) )
))
(declare-fun lt!137639 () tuple2!7582)

(assert (=> b!91114 (= res!75194 (and (= (_2!4036 lt!137639) lt!137641) (= (_1!4036 lt!137639) (_2!4035 lt!137638))))))

(declare-fun readBitPure!0 (BitStream!3402) tuple2!7582)

(declare-fun readerFrom!0 (BitStream!3402 (_ BitVec 32) (_ BitVec 32)) BitStream!3402)

(assert (=> b!91114 (= lt!137639 (readBitPure!0 (readerFrom!0 (_2!4035 lt!137638) (currentBit!4595 thiss!1152) (currentByte!4600 thiss!1152))))))

(declare-fun b!91115 () Bool)

(declare-fun res!75191 () Bool)

(assert (=> b!91115 (=> res!75191 e!59928)))

(assert (=> b!91115 (= res!75191 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1920 (buf!2310 (_2!4035 lt!137638))) (size!1920 (buf!2310 thiss!1151))))))))

(declare-fun b!91116 () Bool)

(declare-fun res!75197 () Bool)

(assert (=> b!91116 (=> (not res!75197) (not e!59925))))

(assert (=> b!91116 (= res!75197 (bvslt i!576 nBits!336))))

(declare-fun b!91117 () Bool)

(declare-fun array_inv!1766 (array!4262) Bool)

(assert (=> b!91117 (= e!59922 (array_inv!1766 (buf!2310 thiss!1151)))))

(declare-fun b!91118 () Bool)

(declare-fun res!75202 () Bool)

(assert (=> b!91118 (=> (not res!75202) (not e!59930))))

(assert (=> b!91118 (= res!75202 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91119 () Bool)

(assert (=> b!91119 (= e!59923 (array_inv!1766 (buf!2310 thiss!1152)))))

(declare-fun b!91120 () Bool)

(assert (=> b!91120 (= e!59927 (= (bitIndex!0 (size!1920 (buf!2310 (_1!4036 lt!137639))) (currentByte!4600 (_1!4036 lt!137639)) (currentBit!4595 (_1!4036 lt!137639))) lt!137643))))

(declare-fun b!91121 () Bool)

(assert (=> b!91121 (= e!59930 e!59925)))

(declare-fun res!75189 () Bool)

(assert (=> b!91121 (=> (not res!75189) (not e!59925))))

(assert (=> b!91121 (= res!75189 (= lt!137640 (bvadd lt!137642 ((_ sign_extend 32) i!576))))))

(assert (=> b!91121 (= lt!137640 (bitIndex!0 (size!1920 (buf!2310 thiss!1152)) (currentByte!4600 thiss!1152) (currentBit!4595 thiss!1152)))))

(assert (=> b!91121 (= lt!137642 (bitIndex!0 (size!1920 (buf!2310 thiss!1151)) (currentByte!4600 thiss!1151) (currentBit!4595 thiss!1151)))))

(declare-fun b!91122 () Bool)

(declare-fun res!75199 () Bool)

(assert (=> b!91122 (=> (not res!75199) (not e!59925))))

(assert (=> b!91122 (= res!75199 (validate_offset_bits!1 ((_ sign_extend 32) (size!1920 (buf!2310 thiss!1152))) ((_ sign_extend 32) (currentByte!4600 thiss!1152)) ((_ sign_extend 32) (currentBit!4595 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91123 () Bool)

(declare-fun res!75190 () Bool)

(assert (=> b!91123 (=> (not res!75190) (not e!59930))))

(assert (=> b!91123 (= res!75190 (and (bvsle i!576 nBits!336) (= (size!1920 (buf!2310 thiss!1152)) (size!1920 (buf!2310 thiss!1151)))))))

(assert (= (and start!18378 res!75200) b!91107))

(assert (= (and b!91107 res!75188) b!91106))

(assert (= (and b!91106 res!75195) b!91118))

(assert (= (and b!91118 res!75202) b!91108))

(assert (= (and b!91108 res!75198) b!91123))

(assert (= (and b!91123 res!75190) b!91121))

(assert (= (and b!91121 res!75189) b!91122))

(assert (= (and b!91122 res!75199) b!91116))

(assert (= (and b!91116 res!75197) b!91112))

(assert (= (and b!91112 res!75201) b!91110))

(assert (= (and b!91110 res!75192) b!91111))

(assert (= (and b!91111 res!75196) b!91114))

(assert (= (and b!91114 res!75194) b!91120))

(assert (= (and b!91112 (not res!75193)) b!91115))

(assert (= (and b!91115 (not res!75191)) b!91113))

(assert (= (and b!91113 (not res!75187)) b!91109))

(assert (= start!18378 b!91119))

(assert (= start!18378 b!91117))

(declare-fun m!135363 () Bool)

(assert (=> b!91107 m!135363))

(declare-fun m!135365 () Bool)

(assert (=> b!91111 m!135365))

(declare-fun m!135367 () Bool)

(assert (=> b!91119 m!135367))

(declare-fun m!135369 () Bool)

(assert (=> b!91121 m!135369))

(declare-fun m!135371 () Bool)

(assert (=> b!91121 m!135371))

(declare-fun m!135373 () Bool)

(assert (=> b!91122 m!135373))

(declare-fun m!135375 () Bool)

(assert (=> b!91112 m!135375))

(declare-fun m!135377 () Bool)

(assert (=> b!91112 m!135377))

(declare-fun m!135379 () Bool)

(assert (=> b!91106 m!135379))

(declare-fun m!135381 () Bool)

(assert (=> start!18378 m!135381))

(declare-fun m!135383 () Bool)

(assert (=> start!18378 m!135383))

(declare-fun m!135385 () Bool)

(assert (=> b!91117 m!135385))

(declare-fun m!135387 () Bool)

(assert (=> b!91108 m!135387))

(declare-fun m!135389 () Bool)

(assert (=> b!91120 m!135389))

(declare-fun m!135391 () Bool)

(assert (=> b!91110 m!135391))

(assert (=> b!91113 m!135391))

(declare-fun m!135393 () Bool)

(assert (=> b!91114 m!135393))

(assert (=> b!91114 m!135393))

(declare-fun m!135395 () Bool)

(assert (=> b!91114 m!135395))

(check-sat (not b!91107) (not b!91117) (not b!91112) (not b!91106) (not b!91120) (not b!91111) (not start!18378) (not b!91113) (not b!91110) (not b!91121) (not b!91108) (not b!91119) (not b!91122) (not b!91114))
(check-sat)

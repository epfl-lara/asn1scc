; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53714 () Bool)

(assert start!53714)

(declare-fun e!173135 () Bool)

(declare-fun from!289 () (_ BitVec 64))

(declare-fun lt!388436 () (_ BitVec 64))

(declare-fun b!249815 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249815 (= e!173135 (bvslt lt!388436 (bvsub nBits!297 from!289)))))

(declare-fun b!249816 () Bool)

(declare-fun res!209095 () Bool)

(declare-fun e!173134 () Bool)

(assert (=> b!249816 (=> (not res!209095) (not e!173134))))

(declare-datatypes ((array!13623 0))(
  ( (array!13624 (arr!6962 (Array (_ BitVec 32) (_ BitVec 8))) (size!5975 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10872 0))(
  ( (BitStream!10873 (buf!6468 array!13623) (currentByte!11899 (_ BitVec 32)) (currentBit!11894 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10872)

(declare-datatypes ((Unit!18086 0))(
  ( (Unit!18087) )
))
(declare-datatypes ((tuple2!21406 0))(
  ( (tuple2!21407 (_1!11628 Unit!18086) (_2!11628 BitStream!10872)) )
))
(declare-fun lt!388440 () tuple2!21406)

(declare-fun isPrefixOf!0 (BitStream!10872 BitStream!10872) Bool)

(assert (=> b!249816 (= res!209095 (isPrefixOf!0 thiss!1005 (_2!11628 lt!388440)))))

(declare-fun b!249817 () Bool)

(declare-fun e!173138 () Bool)

(declare-fun e!173139 () Bool)

(assert (=> b!249817 (= e!173138 (not e!173139))))

(declare-fun res!209092 () Bool)

(assert (=> b!249817 (=> res!209092 e!173139)))

(assert (=> b!249817 (= res!209092 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249817 (validate_offset_bits!1 ((_ sign_extend 32) (size!5975 (buf!6468 (_2!11628 lt!388440)))) ((_ sign_extend 32) (currentByte!11899 (_2!11628 lt!388440))) ((_ sign_extend 32) (currentBit!11894 (_2!11628 lt!388440))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388435 () Unit!18086)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10872 BitStream!10872 (_ BitVec 64) (_ BitVec 64)) Unit!18086)

(assert (=> b!249817 (= lt!388435 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11628 lt!388440) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173137 () Bool)

(assert (=> b!249817 e!173137))

(declare-fun res!209096 () Bool)

(assert (=> b!249817 (=> (not res!209096) (not e!173137))))

(assert (=> b!249817 (= res!209096 (= (size!5975 (buf!6468 thiss!1005)) (size!5975 (buf!6468 (_2!11628 lt!388440)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10872 Bool) tuple2!21406)

(assert (=> b!249817 (= lt!388440 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249818 () Bool)

(assert (=> b!249818 (= e!173137 e!173134)))

(declare-fun res!209091 () Bool)

(assert (=> b!249818 (=> (not res!209091) (not e!173134))))

(declare-fun lt!388438 () (_ BitVec 64))

(declare-fun lt!388439 () (_ BitVec 64))

(assert (=> b!249818 (= res!209091 (= lt!388438 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388439)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249818 (= lt!388438 (bitIndex!0 (size!5975 (buf!6468 (_2!11628 lt!388440))) (currentByte!11899 (_2!11628 lt!388440)) (currentBit!11894 (_2!11628 lt!388440))))))

(assert (=> b!249818 (= lt!388439 (bitIndex!0 (size!5975 (buf!6468 thiss!1005)) (currentByte!11899 thiss!1005) (currentBit!11894 thiss!1005)))))

(declare-fun res!209089 () Bool)

(assert (=> start!53714 (=> (not res!209089) (not e!173138))))

(assert (=> start!53714 (= res!209089 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53714 e!173138))

(assert (=> start!53714 true))

(declare-fun e!173136 () Bool)

(declare-fun inv!12 (BitStream!10872) Bool)

(assert (=> start!53714 (and (inv!12 thiss!1005) e!173136)))

(declare-fun b!249819 () Bool)

(declare-fun e!173140 () Bool)

(declare-datatypes ((tuple2!21408 0))(
  ( (tuple2!21409 (_1!11629 BitStream!10872) (_2!11629 Bool)) )
))
(declare-fun lt!388437 () tuple2!21408)

(assert (=> b!249819 (= e!173140 (= (bitIndex!0 (size!5975 (buf!6468 (_1!11629 lt!388437))) (currentByte!11899 (_1!11629 lt!388437)) (currentBit!11894 (_1!11629 lt!388437))) lt!388438))))

(declare-fun b!249820 () Bool)

(declare-fun array_inv!5716 (array!13623) Bool)

(assert (=> b!249820 (= e!173136 (array_inv!5716 (buf!6468 thiss!1005)))))

(declare-fun b!249821 () Bool)

(assert (=> b!249821 (= e!173134 e!173140)))

(declare-fun res!209090 () Bool)

(assert (=> b!249821 (=> (not res!209090) (not e!173140))))

(assert (=> b!249821 (= res!209090 (and (= (_2!11629 lt!388437) bit!26) (= (_1!11629 lt!388437) (_2!11628 lt!388440))))))

(declare-fun readBitPure!0 (BitStream!10872) tuple2!21408)

(declare-fun readerFrom!0 (BitStream!10872 (_ BitVec 32) (_ BitVec 32)) BitStream!10872)

(assert (=> b!249821 (= lt!388437 (readBitPure!0 (readerFrom!0 (_2!11628 lt!388440) (currentBit!11894 thiss!1005) (currentByte!11899 thiss!1005))))))

(declare-fun b!249822 () Bool)

(declare-fun res!209093 () Bool)

(assert (=> b!249822 (=> (not res!209093) (not e!173138))))

(assert (=> b!249822 (= res!209093 (bvslt from!289 nBits!297))))

(declare-fun b!249823 () Bool)

(assert (=> b!249823 (= e!173139 e!173135)))

(declare-fun res!209094 () Bool)

(assert (=> b!249823 (=> res!209094 e!173135)))

(assert (=> b!249823 (= res!209094 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5975 (buf!6468 (_2!11628 lt!388440)))) ((_ sign_extend 32) (currentByte!11899 (_2!11628 lt!388440))) ((_ sign_extend 32) (currentBit!11894 (_2!11628 lt!388440))) lt!388436)))))

(assert (=> b!249823 (= lt!388436 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249824 () Bool)

(declare-fun res!209097 () Bool)

(assert (=> b!249824 (=> (not res!209097) (not e!173138))))

(assert (=> b!249824 (= res!209097 (validate_offset_bits!1 ((_ sign_extend 32) (size!5975 (buf!6468 thiss!1005))) ((_ sign_extend 32) (currentByte!11899 thiss!1005)) ((_ sign_extend 32) (currentBit!11894 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53714 res!209089) b!249824))

(assert (= (and b!249824 res!209097) b!249822))

(assert (= (and b!249822 res!209093) b!249817))

(assert (= (and b!249817 res!209096) b!249818))

(assert (= (and b!249818 res!209091) b!249816))

(assert (= (and b!249816 res!209095) b!249821))

(assert (= (and b!249821 res!209090) b!249819))

(assert (= (and b!249817 (not res!209092)) b!249823))

(assert (= (and b!249823 (not res!209094)) b!249815))

(assert (= start!53714 b!249820))

(declare-fun m!376205 () Bool)

(assert (=> b!249818 m!376205))

(declare-fun m!376207 () Bool)

(assert (=> b!249818 m!376207))

(declare-fun m!376209 () Bool)

(assert (=> b!249816 m!376209))

(declare-fun m!376211 () Bool)

(assert (=> b!249819 m!376211))

(declare-fun m!376213 () Bool)

(assert (=> b!249817 m!376213))

(declare-fun m!376215 () Bool)

(assert (=> b!249817 m!376215))

(declare-fun m!376217 () Bool)

(assert (=> b!249817 m!376217))

(declare-fun m!376219 () Bool)

(assert (=> b!249823 m!376219))

(declare-fun m!376221 () Bool)

(assert (=> b!249824 m!376221))

(declare-fun m!376223 () Bool)

(assert (=> b!249820 m!376223))

(declare-fun m!376225 () Bool)

(assert (=> start!53714 m!376225))

(declare-fun m!376227 () Bool)

(assert (=> b!249821 m!376227))

(assert (=> b!249821 m!376227))

(declare-fun m!376229 () Bool)

(assert (=> b!249821 m!376229))

(check-sat (not start!53714) (not b!249821) (not b!249817) (not b!249823) (not b!249820) (not b!249824) (not b!249816) (not b!249819) (not b!249818))
(check-sat)

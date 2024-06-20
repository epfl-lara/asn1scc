; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53720 () Bool)

(assert start!53720)

(declare-fun b!249910 () Bool)

(declare-fun res!209175 () Bool)

(declare-fun e!173212 () Bool)

(assert (=> b!249910 (=> (not res!209175) (not e!173212))))

(declare-datatypes ((array!13629 0))(
  ( (array!13630 (arr!6965 (Array (_ BitVec 32) (_ BitVec 8))) (size!5978 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10878 0))(
  ( (BitStream!10879 (buf!6471 array!13629) (currentByte!11902 (_ BitVec 32)) (currentBit!11897 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10878)

(declare-datatypes ((Unit!18092 0))(
  ( (Unit!18093) )
))
(declare-datatypes ((tuple2!21420 0))(
  ( (tuple2!21421 (_1!11635 Unit!18092) (_2!11635 BitStream!10878)) )
))
(declare-fun lt!388511 () tuple2!21420)

(declare-fun isPrefixOf!0 (BitStream!10878 BitStream!10878) Bool)

(assert (=> b!249910 (= res!209175 (isPrefixOf!0 thiss!1005 (_2!11635 lt!388511)))))

(declare-fun b!249912 () Bool)

(declare-fun res!209177 () Bool)

(declare-fun e!173211 () Bool)

(assert (=> b!249912 (=> (not res!209177) (not e!173211))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249912 (= res!209177 (validate_offset_bits!1 ((_ sign_extend 32) (size!5978 (buf!6471 thiss!1005))) ((_ sign_extend 32) (currentByte!11902 thiss!1005)) ((_ sign_extend 32) (currentBit!11897 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249913 () Bool)

(declare-fun e!173209 () Bool)

(declare-datatypes ((tuple2!21422 0))(
  ( (tuple2!21423 (_1!11636 BitStream!10878) (_2!11636 Bool)) )
))
(declare-fun lt!388517 () tuple2!21422)

(declare-datatypes ((tuple2!21424 0))(
  ( (tuple2!21425 (_1!11637 BitStream!10878) (_2!11637 BitStream!10878)) )
))
(declare-fun lt!388518 () tuple2!21424)

(assert (=> b!249913 (= e!173209 (not (or (not (_2!11636 lt!388517)) (not (= (_1!11636 lt!388517) (_2!11637 lt!388518))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10878 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21422)

(assert (=> b!249913 (= lt!388517 (checkBitsLoopPure!0 (_1!11637 lt!388518) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388516 () tuple2!21420)

(declare-fun lt!388513 () (_ BitVec 64))

(assert (=> b!249913 (validate_offset_bits!1 ((_ sign_extend 32) (size!5978 (buf!6471 (_2!11635 lt!388516)))) ((_ sign_extend 32) (currentByte!11902 (_2!11635 lt!388511))) ((_ sign_extend 32) (currentBit!11897 (_2!11635 lt!388511))) lt!388513)))

(declare-fun lt!388509 () Unit!18092)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10878 array!13629 (_ BitVec 64)) Unit!18092)

(assert (=> b!249913 (= lt!388509 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11635 lt!388511) (buf!6471 (_2!11635 lt!388516)) lt!388513))))

(declare-fun reader!0 (BitStream!10878 BitStream!10878) tuple2!21424)

(assert (=> b!249913 (= lt!388518 (reader!0 (_2!11635 lt!388511) (_2!11635 lt!388516)))))

(declare-fun b!249914 () Bool)

(assert (=> b!249914 (= e!173211 (not (isPrefixOf!0 thiss!1005 (_2!11635 lt!388511))))))

(declare-fun e!173210 () Bool)

(assert (=> b!249914 e!173210))

(declare-fun res!209184 () Bool)

(assert (=> b!249914 (=> (not res!209184) (not e!173210))))

(assert (=> b!249914 (= res!209184 (= (size!5978 (buf!6471 (_2!11635 lt!388511))) (size!5978 (buf!6471 (_2!11635 lt!388516)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10878 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21420)

(assert (=> b!249914 (= lt!388516 (appendNBitsLoop!0 (_2!11635 lt!388511) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249914 (validate_offset_bits!1 ((_ sign_extend 32) (size!5978 (buf!6471 (_2!11635 lt!388511)))) ((_ sign_extend 32) (currentByte!11902 (_2!11635 lt!388511))) ((_ sign_extend 32) (currentBit!11897 (_2!11635 lt!388511))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388514 () Unit!18092)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10878 BitStream!10878 (_ BitVec 64) (_ BitVec 64)) Unit!18092)

(assert (=> b!249914 (= lt!388514 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11635 lt!388511) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173208 () Bool)

(assert (=> b!249914 e!173208))

(declare-fun res!209183 () Bool)

(assert (=> b!249914 (=> (not res!209183) (not e!173208))))

(assert (=> b!249914 (= res!209183 (= (size!5978 (buf!6471 thiss!1005)) (size!5978 (buf!6471 (_2!11635 lt!388511)))))))

(declare-fun appendBit!0 (BitStream!10878 Bool) tuple2!21420)

(assert (=> b!249914 (= lt!388511 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249915 () Bool)

(declare-fun res!209176 () Bool)

(assert (=> b!249915 (=> (not res!209176) (not e!173209))))

(assert (=> b!249915 (= res!209176 (isPrefixOf!0 (_2!11635 lt!388511) (_2!11635 lt!388516)))))

(declare-fun b!249916 () Bool)

(declare-fun e!173213 () Bool)

(assert (=> b!249916 (= e!173212 e!173213)))

(declare-fun res!209179 () Bool)

(assert (=> b!249916 (=> (not res!209179) (not e!173213))))

(declare-fun lt!388512 () tuple2!21422)

(assert (=> b!249916 (= res!209179 (and (= (_2!11636 lt!388512) bit!26) (= (_1!11636 lt!388512) (_2!11635 lt!388511))))))

(declare-fun readBitPure!0 (BitStream!10878) tuple2!21422)

(declare-fun readerFrom!0 (BitStream!10878 (_ BitVec 32) (_ BitVec 32)) BitStream!10878)

(assert (=> b!249916 (= lt!388512 (readBitPure!0 (readerFrom!0 (_2!11635 lt!388511) (currentBit!11897 thiss!1005) (currentByte!11902 thiss!1005))))))

(declare-fun b!249917 () Bool)

(declare-fun lt!388510 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249917 (= e!173213 (= (bitIndex!0 (size!5978 (buf!6471 (_1!11636 lt!388512))) (currentByte!11902 (_1!11636 lt!388512)) (currentBit!11897 (_1!11636 lt!388512))) lt!388510))))

(declare-fun b!249918 () Bool)

(declare-fun e!173207 () Bool)

(declare-fun array_inv!5719 (array!13629) Bool)

(assert (=> b!249918 (= e!173207 (array_inv!5719 (buf!6471 thiss!1005)))))

(declare-fun b!249919 () Bool)

(assert (=> b!249919 (= e!173210 e!173209)))

(declare-fun res!209180 () Bool)

(assert (=> b!249919 (=> (not res!209180) (not e!173209))))

(assert (=> b!249919 (= res!209180 (= (bitIndex!0 (size!5978 (buf!6471 (_2!11635 lt!388516))) (currentByte!11902 (_2!11635 lt!388516)) (currentBit!11897 (_2!11635 lt!388516))) (bvadd (bitIndex!0 (size!5978 (buf!6471 (_2!11635 lt!388511))) (currentByte!11902 (_2!11635 lt!388511)) (currentBit!11897 (_2!11635 lt!388511))) lt!388513)))))

(assert (=> b!249919 (= lt!388513 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249920 () Bool)

(declare-fun res!209178 () Bool)

(assert (=> b!249920 (=> (not res!209178) (not e!173211))))

(assert (=> b!249920 (= res!209178 (bvslt from!289 nBits!297))))

(declare-fun b!249911 () Bool)

(assert (=> b!249911 (= e!173208 e!173212)))

(declare-fun res!209181 () Bool)

(assert (=> b!249911 (=> (not res!209181) (not e!173212))))

(declare-fun lt!388515 () (_ BitVec 64))

(assert (=> b!249911 (= res!209181 (= lt!388510 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388515)))))

(assert (=> b!249911 (= lt!388510 (bitIndex!0 (size!5978 (buf!6471 (_2!11635 lt!388511))) (currentByte!11902 (_2!11635 lt!388511)) (currentBit!11897 (_2!11635 lt!388511))))))

(assert (=> b!249911 (= lt!388515 (bitIndex!0 (size!5978 (buf!6471 thiss!1005)) (currentByte!11902 thiss!1005) (currentBit!11897 thiss!1005)))))

(declare-fun res!209182 () Bool)

(assert (=> start!53720 (=> (not res!209182) (not e!173211))))

(assert (=> start!53720 (= res!209182 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53720 e!173211))

(assert (=> start!53720 true))

(declare-fun inv!12 (BitStream!10878) Bool)

(assert (=> start!53720 (and (inv!12 thiss!1005) e!173207)))

(assert (= (and start!53720 res!209182) b!249912))

(assert (= (and b!249912 res!209177) b!249920))

(assert (= (and b!249920 res!209178) b!249914))

(assert (= (and b!249914 res!209183) b!249911))

(assert (= (and b!249911 res!209181) b!249910))

(assert (= (and b!249910 res!209175) b!249916))

(assert (= (and b!249916 res!209179) b!249917))

(assert (= (and b!249914 res!209184) b!249919))

(assert (= (and b!249919 res!209180) b!249915))

(assert (= (and b!249915 res!209176) b!249913))

(assert (= start!53720 b!249918))

(declare-fun m!376295 () Bool)

(assert (=> b!249918 m!376295))

(declare-fun m!376297 () Bool)

(assert (=> b!249916 m!376297))

(assert (=> b!249916 m!376297))

(declare-fun m!376299 () Bool)

(assert (=> b!249916 m!376299))

(declare-fun m!376301 () Bool)

(assert (=> start!53720 m!376301))

(declare-fun m!376303 () Bool)

(assert (=> b!249919 m!376303))

(declare-fun m!376305 () Bool)

(assert (=> b!249919 m!376305))

(assert (=> b!249911 m!376305))

(declare-fun m!376307 () Bool)

(assert (=> b!249911 m!376307))

(declare-fun m!376309 () Bool)

(assert (=> b!249914 m!376309))

(declare-fun m!376311 () Bool)

(assert (=> b!249914 m!376311))

(declare-fun m!376313 () Bool)

(assert (=> b!249914 m!376313))

(declare-fun m!376315 () Bool)

(assert (=> b!249914 m!376315))

(declare-fun m!376317 () Bool)

(assert (=> b!249914 m!376317))

(declare-fun m!376319 () Bool)

(assert (=> b!249915 m!376319))

(declare-fun m!376321 () Bool)

(assert (=> b!249912 m!376321))

(assert (=> b!249910 m!376313))

(declare-fun m!376323 () Bool)

(assert (=> b!249917 m!376323))

(declare-fun m!376325 () Bool)

(assert (=> b!249913 m!376325))

(declare-fun m!376327 () Bool)

(assert (=> b!249913 m!376327))

(declare-fun m!376329 () Bool)

(assert (=> b!249913 m!376329))

(declare-fun m!376331 () Bool)

(assert (=> b!249913 m!376331))

(check-sat (not b!249916) (not b!249919) (not b!249911) (not b!249914) (not b!249910) (not start!53720) (not b!249915) (not b!249917) (not b!249913) (not b!249912) (not b!249918))

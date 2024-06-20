; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11864 () Bool)

(assert start!11864)

(declare-fun b!59748 () Bool)

(declare-fun e!39796 () Bool)

(declare-fun e!39790 () Bool)

(assert (=> b!59748 (= e!39796 (not e!39790))))

(declare-fun res!49763 () Bool)

(assert (=> b!59748 (=> res!49763 e!39790)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!59748 (= res!49763 (bvsge i!635 to!314))))

(declare-datatypes ((array!2721 0))(
  ( (array!2722 (arr!1800 (Array (_ BitVec 32) (_ BitVec 8))) (size!1236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2160 0))(
  ( (BitStream!2161 (buf!1617 array!2721) (currentByte!3235 (_ BitVec 32)) (currentBit!3230 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2160)

(declare-fun isPrefixOf!0 (BitStream!2160 BitStream!2160) Bool)

(assert (=> b!59748 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4095 0))(
  ( (Unit!4096) )
))
(declare-fun lt!93554 () Unit!4095)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2160) Unit!4095)

(assert (=> b!59748 (= lt!93554 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93557 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59748 (= lt!93557 (bitIndex!0 (size!1236 (buf!1617 thiss!1379)) (currentByte!3235 thiss!1379) (currentBit!3230 thiss!1379)))))

(declare-fun b!59749 () Bool)

(declare-fun res!49759 () Bool)

(declare-fun e!39797 () Bool)

(assert (=> b!59749 (=> res!49759 e!39797)))

(declare-datatypes ((tuple2!5442 0))(
  ( (tuple2!5443 (_1!2832 Unit!4095) (_2!2832 BitStream!2160)) )
))
(declare-fun lt!93565 () tuple2!5442)

(declare-fun lt!93558 () tuple2!5442)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59749 (= res!49759 (not (invariant!0 (currentBit!3230 (_2!2832 lt!93565)) (currentByte!3235 (_2!2832 lt!93565)) (size!1236 (buf!1617 (_2!2832 lt!93558))))))))

(declare-fun srcBuffer!2 () array!2721)

(declare-fun b!59750 () Bool)

(declare-datatypes ((tuple2!5444 0))(
  ( (tuple2!5445 (_1!2833 BitStream!2160) (_2!2833 BitStream!2160)) )
))
(declare-fun lt!93561 () tuple2!5444)

(declare-fun e!39787 () Bool)

(declare-datatypes ((List!655 0))(
  ( (Nil!652) (Cons!651 (h!770 Bool) (t!1405 List!655)) )
))
(declare-fun head!474 (List!655) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2160 array!2721 (_ BitVec 64) (_ BitVec 64)) List!655)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2160 BitStream!2160 (_ BitVec 64)) List!655)

(assert (=> b!59750 (= e!39787 (= (head!474 (byteArrayBitContentToList!0 (_2!2832 lt!93565) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!474 (bitStreamReadBitsIntoList!0 (_2!2832 lt!93565) (_1!2833 lt!93561) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59751 () Bool)

(declare-fun e!39793 () Bool)

(declare-fun array_inv!1139 (array!2721) Bool)

(assert (=> b!59751 (= e!39793 (array_inv!1139 (buf!1617 thiss!1379)))))

(declare-fun b!59752 () Bool)

(declare-fun res!49755 () Bool)

(assert (=> b!59752 (=> res!49755 e!39797)))

(assert (=> b!59752 (= res!49755 (not (invariant!0 (currentBit!3230 (_2!2832 lt!93565)) (currentByte!3235 (_2!2832 lt!93565)) (size!1236 (buf!1617 (_2!2832 lt!93565))))))))

(declare-fun b!59753 () Bool)

(assert (=> b!59753 (= e!39797 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93552 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59753 (validate_offset_bits!1 ((_ sign_extend 32) (size!1236 (buf!1617 (_2!2832 lt!93558)))) ((_ sign_extend 32) (currentByte!3235 (_2!2832 lt!93565))) ((_ sign_extend 32) (currentBit!3230 (_2!2832 lt!93565))) lt!93552)))

(declare-fun lt!93555 () Unit!4095)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2160 array!2721 (_ BitVec 64)) Unit!4095)

(assert (=> b!59753 (= lt!93555 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2832 lt!93565) (buf!1617 (_2!2832 lt!93558)) lt!93552))))

(declare-fun lt!93556 () tuple2!5444)

(declare-fun reader!0 (BitStream!2160 BitStream!2160) tuple2!5444)

(assert (=> b!59753 (= lt!93556 (reader!0 (_2!2832 lt!93565) (_2!2832 lt!93558)))))

(assert (=> b!59753 (validate_offset_bits!1 ((_ sign_extend 32) (size!1236 (buf!1617 (_2!2832 lt!93558)))) ((_ sign_extend 32) (currentByte!3235 thiss!1379)) ((_ sign_extend 32) (currentBit!3230 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93562 () Unit!4095)

(assert (=> b!59753 (= lt!93562 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1617 (_2!2832 lt!93558)) (bvsub to!314 i!635)))))

(declare-fun lt!93560 () tuple2!5444)

(assert (=> b!59753 (= lt!93560 (reader!0 thiss!1379 (_2!2832 lt!93558)))))

(declare-fun res!49762 () Bool)

(assert (=> start!11864 (=> (not res!49762) (not e!39796))))

(assert (=> start!11864 (= res!49762 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1236 srcBuffer!2))))))))

(assert (=> start!11864 e!39796))

(assert (=> start!11864 true))

(assert (=> start!11864 (array_inv!1139 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2160) Bool)

(assert (=> start!11864 (and (inv!12 thiss!1379) e!39793)))

(declare-fun b!59754 () Bool)

(declare-fun e!39789 () Bool)

(declare-fun e!39794 () Bool)

(assert (=> b!59754 (= e!39789 e!39794)))

(declare-fun res!49764 () Bool)

(assert (=> b!59754 (=> res!49764 e!39794)))

(assert (=> b!59754 (= res!49764 (not (isPrefixOf!0 (_2!2832 lt!93565) (_2!2832 lt!93558))))))

(assert (=> b!59754 (isPrefixOf!0 thiss!1379 (_2!2832 lt!93558))))

(declare-fun lt!93564 () Unit!4095)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2160 BitStream!2160 BitStream!2160) Unit!4095)

(assert (=> b!59754 (= lt!93564 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2832 lt!93565) (_2!2832 lt!93558)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2160 array!2721 (_ BitVec 64) (_ BitVec 64)) tuple2!5442)

(assert (=> b!59754 (= lt!93558 (appendBitsMSBFirstLoop!0 (_2!2832 lt!93565) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59754 e!39787))

(declare-fun res!49754 () Bool)

(assert (=> b!59754 (=> (not res!49754) (not e!39787))))

(assert (=> b!59754 (= res!49754 (validate_offset_bits!1 ((_ sign_extend 32) (size!1236 (buf!1617 (_2!2832 lt!93565)))) ((_ sign_extend 32) (currentByte!3235 thiss!1379)) ((_ sign_extend 32) (currentBit!3230 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93553 () Unit!4095)

(assert (=> b!59754 (= lt!93553 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1617 (_2!2832 lt!93565)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59754 (= lt!93561 (reader!0 thiss!1379 (_2!2832 lt!93565)))))

(declare-fun b!59755 () Bool)

(declare-fun e!39791 () Bool)

(assert (=> b!59755 (= e!39791 e!39797)))

(declare-fun res!49752 () Bool)

(assert (=> b!59755 (=> res!49752 e!39797)))

(assert (=> b!59755 (= res!49752 (not (= (size!1236 (buf!1617 (_2!2832 lt!93565))) (size!1236 (buf!1617 (_2!2832 lt!93558))))))))

(declare-fun e!39792 () Bool)

(assert (=> b!59755 e!39792))

(declare-fun res!49753 () Bool)

(assert (=> b!59755 (=> (not res!49753) (not e!39792))))

(assert (=> b!59755 (= res!49753 (= (size!1236 (buf!1617 (_2!2832 lt!93558))) (size!1236 (buf!1617 thiss!1379))))))

(declare-fun b!59756 () Bool)

(assert (=> b!59756 (= e!39790 e!39789)))

(declare-fun res!49756 () Bool)

(assert (=> b!59756 (=> res!49756 e!39789)))

(assert (=> b!59756 (= res!49756 (not (isPrefixOf!0 thiss!1379 (_2!2832 lt!93565))))))

(assert (=> b!59756 (validate_offset_bits!1 ((_ sign_extend 32) (size!1236 (buf!1617 (_2!2832 lt!93565)))) ((_ sign_extend 32) (currentByte!3235 (_2!2832 lt!93565))) ((_ sign_extend 32) (currentBit!3230 (_2!2832 lt!93565))) lt!93552)))

(assert (=> b!59756 (= lt!93552 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93559 () Unit!4095)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2160 BitStream!2160 (_ BitVec 64) (_ BitVec 64)) Unit!4095)

(assert (=> b!59756 (= lt!93559 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2832 lt!93565) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2160 (_ BitVec 8) (_ BitVec 32)) tuple2!5442)

(assert (=> b!59756 (= lt!93565 (appendBitFromByte!0 thiss!1379 (select (arr!1800 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59757 () Bool)

(assert (=> b!59757 (= e!39794 e!39791)))

(declare-fun res!49758 () Bool)

(assert (=> b!59757 (=> res!49758 e!39791)))

(declare-fun lt!93563 () (_ BitVec 64))

(assert (=> b!59757 (= res!49758 (not (= lt!93563 (bvsub (bvadd lt!93557 to!314) i!635))))))

(assert (=> b!59757 (= lt!93563 (bitIndex!0 (size!1236 (buf!1617 (_2!2832 lt!93558))) (currentByte!3235 (_2!2832 lt!93558)) (currentBit!3230 (_2!2832 lt!93558))))))

(declare-fun b!59758 () Bool)

(assert (=> b!59758 (= e!39792 (= lt!93563 (bvsub (bvsub (bvadd (bitIndex!0 (size!1236 (buf!1617 (_2!2832 lt!93565))) (currentByte!3235 (_2!2832 lt!93565)) (currentBit!3230 (_2!2832 lt!93565))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59759 () Bool)

(declare-fun res!49757 () Bool)

(assert (=> b!59759 (=> res!49757 e!39791)))

(assert (=> b!59759 (= res!49757 (not (invariant!0 (currentBit!3230 (_2!2832 lt!93558)) (currentByte!3235 (_2!2832 lt!93558)) (size!1236 (buf!1617 (_2!2832 lt!93558))))))))

(declare-fun b!59760 () Bool)

(declare-fun res!49761 () Bool)

(assert (=> b!59760 (=> (not res!49761) (not e!39796))))

(assert (=> b!59760 (= res!49761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1236 (buf!1617 thiss!1379))) ((_ sign_extend 32) (currentByte!3235 thiss!1379)) ((_ sign_extend 32) (currentBit!3230 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59761 () Bool)

(declare-fun res!49760 () Bool)

(assert (=> b!59761 (=> res!49760 e!39791)))

(assert (=> b!59761 (= res!49760 (not (= (size!1236 (buf!1617 thiss!1379)) (size!1236 (buf!1617 (_2!2832 lt!93558))))))))

(assert (= (and start!11864 res!49762) b!59760))

(assert (= (and b!59760 res!49761) b!59748))

(assert (= (and b!59748 (not res!49763)) b!59756))

(assert (= (and b!59756 (not res!49756)) b!59754))

(assert (= (and b!59754 res!49754) b!59750))

(assert (= (and b!59754 (not res!49764)) b!59757))

(assert (= (and b!59757 (not res!49758)) b!59759))

(assert (= (and b!59759 (not res!49757)) b!59761))

(assert (= (and b!59761 (not res!49760)) b!59755))

(assert (= (and b!59755 res!49753) b!59758))

(assert (= (and b!59755 (not res!49752)) b!59752))

(assert (= (and b!59752 (not res!49755)) b!59749))

(assert (= (and b!59749 (not res!49759)) b!59753))

(assert (= start!11864 b!59751))

(declare-fun m!94101 () Bool)

(assert (=> b!59756 m!94101))

(declare-fun m!94103 () Bool)

(assert (=> b!59756 m!94103))

(declare-fun m!94105 () Bool)

(assert (=> b!59756 m!94105))

(declare-fun m!94107 () Bool)

(assert (=> b!59756 m!94107))

(assert (=> b!59756 m!94101))

(declare-fun m!94109 () Bool)

(assert (=> b!59756 m!94109))

(declare-fun m!94111 () Bool)

(assert (=> b!59752 m!94111))

(declare-fun m!94113 () Bool)

(assert (=> b!59759 m!94113))

(declare-fun m!94115 () Bool)

(assert (=> b!59753 m!94115))

(declare-fun m!94117 () Bool)

(assert (=> b!59753 m!94117))

(declare-fun m!94119 () Bool)

(assert (=> b!59753 m!94119))

(declare-fun m!94121 () Bool)

(assert (=> b!59753 m!94121))

(declare-fun m!94123 () Bool)

(assert (=> b!59753 m!94123))

(declare-fun m!94125 () Bool)

(assert (=> b!59753 m!94125))

(declare-fun m!94127 () Bool)

(assert (=> b!59748 m!94127))

(declare-fun m!94129 () Bool)

(assert (=> b!59748 m!94129))

(declare-fun m!94131 () Bool)

(assert (=> b!59748 m!94131))

(declare-fun m!94133 () Bool)

(assert (=> b!59758 m!94133))

(declare-fun m!94135 () Bool)

(assert (=> b!59757 m!94135))

(declare-fun m!94137 () Bool)

(assert (=> b!59749 m!94137))

(declare-fun m!94139 () Bool)

(assert (=> start!11864 m!94139))

(declare-fun m!94141 () Bool)

(assert (=> start!11864 m!94141))

(declare-fun m!94143 () Bool)

(assert (=> b!59750 m!94143))

(assert (=> b!59750 m!94143))

(declare-fun m!94145 () Bool)

(assert (=> b!59750 m!94145))

(declare-fun m!94147 () Bool)

(assert (=> b!59750 m!94147))

(assert (=> b!59750 m!94147))

(declare-fun m!94149 () Bool)

(assert (=> b!59750 m!94149))

(declare-fun m!94151 () Bool)

(assert (=> b!59760 m!94151))

(declare-fun m!94153 () Bool)

(assert (=> b!59754 m!94153))

(declare-fun m!94155 () Bool)

(assert (=> b!59754 m!94155))

(declare-fun m!94157 () Bool)

(assert (=> b!59754 m!94157))

(declare-fun m!94159 () Bool)

(assert (=> b!59754 m!94159))

(declare-fun m!94161 () Bool)

(assert (=> b!59754 m!94161))

(declare-fun m!94163 () Bool)

(assert (=> b!59754 m!94163))

(declare-fun m!94165 () Bool)

(assert (=> b!59754 m!94165))

(declare-fun m!94167 () Bool)

(assert (=> b!59751 m!94167))

(check-sat (not b!59750) (not b!59760) (not start!11864) (not b!59758) (not b!59749) (not b!59756) (not b!59751) (not b!59748) (not b!59752) (not b!59759) (not b!59753) (not b!59754) (not b!59757))
(check-sat)

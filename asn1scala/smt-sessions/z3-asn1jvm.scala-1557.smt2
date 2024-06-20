; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43640 () Bool)

(assert start!43640)

(declare-fun b!207308 () Bool)

(declare-fun res!173916 () Bool)

(declare-fun e!141709 () Bool)

(assert (=> b!207308 (=> (not res!173916) (not e!141709))))

(declare-datatypes ((array!10423 0))(
  ( (array!10424 (arr!5513 (Array (_ BitVec 32) (_ BitVec 8))) (size!4583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8274 0))(
  ( (BitStream!8275 (buf!5088 array!10423) (currentByte!9606 (_ BitVec 32)) (currentBit!9601 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8274)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207308 (= res!173916 (invariant!0 (currentBit!9601 thiss!1204) (currentByte!9606 thiss!1204) (size!4583 (buf!5088 thiss!1204))))))

(declare-fun b!207309 () Bool)

(declare-fun res!173919 () Bool)

(declare-fun e!141716 () Bool)

(assert (=> b!207309 (=> res!173919 e!141716)))

(declare-datatypes ((Unit!14760 0))(
  ( (Unit!14761) )
))
(declare-datatypes ((tuple2!17770 0))(
  ( (tuple2!17771 (_1!9540 Unit!14760) (_2!9540 BitStream!8274)) )
))
(declare-fun lt!323580 () tuple2!17770)

(assert (=> b!207309 (= res!173919 (not (invariant!0 (currentBit!9601 (_2!9540 lt!323580)) (currentByte!9606 (_2!9540 lt!323580)) (size!4583 (buf!5088 (_2!9540 lt!323580))))))))

(declare-fun b!207310 () Bool)

(declare-fun e!141707 () Bool)

(assert (=> b!207310 (= e!141707 (invariant!0 (currentBit!9601 thiss!1204) (currentByte!9606 thiss!1204) (size!4583 (buf!5088 (_2!9540 lt!323580)))))))

(declare-fun res!173929 () Bool)

(declare-fun e!141712 () Bool)

(assert (=> start!43640 (=> (not res!173929) (not e!141712))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43640 (= res!173929 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43640 e!141712))

(assert (=> start!43640 true))

(declare-fun e!141714 () Bool)

(declare-fun inv!12 (BitStream!8274) Bool)

(assert (=> start!43640 (and (inv!12 thiss!1204) e!141714)))

(declare-fun b!207311 () Bool)

(declare-fun res!173918 () Bool)

(declare-fun e!141715 () Bool)

(assert (=> b!207311 (=> (not res!173918) (not e!141715))))

(declare-fun lt!323585 () tuple2!17770)

(declare-fun isPrefixOf!0 (BitStream!8274 BitStream!8274) Bool)

(assert (=> b!207311 (= res!173918 (isPrefixOf!0 thiss!1204 (_2!9540 lt!323585)))))

(declare-fun b!207312 () Bool)

(declare-fun res!173925 () Bool)

(assert (=> b!207312 (=> res!173925 e!141716)))

(assert (=> b!207312 (= res!173925 (not (isPrefixOf!0 thiss!1204 (_2!9540 lt!323585))))))

(declare-fun b!207313 () Bool)

(declare-fun e!141710 () Bool)

(declare-datatypes ((tuple2!17772 0))(
  ( (tuple2!17773 (_1!9541 BitStream!8274) (_2!9541 Bool)) )
))
(declare-fun lt!323594 () tuple2!17772)

(declare-fun lt!323581 () tuple2!17772)

(assert (=> b!207313 (= e!141710 (= (_2!9541 lt!323594) (_2!9541 lt!323581)))))

(declare-fun b!207314 () Bool)

(declare-fun e!141713 () Bool)

(assert (=> b!207314 (= e!141713 e!141716)))

(declare-fun res!173922 () Bool)

(assert (=> b!207314 (=> res!173922 e!141716)))

(declare-fun lt!323592 () (_ BitVec 64))

(declare-fun lt!323582 () (_ BitVec 64))

(assert (=> b!207314 (= res!173922 (not (= lt!323592 (bvsub (bvsub (bvadd lt!323582 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207314 (= lt!323592 (bitIndex!0 (size!4583 (buf!5088 (_2!9540 lt!323580))) (currentByte!9606 (_2!9540 lt!323580)) (currentBit!9601 (_2!9540 lt!323580))))))

(assert (=> b!207314 (isPrefixOf!0 thiss!1204 (_2!9540 lt!323580))))

(declare-fun lt!323586 () Unit!14760)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8274 BitStream!8274 BitStream!8274) Unit!14760)

(assert (=> b!207314 (= lt!323586 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9540 lt!323585) (_2!9540 lt!323580)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8274 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17770)

(assert (=> b!207314 (= lt!323580 (appendBitsLSBFirstLoopTR!0 (_2!9540 lt!323585) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207315 () Bool)

(assert (=> b!207315 (= e!141709 (not e!141713))))

(declare-fun res!173930 () Bool)

(assert (=> b!207315 (=> res!173930 e!141713)))

(declare-fun lt!323590 () (_ BitVec 64))

(assert (=> b!207315 (= res!173930 (not (= lt!323582 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323590))))))

(assert (=> b!207315 (= lt!323582 (bitIndex!0 (size!4583 (buf!5088 (_2!9540 lt!323585))) (currentByte!9606 (_2!9540 lt!323585)) (currentBit!9601 (_2!9540 lt!323585))))))

(assert (=> b!207315 (= lt!323590 (bitIndex!0 (size!4583 (buf!5088 thiss!1204)) (currentByte!9606 thiss!1204) (currentBit!9601 thiss!1204)))))

(declare-fun e!141708 () Bool)

(assert (=> b!207315 e!141708))

(declare-fun res!173923 () Bool)

(assert (=> b!207315 (=> (not res!173923) (not e!141708))))

(assert (=> b!207315 (= res!173923 (= (size!4583 (buf!5088 thiss!1204)) (size!4583 (buf!5088 (_2!9540 lt!323585)))))))

(declare-fun lt!323596 () Bool)

(declare-fun appendBit!0 (BitStream!8274 Bool) tuple2!17770)

(assert (=> b!207315 (= lt!323585 (appendBit!0 thiss!1204 lt!323596))))

(assert (=> b!207315 (= lt!323596 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207316 () Bool)

(declare-fun array_inv!4324 (array!10423) Bool)

(assert (=> b!207316 (= e!141714 (array_inv!4324 (buf!5088 thiss!1204)))))

(declare-fun b!207317 () Bool)

(declare-fun res!173924 () Bool)

(assert (=> b!207317 (=> res!173924 e!141716)))

(assert (=> b!207317 (= res!173924 (not (isPrefixOf!0 (_2!9540 lt!323585) (_2!9540 lt!323580))))))

(declare-fun b!207318 () Bool)

(assert (=> b!207318 (= e!141712 e!141709)))

(declare-fun res!173920 () Bool)

(assert (=> b!207318 (=> (not res!173920) (not e!141709))))

(declare-fun lt!323587 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207318 (= res!173920 (validate_offset_bits!1 ((_ sign_extend 32) (size!4583 (buf!5088 thiss!1204))) ((_ sign_extend 32) (currentByte!9606 thiss!1204)) ((_ sign_extend 32) (currentBit!9601 thiss!1204)) lt!323587))))

(assert (=> b!207318 (= lt!323587 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207319 () Bool)

(declare-fun res!173928 () Bool)

(assert (=> b!207319 (=> res!173928 e!141716)))

(assert (=> b!207319 (= res!173928 (or (not (= (size!4583 (buf!5088 (_2!9540 lt!323580))) (size!4583 (buf!5088 thiss!1204)))) (not (= lt!323592 (bvsub (bvadd lt!323590 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207320 () Bool)

(assert (=> b!207320 (= e!141708 e!141715)))

(declare-fun res!173921 () Bool)

(assert (=> b!207320 (=> (not res!173921) (not e!141715))))

(declare-fun lt!323588 () (_ BitVec 64))

(declare-fun lt!323593 () (_ BitVec 64))

(assert (=> b!207320 (= res!173921 (= lt!323588 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323593)))))

(assert (=> b!207320 (= lt!323588 (bitIndex!0 (size!4583 (buf!5088 (_2!9540 lt!323585))) (currentByte!9606 (_2!9540 lt!323585)) (currentBit!9601 (_2!9540 lt!323585))))))

(assert (=> b!207320 (= lt!323593 (bitIndex!0 (size!4583 (buf!5088 thiss!1204)) (currentByte!9606 thiss!1204) (currentBit!9601 thiss!1204)))))

(declare-fun b!207321 () Bool)

(declare-fun res!173926 () Bool)

(assert (=> b!207321 (=> (not res!173926) (not e!141709))))

(assert (=> b!207321 (= res!173926 (not (= i!590 nBits!348)))))

(declare-fun b!207322 () Bool)

(declare-fun e!141717 () Bool)

(declare-fun lt!323597 () tuple2!17772)

(assert (=> b!207322 (= e!141717 (= (bitIndex!0 (size!4583 (buf!5088 (_1!9541 lt!323597))) (currentByte!9606 (_1!9541 lt!323597)) (currentBit!9601 (_1!9541 lt!323597))) lt!323588))))

(declare-fun b!207323 () Bool)

(assert (=> b!207323 (= e!141716 (or (not (= (size!4583 (buf!5088 (_2!9540 lt!323585))) (size!4583 (buf!5088 (_2!9540 lt!323580))))) (bvsge ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17774 0))(
  ( (tuple2!17775 (_1!9542 BitStream!8274) (_2!9542 (_ BitVec 64))) )
))
(declare-fun lt!323579 () tuple2!17774)

(declare-datatypes ((tuple2!17776 0))(
  ( (tuple2!17777 (_1!9543 BitStream!8274) (_2!9543 BitStream!8274)) )
))
(declare-fun lt!323589 () tuple2!17776)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17774)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207323 (= lt!323579 (readNBitsLSBFirstsLoopPure!0 (_1!9543 lt!323589) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207323 (validate_offset_bits!1 ((_ sign_extend 32) (size!4583 (buf!5088 (_2!9540 lt!323580)))) ((_ sign_extend 32) (currentByte!9606 thiss!1204)) ((_ sign_extend 32) (currentBit!9601 thiss!1204)) lt!323587)))

(declare-fun lt!323584 () Unit!14760)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8274 array!10423 (_ BitVec 64)) Unit!14760)

(assert (=> b!207323 (= lt!323584 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5088 (_2!9540 lt!323580)) lt!323587))))

(declare-fun readBitPure!0 (BitStream!8274) tuple2!17772)

(assert (=> b!207323 (= (_2!9541 (readBitPure!0 (_1!9543 lt!323589))) lt!323596)))

(declare-fun lt!323595 () tuple2!17776)

(declare-fun reader!0 (BitStream!8274 BitStream!8274) tuple2!17776)

(assert (=> b!207323 (= lt!323595 (reader!0 (_2!9540 lt!323585) (_2!9540 lt!323580)))))

(assert (=> b!207323 (= lt!323589 (reader!0 thiss!1204 (_2!9540 lt!323580)))))

(assert (=> b!207323 e!141710))

(declare-fun res!173917 () Bool)

(assert (=> b!207323 (=> (not res!173917) (not e!141710))))

(assert (=> b!207323 (= res!173917 (= (bitIndex!0 (size!4583 (buf!5088 (_1!9541 lt!323594))) (currentByte!9606 (_1!9541 lt!323594)) (currentBit!9601 (_1!9541 lt!323594))) (bitIndex!0 (size!4583 (buf!5088 (_1!9541 lt!323581))) (currentByte!9606 (_1!9541 lt!323581)) (currentBit!9601 (_1!9541 lt!323581)))))))

(declare-fun lt!323591 () Unit!14760)

(declare-fun lt!323583 () BitStream!8274)

(declare-fun readBitPrefixLemma!0 (BitStream!8274 BitStream!8274) Unit!14760)

(assert (=> b!207323 (= lt!323591 (readBitPrefixLemma!0 lt!323583 (_2!9540 lt!323580)))))

(assert (=> b!207323 (= lt!323581 (readBitPure!0 (BitStream!8275 (buf!5088 (_2!9540 lt!323580)) (currentByte!9606 thiss!1204) (currentBit!9601 thiss!1204))))))

(assert (=> b!207323 (= lt!323594 (readBitPure!0 lt!323583))))

(assert (=> b!207323 e!141707))

(declare-fun res!173915 () Bool)

(assert (=> b!207323 (=> (not res!173915) (not e!141707))))

(assert (=> b!207323 (= res!173915 (invariant!0 (currentBit!9601 thiss!1204) (currentByte!9606 thiss!1204) (size!4583 (buf!5088 (_2!9540 lt!323585)))))))

(assert (=> b!207323 (= lt!323583 (BitStream!8275 (buf!5088 (_2!9540 lt!323585)) (currentByte!9606 thiss!1204) (currentBit!9601 thiss!1204)))))

(declare-fun b!207324 () Bool)

(assert (=> b!207324 (= e!141715 e!141717)))

(declare-fun res!173927 () Bool)

(assert (=> b!207324 (=> (not res!173927) (not e!141717))))

(assert (=> b!207324 (= res!173927 (and (= (_2!9541 lt!323597) lt!323596) (= (_1!9541 lt!323597) (_2!9540 lt!323585))))))

(declare-fun readerFrom!0 (BitStream!8274 (_ BitVec 32) (_ BitVec 32)) BitStream!8274)

(assert (=> b!207324 (= lt!323597 (readBitPure!0 (readerFrom!0 (_2!9540 lt!323585) (currentBit!9601 thiss!1204) (currentByte!9606 thiss!1204))))))

(assert (= (and start!43640 res!173929) b!207318))

(assert (= (and b!207318 res!173920) b!207308))

(assert (= (and b!207308 res!173916) b!207321))

(assert (= (and b!207321 res!173926) b!207315))

(assert (= (and b!207315 res!173923) b!207320))

(assert (= (and b!207320 res!173921) b!207311))

(assert (= (and b!207311 res!173918) b!207324))

(assert (= (and b!207324 res!173927) b!207322))

(assert (= (and b!207315 (not res!173930)) b!207314))

(assert (= (and b!207314 (not res!173922)) b!207309))

(assert (= (and b!207309 (not res!173919)) b!207319))

(assert (= (and b!207319 (not res!173928)) b!207317))

(assert (= (and b!207317 (not res!173924)) b!207312))

(assert (= (and b!207312 (not res!173925)) b!207323))

(assert (= (and b!207323 res!173915) b!207310))

(assert (= (and b!207323 res!173917) b!207313))

(assert (= start!43640 b!207316))

(declare-fun m!319025 () Bool)

(assert (=> b!207309 m!319025))

(declare-fun m!319027 () Bool)

(assert (=> b!207308 m!319027))

(declare-fun m!319029 () Bool)

(assert (=> start!43640 m!319029))

(declare-fun m!319031 () Bool)

(assert (=> b!207323 m!319031))

(declare-fun m!319033 () Bool)

(assert (=> b!207323 m!319033))

(declare-fun m!319035 () Bool)

(assert (=> b!207323 m!319035))

(declare-fun m!319037 () Bool)

(assert (=> b!207323 m!319037))

(declare-fun m!319039 () Bool)

(assert (=> b!207323 m!319039))

(declare-fun m!319041 () Bool)

(assert (=> b!207323 m!319041))

(declare-fun m!319043 () Bool)

(assert (=> b!207323 m!319043))

(declare-fun m!319045 () Bool)

(assert (=> b!207323 m!319045))

(declare-fun m!319047 () Bool)

(assert (=> b!207323 m!319047))

(declare-fun m!319049 () Bool)

(assert (=> b!207323 m!319049))

(declare-fun m!319051 () Bool)

(assert (=> b!207323 m!319051))

(declare-fun m!319053 () Bool)

(assert (=> b!207323 m!319053))

(declare-fun m!319055 () Bool)

(assert (=> b!207323 m!319055))

(declare-fun m!319057 () Bool)

(assert (=> b!207322 m!319057))

(declare-fun m!319059 () Bool)

(assert (=> b!207314 m!319059))

(declare-fun m!319061 () Bool)

(assert (=> b!207314 m!319061))

(declare-fun m!319063 () Bool)

(assert (=> b!207314 m!319063))

(declare-fun m!319065 () Bool)

(assert (=> b!207314 m!319065))

(declare-fun m!319067 () Bool)

(assert (=> b!207324 m!319067))

(assert (=> b!207324 m!319067))

(declare-fun m!319069 () Bool)

(assert (=> b!207324 m!319069))

(declare-fun m!319071 () Bool)

(assert (=> b!207311 m!319071))

(assert (=> b!207312 m!319071))

(declare-fun m!319073 () Bool)

(assert (=> b!207320 m!319073))

(declare-fun m!319075 () Bool)

(assert (=> b!207320 m!319075))

(declare-fun m!319077 () Bool)

(assert (=> b!207310 m!319077))

(declare-fun m!319079 () Bool)

(assert (=> b!207318 m!319079))

(assert (=> b!207315 m!319073))

(assert (=> b!207315 m!319075))

(declare-fun m!319081 () Bool)

(assert (=> b!207315 m!319081))

(declare-fun m!319083 () Bool)

(assert (=> b!207317 m!319083))

(declare-fun m!319085 () Bool)

(assert (=> b!207316 m!319085))

(check-sat (not b!207311) (not b!207316) (not b!207318) (not b!207317) (not b!207323) (not b!207315) (not start!43640) (not b!207310) (not b!207320) (not b!207322) (not b!207324) (not b!207308) (not b!207314) (not b!207312) (not b!207309))
(check-sat)

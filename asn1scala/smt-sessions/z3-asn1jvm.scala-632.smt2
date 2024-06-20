; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17838 () Bool)

(assert start!17838)

(declare-fun b!86857 () Bool)

(declare-fun res!71407 () Bool)

(declare-fun e!57671 () Bool)

(assert (=> b!86857 (=> (not res!71407) (not e!57671))))

(declare-datatypes ((array!4106 0))(
  ( (array!4107 (arr!2491 (Array (_ BitVec 32) (_ BitVec 8))) (size!1854 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3270 0))(
  ( (BitStream!3271 (buf!2244 array!4106) (currentByte!4459 (_ BitVec 32)) (currentBit!4454 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3270)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86857 (= res!71407 (invariant!0 (currentBit!4454 thiss!1151) (currentByte!4459 thiss!1151) (size!1854 (buf!2244 thiss!1151))))))

(declare-fun b!86858 () Bool)

(declare-fun res!71406 () Bool)

(declare-fun e!57664 () Bool)

(assert (=> b!86858 (=> res!71406 e!57664)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86858 (= res!71406 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86859 () Bool)

(declare-fun e!57668 () Bool)

(assert (=> b!86859 (= e!57671 e!57668)))

(declare-fun res!71399 () Bool)

(assert (=> b!86859 (=> (not res!71399) (not e!57668))))

(declare-fun lt!135432 () (_ BitVec 64))

(declare-fun lt!135434 () (_ BitVec 64))

(assert (=> b!86859 (= res!71399 (= lt!135432 (bvadd lt!135434 ((_ sign_extend 32) i!576))))))

(declare-fun thiss!1152 () BitStream!3270)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86859 (= lt!135432 (bitIndex!0 (size!1854 (buf!2244 thiss!1152)) (currentByte!4459 thiss!1152) (currentBit!4454 thiss!1152)))))

(assert (=> b!86859 (= lt!135434 (bitIndex!0 (size!1854 (buf!2244 thiss!1151)) (currentByte!4459 thiss!1151) (currentBit!4454 thiss!1151)))))

(declare-fun b!86860 () Bool)

(declare-fun e!57666 () Bool)

(declare-fun array_inv!1700 (array!4106) Bool)

(assert (=> b!86860 (= e!57666 (array_inv!1700 (buf!2244 thiss!1152)))))

(declare-fun b!86861 () Bool)

(declare-fun res!71392 () Bool)

(declare-fun e!57662 () Bool)

(assert (=> b!86861 (=> res!71392 e!57662)))

(declare-datatypes ((Unit!5727 0))(
  ( (Unit!5728) )
))
(declare-datatypes ((tuple3!408 0))(
  ( (tuple3!409 (_1!3904 Unit!5727) (_2!3904 BitStream!3270) (_3!228 (_ BitVec 32))) )
))
(declare-fun lt!135431 () tuple3!408)

(assert (=> b!86861 (= res!71392 (or (bvsgt (_3!228 lt!135431) nBits!336) (not (= (size!1854 (buf!2244 (_2!3904 lt!135431))) (size!1854 (buf!2244 thiss!1151))))))))

(declare-fun b!86862 () Bool)

(declare-fun e!57672 () Bool)

(assert (=> b!86862 (= e!57672 (array_inv!1700 (buf!2244 thiss!1151)))))

(declare-fun b!86864 () Bool)

(assert (=> b!86864 (= e!57668 (not e!57664))))

(declare-fun res!71388 () Bool)

(assert (=> b!86864 (=> res!71388 e!57664)))

(declare-datatypes ((tuple2!7352 0))(
  ( (tuple2!7353 (_1!3905 Unit!5727) (_2!3905 BitStream!3270)) )
))
(declare-fun lt!135430 () tuple2!7352)

(assert (=> b!86864 (= res!71388 (not (invariant!0 (currentBit!4454 (_2!3905 lt!135430)) (currentByte!4459 (_2!3905 lt!135430)) (size!1854 (buf!2244 (_2!3905 lt!135430))))))))

(declare-fun e!57667 () Bool)

(assert (=> b!86864 e!57667))

(declare-fun res!71396 () Bool)

(assert (=> b!86864 (=> (not res!71396) (not e!57667))))

(assert (=> b!86864 (= res!71396 (= (size!1854 (buf!2244 thiss!1152)) (size!1854 (buf!2244 (_2!3905 lt!135430)))))))

(declare-fun lt!135435 () Bool)

(declare-fun appendBit!0 (BitStream!3270 Bool) tuple2!7352)

(assert (=> b!86864 (= lt!135430 (appendBit!0 thiss!1152 lt!135435))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86864 (= lt!135435 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86865 () Bool)

(declare-fun e!57663 () Bool)

(declare-datatypes ((tuple2!7354 0))(
  ( (tuple2!7355 (_1!3906 BitStream!3270) (_2!3906 Bool)) )
))
(declare-fun lt!135429 () tuple2!7354)

(declare-fun lt!135433 () (_ BitVec 64))

(assert (=> b!86865 (= e!57663 (= (bitIndex!0 (size!1854 (buf!2244 (_1!3906 lt!135429))) (currentByte!4459 (_1!3906 lt!135429)) (currentBit!4454 (_1!3906 lt!135429))) lt!135433))))

(declare-fun b!86866 () Bool)

(declare-fun e!57669 () Bool)

(assert (=> b!86866 (= e!57669 e!57663)))

(declare-fun res!71401 () Bool)

(assert (=> b!86866 (=> (not res!71401) (not e!57663))))

(assert (=> b!86866 (= res!71401 (and (= (_2!3906 lt!135429) lt!135435) (= (_1!3906 lt!135429) (_2!3905 lt!135430))))))

(declare-fun readBitPure!0 (BitStream!3270) tuple2!7354)

(declare-fun readerFrom!0 (BitStream!3270 (_ BitVec 32) (_ BitVec 32)) BitStream!3270)

(assert (=> b!86866 (= lt!135429 (readBitPure!0 (readerFrom!0 (_2!3905 lt!135430) (currentBit!4454 thiss!1152) (currentByte!4459 thiss!1152))))))

(declare-fun b!86867 () Bool)

(declare-fun res!71391 () Bool)

(assert (=> b!86867 (=> (not res!71391) (not e!57671))))

(assert (=> b!86867 (= res!71391 (and (bvsle i!576 nBits!336) (= (size!1854 (buf!2244 thiss!1152)) (size!1854 (buf!2244 thiss!1151)))))))

(declare-fun b!86868 () Bool)

(declare-fun res!71390 () Bool)

(assert (=> b!86868 (=> (not res!71390) (not e!57668))))

(assert (=> b!86868 (= res!71390 (bvslt i!576 nBits!336))))

(declare-fun b!86869 () Bool)

(assert (=> b!86869 (= e!57662 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4454 (_2!3904 lt!135431)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4459 (_2!3904 lt!135431)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1854 (buf!2244 (_2!3904 lt!135431)))))))))

(declare-fun b!86870 () Bool)

(declare-fun res!71404 () Bool)

(assert (=> b!86870 (=> (not res!71404) (not e!57671))))

(assert (=> b!86870 (= res!71404 (invariant!0 (currentBit!4454 thiss!1152) (currentByte!4459 thiss!1152) (size!1854 (buf!2244 thiss!1152))))))

(declare-fun b!86871 () Bool)

(assert (=> b!86871 (= e!57664 e!57662)))

(declare-fun res!71397 () Bool)

(assert (=> b!86871 (=> res!71397 e!57662)))

(assert (=> b!86871 (= res!71397 (bvslt (_3!228 lt!135431) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3270 (_ BitVec 64) BitStream!3270 (_ BitVec 32)) tuple3!408)

(assert (=> b!86871 (= lt!135431 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3905 lt!135430) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86872 () Bool)

(assert (=> b!86872 (= e!57667 e!57669)))

(declare-fun res!71393 () Bool)

(assert (=> b!86872 (=> (not res!71393) (not e!57669))))

(assert (=> b!86872 (= res!71393 (= lt!135433 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135432)))))

(assert (=> b!86872 (= lt!135433 (bitIndex!0 (size!1854 (buf!2244 (_2!3905 lt!135430))) (currentByte!4459 (_2!3905 lt!135430)) (currentBit!4454 (_2!3905 lt!135430))))))

(declare-fun b!86873 () Bool)

(declare-fun res!71394 () Bool)

(assert (=> b!86873 (=> res!71394 e!57662)))

(assert (=> b!86873 (= res!71394 (not (invariant!0 (currentBit!4454 (_2!3904 lt!135431)) (currentByte!4459 (_2!3904 lt!135431)) (size!1854 (buf!2244 (_2!3904 lt!135431))))))))

(declare-fun b!86874 () Bool)

(declare-fun res!71402 () Bool)

(assert (=> b!86874 (=> (not res!71402) (not e!57671))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86874 (= res!71402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1854 (buf!2244 thiss!1151))) ((_ sign_extend 32) (currentByte!4459 thiss!1151)) ((_ sign_extend 32) (currentBit!4454 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86875 () Bool)

(declare-fun res!71400 () Bool)

(assert (=> b!86875 (=> res!71400 e!57662)))

(assert (=> b!86875 (= res!71400 (not (= (bitIndex!0 (size!1854 (buf!2244 (_2!3904 lt!135431))) (currentByte!4459 (_2!3904 lt!135431)) (currentBit!4454 (_2!3904 lt!135431))) (bvadd lt!135434 ((_ sign_extend 32) (_3!228 lt!135431))))))))

(declare-fun b!86876 () Bool)

(declare-fun res!71389 () Bool)

(assert (=> b!86876 (=> (not res!71389) (not e!57671))))

(assert (=> b!86876 (= res!71389 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86863 () Bool)

(declare-fun res!71403 () Bool)

(assert (=> b!86863 (=> (not res!71403) (not e!57669))))

(declare-fun isPrefixOf!0 (BitStream!3270 BitStream!3270) Bool)

(assert (=> b!86863 (= res!71403 (isPrefixOf!0 thiss!1152 (_2!3905 lt!135430)))))

(declare-fun res!71398 () Bool)

(assert (=> start!17838 (=> (not res!71398) (not e!57671))))

(assert (=> start!17838 (= res!71398 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17838 e!57671))

(declare-fun inv!12 (BitStream!3270) Bool)

(assert (=> start!17838 (and (inv!12 thiss!1152) e!57666)))

(assert (=> start!17838 (and (inv!12 thiss!1151) e!57672)))

(assert (=> start!17838 true))

(declare-fun b!86877 () Bool)

(declare-fun res!71395 () Bool)

(assert (=> b!86877 (=> (not res!71395) (not e!57668))))

(assert (=> b!86877 (= res!71395 (validate_offset_bits!1 ((_ sign_extend 32) (size!1854 (buf!2244 thiss!1152))) ((_ sign_extend 32) (currentByte!4459 thiss!1152)) ((_ sign_extend 32) (currentBit!4454 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86878 () Bool)

(declare-fun res!71405 () Bool)

(assert (=> b!86878 (=> res!71405 e!57662)))

(assert (=> b!86878 (= res!71405 (or (bvsgt ((_ sign_extend 32) (size!1854 (buf!2244 (_2!3904 lt!135431)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4459 (_2!3904 lt!135431))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4454 (_2!3904 lt!135431))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1854 (buf!2244 (_2!3904 lt!135431)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4459 (_2!3904 lt!135431))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4454 (_2!3904 lt!135431))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!17838 res!71398) b!86874))

(assert (= (and b!86874 res!71402) b!86857))

(assert (= (and b!86857 res!71407) b!86876))

(assert (= (and b!86876 res!71389) b!86870))

(assert (= (and b!86870 res!71404) b!86867))

(assert (= (and b!86867 res!71391) b!86859))

(assert (= (and b!86859 res!71399) b!86877))

(assert (= (and b!86877 res!71395) b!86868))

(assert (= (and b!86868 res!71390) b!86864))

(assert (= (and b!86864 res!71396) b!86872))

(assert (= (and b!86872 res!71393) b!86863))

(assert (= (and b!86863 res!71403) b!86866))

(assert (= (and b!86866 res!71401) b!86865))

(assert (= (and b!86864 (not res!71388)) b!86858))

(assert (= (and b!86858 (not res!71406)) b!86871))

(assert (= (and b!86871 (not res!71397)) b!86873))

(assert (= (and b!86873 (not res!71394)) b!86861))

(assert (= (and b!86861 (not res!71392)) b!86875))

(assert (= (and b!86875 (not res!71400)) b!86878))

(assert (= (and b!86878 (not res!71405)) b!86869))

(assert (= start!17838 b!86860))

(assert (= start!17838 b!86862))

(declare-fun m!132533 () Bool)

(assert (=> b!86862 m!132533))

(declare-fun m!132535 () Bool)

(assert (=> b!86874 m!132535))

(declare-fun m!132537 () Bool)

(assert (=> b!86875 m!132537))

(declare-fun m!132539 () Bool)

(assert (=> b!86857 m!132539))

(declare-fun m!132541 () Bool)

(assert (=> start!17838 m!132541))

(declare-fun m!132543 () Bool)

(assert (=> start!17838 m!132543))

(declare-fun m!132545 () Bool)

(assert (=> b!86877 m!132545))

(declare-fun m!132547 () Bool)

(assert (=> b!86859 m!132547))

(declare-fun m!132549 () Bool)

(assert (=> b!86859 m!132549))

(declare-fun m!132551 () Bool)

(assert (=> b!86873 m!132551))

(declare-fun m!132553 () Bool)

(assert (=> b!86872 m!132553))

(declare-fun m!132555 () Bool)

(assert (=> b!86860 m!132555))

(declare-fun m!132557 () Bool)

(assert (=> b!86866 m!132557))

(assert (=> b!86866 m!132557))

(declare-fun m!132559 () Bool)

(assert (=> b!86866 m!132559))

(declare-fun m!132561 () Bool)

(assert (=> b!86863 m!132561))

(declare-fun m!132563 () Bool)

(assert (=> b!86870 m!132563))

(declare-fun m!132565 () Bool)

(assert (=> b!86869 m!132565))

(declare-fun m!132567 () Bool)

(assert (=> b!86864 m!132567))

(declare-fun m!132569 () Bool)

(assert (=> b!86864 m!132569))

(declare-fun m!132571 () Bool)

(assert (=> b!86871 m!132571))

(declare-fun m!132573 () Bool)

(assert (=> b!86865 m!132573))

(check-sat (not b!86872) (not b!86859) (not b!86870) (not b!86871) (not b!86869) (not b!86874) (not b!86863) (not b!86865) (not b!86873) (not b!86862) (not b!86864) (not b!86875) (not b!86860) (not b!86857) (not b!86866) (not b!86877) (not start!17838))

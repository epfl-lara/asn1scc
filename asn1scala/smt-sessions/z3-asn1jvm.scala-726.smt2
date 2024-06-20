; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20334 () Bool)

(assert start!20334)

(declare-fun b!101990 () Bool)

(declare-fun e!66684 () Bool)

(declare-fun e!66679 () Bool)

(assert (=> b!101990 (= e!66684 e!66679)))

(declare-fun res!83828 () Bool)

(assert (=> b!101990 (=> (not res!83828) (not e!66679))))

(declare-datatypes ((array!4778 0))(
  ( (array!4779 (arr!2773 (Array (_ BitVec 32) (_ BitVec 8))) (size!2180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3834 0))(
  ( (BitStream!3835 (buf!2540 array!4778) (currentByte!5013 (_ BitVec 32)) (currentBit!5008 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3834)

(declare-fun lt!148402 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101990 (= res!83828 (validate_offset_bits!1 ((_ sign_extend 32) (size!2180 (buf!2540 thiss!1305))) ((_ sign_extend 32) (currentByte!5013 thiss!1305)) ((_ sign_extend 32) (currentBit!5008 thiss!1305)) lt!148402))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!101990 (= lt!148402 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!101991 () Bool)

(declare-fun res!83824 () Bool)

(declare-fun e!66675 () Bool)

(assert (=> b!101991 (=> (not res!83824) (not e!66675))))

(declare-datatypes ((Unit!6256 0))(
  ( (Unit!6257) )
))
(declare-datatypes ((tuple2!8272 0))(
  ( (tuple2!8273 (_1!4391 Unit!6256) (_2!4391 BitStream!3834)) )
))
(declare-fun lt!148396 () tuple2!8272)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101991 (= res!83824 (invariant!0 (currentBit!5008 thiss!1305) (currentByte!5013 thiss!1305) (size!2180 (buf!2540 (_2!4391 lt!148396)))))))

(declare-fun b!101993 () Bool)

(declare-fun e!66676 () Bool)

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!148390 () (_ BitVec 64))

(assert (=> b!101993 (= e!66676 (= (bvand (bvand v!199 (bvnot lt!148390)) lt!148390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101994 () Bool)

(assert (=> b!101994 (= e!66679 (not e!66676))))

(declare-fun res!83821 () Bool)

(assert (=> b!101994 (=> res!83821 e!66676)))

(declare-datatypes ((tuple2!8274 0))(
  ( (tuple2!8275 (_1!4392 BitStream!3834) (_2!4392 BitStream!3834)) )
))
(declare-fun lt!148388 () tuple2!8274)

(assert (=> b!101994 (= res!83821 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2180 (buf!2540 (_1!4392 lt!148388)))) ((_ sign_extend 32) (currentByte!5013 (_1!4392 lt!148388))) ((_ sign_extend 32) (currentBit!5008 (_1!4392 lt!148388))) lt!148402)))))

(declare-fun lt!148399 () tuple2!8272)

(assert (=> b!101994 (validate_offset_bits!1 ((_ sign_extend 32) (size!2180 (buf!2540 (_2!4391 lt!148399)))) ((_ sign_extend 32) (currentByte!5013 thiss!1305)) ((_ sign_extend 32) (currentBit!5008 thiss!1305)) lt!148402)))

(declare-fun lt!148391 () Unit!6256)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3834 array!4778 (_ BitVec 64)) Unit!6256)

(assert (=> b!101994 (= lt!148391 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2540 (_2!4391 lt!148399)) lt!148402))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101994 (= lt!148390 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!148393 () Bool)

(declare-datatypes ((tuple2!8276 0))(
  ( (tuple2!8277 (_1!4393 BitStream!3834) (_2!4393 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3834) tuple2!8276)

(assert (=> b!101994 (= (_2!4393 (readBitPure!0 (_1!4392 lt!148388))) lt!148393)))

(declare-fun lt!148394 () tuple2!8274)

(declare-fun reader!0 (BitStream!3834 BitStream!3834) tuple2!8274)

(assert (=> b!101994 (= lt!148394 (reader!0 (_2!4391 lt!148396) (_2!4391 lt!148399)))))

(assert (=> b!101994 (= lt!148388 (reader!0 thiss!1305 (_2!4391 lt!148399)))))

(declare-fun e!66681 () Bool)

(assert (=> b!101994 e!66681))

(declare-fun res!83820 () Bool)

(assert (=> b!101994 (=> (not res!83820) (not e!66681))))

(declare-fun lt!148387 () tuple2!8276)

(declare-fun lt!148398 () tuple2!8276)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101994 (= res!83820 (= (bitIndex!0 (size!2180 (buf!2540 (_1!4393 lt!148387))) (currentByte!5013 (_1!4393 lt!148387)) (currentBit!5008 (_1!4393 lt!148387))) (bitIndex!0 (size!2180 (buf!2540 (_1!4393 lt!148398))) (currentByte!5013 (_1!4393 lt!148398)) (currentBit!5008 (_1!4393 lt!148398)))))))

(declare-fun lt!148392 () Unit!6256)

(declare-fun lt!148395 () BitStream!3834)

(declare-fun readBitPrefixLemma!0 (BitStream!3834 BitStream!3834) Unit!6256)

(assert (=> b!101994 (= lt!148392 (readBitPrefixLemma!0 lt!148395 (_2!4391 lt!148399)))))

(assert (=> b!101994 (= lt!148398 (readBitPure!0 (BitStream!3835 (buf!2540 (_2!4391 lt!148399)) (currentByte!5013 thiss!1305) (currentBit!5008 thiss!1305))))))

(assert (=> b!101994 (= lt!148387 (readBitPure!0 lt!148395))))

(assert (=> b!101994 (= lt!148395 (BitStream!3835 (buf!2540 (_2!4391 lt!148396)) (currentByte!5013 thiss!1305) (currentBit!5008 thiss!1305)))))

(assert (=> b!101994 e!66675))

(declare-fun res!83829 () Bool)

(assert (=> b!101994 (=> (not res!83829) (not e!66675))))

(declare-fun isPrefixOf!0 (BitStream!3834 BitStream!3834) Bool)

(assert (=> b!101994 (= res!83829 (isPrefixOf!0 thiss!1305 (_2!4391 lt!148399)))))

(declare-fun lt!148397 () Unit!6256)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3834 BitStream!3834 BitStream!3834) Unit!6256)

(assert (=> b!101994 (= lt!148397 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4391 lt!148396) (_2!4391 lt!148399)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3834 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8272)

(assert (=> b!101994 (= lt!148399 (appendNLeastSignificantBitsLoop!0 (_2!4391 lt!148396) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66677 () Bool)

(assert (=> b!101994 e!66677))

(declare-fun res!83822 () Bool)

(assert (=> b!101994 (=> (not res!83822) (not e!66677))))

(assert (=> b!101994 (= res!83822 (= (size!2180 (buf!2540 thiss!1305)) (size!2180 (buf!2540 (_2!4391 lt!148396)))))))

(declare-fun appendBit!0 (BitStream!3834 Bool) tuple2!8272)

(assert (=> b!101994 (= lt!148396 (appendBit!0 thiss!1305 lt!148393))))

(assert (=> b!101994 (= lt!148393 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101995 () Bool)

(assert (=> b!101995 (= e!66675 (invariant!0 (currentBit!5008 thiss!1305) (currentByte!5013 thiss!1305) (size!2180 (buf!2540 (_2!4391 lt!148399)))))))

(declare-fun b!101996 () Bool)

(declare-fun e!66682 () Bool)

(declare-fun array_inv!1982 (array!4778) Bool)

(assert (=> b!101996 (= e!66682 (array_inv!1982 (buf!2540 thiss!1305)))))

(declare-fun b!101997 () Bool)

(declare-fun e!66680 () Bool)

(declare-fun e!66683 () Bool)

(assert (=> b!101997 (= e!66680 e!66683)))

(declare-fun res!83831 () Bool)

(assert (=> b!101997 (=> (not res!83831) (not e!66683))))

(declare-fun lt!148401 () tuple2!8276)

(assert (=> b!101997 (= res!83831 (and (= (_2!4393 lt!148401) lt!148393) (= (_1!4393 lt!148401) (_2!4391 lt!148396))))))

(declare-fun readerFrom!0 (BitStream!3834 (_ BitVec 32) (_ BitVec 32)) BitStream!3834)

(assert (=> b!101997 (= lt!148401 (readBitPure!0 (readerFrom!0 (_2!4391 lt!148396) (currentBit!5008 thiss!1305) (currentByte!5013 thiss!1305))))))

(declare-fun b!101998 () Bool)

(declare-fun res!83827 () Bool)

(assert (=> b!101998 (=> (not res!83827) (not e!66679))))

(assert (=> b!101998 (= res!83827 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101999 () Bool)

(declare-fun res!83830 () Bool)

(assert (=> b!101999 (=> (not res!83830) (not e!66679))))

(assert (=> b!101999 (= res!83830 (bvslt i!615 nBits!396))))

(declare-fun b!102000 () Bool)

(declare-fun res!83826 () Bool)

(assert (=> b!102000 (=> (not res!83826) (not e!66680))))

(assert (=> b!102000 (= res!83826 (isPrefixOf!0 thiss!1305 (_2!4391 lt!148396)))))

(declare-fun b!101992 () Bool)

(assert (=> b!101992 (= e!66677 e!66680)))

(declare-fun res!83825 () Bool)

(assert (=> b!101992 (=> (not res!83825) (not e!66680))))

(declare-fun lt!148389 () (_ BitVec 64))

(declare-fun lt!148400 () (_ BitVec 64))

(assert (=> b!101992 (= res!83825 (= lt!148389 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148400)))))

(assert (=> b!101992 (= lt!148389 (bitIndex!0 (size!2180 (buf!2540 (_2!4391 lt!148396))) (currentByte!5013 (_2!4391 lt!148396)) (currentBit!5008 (_2!4391 lt!148396))))))

(assert (=> b!101992 (= lt!148400 (bitIndex!0 (size!2180 (buf!2540 thiss!1305)) (currentByte!5013 thiss!1305) (currentBit!5008 thiss!1305)))))

(declare-fun res!83823 () Bool)

(assert (=> start!20334 (=> (not res!83823) (not e!66684))))

(assert (=> start!20334 (= res!83823 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20334 e!66684))

(assert (=> start!20334 true))

(declare-fun inv!12 (BitStream!3834) Bool)

(assert (=> start!20334 (and (inv!12 thiss!1305) e!66682)))

(declare-fun b!102001 () Bool)

(assert (=> b!102001 (= e!66681 (= (_2!4393 lt!148387) (_2!4393 lt!148398)))))

(declare-fun b!102002 () Bool)

(assert (=> b!102002 (= e!66683 (= (bitIndex!0 (size!2180 (buf!2540 (_1!4393 lt!148401))) (currentByte!5013 (_1!4393 lt!148401)) (currentBit!5008 (_1!4393 lt!148401))) lt!148389))))

(assert (= (and start!20334 res!83823) b!101990))

(assert (= (and b!101990 res!83828) b!101998))

(assert (= (and b!101998 res!83827) b!101999))

(assert (= (and b!101999 res!83830) b!101994))

(assert (= (and b!101994 res!83822) b!101992))

(assert (= (and b!101992 res!83825) b!102000))

(assert (= (and b!102000 res!83826) b!101997))

(assert (= (and b!101997 res!83831) b!102002))

(assert (= (and b!101994 res!83829) b!101991))

(assert (= (and b!101991 res!83824) b!101995))

(assert (= (and b!101994 res!83820) b!102001))

(assert (= (and b!101994 (not res!83821)) b!101993))

(assert (= start!20334 b!101996))

(declare-fun m!148491 () Bool)

(assert (=> b!102000 m!148491))

(declare-fun m!148493 () Bool)

(assert (=> b!101991 m!148493))

(declare-fun m!148495 () Bool)

(assert (=> b!101997 m!148495))

(assert (=> b!101997 m!148495))

(declare-fun m!148497 () Bool)

(assert (=> b!101997 m!148497))

(declare-fun m!148499 () Bool)

(assert (=> start!20334 m!148499))

(declare-fun m!148501 () Bool)

(assert (=> b!101996 m!148501))

(declare-fun m!148503 () Bool)

(assert (=> b!101992 m!148503))

(declare-fun m!148505 () Bool)

(assert (=> b!101992 m!148505))

(declare-fun m!148507 () Bool)

(assert (=> b!101998 m!148507))

(declare-fun m!148509 () Bool)

(assert (=> b!101995 m!148509))

(declare-fun m!148511 () Bool)

(assert (=> b!102002 m!148511))

(declare-fun m!148513 () Bool)

(assert (=> b!101990 m!148513))

(declare-fun m!148515 () Bool)

(assert (=> b!101994 m!148515))

(declare-fun m!148517 () Bool)

(assert (=> b!101994 m!148517))

(declare-fun m!148519 () Bool)

(assert (=> b!101994 m!148519))

(declare-fun m!148521 () Bool)

(assert (=> b!101994 m!148521))

(declare-fun m!148523 () Bool)

(assert (=> b!101994 m!148523))

(declare-fun m!148525 () Bool)

(assert (=> b!101994 m!148525))

(declare-fun m!148527 () Bool)

(assert (=> b!101994 m!148527))

(declare-fun m!148529 () Bool)

(assert (=> b!101994 m!148529))

(declare-fun m!148531 () Bool)

(assert (=> b!101994 m!148531))

(declare-fun m!148533 () Bool)

(assert (=> b!101994 m!148533))

(declare-fun m!148535 () Bool)

(assert (=> b!101994 m!148535))

(declare-fun m!148537 () Bool)

(assert (=> b!101994 m!148537))

(declare-fun m!148539 () Bool)

(assert (=> b!101994 m!148539))

(declare-fun m!148541 () Bool)

(assert (=> b!101994 m!148541))

(declare-fun m!148543 () Bool)

(assert (=> b!101994 m!148543))

(declare-fun m!148545 () Bool)

(assert (=> b!101994 m!148545))

(check-sat (not b!101990) (not b!101991) (not b!101997) (not start!20334) (not b!101998) (not b!101992) (not b!102002) (not b!101995) (not b!101994) (not b!102000) (not b!101996))

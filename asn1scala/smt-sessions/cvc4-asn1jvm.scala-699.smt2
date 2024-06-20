; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19642 () Bool)

(assert start!19642)

(declare-fun b!98056 () Bool)

(declare-fun res!80446 () Bool)

(declare-fun e!64182 () Bool)

(assert (=> b!98056 (=> (not res!80446) (not e!64182))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98056 (= res!80446 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98057 () Bool)

(declare-fun lt!142065 () (_ BitVec 64))

(declare-fun lt!142066 () (_ BitVec 64))

(assert (=> b!98057 (= e!64182 (and (= lt!142066 (bvand ((_ sign_extend 32) nBits!388) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!142066 (bvand (bvadd lt!142065 ((_ sign_extend 32) nBits!388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!98057 (= lt!142066 (bvand lt!142065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!4595 0))(
  ( (array!4596 (arr!2693 (Array (_ BitVec 32) (_ BitVec 8))) (size!2100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3674 0))(
  ( (BitStream!3675 (buf!2451 array!4595) (currentByte!4875 (_ BitVec 32)) (currentBit!4870 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3674)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98057 (= lt!142065 (bitIndex!0 (size!2100 (buf!2451 thiss!1288)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)))))

(declare-fun b!98058 () Bool)

(declare-fun res!80447 () Bool)

(assert (=> b!98058 (=> (not res!80447) (not e!64182))))

(declare-datatypes ((Unit!5991 0))(
  ( (Unit!5992) )
))
(declare-datatypes ((tuple2!7880 0))(
  ( (tuple2!7881 (_1!4192 Unit!5991) (_2!4192 BitStream!3674)) )
))
(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7880)

(assert (=> b!98058 (= res!80447 (= (size!2100 (buf!2451 thiss!1288)) (size!2100 (buf!2451 (_2!4192 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))))))

(declare-fun b!98059 () Bool)

(declare-fun res!80444 () Bool)

(assert (=> b!98059 (=> (not res!80444) (not e!64182))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98059 (= res!80444 (validate_offset_bits!1 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98060 () Bool)

(declare-fun e!64181 () Bool)

(declare-fun array_inv!1902 (array!4595) Bool)

(assert (=> b!98060 (= e!64181 (array_inv!1902 (buf!2451 thiss!1288)))))

(declare-fun res!80445 () Bool)

(assert (=> start!19642 (=> (not res!80445) (not e!64182))))

(assert (=> start!19642 (= res!80445 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19642 e!64182))

(assert (=> start!19642 true))

(declare-fun inv!12 (BitStream!3674) Bool)

(assert (=> start!19642 (and (inv!12 thiss!1288) e!64181)))

(assert (= (and start!19642 res!80445) b!98059))

(assert (= (and b!98059 res!80444) b!98056))

(assert (= (and b!98056 res!80446) b!98058))

(assert (= (and b!98058 res!80447) b!98057))

(assert (= start!19642 b!98060))

(declare-fun m!142489 () Bool)

(assert (=> b!98059 m!142489))

(declare-fun m!142491 () Bool)

(assert (=> b!98056 m!142491))

(declare-fun m!142493 () Bool)

(assert (=> b!98057 m!142493))

(declare-fun m!142495 () Bool)

(assert (=> b!98058 m!142495))

(declare-fun m!142497 () Bool)

(assert (=> b!98060 m!142497))

(declare-fun m!142499 () Bool)

(assert (=> start!19642 m!142499))

(push 1)

(assert (not b!98058))

(assert (not b!98060))

(assert (not start!19642))

(assert (not b!98057))

(assert (not b!98059))

(assert (not b!98056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30764 () Bool)

(declare-fun e!64191 () Bool)

(assert (=> d!30764 e!64191))

(declare-fun res!80464 () Bool)

(assert (=> d!30764 (=> (not res!80464) (not e!64191))))

(declare-fun lt!142119 () (_ BitVec 64))

(declare-fun lt!142116 () (_ BitVec 64))

(declare-fun lt!142117 () (_ BitVec 64))

(assert (=> d!30764 (= res!80464 (= lt!142117 (bvsub lt!142119 lt!142116)))))

(assert (=> d!30764 (or (= (bvand lt!142119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142119 lt!142116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30764 (= lt!142116 (remainingBits!0 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288))))))

(declare-fun lt!142118 () (_ BitVec 64))

(declare-fun lt!142120 () (_ BitVec 64))

(assert (=> d!30764 (= lt!142119 (bvmul lt!142118 lt!142120))))

(assert (=> d!30764 (or (= lt!142118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142120 (bvsdiv (bvmul lt!142118 lt!142120) lt!142118)))))

(assert (=> d!30764 (= lt!142120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30764 (= lt!142118 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))))))

(assert (=> d!30764 (= lt!142117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4875 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4870 thiss!1288))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30764 (invariant!0 (currentBit!4870 thiss!1288) (currentByte!4875 thiss!1288) (size!2100 (buf!2451 thiss!1288)))))

(assert (=> d!30764 (= (bitIndex!0 (size!2100 (buf!2451 thiss!1288)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)) lt!142117)))

(declare-fun b!98077 () Bool)

(declare-fun res!80465 () Bool)

(assert (=> b!98077 (=> (not res!80465) (not e!64191))))

(assert (=> b!98077 (= res!80465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142117))))

(declare-fun b!98078 () Bool)

(declare-fun lt!142115 () (_ BitVec 64))

(assert (=> b!98078 (= e!64191 (bvsle lt!142117 (bvmul lt!142115 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98078 (or (= lt!142115 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142115 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142115)))))

(assert (=> b!98078 (= lt!142115 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))))))

(assert (= (and d!30764 res!80464) b!98077))

(assert (= (and b!98077 res!80465) b!98078))

(declare-fun m!142509 () Bool)

(assert (=> d!30764 m!142509))

(declare-fun m!142511 () Bool)

(assert (=> d!30764 m!142511))

(assert (=> b!98057 d!30764))

(declare-fun d!30768 () Bool)

(assert (=> d!30768 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4870 thiss!1288) (currentByte!4875 thiss!1288) (size!2100 (buf!2451 thiss!1288))))))

(declare-fun bs!7531 () Bool)

(assert (= bs!7531 d!30768))

(assert (=> bs!7531 m!142511))

(assert (=> start!19642 d!30768))

(declare-fun d!30770 () Bool)

(assert (=> d!30770 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!98056 d!30770))

(declare-fun d!30772 () Bool)

(assert (=> d!30772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7532 () Bool)

(assert (= bs!7532 d!30772))

(assert (=> bs!7532 m!142509))

(assert (=> b!98059 d!30772))

(declare-fun d!30774 () Bool)

(assert (=> d!30774 (= (array_inv!1902 (buf!2451 thiss!1288)) (bvsge (size!2100 (buf!2451 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!98060 d!30774))

(declare-fun b!98183 () Bool)

(declare-fun res!80540 () Bool)

(declare-fun lt!142495 () tuple2!7880)

(declare-fun isPrefixOf!0 (BitStream!3674 BitStream!3674) Bool)

(assert (=> b!98183 (= res!80540 (isPrefixOf!0 thiss!1288 (_2!4192 lt!142495)))))

(declare-fun e!64254 () Bool)

(assert (=> b!98183 (=> (not res!80540) (not e!64254))))

(declare-fun b!98184 () Bool)

(declare-fun res!80542 () Bool)

(assert (=> b!98184 (= res!80542 (= (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142495))) (currentByte!4875 (_2!4192 lt!142495)) (currentBit!4870 (_2!4192 lt!142495))) (bvadd (bitIndex!0 (size!2100 (buf!2451 thiss!1288)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98184 (=> (not res!80542) (not e!64254))))

(declare-fun b!98185 () Bool)

(declare-fun e!64251 () tuple2!7880)

(declare-fun lt!142518 () tuple2!7880)

(declare-fun Unit!6005 () Unit!5991)

(assert (=> b!98185 (= e!64251 (tuple2!7881 Unit!6005 (_2!4192 lt!142518)))))

(declare-fun lt!142485 () Bool)

(assert (=> b!98185 (= lt!142485 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3674 Bool) tuple2!7880)

(assert (=> b!98185 (= lt!142495 (appendBit!0 thiss!1288 lt!142485))))

(declare-fun res!80538 () Bool)

(assert (=> b!98185 (= res!80538 (= (size!2100 (buf!2451 thiss!1288)) (size!2100 (buf!2451 (_2!4192 lt!142495)))))))

(assert (=> b!98185 (=> (not res!80538) (not e!64254))))

(assert (=> b!98185 e!64254))

(declare-fun lt!142517 () tuple2!7880)

(assert (=> b!98185 (= lt!142517 lt!142495)))

(assert (=> b!98185 (= lt!142518 (appendNLeastSignificantBitsLoop!0 (_2!4192 lt!142517) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!142519 () Unit!5991)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3674 BitStream!3674 BitStream!3674) Unit!5991)

(assert (=> b!98185 (= lt!142519 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4192 lt!142517) (_2!4192 lt!142518)))))

(declare-fun call!1222 () Bool)

(assert (=> b!98185 call!1222))

(declare-fun lt!142483 () Unit!5991)

(assert (=> b!98185 (= lt!142483 lt!142519)))

(assert (=> b!98185 (invariant!0 (currentBit!4870 thiss!1288) (currentByte!4875 thiss!1288) (size!2100 (buf!2451 (_2!4192 lt!142517))))))

(declare-fun lt!142522 () BitStream!3674)

(assert (=> b!98185 (= lt!142522 (BitStream!3675 (buf!2451 (_2!4192 lt!142517)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)))))

(assert (=> b!98185 (invariant!0 (currentBit!4870 lt!142522) (currentByte!4875 lt!142522) (size!2100 (buf!2451 (_2!4192 lt!142518))))))

(declare-fun lt!142514 () BitStream!3674)

(assert (=> b!98185 (= lt!142514 (BitStream!3675 (buf!2451 (_2!4192 lt!142518)) (currentByte!4875 lt!142522) (currentBit!4870 lt!142522)))))

(declare-datatypes ((tuple2!7894 0))(
  ( (tuple2!7895 (_1!4199 BitStream!3674) (_2!4199 Bool)) )
))
(declare-fun lt!142521 () tuple2!7894)

(declare-fun readBitPure!0 (BitStream!3674) tuple2!7894)

(assert (=> b!98185 (= lt!142521 (readBitPure!0 lt!142522))))

(declare-fun lt!142523 () tuple2!7894)

(assert (=> b!98185 (= lt!142523 (readBitPure!0 lt!142514))))

(declare-fun lt!142512 () Unit!5991)

(declare-fun readBitPrefixLemma!0 (BitStream!3674 BitStream!3674) Unit!5991)

(assert (=> b!98185 (= lt!142512 (readBitPrefixLemma!0 lt!142522 (_2!4192 lt!142518)))))

(declare-fun res!80546 () Bool)

(assert (=> b!98185 (= res!80546 (= (bitIndex!0 (size!2100 (buf!2451 (_1!4199 lt!142521))) (currentByte!4875 (_1!4199 lt!142521)) (currentBit!4870 (_1!4199 lt!142521))) (bitIndex!0 (size!2100 (buf!2451 (_1!4199 lt!142523))) (currentByte!4875 (_1!4199 lt!142523)) (currentBit!4870 (_1!4199 lt!142523)))))))

(declare-fun e!64252 () Bool)

(assert (=> b!98185 (=> (not res!80546) (not e!64252))))

(assert (=> b!98185 e!64252))

(declare-fun lt!142482 () Unit!5991)

(assert (=> b!98185 (= lt!142482 lt!142512)))

(declare-datatypes ((tuple2!7896 0))(
  ( (tuple2!7897 (_1!4200 BitStream!3674) (_2!4200 BitStream!3674)) )
))
(declare-fun lt!142497 () tuple2!7896)

(declare-fun reader!0 (BitStream!3674 BitStream!3674) tuple2!7896)

(assert (=> b!98185 (= lt!142497 (reader!0 thiss!1288 (_2!4192 lt!142518)))))

(declare-fun lt!142513 () tuple2!7896)

(assert (=> b!98185 (= lt!142513 (reader!0 (_2!4192 lt!142517) (_2!4192 lt!142518)))))

(declare-fun lt!142510 () tuple2!7894)

(assert (=> b!98185 (= lt!142510 (readBitPure!0 (_1!4200 lt!142497)))))

(assert (=> b!98185 (= (_2!4199 lt!142510) lt!142485)))

(declare-fun lt!142506 () Unit!5991)

(declare-fun Unit!6006 () Unit!5991)

(assert (=> b!98185 (= lt!142506 Unit!6006)))

(declare-fun lt!142511 () (_ BitVec 64))

(assert (=> b!98185 (= lt!142511 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!142493 () (_ BitVec 64))

(assert (=> b!98185 (= lt!142493 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!142520 () Unit!5991)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3674 array!4595 (_ BitVec 64)) Unit!5991)

(assert (=> b!98185 (= lt!142520 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2451 (_2!4192 lt!142518)) lt!142493))))

(assert (=> b!98185 (validate_offset_bits!1 ((_ sign_extend 32) (size!2100 (buf!2451 (_2!4192 lt!142518)))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288)) lt!142493)))

(declare-fun lt!142509 () Unit!5991)

(assert (=> b!98185 (= lt!142509 lt!142520)))

(declare-datatypes ((tuple2!7898 0))(
  ( (tuple2!7899 (_1!4201 BitStream!3674) (_2!4201 (_ BitVec 64))) )
))
(declare-fun lt!142505 () tuple2!7898)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7898)

(assert (=> b!98185 (= lt!142505 (readNLeastSignificantBitsLoopPure!0 (_1!4200 lt!142497) nBits!388 #b00000000000000000000000000000000 lt!142511))))

(declare-fun lt!142524 () (_ BitVec 64))

(assert (=> b!98185 (= lt!142524 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!142496 () Unit!5991)

(assert (=> b!98185 (= lt!142496 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4192 lt!142517) (buf!2451 (_2!4192 lt!142518)) lt!142524))))

(assert (=> b!98185 (validate_offset_bits!1 ((_ sign_extend 32) (size!2100 (buf!2451 (_2!4192 lt!142518)))) ((_ sign_extend 32) (currentByte!4875 (_2!4192 lt!142517))) ((_ sign_extend 32) (currentBit!4870 (_2!4192 lt!142517))) lt!142524)))

(declare-fun lt!142516 () Unit!5991)

(assert (=> b!98185 (= lt!142516 lt!142496)))

(declare-fun lt!142525 () tuple2!7898)

(assert (=> b!98185 (= lt!142525 (readNLeastSignificantBitsLoopPure!0 (_1!4200 lt!142513) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142511 (ite (_2!4199 lt!142510) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!142490 () tuple2!7898)

(assert (=> b!98185 (= lt!142490 (readNLeastSignificantBitsLoopPure!0 (_1!4200 lt!142497) nBits!388 #b00000000000000000000000000000000 lt!142511))))

(declare-fun c!6215 () Bool)

(assert (=> b!98185 (= c!6215 (_2!4199 (readBitPure!0 (_1!4200 lt!142497))))))

(declare-fun e!64253 () (_ BitVec 64))

(declare-fun lt!142494 () tuple2!7898)

(declare-fun withMovedBitIndex!0 (BitStream!3674 (_ BitVec 64)) BitStream!3674)

(assert (=> b!98185 (= lt!142494 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4200 lt!142497) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142511 e!64253)))))

(declare-fun lt!142484 () Unit!5991)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5991)

(assert (=> b!98185 (= lt!142484 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4200 lt!142497) nBits!388 #b00000000000000000000000000000000 lt!142511))))

(assert (=> b!98185 (and (= (_2!4201 lt!142490) (_2!4201 lt!142494)) (= (_1!4201 lt!142490) (_1!4201 lt!142494)))))

(declare-fun lt!142503 () Unit!5991)

(assert (=> b!98185 (= lt!142503 lt!142484)))

(assert (=> b!98185 (= (_1!4200 lt!142497) (withMovedBitIndex!0 (_2!4200 lt!142497) (bvsub (bitIndex!0 (size!2100 (buf!2451 thiss!1288)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)) (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142518))) (currentByte!4875 (_2!4192 lt!142518)) (currentBit!4870 (_2!4192 lt!142518))))))))

(declare-fun lt!142515 () Unit!5991)

(declare-fun Unit!6007 () Unit!5991)

(assert (=> b!98185 (= lt!142515 Unit!6007)))

(assert (=> b!98185 (= (_1!4200 lt!142513) (withMovedBitIndex!0 (_2!4200 lt!142513) (bvsub (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142517))) (currentByte!4875 (_2!4192 lt!142517)) (currentBit!4870 (_2!4192 lt!142517))) (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142518))) (currentByte!4875 (_2!4192 lt!142518)) (currentBit!4870 (_2!4192 lt!142518))))))))

(declare-fun lt!142501 () Unit!5991)

(declare-fun Unit!6008 () Unit!5991)

(assert (=> b!98185 (= lt!142501 Unit!6008)))

(assert (=> b!98185 (= (bitIndex!0 (size!2100 (buf!2451 thiss!1288)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)) (bvsub (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142517))) (currentByte!4875 (_2!4192 lt!142517)) (currentBit!4870 (_2!4192 lt!142517))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!142499 () Unit!5991)

(declare-fun Unit!6009 () Unit!5991)

(assert (=> b!98185 (= lt!142499 Unit!6009)))

(assert (=> b!98185 (= (_2!4201 lt!142505) (_2!4201 lt!142525))))

(declare-fun lt!142508 () Unit!5991)

(declare-fun Unit!6010 () Unit!5991)

(assert (=> b!98185 (= lt!142508 Unit!6010)))

(assert (=> b!98185 (= (_1!4201 lt!142505) (_2!4200 lt!142497))))

(declare-fun b!98186 () Bool)

(declare-fun res!80544 () Bool)

(declare-fun e!64250 () Bool)

(assert (=> b!98186 (=> (not res!80544) (not e!64250))))

(declare-fun lt!142486 () tuple2!7880)

(assert (=> b!98186 (= res!80544 (isPrefixOf!0 thiss!1288 (_2!4192 lt!142486)))))

(declare-fun d!30776 () Bool)

(assert (=> d!30776 e!64250))

(declare-fun res!80543 () Bool)

(assert (=> d!30776 (=> (not res!80543) (not e!64250))))

(assert (=> d!30776 (= res!80543 (= (size!2100 (buf!2451 thiss!1288)) (size!2100 (buf!2451 (_2!4192 lt!142486)))))))

(assert (=> d!30776 (= lt!142486 e!64251)))

(declare-fun c!6214 () Bool)

(assert (=> d!30776 (= c!6214 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30776 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30776 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!142486)))

(declare-fun b!98187 () Bool)

(assert (=> b!98187 (= e!64252 (= (_2!4199 lt!142521) (_2!4199 lt!142523)))))

(declare-fun b!98188 () Bool)

(declare-fun lt!142502 () tuple2!7894)

(declare-fun readerFrom!0 (BitStream!3674 (_ BitVec 32) (_ BitVec 32)) BitStream!3674)

(assert (=> b!98188 (= lt!142502 (readBitPure!0 (readerFrom!0 (_2!4192 lt!142495) (currentBit!4870 thiss!1288) (currentByte!4875 thiss!1288))))))

(declare-fun res!80541 () Bool)

(assert (=> b!98188 (= res!80541 (and (= (_2!4199 lt!142502) lt!142485) (= (_1!4199 lt!142502) (_2!4192 lt!142495))))))

(declare-fun e!64248 () Bool)

(assert (=> b!98188 (=> (not res!80541) (not e!64248))))

(assert (=> b!98188 (= e!64254 e!64248)))

(declare-fun b!98189 () Bool)

(declare-fun e!64249 () Bool)

(declare-fun lt!142488 () (_ BitVec 64))

(assert (=> b!98189 (= e!64249 (validate_offset_bits!1 ((_ sign_extend 32) (size!2100 (buf!2451 thiss!1288))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288)) lt!142488))))

(declare-fun b!98190 () Bool)

(assert (=> b!98190 (= e!64253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98191 () Bool)

(assert (=> b!98191 (= e!64253 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!98192 () Bool)

(declare-fun lt!142491 () Unit!5991)

(assert (=> b!98192 (= e!64251 (tuple2!7881 lt!142491 thiss!1288))))

(declare-fun lt!142492 () BitStream!3674)

(assert (=> b!98192 (= lt!142492 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3674) Unit!5991)

(assert (=> b!98192 (= lt!142491 (lemmaIsPrefixRefl!0 lt!142492))))

(assert (=> b!98192 call!1222))

(declare-fun lt!142487 () tuple2!7896)

(declare-fun b!98193 () Bool)

(declare-fun lt!142489 () tuple2!7898)

(assert (=> b!98193 (= e!64250 (and (= (_2!4201 lt!142489) v!196) (= (_1!4201 lt!142489) (_2!4200 lt!142487))))))

(declare-fun lt!142498 () (_ BitVec 64))

(assert (=> b!98193 (= lt!142489 (readNLeastSignificantBitsLoopPure!0 (_1!4200 lt!142487) nBits!388 #b00000000000000000000000000000000 lt!142498))))

(declare-fun lt!142481 () Unit!5991)

(declare-fun lt!142504 () Unit!5991)

(assert (=> b!98193 (= lt!142481 lt!142504)))

(assert (=> b!98193 (validate_offset_bits!1 ((_ sign_extend 32) (size!2100 (buf!2451 (_2!4192 lt!142486)))) ((_ sign_extend 32) (currentByte!4875 thiss!1288)) ((_ sign_extend 32) (currentBit!4870 thiss!1288)) lt!142488)))

(assert (=> b!98193 (= lt!142504 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2451 (_2!4192 lt!142486)) lt!142488))))

(assert (=> b!98193 e!64249))

(declare-fun res!80545 () Bool)

(assert (=> b!98193 (=> (not res!80545) (not e!64249))))

(assert (=> b!98193 (= res!80545 (and (= (size!2100 (buf!2451 thiss!1288)) (size!2100 (buf!2451 (_2!4192 lt!142486)))) (bvsge lt!142488 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98193 (= lt!142488 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98193 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98193 (= lt!142498 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98193 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98193 (= lt!142487 (reader!0 thiss!1288 (_2!4192 lt!142486)))))

(declare-fun b!98194 () Bool)

(declare-fun res!80539 () Bool)

(assert (=> b!98194 (=> (not res!80539) (not e!64250))))

(declare-fun lt!142507 () (_ BitVec 64))

(declare-fun lt!142500 () (_ BitVec 64))

(assert (=> b!98194 (= res!80539 (= (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142486))) (currentByte!4875 (_2!4192 lt!142486)) (currentBit!4870 (_2!4192 lt!142486))) (bvadd lt!142507 lt!142500)))))

(assert (=> b!98194 (or (not (= (bvand lt!142507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142500 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!142507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!142507 lt!142500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98194 (= lt!142500 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98194 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98194 (= lt!142507 (bitIndex!0 (size!2100 (buf!2451 thiss!1288)) (currentByte!4875 thiss!1288) (currentBit!4870 thiss!1288)))))

(declare-fun b!98195 () Bool)

(assert (=> b!98195 (= e!64248 (= (bitIndex!0 (size!2100 (buf!2451 (_1!4199 lt!142502))) (currentByte!4875 (_1!4199 lt!142502)) (currentBit!4870 (_1!4199 lt!142502))) (bitIndex!0 (size!2100 (buf!2451 (_2!4192 lt!142495))) (currentByte!4875 (_2!4192 lt!142495)) (currentBit!4870 (_2!4192 lt!142495)))))))

(declare-fun bm!1219 () Bool)

(assert (=> bm!1219 (= call!1222 (isPrefixOf!0 (ite c!6214 thiss!1288 lt!142492) (ite c!6214 (_2!4192 lt!142518) lt!142492)))))

(assert (= (and d!30776 c!6214) b!98185))

(assert (= (and d!30776 (not c!6214)) b!98192))

(assert (= (and b!98185 res!80538) b!98184))

(assert (= (and b!98184 res!80542) b!98183))

(assert (= (and b!98183 res!80540) b!98188))

(assert (= (and b!98188 res!80541) b!98195))

(assert (= (and b!98185 res!80546) b!98187))

(assert (= (and b!98185 c!6215) b!98191))

(assert (= (and b!98185 (not c!6215)) b!98190))

(assert (= (or b!98185 b!98192) bm!1219))

(assert (= (and d!30776 res!80543) b!98194))

(assert (= (and b!98194 res!80539) b!98186))

(assert (= (and b!98186 res!80544) b!98193))

(assert (= (and b!98193 res!80545) b!98189))

(declare-fun m!142677 () Bool)

(assert (=> b!98186 m!142677))

(declare-fun m!142679 () Bool)

(assert (=> b!98189 m!142679))

(declare-fun m!142681 () Bool)

(assert (=> b!98193 m!142681))

(declare-fun m!142683 () Bool)

(assert (=> b!98193 m!142683))

(declare-fun m!142685 () Bool)

(assert (=> b!98193 m!142685))

(declare-fun m!142687 () Bool)

(assert (=> b!98193 m!142687))

(declare-fun m!142689 () Bool)

(assert (=> b!98193 m!142689))

(declare-fun m!142691 () Bool)

(assert (=> b!98194 m!142691))

(assert (=> b!98194 m!142493))

(declare-fun m!142693 () Bool)

(assert (=> b!98184 m!142693))

(assert (=> b!98184 m!142493))

(declare-fun m!142695 () Bool)

(assert (=> b!98183 m!142695))

(declare-fun m!142697 () Bool)

(assert (=> bm!1219 m!142697))

(declare-fun m!142699 () Bool)

(assert (=> b!98195 m!142699))

(assert (=> b!98195 m!142693))

(declare-fun m!142701 () Bool)

(assert (=> b!98188 m!142701))

(assert (=> b!98188 m!142701))

(declare-fun m!142703 () Bool)

(assert (=> b!98188 m!142703))

(declare-fun m!142705 () Bool)

(assert (=> b!98185 m!142705))

(declare-fun m!142707 () Bool)

(assert (=> b!98185 m!142707))

(declare-fun m!142709 () Bool)

(assert (=> b!98185 m!142709))

(declare-fun m!142711 () Bool)

(assert (=> b!98185 m!142711))

(declare-fun m!142713 () Bool)

(assert (=> b!98185 m!142713))

(declare-fun m!142715 () Bool)

(assert (=> b!98185 m!142715))

(declare-fun m!142717 () Bool)

(assert (=> b!98185 m!142717))

(declare-fun m!142719 () Bool)

(assert (=> b!98185 m!142719))

(declare-fun m!142721 () Bool)

(assert (=> b!98185 m!142721))

(declare-fun m!142723 () Bool)

(assert (=> b!98185 m!142723))

(declare-fun m!142725 () Bool)

(assert (=> b!98185 m!142725))

(declare-fun m!142727 () Bool)

(assert (=> b!98185 m!142727))

(declare-fun m!142729 () Bool)

(assert (=> b!98185 m!142729))

(declare-fun m!142731 () Bool)

(assert (=> b!98185 m!142731))

(declare-fun m!142733 () Bool)

(assert (=> b!98185 m!142733))

(assert (=> b!98185 m!142683))

(declare-fun m!142735 () Bool)

(assert (=> b!98185 m!142735))

(declare-fun m!142737 () Bool)

(assert (=> b!98185 m!142737))

(declare-fun m!142739 () Bool)

(assert (=> b!98185 m!142739))

(declare-fun m!142741 () Bool)

(assert (=> b!98185 m!142741))

(declare-fun m!142743 () Bool)

(assert (=> b!98185 m!142743))

(assert (=> b!98185 m!142709))

(assert (=> b!98185 m!142493))

(declare-fun m!142745 () Bool)

(assert (=> b!98185 m!142745))

(declare-fun m!142747 () Bool)

(assert (=> b!98185 m!142747))

(declare-fun m!142749 () Bool)

(assert (=> b!98185 m!142749))

(declare-fun m!142751 () Bool)

(assert (=> b!98185 m!142751))

(declare-fun m!142753 () Bool)

(assert (=> b!98185 m!142753))

(declare-fun m!142755 () Bool)

(assert (=> b!98185 m!142755))

(declare-fun m!142757 () Bool)

(assert (=> b!98192 m!142757))

(assert (=> b!98058 d!30776))

(push 1)

(assert (not b!98194))

(assert (not d!30768))

(assert (not b!98188))

(assert (not b!98189))

(assert (not b!98193))

(assert (not b!98186))

(assert (not b!98185))

(assert (not d!30772))

(assert (not d!30764))

(assert (not bm!1219))

(assert (not b!98192))

(assert (not b!98184))

(assert (not b!98195))

(assert (not b!98183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


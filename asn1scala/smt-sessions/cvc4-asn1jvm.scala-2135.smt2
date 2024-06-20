; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54094 () Bool)

(assert start!54094)

(declare-fun b!252250 () Bool)

(declare-fun e!174794 () Bool)

(declare-datatypes ((array!13718 0))(
  ( (array!13719 (arr!7005 (Array (_ BitVec 32) (_ BitVec 8))) (size!6018 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10958 0))(
  ( (BitStream!10959 (buf!6520 array!13718) (currentByte!11975 (_ BitVec 32)) (currentBit!11970 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21678 0))(
  ( (tuple2!21679 (_1!11767 BitStream!10958) (_2!11767 Bool)) )
))
(declare-fun lt!391826 () tuple2!21678)

(declare-fun lt!391824 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252250 (= e!174794 (= (bitIndex!0 (size!6018 (buf!6520 (_1!11767 lt!391826))) (currentByte!11975 (_1!11767 lt!391826)) (currentBit!11970 (_1!11767 lt!391826))) lt!391824))))

(declare-fun b!252251 () Bool)

(declare-fun e!174798 () Bool)

(declare-fun e!174793 () Bool)

(assert (=> b!252251 (= e!174798 e!174793)))

(declare-fun res!211323 () Bool)

(assert (=> b!252251 (=> (not res!211323) (not e!174793))))

(declare-fun lt!391830 () (_ BitVec 64))

(declare-datatypes ((Unit!18184 0))(
  ( (Unit!18185) )
))
(declare-datatypes ((tuple2!21680 0))(
  ( (tuple2!21681 (_1!11768 Unit!18184) (_2!11768 BitStream!10958)) )
))
(declare-fun lt!391832 () tuple2!21680)

(declare-fun lt!391828 () tuple2!21680)

(assert (=> b!252251 (= res!211323 (= (bitIndex!0 (size!6018 (buf!6520 (_2!11768 lt!391828))) (currentByte!11975 (_2!11768 lt!391828)) (currentBit!11970 (_2!11768 lt!391828))) (bvadd (bitIndex!0 (size!6018 (buf!6520 (_2!11768 lt!391832))) (currentByte!11975 (_2!11768 lt!391832)) (currentBit!11970 (_2!11768 lt!391832))) lt!391830)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252251 (= lt!391830 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252252 () Bool)

(declare-fun res!211329 () Bool)

(declare-fun e!174792 () Bool)

(assert (=> b!252252 (=> (not res!211329) (not e!174792))))

(declare-fun thiss!1005 () BitStream!10958)

(declare-fun isPrefixOf!0 (BitStream!10958 BitStream!10958) Bool)

(assert (=> b!252252 (= res!211329 (isPrefixOf!0 thiss!1005 (_2!11768 lt!391832)))))

(declare-fun b!252253 () Bool)

(declare-fun res!211319 () Bool)

(assert (=> b!252253 (=> (not res!211319) (not e!174793))))

(assert (=> b!252253 (= res!211319 (isPrefixOf!0 (_2!11768 lt!391832) (_2!11768 lt!391828)))))

(declare-fun b!252254 () Bool)

(declare-fun e!174797 () Bool)

(declare-fun array_inv!5759 (array!13718) Bool)

(assert (=> b!252254 (= e!174797 (array_inv!5759 (buf!6520 thiss!1005)))))

(declare-fun b!252255 () Bool)

(declare-fun res!211326 () Bool)

(declare-fun e!174795 () Bool)

(assert (=> b!252255 (=> (not res!211326) (not e!174795))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252255 (= res!211326 (validate_offset_bits!1 ((_ sign_extend 32) (size!6018 (buf!6520 thiss!1005))) ((_ sign_extend 32) (currentByte!11975 thiss!1005)) ((_ sign_extend 32) (currentBit!11970 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252256 () Bool)

(declare-fun e!174800 () Bool)

(declare-fun lt!391836 () tuple2!21678)

(declare-fun lt!391835 () tuple2!21678)

(assert (=> b!252256 (= e!174800 (= (_2!11767 lt!391836) (_2!11767 lt!391835)))))

(declare-fun res!211318 () Bool)

(assert (=> start!54094 (=> (not res!211318) (not e!174795))))

(assert (=> start!54094 (= res!211318 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54094 e!174795))

(assert (=> start!54094 true))

(declare-fun inv!12 (BitStream!10958) Bool)

(assert (=> start!54094 (and (inv!12 thiss!1005) e!174797)))

(declare-fun b!252257 () Bool)

(declare-fun lt!391831 () tuple2!21678)

(declare-datatypes ((tuple2!21682 0))(
  ( (tuple2!21683 (_1!11769 BitStream!10958) (_2!11769 BitStream!10958)) )
))
(declare-fun lt!391822 () tuple2!21682)

(assert (=> b!252257 (= e!174793 (not (or (not (_2!11767 lt!391831)) (not (= (_1!11767 lt!391831) (_2!11769 lt!391822))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10958 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21678)

(assert (=> b!252257 (= lt!391831 (checkBitsLoopPure!0 (_1!11769 lt!391822) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252257 (validate_offset_bits!1 ((_ sign_extend 32) (size!6018 (buf!6520 (_2!11768 lt!391828)))) ((_ sign_extend 32) (currentByte!11975 (_2!11768 lt!391832))) ((_ sign_extend 32) (currentBit!11970 (_2!11768 lt!391832))) lt!391830)))

(declare-fun lt!391823 () Unit!18184)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10958 array!13718 (_ BitVec 64)) Unit!18184)

(assert (=> b!252257 (= lt!391823 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11768 lt!391832) (buf!6520 (_2!11768 lt!391828)) lt!391830))))

(declare-fun reader!0 (BitStream!10958 BitStream!10958) tuple2!21682)

(assert (=> b!252257 (= lt!391822 (reader!0 (_2!11768 lt!391832) (_2!11768 lt!391828)))))

(declare-fun b!252258 () Bool)

(assert (=> b!252258 (= e!174795 (not true))))

(declare-fun lt!391837 () tuple2!21682)

(declare-fun lt!391827 () tuple2!21678)

(assert (=> b!252258 (= lt!391827 (checkBitsLoopPure!0 (_1!11769 lt!391837) nBits!297 bit!26 from!289))))

(assert (=> b!252258 (validate_offset_bits!1 ((_ sign_extend 32) (size!6018 (buf!6520 (_2!11768 lt!391828)))) ((_ sign_extend 32) (currentByte!11975 thiss!1005)) ((_ sign_extend 32) (currentBit!11970 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391829 () Unit!18184)

(assert (=> b!252258 (= lt!391829 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6520 (_2!11768 lt!391828)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10958) tuple2!21678)

(assert (=> b!252258 (= (_2!11767 (readBitPure!0 (_1!11769 lt!391837))) bit!26)))

(declare-fun lt!391825 () tuple2!21682)

(assert (=> b!252258 (= lt!391825 (reader!0 (_2!11768 lt!391832) (_2!11768 lt!391828)))))

(assert (=> b!252258 (= lt!391837 (reader!0 thiss!1005 (_2!11768 lt!391828)))))

(assert (=> b!252258 e!174800))

(declare-fun res!211322 () Bool)

(assert (=> b!252258 (=> (not res!211322) (not e!174800))))

(assert (=> b!252258 (= res!211322 (= (bitIndex!0 (size!6018 (buf!6520 (_1!11767 lt!391836))) (currentByte!11975 (_1!11767 lt!391836)) (currentBit!11970 (_1!11767 lt!391836))) (bitIndex!0 (size!6018 (buf!6520 (_1!11767 lt!391835))) (currentByte!11975 (_1!11767 lt!391835)) (currentBit!11970 (_1!11767 lt!391835)))))))

(declare-fun lt!391833 () Unit!18184)

(declare-fun lt!391834 () BitStream!10958)

(declare-fun readBitPrefixLemma!0 (BitStream!10958 BitStream!10958) Unit!18184)

(assert (=> b!252258 (= lt!391833 (readBitPrefixLemma!0 lt!391834 (_2!11768 lt!391828)))))

(assert (=> b!252258 (= lt!391835 (readBitPure!0 (BitStream!10959 (buf!6520 (_2!11768 lt!391828)) (currentByte!11975 thiss!1005) (currentBit!11970 thiss!1005))))))

(assert (=> b!252258 (= lt!391836 (readBitPure!0 lt!391834))))

(assert (=> b!252258 (= lt!391834 (BitStream!10959 (buf!6520 (_2!11768 lt!391832)) (currentByte!11975 thiss!1005) (currentBit!11970 thiss!1005)))))

(declare-fun e!174799 () Bool)

(assert (=> b!252258 e!174799))

(declare-fun res!211320 () Bool)

(assert (=> b!252258 (=> (not res!211320) (not e!174799))))

(assert (=> b!252258 (= res!211320 (isPrefixOf!0 thiss!1005 (_2!11768 lt!391828)))))

(declare-fun lt!391838 () Unit!18184)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10958 BitStream!10958 BitStream!10958) Unit!18184)

(assert (=> b!252258 (= lt!391838 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11768 lt!391832) (_2!11768 lt!391828)))))

(assert (=> b!252258 e!174798))

(declare-fun res!211325 () Bool)

(assert (=> b!252258 (=> (not res!211325) (not e!174798))))

(assert (=> b!252258 (= res!211325 (= (size!6018 (buf!6520 (_2!11768 lt!391832))) (size!6018 (buf!6520 (_2!11768 lt!391828)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10958 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21680)

(assert (=> b!252258 (= lt!391828 (appendNBitsLoop!0 (_2!11768 lt!391832) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252258 (validate_offset_bits!1 ((_ sign_extend 32) (size!6018 (buf!6520 (_2!11768 lt!391832)))) ((_ sign_extend 32) (currentByte!11975 (_2!11768 lt!391832))) ((_ sign_extend 32) (currentBit!11970 (_2!11768 lt!391832))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391839 () Unit!18184)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10958 BitStream!10958 (_ BitVec 64) (_ BitVec 64)) Unit!18184)

(assert (=> b!252258 (= lt!391839 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11768 lt!391832) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174791 () Bool)

(assert (=> b!252258 e!174791))

(declare-fun res!211324 () Bool)

(assert (=> b!252258 (=> (not res!211324) (not e!174791))))

(assert (=> b!252258 (= res!211324 (= (size!6018 (buf!6520 thiss!1005)) (size!6018 (buf!6520 (_2!11768 lt!391832)))))))

(declare-fun appendBit!0 (BitStream!10958 Bool) tuple2!21680)

(assert (=> b!252258 (= lt!391832 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252259 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252259 (= e!174799 (invariant!0 (currentBit!11970 thiss!1005) (currentByte!11975 thiss!1005) (size!6018 (buf!6520 (_2!11768 lt!391828)))))))

(declare-fun b!252260 () Bool)

(assert (=> b!252260 (= e!174792 e!174794)))

(declare-fun res!211317 () Bool)

(assert (=> b!252260 (=> (not res!211317) (not e!174794))))

(assert (=> b!252260 (= res!211317 (and (= (_2!11767 lt!391826) bit!26) (= (_1!11767 lt!391826) (_2!11768 lt!391832))))))

(declare-fun readerFrom!0 (BitStream!10958 (_ BitVec 32) (_ BitVec 32)) BitStream!10958)

(assert (=> b!252260 (= lt!391826 (readBitPure!0 (readerFrom!0 (_2!11768 lt!391832) (currentBit!11970 thiss!1005) (currentByte!11975 thiss!1005))))))

(declare-fun b!252261 () Bool)

(declare-fun res!211328 () Bool)

(assert (=> b!252261 (=> (not res!211328) (not e!174799))))

(assert (=> b!252261 (= res!211328 (invariant!0 (currentBit!11970 thiss!1005) (currentByte!11975 thiss!1005) (size!6018 (buf!6520 (_2!11768 lt!391832)))))))

(declare-fun b!252262 () Bool)

(declare-fun res!211327 () Bool)

(assert (=> b!252262 (=> (not res!211327) (not e!174795))))

(assert (=> b!252262 (= res!211327 (bvslt from!289 nBits!297))))

(declare-fun b!252263 () Bool)

(assert (=> b!252263 (= e!174791 e!174792)))

(declare-fun res!211321 () Bool)

(assert (=> b!252263 (=> (not res!211321) (not e!174792))))

(declare-fun lt!391821 () (_ BitVec 64))

(assert (=> b!252263 (= res!211321 (= lt!391824 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391821)))))

(assert (=> b!252263 (= lt!391824 (bitIndex!0 (size!6018 (buf!6520 (_2!11768 lt!391832))) (currentByte!11975 (_2!11768 lt!391832)) (currentBit!11970 (_2!11768 lt!391832))))))

(assert (=> b!252263 (= lt!391821 (bitIndex!0 (size!6018 (buf!6520 thiss!1005)) (currentByte!11975 thiss!1005) (currentBit!11970 thiss!1005)))))

(assert (= (and start!54094 res!211318) b!252255))

(assert (= (and b!252255 res!211326) b!252262))

(assert (= (and b!252262 res!211327) b!252258))

(assert (= (and b!252258 res!211324) b!252263))

(assert (= (and b!252263 res!211321) b!252252))

(assert (= (and b!252252 res!211329) b!252260))

(assert (= (and b!252260 res!211317) b!252250))

(assert (= (and b!252258 res!211325) b!252251))

(assert (= (and b!252251 res!211323) b!252253))

(assert (= (and b!252253 res!211319) b!252257))

(assert (= (and b!252258 res!211320) b!252261))

(assert (= (and b!252261 res!211328) b!252259))

(assert (= (and b!252258 res!211322) b!252256))

(assert (= start!54094 b!252254))

(declare-fun m!379515 () Bool)

(assert (=> b!252255 m!379515))

(declare-fun m!379517 () Bool)

(assert (=> b!252260 m!379517))

(assert (=> b!252260 m!379517))

(declare-fun m!379519 () Bool)

(assert (=> b!252260 m!379519))

(declare-fun m!379521 () Bool)

(assert (=> b!252251 m!379521))

(declare-fun m!379523 () Bool)

(assert (=> b!252251 m!379523))

(declare-fun m!379525 () Bool)

(assert (=> b!252254 m!379525))

(declare-fun m!379527 () Bool)

(assert (=> b!252250 m!379527))

(declare-fun m!379529 () Bool)

(assert (=> b!252258 m!379529))

(declare-fun m!379531 () Bool)

(assert (=> b!252258 m!379531))

(declare-fun m!379533 () Bool)

(assert (=> b!252258 m!379533))

(declare-fun m!379535 () Bool)

(assert (=> b!252258 m!379535))

(declare-fun m!379537 () Bool)

(assert (=> b!252258 m!379537))

(declare-fun m!379539 () Bool)

(assert (=> b!252258 m!379539))

(declare-fun m!379541 () Bool)

(assert (=> b!252258 m!379541))

(declare-fun m!379543 () Bool)

(assert (=> b!252258 m!379543))

(declare-fun m!379545 () Bool)

(assert (=> b!252258 m!379545))

(declare-fun m!379547 () Bool)

(assert (=> b!252258 m!379547))

(declare-fun m!379549 () Bool)

(assert (=> b!252258 m!379549))

(declare-fun m!379551 () Bool)

(assert (=> b!252258 m!379551))

(declare-fun m!379553 () Bool)

(assert (=> b!252258 m!379553))

(declare-fun m!379555 () Bool)

(assert (=> b!252258 m!379555))

(declare-fun m!379557 () Bool)

(assert (=> b!252258 m!379557))

(declare-fun m!379559 () Bool)

(assert (=> b!252258 m!379559))

(declare-fun m!379561 () Bool)

(assert (=> b!252258 m!379561))

(declare-fun m!379563 () Bool)

(assert (=> b!252253 m!379563))

(assert (=> b!252263 m!379523))

(declare-fun m!379565 () Bool)

(assert (=> b!252263 m!379565))

(declare-fun m!379567 () Bool)

(assert (=> b!252252 m!379567))

(declare-fun m!379569 () Bool)

(assert (=> b!252257 m!379569))

(declare-fun m!379571 () Bool)

(assert (=> b!252257 m!379571))

(declare-fun m!379573 () Bool)

(assert (=> b!252257 m!379573))

(assert (=> b!252257 m!379549))

(declare-fun m!379575 () Bool)

(assert (=> b!252261 m!379575))

(declare-fun m!379577 () Bool)

(assert (=> b!252259 m!379577))

(declare-fun m!379579 () Bool)

(assert (=> start!54094 m!379579))

(push 1)

(assert (not b!252250))

(assert (not b!252258))

(assert (not b!252259))

(assert (not b!252263))

(assert (not b!252257))

(assert (not b!252253))

(assert (not b!252261))

(assert (not b!252260))

(assert (not b!252255))

(assert (not b!252252))

(assert (not b!252254))

(assert (not start!54094))

(assert (not b!252251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


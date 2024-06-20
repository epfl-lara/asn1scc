; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18180 () Bool)

(assert start!18180)

(declare-fun b!89819 () Bool)

(declare-fun res!74021 () Bool)

(declare-fun e!59276 () Bool)

(assert (=> b!89819 (=> (not res!74021) (not e!59276))))

(declare-datatypes ((array!4229 0))(
  ( (array!4230 (arr!2545 (Array (_ BitVec 32) (_ BitVec 8))) (size!1908 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3378 0))(
  ( (BitStream!3379 (buf!2298 array!4229) (currentByte!4561 (_ BitVec 32)) (currentBit!4556 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3378)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89819 (= res!74021 (invariant!0 (currentBit!4556 thiss!1152) (currentByte!4561 thiss!1152) (size!1908 (buf!2298 thiss!1152))))))

(declare-fun b!89820 () Bool)

(declare-fun res!74018 () Bool)

(assert (=> b!89820 (=> (not res!74018) (not e!59276))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89820 (= res!74018 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89821 () Bool)

(declare-fun res!74010 () Bool)

(declare-fun e!59268 () Bool)

(assert (=> b!89821 (=> res!74010 e!59268)))

(declare-fun thiss!1151 () BitStream!3378)

(declare-datatypes ((Unit!5802 0))(
  ( (Unit!5803) )
))
(declare-datatypes ((tuple3!426 0))(
  ( (tuple3!427 (_1!3994 Unit!5802) (_2!3994 BitStream!3378) (_3!237 (_ BitVec 32))) )
))
(declare-fun lt!136791 () tuple3!426)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!89821 (= res!74010 (or (bvsgt (_3!237 lt!136791) nBits!336) (not (= (size!1908 (buf!2298 (_2!3994 lt!136791))) (size!1908 (buf!2298 thiss!1151))))))))

(declare-fun b!89822 () Bool)

(declare-fun e!59272 () Bool)

(declare-datatypes ((tuple2!7514 0))(
  ( (tuple2!7515 (_1!3995 BitStream!3378) (_2!3995 Bool)) )
))
(declare-fun lt!136789 () tuple2!7514)

(declare-fun lt!136790 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89822 (= e!59272 (= (bitIndex!0 (size!1908 (buf!2298 (_1!3995 lt!136789))) (currentByte!4561 (_1!3995 lt!136789)) (currentBit!4556 (_1!3995 lt!136789))) lt!136790))))

(declare-fun b!89823 () Bool)

(declare-fun e!59270 () Bool)

(declare-fun array_inv!1754 (array!4229) Bool)

(assert (=> b!89823 (= e!59270 (array_inv!1754 (buf!2298 thiss!1152)))))

(declare-fun b!89824 () Bool)

(assert (=> b!89824 (= e!59268 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!237 lt!136791) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!237 lt!136791)) #b10000000000000000000000000000000))))))

(declare-fun b!89825 () Bool)

(declare-fun e!59275 () Bool)

(declare-fun e!59277 () Bool)

(assert (=> b!89825 (= e!59275 e!59277)))

(declare-fun res!74022 () Bool)

(assert (=> b!89825 (=> (not res!74022) (not e!59277))))

(declare-fun lt!136788 () (_ BitVec 64))

(assert (=> b!89825 (= res!74022 (= lt!136790 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136788)))))

(declare-datatypes ((tuple2!7516 0))(
  ( (tuple2!7517 (_1!3996 Unit!5802) (_2!3996 BitStream!3378)) )
))
(declare-fun lt!136792 () tuple2!7516)

(assert (=> b!89825 (= lt!136790 (bitIndex!0 (size!1908 (buf!2298 (_2!3996 lt!136792))) (currentByte!4561 (_2!3996 lt!136792)) (currentBit!4556 (_2!3996 lt!136792))))))

(declare-fun b!89826 () Bool)

(declare-fun res!74019 () Bool)

(declare-fun e!59273 () Bool)

(assert (=> b!89826 (=> (not res!74019) (not e!59273))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89826 (= res!74019 (validate_offset_bits!1 ((_ sign_extend 32) (size!1908 (buf!2298 thiss!1152))) ((_ sign_extend 32) (currentByte!4561 thiss!1152)) ((_ sign_extend 32) (currentBit!4556 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89827 () Bool)

(declare-fun res!74020 () Bool)

(assert (=> b!89827 (=> (not res!74020) (not e!59276))))

(assert (=> b!89827 (= res!74020 (invariant!0 (currentBit!4556 thiss!1151) (currentByte!4561 thiss!1151) (size!1908 (buf!2298 thiss!1151))))))

(declare-fun b!89828 () Bool)

(declare-fun e!59269 () Bool)

(assert (=> b!89828 (= e!59269 (array_inv!1754 (buf!2298 thiss!1151)))))

(declare-fun b!89829 () Bool)

(assert (=> b!89829 (= e!59277 e!59272)))

(declare-fun res!74016 () Bool)

(assert (=> b!89829 (=> (not res!74016) (not e!59272))))

(declare-fun lt!136793 () Bool)

(assert (=> b!89829 (= res!74016 (and (= (_2!3995 lt!136789) lt!136793) (= (_1!3995 lt!136789) (_2!3996 lt!136792))))))

(declare-fun readBitPure!0 (BitStream!3378) tuple2!7514)

(declare-fun readerFrom!0 (BitStream!3378 (_ BitVec 32) (_ BitVec 32)) BitStream!3378)

(assert (=> b!89829 (= lt!136789 (readBitPure!0 (readerFrom!0 (_2!3996 lt!136792) (currentBit!4556 thiss!1152) (currentByte!4561 thiss!1152))))))

(declare-fun b!89830 () Bool)

(assert (=> b!89830 (= e!59276 e!59273)))

(declare-fun res!74024 () Bool)

(assert (=> b!89830 (=> (not res!74024) (not e!59273))))

(declare-fun lt!136794 () (_ BitVec 64))

(assert (=> b!89830 (= res!74024 (= lt!136788 (bvadd lt!136794 ((_ sign_extend 32) i!576))))))

(assert (=> b!89830 (= lt!136788 (bitIndex!0 (size!1908 (buf!2298 thiss!1152)) (currentByte!4561 thiss!1152) (currentBit!4556 thiss!1152)))))

(assert (=> b!89830 (= lt!136794 (bitIndex!0 (size!1908 (buf!2298 thiss!1151)) (currentByte!4561 thiss!1151) (currentBit!4556 thiss!1151)))))

(declare-fun b!89831 () Bool)

(declare-fun res!74017 () Bool)

(assert (=> b!89831 (=> (not res!74017) (not e!59273))))

(assert (=> b!89831 (= res!74017 (bvslt i!576 nBits!336))))

(declare-fun b!89832 () Bool)

(declare-fun res!74011 () Bool)

(assert (=> b!89832 (=> (not res!74011) (not e!59276))))

(assert (=> b!89832 (= res!74011 (and (bvsle i!576 nBits!336) (= (size!1908 (buf!2298 thiss!1152)) (size!1908 (buf!2298 thiss!1151)))))))

(declare-fun res!74012 () Bool)

(assert (=> start!18180 (=> (not res!74012) (not e!59276))))

(assert (=> start!18180 (= res!74012 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18180 e!59276))

(declare-fun inv!12 (BitStream!3378) Bool)

(assert (=> start!18180 (and (inv!12 thiss!1152) e!59270)))

(assert (=> start!18180 (and (inv!12 thiss!1151) e!59269)))

(assert (=> start!18180 true))

(declare-fun b!89833 () Bool)

(declare-fun res!74026 () Bool)

(assert (=> b!89833 (=> res!74026 e!59268)))

(assert (=> b!89833 (= res!74026 (not (invariant!0 (currentBit!4556 (_2!3994 lt!136791)) (currentByte!4561 (_2!3994 lt!136791)) (size!1908 (buf!2298 (_2!3994 lt!136791))))))))

(declare-fun b!89834 () Bool)

(declare-fun res!74008 () Bool)

(assert (=> b!89834 (=> (not res!74008) (not e!59276))))

(assert (=> b!89834 (= res!74008 (validate_offset_bits!1 ((_ sign_extend 32) (size!1908 (buf!2298 thiss!1151))) ((_ sign_extend 32) (currentByte!4561 thiss!1151)) ((_ sign_extend 32) (currentBit!4556 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89835 () Bool)

(declare-fun e!59271 () Bool)

(assert (=> b!89835 (= e!59271 e!59268)))

(declare-fun res!74025 () Bool)

(assert (=> b!89835 (=> res!74025 e!59268)))

(assert (=> b!89835 (= res!74025 (bvslt (_3!237 lt!136791) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3378 (_ BitVec 64) BitStream!3378 (_ BitVec 32)) tuple3!426)

(assert (=> b!89835 (= lt!136791 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3996 lt!136792) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89836 () Bool)

(declare-fun res!74013 () Bool)

(assert (=> b!89836 (=> res!74013 e!59268)))

(assert (=> b!89836 (= res!74013 (not (= (bitIndex!0 (size!1908 (buf!2298 (_2!3994 lt!136791))) (currentByte!4561 (_2!3994 lt!136791)) (currentBit!4556 (_2!3994 lt!136791))) (bvadd lt!136794 ((_ sign_extend 32) (_3!237 lt!136791))))))))

(declare-fun b!89837 () Bool)

(declare-fun res!74023 () Bool)

(assert (=> b!89837 (=> (not res!74023) (not e!59277))))

(declare-fun isPrefixOf!0 (BitStream!3378 BitStream!3378) Bool)

(assert (=> b!89837 (= res!74023 (isPrefixOf!0 thiss!1152 (_2!3996 lt!136792)))))

(declare-fun b!89838 () Bool)

(declare-fun res!74015 () Bool)

(assert (=> b!89838 (=> res!74015 e!59271)))

(assert (=> b!89838 (= res!74015 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89839 () Bool)

(assert (=> b!89839 (= e!59273 (not e!59271))))

(declare-fun res!74009 () Bool)

(assert (=> b!89839 (=> res!74009 e!59271)))

(assert (=> b!89839 (= res!74009 (not (invariant!0 (currentBit!4556 (_2!3996 lt!136792)) (currentByte!4561 (_2!3996 lt!136792)) (size!1908 (buf!2298 (_2!3996 lt!136792))))))))

(assert (=> b!89839 e!59275))

(declare-fun res!74014 () Bool)

(assert (=> b!89839 (=> (not res!74014) (not e!59275))))

(assert (=> b!89839 (= res!74014 (= (size!1908 (buf!2298 thiss!1152)) (size!1908 (buf!2298 (_2!3996 lt!136792)))))))

(declare-fun appendBit!0 (BitStream!3378 Bool) tuple2!7516)

(assert (=> b!89839 (= lt!136792 (appendBit!0 thiss!1152 lt!136793))))

(assert (=> b!89839 (= lt!136793 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!18180 res!74012) b!89834))

(assert (= (and b!89834 res!74008) b!89827))

(assert (= (and b!89827 res!74020) b!89820))

(assert (= (and b!89820 res!74018) b!89819))

(assert (= (and b!89819 res!74021) b!89832))

(assert (= (and b!89832 res!74011) b!89830))

(assert (= (and b!89830 res!74024) b!89826))

(assert (= (and b!89826 res!74019) b!89831))

(assert (= (and b!89831 res!74017) b!89839))

(assert (= (and b!89839 res!74014) b!89825))

(assert (= (and b!89825 res!74022) b!89837))

(assert (= (and b!89837 res!74023) b!89829))

(assert (= (and b!89829 res!74016) b!89822))

(assert (= (and b!89839 (not res!74009)) b!89838))

(assert (= (and b!89838 (not res!74015)) b!89835))

(assert (= (and b!89835 (not res!74025)) b!89833))

(assert (= (and b!89833 (not res!74026)) b!89821))

(assert (= (and b!89821 (not res!74010)) b!89836))

(assert (= (and b!89836 (not res!74013)) b!89824))

(assert (= start!18180 b!89823))

(assert (= start!18180 b!89828))

(declare-fun m!134505 () Bool)

(assert (=> b!89835 m!134505))

(declare-fun m!134507 () Bool)

(assert (=> b!89829 m!134507))

(assert (=> b!89829 m!134507))

(declare-fun m!134509 () Bool)

(assert (=> b!89829 m!134509))

(declare-fun m!134511 () Bool)

(assert (=> b!89839 m!134511))

(declare-fun m!134513 () Bool)

(assert (=> b!89839 m!134513))

(declare-fun m!134515 () Bool)

(assert (=> b!89828 m!134515))

(declare-fun m!134517 () Bool)

(assert (=> b!89827 m!134517))

(declare-fun m!134519 () Bool)

(assert (=> b!89826 m!134519))

(declare-fun m!134521 () Bool)

(assert (=> b!89833 m!134521))

(declare-fun m!134523 () Bool)

(assert (=> b!89837 m!134523))

(declare-fun m!134525 () Bool)

(assert (=> start!18180 m!134525))

(declare-fun m!134527 () Bool)

(assert (=> start!18180 m!134527))

(declare-fun m!134529 () Bool)

(assert (=> b!89822 m!134529))

(declare-fun m!134531 () Bool)

(assert (=> b!89825 m!134531))

(declare-fun m!134533 () Bool)

(assert (=> b!89836 m!134533))

(declare-fun m!134535 () Bool)

(assert (=> b!89819 m!134535))

(declare-fun m!134537 () Bool)

(assert (=> b!89830 m!134537))

(declare-fun m!134539 () Bool)

(assert (=> b!89830 m!134539))

(declare-fun m!134541 () Bool)

(assert (=> b!89823 m!134541))

(declare-fun m!134543 () Bool)

(assert (=> b!89834 m!134543))

(check-sat (not b!89833) (not b!89835) (not b!89837) (not start!18180) (not b!89827) (not b!89825) (not b!89830) (not b!89836) (not b!89828) (not b!89834) (not b!89819) (not b!89822) (not b!89829) (not b!89826) (not b!89839) (not b!89823))
(check-sat)

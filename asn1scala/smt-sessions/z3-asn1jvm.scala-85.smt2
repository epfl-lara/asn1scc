; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1732 () Bool)

(assert start!1732)

(declare-fun b!8300 () Bool)

(declare-fun res!8866 () Bool)

(declare-fun e!5201 () Bool)

(assert (=> b!8300 (=> (not res!8866) (not e!5201))))

(declare-datatypes ((array!554 0))(
  ( (array!555 (arr!644 (Array (_ BitVec 32) (_ BitVec 8))) (size!239 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!456 0))(
  ( (BitStream!457 (buf!575 array!554) (currentByte!1596 (_ BitVec 32)) (currentBit!1591 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!456)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8300 (= res!8866 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486)) nBits!460))))

(declare-fun b!8301 () Bool)

(declare-fun res!8868 () Bool)

(declare-fun e!5197 () Bool)

(assert (=> b!8301 (=> (not res!8868) (not e!5197))))

(declare-datatypes ((Unit!690 0))(
  ( (Unit!691) )
))
(declare-datatypes ((tuple2!1122 0))(
  ( (tuple2!1123 (_1!592 Unit!690) (_2!592 BitStream!456)) )
))
(declare-fun lt!11552 () tuple2!1122)

(assert (=> b!8301 (= res!8868 (= (size!239 (buf!575 thiss!1486)) (size!239 (buf!575 (_2!592 lt!11552)))))))

(declare-fun b!8302 () Bool)

(assert (=> b!8302 (= e!5201 e!5197)))

(declare-fun res!8869 () Bool)

(assert (=> b!8302 (=> (not res!8869) (not e!5197))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8302 (= res!8869 (invariant!0 (currentBit!1591 (_2!592 lt!11552)) (currentByte!1596 (_2!592 lt!11552)) (size!239 (buf!575 (_2!592 lt!11552)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!554)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!456 array!554 (_ BitVec 64) (_ BitVec 64)) tuple2!1122)

(assert (=> b!8302 (= lt!11552 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!8867 () Bool)

(assert (=> start!1732 (=> (not res!8867) (not e!5201))))

(assert (=> start!1732 (= res!8867 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!239 srcBuffer!6))))))))

(assert (=> start!1732 e!5201))

(assert (=> start!1732 true))

(declare-fun array_inv!234 (array!554) Bool)

(assert (=> start!1732 (array_inv!234 srcBuffer!6)))

(declare-fun e!5199 () Bool)

(declare-fun inv!12 (BitStream!456) Bool)

(assert (=> start!1732 (and (inv!12 thiss!1486) e!5199)))

(declare-fun b!8303 () Bool)

(assert (=> b!8303 (= e!5199 (array_inv!234 (buf!575 thiss!1486)))))

(declare-fun b!8304 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8304 (= e!5197 (not (= (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11552))) (currentByte!1596 (_2!592 lt!11552)) (currentBit!1591 (_2!592 lt!11552))) (bvadd (bitIndex!0 (size!239 (buf!575 thiss!1486)) (currentByte!1596 thiss!1486) (currentBit!1591 thiss!1486)) nBits!460))))))

(assert (= (and start!1732 res!8867) b!8300))

(assert (= (and b!8300 res!8866) b!8302))

(assert (= (and b!8302 res!8869) b!8301))

(assert (= (and b!8301 res!8868) b!8304))

(assert (= start!1732 b!8303))

(declare-fun m!11107 () Bool)

(assert (=> b!8302 m!11107))

(declare-fun m!11109 () Bool)

(assert (=> b!8302 m!11109))

(declare-fun m!11111 () Bool)

(assert (=> start!1732 m!11111))

(declare-fun m!11113 () Bool)

(assert (=> start!1732 m!11113))

(declare-fun m!11115 () Bool)

(assert (=> b!8303 m!11115))

(declare-fun m!11117 () Bool)

(assert (=> b!8304 m!11117))

(declare-fun m!11119 () Bool)

(assert (=> b!8304 m!11119))

(declare-fun m!11121 () Bool)

(assert (=> b!8300 m!11121))

(check-sat (not b!8304) (not b!8303) (not start!1732) (not b!8300) (not b!8302))
(check-sat)
(get-model)

(declare-fun d!2436 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486))) nBits!460))))

(declare-fun bs!830 () Bool)

(assert (= bs!830 d!2436))

(declare-fun m!11139 () Bool)

(assert (=> bs!830 m!11139))

(assert (=> b!8300 d!2436))

(declare-fun d!2438 () Bool)

(assert (=> d!2438 (= (invariant!0 (currentBit!1591 (_2!592 lt!11552)) (currentByte!1596 (_2!592 lt!11552)) (size!239 (buf!575 (_2!592 lt!11552)))) (and (bvsge (currentBit!1591 (_2!592 lt!11552)) #b00000000000000000000000000000000) (bvslt (currentBit!1591 (_2!592 lt!11552)) #b00000000000000000000000000001000) (bvsge (currentByte!1596 (_2!592 lt!11552)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1596 (_2!592 lt!11552)) (size!239 (buf!575 (_2!592 lt!11552)))) (and (= (currentBit!1591 (_2!592 lt!11552)) #b00000000000000000000000000000000) (= (currentByte!1596 (_2!592 lt!11552)) (size!239 (buf!575 (_2!592 lt!11552))))))))))

(assert (=> b!8302 d!2438))

(declare-fun b!8352 () Bool)

(declare-fun res!8911 () Bool)

(declare-fun e!5232 () Bool)

(assert (=> b!8352 (=> (not res!8911) (not e!5232))))

(declare-fun lt!11699 () tuple2!1122)

(assert (=> b!8352 (= res!8911 (invariant!0 (currentBit!1591 (_2!592 lt!11699)) (currentByte!1596 (_2!592 lt!11699)) (size!239 (buf!575 (_2!592 lt!11699)))))))

(declare-fun b!8353 () Bool)

(declare-fun res!8912 () Bool)

(assert (=> b!8353 (=> (not res!8912) (not e!5232))))

(assert (=> b!8353 (= res!8912 (= (size!239 (buf!575 (_2!592 lt!11699))) (size!239 (buf!575 thiss!1486))))))

(declare-fun b!8354 () Bool)

(declare-fun res!8914 () Bool)

(assert (=> b!8354 (=> (not res!8914) (not e!5232))))

(assert (=> b!8354 (= res!8914 (= (size!239 (buf!575 thiss!1486)) (size!239 (buf!575 (_2!592 lt!11699)))))))

(declare-fun b!8355 () Bool)

(declare-fun e!5231 () Bool)

(declare-fun lt!11714 () (_ BitVec 64))

(assert (=> b!8355 (= e!5231 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486)) lt!11714))))

(declare-fun b!8356 () Bool)

(declare-fun res!8913 () Bool)

(assert (=> b!8356 (=> (not res!8913) (not e!5232))))

(declare-fun isPrefixOf!0 (BitStream!456 BitStream!456) Bool)

(assert (=> b!8356 (= res!8913 (isPrefixOf!0 thiss!1486 (_2!592 lt!11699)))))

(declare-fun c!458 () Bool)

(declare-fun bm!110 () Bool)

(declare-datatypes ((tuple2!1126 0))(
  ( (tuple2!1127 (_1!594 BitStream!456) (_2!594 BitStream!456)) )
))
(declare-fun call!113 () tuple2!1126)

(declare-fun lt!11701 () tuple2!1122)

(declare-fun reader!0 (BitStream!456 BitStream!456) tuple2!1126)

(assert (=> bm!110 (= call!113 (reader!0 thiss!1486 (ite c!458 (_2!592 lt!11701) thiss!1486)))))

(declare-fun b!8357 () Bool)

(declare-fun e!5233 () tuple2!1122)

(declare-fun Unit!694 () Unit!690)

(assert (=> b!8357 (= e!5233 (tuple2!1123 Unit!694 thiss!1486))))

(assert (=> b!8357 (= (size!239 (buf!575 thiss!1486)) (size!239 (buf!575 thiss!1486)))))

(declare-fun lt!11718 () Unit!690)

(declare-fun Unit!695 () Unit!690)

(assert (=> b!8357 (= lt!11718 Unit!695)))

(declare-fun checkByteArrayBitContent!0 (BitStream!456 array!554 array!554 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1128 0))(
  ( (tuple2!1129 (_1!595 array!554) (_2!595 BitStream!456)) )
))
(declare-fun readBits!0 (BitStream!456 (_ BitVec 64)) tuple2!1128)

(assert (=> b!8357 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!595 (readBits!0 (_1!594 call!113) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11724 () tuple2!1126)

(declare-fun b!8358 () Bool)

(declare-datatypes ((List!135 0))(
  ( (Nil!132) (Cons!131 (h!250 Bool) (t!885 List!135)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!456 BitStream!456 (_ BitVec 64)) List!135)

(declare-fun byteArrayBitContentToList!0 (BitStream!456 array!554 (_ BitVec 64) (_ BitVec 64)) List!135)

(assert (=> b!8358 (= e!5232 (= (bitStreamReadBitsIntoList!0 (_2!592 lt!11699) (_1!594 lt!11724) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!592 lt!11699) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8358 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8358 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11710 () Unit!690)

(declare-fun lt!11735 () Unit!690)

(assert (=> b!8358 (= lt!11710 lt!11735)))

(assert (=> b!8358 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11699)))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486)) lt!11714)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!456 array!554 (_ BitVec 64)) Unit!690)

(assert (=> b!8358 (= lt!11735 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!575 (_2!592 lt!11699)) lt!11714))))

(assert (=> b!8358 e!5231))

(declare-fun res!8910 () Bool)

(assert (=> b!8358 (=> (not res!8910) (not e!5231))))

(assert (=> b!8358 (= res!8910 (and (= (size!239 (buf!575 thiss!1486)) (size!239 (buf!575 (_2!592 lt!11699)))) (bvsge lt!11714 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8358 (= lt!11714 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8358 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8358 (= lt!11724 (reader!0 thiss!1486 (_2!592 lt!11699)))))

(declare-fun b!8359 () Bool)

(declare-fun Unit!696 () Unit!690)

(assert (=> b!8359 (= e!5233 (tuple2!1123 Unit!696 (_2!592 lt!11701)))))

(declare-fun lt!11700 () tuple2!1122)

(declare-fun appendBitFromByte!0 (BitStream!456 (_ BitVec 8) (_ BitVec 32)) tuple2!1122)

(assert (=> b!8359 (= lt!11700 (appendBitFromByte!0 thiss!1486 (select (arr!644 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11698 () (_ BitVec 64))

(assert (=> b!8359 (= lt!11698 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11729 () (_ BitVec 64))

(assert (=> b!8359 (= lt!11729 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11716 () Unit!690)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!456 BitStream!456 (_ BitVec 64) (_ BitVec 64)) Unit!690)

(assert (=> b!8359 (= lt!11716 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!592 lt!11700) lt!11698 lt!11729))))

(assert (=> b!8359 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11700)))) ((_ sign_extend 32) (currentByte!1596 (_2!592 lt!11700))) ((_ sign_extend 32) (currentBit!1591 (_2!592 lt!11700))) (bvsub lt!11698 lt!11729))))

(declare-fun lt!11708 () Unit!690)

(assert (=> b!8359 (= lt!11708 lt!11716)))

(declare-fun lt!11726 () tuple2!1126)

(assert (=> b!8359 (= lt!11726 (reader!0 thiss!1486 (_2!592 lt!11700)))))

(declare-fun lt!11712 () (_ BitVec 64))

(assert (=> b!8359 (= lt!11712 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11720 () Unit!690)

(assert (=> b!8359 (= lt!11720 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!575 (_2!592 lt!11700)) lt!11712))))

(assert (=> b!8359 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11700)))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486)) lt!11712)))

(declare-fun lt!11692 () Unit!690)

(assert (=> b!8359 (= lt!11692 lt!11720)))

(declare-fun head!41 (List!135) Bool)

(assert (=> b!8359 (= (head!41 (byteArrayBitContentToList!0 (_2!592 lt!11700) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!41 (bitStreamReadBitsIntoList!0 (_2!592 lt!11700) (_1!594 lt!11726) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11734 () Unit!690)

(declare-fun Unit!697 () Unit!690)

(assert (=> b!8359 (= lt!11734 Unit!697)))

(assert (=> b!8359 (= lt!11701 (appendBitsMSBFirstLoop!0 (_2!592 lt!11700) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11696 () Unit!690)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!456 BitStream!456 BitStream!456) Unit!690)

(assert (=> b!8359 (= lt!11696 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!592 lt!11700) (_2!592 lt!11701)))))

(assert (=> b!8359 (isPrefixOf!0 thiss!1486 (_2!592 lt!11701))))

(declare-fun lt!11707 () Unit!690)

(assert (=> b!8359 (= lt!11707 lt!11696)))

(assert (=> b!8359 (= (size!239 (buf!575 (_2!592 lt!11701))) (size!239 (buf!575 thiss!1486)))))

(declare-fun lt!11733 () Unit!690)

(declare-fun Unit!698 () Unit!690)

(assert (=> b!8359 (= lt!11733 Unit!698)))

(assert (=> b!8359 (= (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11701))) (currentByte!1596 (_2!592 lt!11701)) (currentBit!1591 (_2!592 lt!11701))) (bvsub (bvadd (bitIndex!0 (size!239 (buf!575 thiss!1486)) (currentByte!1596 thiss!1486) (currentBit!1591 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11695 () Unit!690)

(declare-fun Unit!699 () Unit!690)

(assert (=> b!8359 (= lt!11695 Unit!699)))

(assert (=> b!8359 (= (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11701))) (currentByte!1596 (_2!592 lt!11701)) (currentBit!1591 (_2!592 lt!11701))) (bvsub (bvsub (bvadd (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11700))) (currentByte!1596 (_2!592 lt!11700)) (currentBit!1591 (_2!592 lt!11700))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11706 () Unit!690)

(declare-fun Unit!700 () Unit!690)

(assert (=> b!8359 (= lt!11706 Unit!700)))

(declare-fun lt!11732 () tuple2!1126)

(assert (=> b!8359 (= lt!11732 call!113)))

(declare-fun lt!11728 () (_ BitVec 64))

(assert (=> b!8359 (= lt!11728 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11704 () Unit!690)

(assert (=> b!8359 (= lt!11704 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!575 (_2!592 lt!11701)) lt!11728))))

(assert (=> b!8359 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11701)))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486)) lt!11728)))

(declare-fun lt!11709 () Unit!690)

(assert (=> b!8359 (= lt!11709 lt!11704)))

(declare-fun lt!11713 () tuple2!1126)

(assert (=> b!8359 (= lt!11713 (reader!0 (_2!592 lt!11700) (_2!592 lt!11701)))))

(declare-fun lt!11723 () (_ BitVec 64))

(assert (=> b!8359 (= lt!11723 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11727 () Unit!690)

(assert (=> b!8359 (= lt!11727 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!592 lt!11700) (buf!575 (_2!592 lt!11701)) lt!11723))))

(assert (=> b!8359 (validate_offset_bits!1 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11701)))) ((_ sign_extend 32) (currentByte!1596 (_2!592 lt!11700))) ((_ sign_extend 32) (currentBit!1591 (_2!592 lt!11700))) lt!11723)))

(declare-fun lt!11719 () Unit!690)

(assert (=> b!8359 (= lt!11719 lt!11727)))

(declare-fun lt!11717 () List!135)

(assert (=> b!8359 (= lt!11717 (byteArrayBitContentToList!0 (_2!592 lt!11701) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11693 () List!135)

(assert (=> b!8359 (= lt!11693 (byteArrayBitContentToList!0 (_2!592 lt!11701) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11703 () List!135)

(assert (=> b!8359 (= lt!11703 (bitStreamReadBitsIntoList!0 (_2!592 lt!11701) (_1!594 lt!11732) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11731 () List!135)

(assert (=> b!8359 (= lt!11731 (bitStreamReadBitsIntoList!0 (_2!592 lt!11701) (_1!594 lt!11713) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11721 () (_ BitVec 64))

(assert (=> b!8359 (= lt!11721 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11694 () Unit!690)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!456 BitStream!456 BitStream!456 BitStream!456 (_ BitVec 64) List!135) Unit!690)

(assert (=> b!8359 (= lt!11694 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!592 lt!11701) (_2!592 lt!11701) (_1!594 lt!11732) (_1!594 lt!11713) lt!11721 lt!11703))))

(declare-fun tail!49 (List!135) List!135)

(assert (=> b!8359 (= (bitStreamReadBitsIntoList!0 (_2!592 lt!11701) (_1!594 lt!11713) (bvsub lt!11721 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!49 lt!11703))))

(declare-fun lt!11722 () Unit!690)

(assert (=> b!8359 (= lt!11722 lt!11694)))

(declare-fun lt!11725 () (_ BitVec 64))

(declare-fun lt!11730 () Unit!690)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!554 array!554 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!690)

(assert (=> b!8359 (= lt!11730 (arrayBitRangesEqImpliesEq!0 (buf!575 (_2!592 lt!11700)) (buf!575 (_2!592 lt!11701)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11725 (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11700))) (currentByte!1596 (_2!592 lt!11700)) (currentBit!1591 (_2!592 lt!11700)))))))

(declare-fun bitAt!0 (array!554 (_ BitVec 64)) Bool)

(assert (=> b!8359 (= (bitAt!0 (buf!575 (_2!592 lt!11700)) lt!11725) (bitAt!0 (buf!575 (_2!592 lt!11701)) lt!11725))))

(declare-fun lt!11702 () Unit!690)

(assert (=> b!8359 (= lt!11702 lt!11730)))

(declare-fun d!2440 () Bool)

(assert (=> d!2440 e!5232))

(declare-fun res!8915 () Bool)

(assert (=> d!2440 (=> (not res!8915) (not e!5232))))

(declare-fun lt!11697 () (_ BitVec 64))

(assert (=> d!2440 (= res!8915 (= (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11699))) (currentByte!1596 (_2!592 lt!11699)) (currentBit!1591 (_2!592 lt!11699))) (bvsub lt!11697 from!367)))))

(assert (=> d!2440 (or (= (bvand lt!11697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11697 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11715 () (_ BitVec 64))

(assert (=> d!2440 (= lt!11697 (bvadd lt!11715 from!367 nBits!460))))

(assert (=> d!2440 (or (not (= (bvand lt!11715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11715 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2440 (= lt!11715 (bitIndex!0 (size!239 (buf!575 thiss!1486)) (currentByte!1596 thiss!1486) (currentBit!1591 thiss!1486)))))

(assert (=> d!2440 (= lt!11699 e!5233)))

(assert (=> d!2440 (= c!458 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11711 () Unit!690)

(declare-fun lt!11705 () Unit!690)

(assert (=> d!2440 (= lt!11711 lt!11705)))

(assert (=> d!2440 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!456) Unit!690)

(assert (=> d!2440 (= lt!11705 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2440 (= lt!11725 (bitIndex!0 (size!239 (buf!575 thiss!1486)) (currentByte!1596 thiss!1486) (currentBit!1591 thiss!1486)))))

(assert (=> d!2440 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2440 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11699)))

(assert (= (and d!2440 c!458) b!8359))

(assert (= (and d!2440 (not c!458)) b!8357))

(assert (= (or b!8359 b!8357) bm!110))

(assert (= (and d!2440 res!8915) b!8352))

(assert (= (and b!8352 res!8911) b!8354))

(assert (= (and b!8354 res!8914) b!8356))

(assert (= (and b!8356 res!8913) b!8353))

(assert (= (and b!8353 res!8912) b!8358))

(assert (= (and b!8358 res!8910) b!8355))

(declare-fun m!11153 () Bool)

(assert (=> b!8352 m!11153))

(declare-fun m!11155 () Bool)

(assert (=> b!8355 m!11155))

(declare-fun m!11157 () Bool)

(assert (=> d!2440 m!11157))

(assert (=> d!2440 m!11119))

(declare-fun m!11159 () Bool)

(assert (=> d!2440 m!11159))

(declare-fun m!11161 () Bool)

(assert (=> d!2440 m!11161))

(declare-fun m!11163 () Bool)

(assert (=> b!8357 m!11163))

(declare-fun m!11165 () Bool)

(assert (=> b!8357 m!11165))

(declare-fun m!11167 () Bool)

(assert (=> bm!110 m!11167))

(declare-fun m!11169 () Bool)

(assert (=> b!8359 m!11169))

(declare-fun m!11171 () Bool)

(assert (=> b!8359 m!11171))

(assert (=> b!8359 m!11169))

(declare-fun m!11173 () Bool)

(assert (=> b!8359 m!11173))

(declare-fun m!11175 () Bool)

(assert (=> b!8359 m!11175))

(declare-fun m!11177 () Bool)

(assert (=> b!8359 m!11177))

(declare-fun m!11179 () Bool)

(assert (=> b!8359 m!11179))

(declare-fun m!11181 () Bool)

(assert (=> b!8359 m!11181))

(declare-fun m!11183 () Bool)

(assert (=> b!8359 m!11183))

(declare-fun m!11185 () Bool)

(assert (=> b!8359 m!11185))

(declare-fun m!11187 () Bool)

(assert (=> b!8359 m!11187))

(declare-fun m!11189 () Bool)

(assert (=> b!8359 m!11189))

(declare-fun m!11191 () Bool)

(assert (=> b!8359 m!11191))

(declare-fun m!11193 () Bool)

(assert (=> b!8359 m!11193))

(declare-fun m!11195 () Bool)

(assert (=> b!8359 m!11195))

(declare-fun m!11197 () Bool)

(assert (=> b!8359 m!11197))

(declare-fun m!11199 () Bool)

(assert (=> b!8359 m!11199))

(declare-fun m!11201 () Bool)

(assert (=> b!8359 m!11201))

(declare-fun m!11203 () Bool)

(assert (=> b!8359 m!11203))

(declare-fun m!11205 () Bool)

(assert (=> b!8359 m!11205))

(declare-fun m!11207 () Bool)

(assert (=> b!8359 m!11207))

(declare-fun m!11209 () Bool)

(assert (=> b!8359 m!11209))

(declare-fun m!11211 () Bool)

(assert (=> b!8359 m!11211))

(declare-fun m!11213 () Bool)

(assert (=> b!8359 m!11213))

(assert (=> b!8359 m!11195))

(declare-fun m!11215 () Bool)

(assert (=> b!8359 m!11215))

(declare-fun m!11217 () Bool)

(assert (=> b!8359 m!11217))

(declare-fun m!11219 () Bool)

(assert (=> b!8359 m!11219))

(declare-fun m!11221 () Bool)

(assert (=> b!8359 m!11221))

(assert (=> b!8359 m!11217))

(declare-fun m!11223 () Bool)

(assert (=> b!8359 m!11223))

(declare-fun m!11225 () Bool)

(assert (=> b!8359 m!11225))

(declare-fun m!11227 () Bool)

(assert (=> b!8359 m!11227))

(declare-fun m!11229 () Bool)

(assert (=> b!8359 m!11229))

(assert (=> b!8359 m!11119))

(assert (=> b!8359 m!11205))

(declare-fun m!11231 () Bool)

(assert (=> b!8358 m!11231))

(declare-fun m!11233 () Bool)

(assert (=> b!8358 m!11233))

(declare-fun m!11235 () Bool)

(assert (=> b!8358 m!11235))

(declare-fun m!11237 () Bool)

(assert (=> b!8358 m!11237))

(declare-fun m!11239 () Bool)

(assert (=> b!8358 m!11239))

(declare-fun m!11241 () Bool)

(assert (=> b!8356 m!11241))

(assert (=> b!8302 d!2440))

(declare-fun d!2472 () Bool)

(assert (=> d!2472 (= (array_inv!234 srcBuffer!6) (bvsge (size!239 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1732 d!2472))

(declare-fun d!2474 () Bool)

(assert (=> d!2474 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1591 thiss!1486) (currentByte!1596 thiss!1486) (size!239 (buf!575 thiss!1486))))))

(declare-fun bs!834 () Bool)

(assert (= bs!834 d!2474))

(declare-fun m!11243 () Bool)

(assert (=> bs!834 m!11243))

(assert (=> start!1732 d!2474))

(declare-fun d!2476 () Bool)

(assert (=> d!2476 (= (array_inv!234 (buf!575 thiss!1486)) (bvsge (size!239 (buf!575 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8303 d!2476))

(declare-fun d!2478 () Bool)

(declare-fun e!5236 () Bool)

(assert (=> d!2478 e!5236))

(declare-fun res!8921 () Bool)

(assert (=> d!2478 (=> (not res!8921) (not e!5236))))

(declare-fun lt!11748 () (_ BitVec 64))

(declare-fun lt!11750 () (_ BitVec 64))

(declare-fun lt!11749 () (_ BitVec 64))

(assert (=> d!2478 (= res!8921 (= lt!11748 (bvsub lt!11749 lt!11750)))))

(assert (=> d!2478 (or (= (bvand lt!11749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!11750 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11749 lt!11750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2478 (= lt!11750 (remainingBits!0 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11552)))) ((_ sign_extend 32) (currentByte!1596 (_2!592 lt!11552))) ((_ sign_extend 32) (currentBit!1591 (_2!592 lt!11552)))))))

(declare-fun lt!11753 () (_ BitVec 64))

(declare-fun lt!11752 () (_ BitVec 64))

(assert (=> d!2478 (= lt!11749 (bvmul lt!11753 lt!11752))))

(assert (=> d!2478 (or (= lt!11753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!11752 (bvsdiv (bvmul lt!11753 lt!11752) lt!11753)))))

(assert (=> d!2478 (= lt!11752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2478 (= lt!11753 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11552)))))))

(assert (=> d!2478 (= lt!11748 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1596 (_2!592 lt!11552))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1591 (_2!592 lt!11552)))))))

(assert (=> d!2478 (invariant!0 (currentBit!1591 (_2!592 lt!11552)) (currentByte!1596 (_2!592 lt!11552)) (size!239 (buf!575 (_2!592 lt!11552))))))

(assert (=> d!2478 (= (bitIndex!0 (size!239 (buf!575 (_2!592 lt!11552))) (currentByte!1596 (_2!592 lt!11552)) (currentBit!1591 (_2!592 lt!11552))) lt!11748)))

(declare-fun b!8364 () Bool)

(declare-fun res!8920 () Bool)

(assert (=> b!8364 (=> (not res!8920) (not e!5236))))

(assert (=> b!8364 (= res!8920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!11748))))

(declare-fun b!8365 () Bool)

(declare-fun lt!11751 () (_ BitVec 64))

(assert (=> b!8365 (= e!5236 (bvsle lt!11748 (bvmul lt!11751 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8365 (or (= lt!11751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!11751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!11751)))))

(assert (=> b!8365 (= lt!11751 ((_ sign_extend 32) (size!239 (buf!575 (_2!592 lt!11552)))))))

(assert (= (and d!2478 res!8921) b!8364))

(assert (= (and b!8364 res!8920) b!8365))

(declare-fun m!11245 () Bool)

(assert (=> d!2478 m!11245))

(assert (=> d!2478 m!11107))

(assert (=> b!8304 d!2478))

(declare-fun d!2480 () Bool)

(declare-fun e!5237 () Bool)

(assert (=> d!2480 e!5237))

(declare-fun res!8923 () Bool)

(assert (=> d!2480 (=> (not res!8923) (not e!5237))))

(declare-fun lt!11755 () (_ BitVec 64))

(declare-fun lt!11756 () (_ BitVec 64))

(declare-fun lt!11754 () (_ BitVec 64))

(assert (=> d!2480 (= res!8923 (= lt!11754 (bvsub lt!11755 lt!11756)))))

(assert (=> d!2480 (or (= (bvand lt!11755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!11756 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11755 lt!11756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2480 (= lt!11756 (remainingBits!0 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))) ((_ sign_extend 32) (currentByte!1596 thiss!1486)) ((_ sign_extend 32) (currentBit!1591 thiss!1486))))))

(declare-fun lt!11759 () (_ BitVec 64))

(declare-fun lt!11758 () (_ BitVec 64))

(assert (=> d!2480 (= lt!11755 (bvmul lt!11759 lt!11758))))

(assert (=> d!2480 (or (= lt!11759 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!11758 (bvsdiv (bvmul lt!11759 lt!11758) lt!11759)))))

(assert (=> d!2480 (= lt!11758 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2480 (= lt!11759 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))))))

(assert (=> d!2480 (= lt!11754 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1596 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1591 thiss!1486))))))

(assert (=> d!2480 (invariant!0 (currentBit!1591 thiss!1486) (currentByte!1596 thiss!1486) (size!239 (buf!575 thiss!1486)))))

(assert (=> d!2480 (= (bitIndex!0 (size!239 (buf!575 thiss!1486)) (currentByte!1596 thiss!1486) (currentBit!1591 thiss!1486)) lt!11754)))

(declare-fun b!8366 () Bool)

(declare-fun res!8922 () Bool)

(assert (=> b!8366 (=> (not res!8922) (not e!5237))))

(assert (=> b!8366 (= res!8922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!11754))))

(declare-fun b!8367 () Bool)

(declare-fun lt!11757 () (_ BitVec 64))

(assert (=> b!8367 (= e!5237 (bvsle lt!11754 (bvmul lt!11757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8367 (or (= lt!11757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!11757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!11757)))))

(assert (=> b!8367 (= lt!11757 ((_ sign_extend 32) (size!239 (buf!575 thiss!1486))))))

(assert (= (and d!2480 res!8923) b!8366))

(assert (= (and b!8366 res!8922) b!8367))

(assert (=> d!2480 m!11139))

(assert (=> d!2480 m!11243))

(assert (=> b!8304 d!2480))

(check-sat (not b!8357) (not bm!110) (not d!2478) (not b!8352) (not b!8359) (not d!2480) (not b!8355) (not d!2436) (not d!2474) (not b!8356) (not b!8358) (not d!2440))
(check-sat)

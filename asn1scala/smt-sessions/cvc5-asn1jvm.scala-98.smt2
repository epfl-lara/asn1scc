; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2264 () Bool)

(assert start!2264)

(declare-fun res!10587 () Bool)

(declare-fun e!6525 () Bool)

(assert (=> start!2264 (=> (not res!10587) (not e!6525))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!636 0))(
  ( (array!637 (arr!691 (Array (_ BitVec 32) (_ BitVec 8))) (size!274 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!636)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2264 (= res!10587 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!274 srcBuffer!6))))))))

(assert (=> start!2264 e!6525))

(assert (=> start!2264 true))

(declare-fun array_inv!266 (array!636) Bool)

(assert (=> start!2264 (array_inv!266 srcBuffer!6)))

(declare-datatypes ((BitStream!514 0))(
  ( (BitStream!515 (buf!616 array!636) (currentByte!1682 (_ BitVec 32)) (currentBit!1677 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!514)

(declare-fun e!6521 () Bool)

(declare-fun inv!12 (BitStream!514) Bool)

(assert (=> start!2264 (and (inv!12 thiss!1486) e!6521)))

(declare-fun lt!16668 () (_ BitVec 64))

(declare-fun e!6527 () Bool)

(declare-fun lt!16676 () (_ BitVec 64))

(declare-fun b!10635 () Bool)

(assert (=> b!10635 (= e!6527 (or (not (= lt!16676 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!16676 (bvand lt!16668 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16669 () (_ BitVec 64))

(assert (=> b!10635 (= lt!16676 (bvand lt!16669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!10636 () Bool)

(assert (=> b!10636 (= e!6521 (array_inv!266 (buf!616 thiss!1486)))))

(declare-fun b!10637 () Bool)

(declare-fun res!10585 () Bool)

(declare-fun e!6520 () Bool)

(assert (=> b!10637 (=> res!10585 e!6520)))

(declare-datatypes ((Unit!920 0))(
  ( (Unit!921) )
))
(declare-datatypes ((tuple2!1306 0))(
  ( (tuple2!1307 (_1!696 Unit!920) (_2!696 BitStream!514)) )
))
(declare-fun lt!16675 () tuple2!1306)

(declare-datatypes ((List!153 0))(
  ( (Nil!150) (Cons!149 (h!268 Bool) (t!903 List!153)) )
))
(declare-fun lt!16674 () List!153)

(declare-fun byteArrayBitContentToList!0 (BitStream!514 array!636 (_ BitVec 64) (_ BitVec 64)) List!153)

(assert (=> b!10637 (= res!10585 (not (= lt!16674 (byteArrayBitContentToList!0 (_2!696 lt!16675) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!10638 () Bool)

(declare-fun res!10584 () Bool)

(declare-fun e!6523 () Bool)

(assert (=> b!10638 (=> (not res!10584) (not e!6523))))

(assert (=> b!10638 (= res!10584 (= (size!274 (buf!616 thiss!1486)) (size!274 (buf!616 (_2!696 lt!16675)))))))

(declare-fun b!10639 () Bool)

(assert (=> b!10639 (= e!6525 e!6523)))

(declare-fun res!10588 () Bool)

(assert (=> b!10639 (=> (not res!10588) (not e!6523))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10639 (= res!10588 (invariant!0 (currentBit!1677 (_2!696 lt!16675)) (currentByte!1682 (_2!696 lt!16675)) (size!274 (buf!616 (_2!696 lt!16675)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!514 array!636 (_ BitVec 64) (_ BitVec 64)) tuple2!1306)

(assert (=> b!10639 (= lt!16675 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10640 () Bool)

(declare-fun res!10591 () Bool)

(assert (=> b!10640 (=> (not res!10591) (not e!6525))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10640 (= res!10591 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) nBits!460))))

(declare-fun b!10641 () Bool)

(assert (=> b!10641 (= e!6520 e!6527)))

(declare-fun res!10583 () Bool)

(assert (=> b!10641 (=> res!10583 e!6527)))

(declare-datatypes ((tuple2!1308 0))(
  ( (tuple2!1309 (_1!697 array!636) (_2!697 BitStream!514)) )
))
(declare-fun lt!16672 () tuple2!1308)

(declare-fun checkByteArrayBitContent!0 (BitStream!514 array!636 array!636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10641 (= res!10583 (not (checkByteArrayBitContent!0 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!16673 () Unit!920)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!514 array!636 array!636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!920)

(assert (=> b!10641 (= lt!16673 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!10642 () Bool)

(declare-fun e!6524 () Bool)

(assert (=> b!10642 (= e!6524 (not e!6520))))

(declare-fun res!10589 () Bool)

(assert (=> b!10642 (=> res!10589 e!6520)))

(assert (=> b!10642 (= res!10589 (not (= (byteArrayBitContentToList!0 (_2!696 lt!16675) (_1!697 lt!16672) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!16674)))))

(declare-datatypes ((tuple2!1310 0))(
  ( (tuple2!1311 (_1!698 BitStream!514) (_2!698 BitStream!514)) )
))
(declare-fun lt!16670 () tuple2!1310)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!514 BitStream!514 (_ BitVec 64)) List!153)

(assert (=> b!10642 (= lt!16674 (bitStreamReadBitsIntoList!0 (_2!696 lt!16675) (_1!698 lt!16670) nBits!460))))

(declare-fun readBits!0 (BitStream!514 (_ BitVec 64)) tuple2!1308)

(assert (=> b!10642 (= lt!16672 (readBits!0 (_1!698 lt!16670) nBits!460))))

(assert (=> b!10642 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) nBits!460)))

(declare-fun lt!16671 () Unit!920)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!514 array!636 (_ BitVec 64)) Unit!920)

(assert (=> b!10642 (= lt!16671 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!616 (_2!696 lt!16675)) nBits!460))))

(declare-fun reader!0 (BitStream!514 BitStream!514) tuple2!1310)

(assert (=> b!10642 (= lt!16670 (reader!0 thiss!1486 (_2!696 lt!16675)))))

(declare-fun b!10643 () Bool)

(assert (=> b!10643 (= e!6523 e!6524)))

(declare-fun res!10586 () Bool)

(assert (=> b!10643 (=> (not res!10586) (not e!6524))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10643 (= res!10586 (= (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16675))) (currentByte!1682 (_2!696 lt!16675)) (currentBit!1677 (_2!696 lt!16675))) lt!16668))))

(assert (=> b!10643 (= lt!16668 (bvadd lt!16669 nBits!460))))

(assert (=> b!10643 (= lt!16669 (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)))))

(declare-fun b!10644 () Bool)

(declare-fun res!10590 () Bool)

(assert (=> b!10644 (=> (not res!10590) (not e!6524))))

(declare-fun isPrefixOf!0 (BitStream!514 BitStream!514) Bool)

(assert (=> b!10644 (= res!10590 (isPrefixOf!0 thiss!1486 (_2!696 lt!16675)))))

(assert (= (and start!2264 res!10587) b!10640))

(assert (= (and b!10640 res!10591) b!10639))

(assert (= (and b!10639 res!10588) b!10638))

(assert (= (and b!10638 res!10584) b!10643))

(assert (= (and b!10643 res!10586) b!10644))

(assert (= (and b!10644 res!10590) b!10642))

(assert (= (and b!10642 (not res!10589)) b!10637))

(assert (= (and b!10637 (not res!10585)) b!10641))

(assert (= (and b!10641 (not res!10583)) b!10635))

(assert (= start!2264 b!10636))

(declare-fun m!15533 () Bool)

(assert (=> b!10637 m!15533))

(declare-fun m!15535 () Bool)

(assert (=> b!10641 m!15535))

(declare-fun m!15537 () Bool)

(assert (=> b!10641 m!15537))

(declare-fun m!15539 () Bool)

(assert (=> b!10644 m!15539))

(declare-fun m!15541 () Bool)

(assert (=> b!10642 m!15541))

(declare-fun m!15543 () Bool)

(assert (=> b!10642 m!15543))

(declare-fun m!15545 () Bool)

(assert (=> b!10642 m!15545))

(declare-fun m!15547 () Bool)

(assert (=> b!10642 m!15547))

(declare-fun m!15549 () Bool)

(assert (=> b!10642 m!15549))

(declare-fun m!15551 () Bool)

(assert (=> b!10642 m!15551))

(declare-fun m!15553 () Bool)

(assert (=> b!10636 m!15553))

(declare-fun m!15555 () Bool)

(assert (=> b!10643 m!15555))

(declare-fun m!15557 () Bool)

(assert (=> b!10643 m!15557))

(declare-fun m!15559 () Bool)

(assert (=> start!2264 m!15559))

(declare-fun m!15561 () Bool)

(assert (=> start!2264 m!15561))

(declare-fun m!15563 () Bool)

(assert (=> b!10640 m!15563))

(declare-fun m!15565 () Bool)

(assert (=> b!10639 m!15565))

(declare-fun m!15567 () Bool)

(assert (=> b!10639 m!15567))

(push 1)

(assert (not b!10637))

(assert (not b!10643))

(assert (not b!10639))

(assert (not start!2264))

(assert (not b!10644))

(assert (not b!10641))

(assert (not b!10640))

(assert (not b!10636))

(assert (not b!10642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3344 () Bool)

(assert (=> d!3344 (= (invariant!0 (currentBit!1677 (_2!696 lt!16675)) (currentByte!1682 (_2!696 lt!16675)) (size!274 (buf!616 (_2!696 lt!16675)))) (and (bvsge (currentBit!1677 (_2!696 lt!16675)) #b00000000000000000000000000000000) (bvslt (currentBit!1677 (_2!696 lt!16675)) #b00000000000000000000000000001000) (bvsge (currentByte!1682 (_2!696 lt!16675)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1682 (_2!696 lt!16675)) (size!274 (buf!616 (_2!696 lt!16675)))) (and (= (currentBit!1677 (_2!696 lt!16675)) #b00000000000000000000000000000000) (= (currentByte!1682 (_2!696 lt!16675)) (size!274 (buf!616 (_2!696 lt!16675))))))))))

(assert (=> b!10639 d!3344))

(declare-fun b!10760 () Bool)

(declare-fun e!6606 () tuple2!1306)

(declare-fun lt!16953 () tuple2!1306)

(declare-fun Unit!926 () Unit!920)

(assert (=> b!10760 (= e!6606 (tuple2!1307 Unit!926 (_2!696 lt!16953)))))

(declare-fun lt!16943 () tuple2!1306)

(declare-fun appendBitFromByte!0 (BitStream!514 (_ BitVec 8) (_ BitVec 32)) tuple2!1306)

(assert (=> b!10760 (= lt!16943 (appendBitFromByte!0 thiss!1486 (select (arr!691 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!16962 () (_ BitVec 64))

(assert (=> b!10760 (= lt!16962 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16941 () (_ BitVec 64))

(assert (=> b!10760 (= lt!16941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16976 () Unit!920)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!514 BitStream!514 (_ BitVec 64) (_ BitVec 64)) Unit!920)

(assert (=> b!10760 (= lt!16976 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!696 lt!16943) lt!16962 lt!16941))))

(assert (=> b!10760 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16943)))) ((_ sign_extend 32) (currentByte!1682 (_2!696 lt!16943))) ((_ sign_extend 32) (currentBit!1677 (_2!696 lt!16943))) (bvsub lt!16962 lt!16941))))

(declare-fun lt!16950 () Unit!920)

(assert (=> b!10760 (= lt!16950 lt!16976)))

(declare-fun lt!16973 () tuple2!1310)

(assert (=> b!10760 (= lt!16973 (reader!0 thiss!1486 (_2!696 lt!16943)))))

(declare-fun lt!16963 () (_ BitVec 64))

(assert (=> b!10760 (= lt!16963 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16967 () Unit!920)

(assert (=> b!10760 (= lt!16967 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!616 (_2!696 lt!16943)) lt!16963))))

(assert (=> b!10760 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16943)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) lt!16963)))

(declare-fun lt!16937 () Unit!920)

(assert (=> b!10760 (= lt!16937 lt!16967)))

(declare-fun head!59 (List!153) Bool)

(assert (=> b!10760 (= (head!59 (byteArrayBitContentToList!0 (_2!696 lt!16943) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!59 (bitStreamReadBitsIntoList!0 (_2!696 lt!16943) (_1!698 lt!16973) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16961 () Unit!920)

(declare-fun Unit!927 () Unit!920)

(assert (=> b!10760 (= lt!16961 Unit!927)))

(assert (=> b!10760 (= lt!16953 (appendBitsMSBFirstLoop!0 (_2!696 lt!16943) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!16942 () Unit!920)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!514 BitStream!514 BitStream!514) Unit!920)

(assert (=> b!10760 (= lt!16942 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!696 lt!16943) (_2!696 lt!16953)))))

(assert (=> b!10760 (isPrefixOf!0 thiss!1486 (_2!696 lt!16953))))

(declare-fun lt!16965 () Unit!920)

(assert (=> b!10760 (= lt!16965 lt!16942)))

(assert (=> b!10760 (= (size!274 (buf!616 (_2!696 lt!16953))) (size!274 (buf!616 thiss!1486)))))

(declare-fun lt!16974 () Unit!920)

(declare-fun Unit!928 () Unit!920)

(assert (=> b!10760 (= lt!16974 Unit!928)))

(assert (=> b!10760 (= (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16953))) (currentByte!1682 (_2!696 lt!16953)) (currentBit!1677 (_2!696 lt!16953))) (bvsub (bvadd (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!16968 () Unit!920)

(declare-fun Unit!929 () Unit!920)

(assert (=> b!10760 (= lt!16968 Unit!929)))

(assert (=> b!10760 (= (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16953))) (currentByte!1682 (_2!696 lt!16953)) (currentBit!1677 (_2!696 lt!16953))) (bvsub (bvsub (bvadd (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16943))) (currentByte!1682 (_2!696 lt!16943)) (currentBit!1677 (_2!696 lt!16943))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16972 () Unit!920)

(declare-fun Unit!930 () Unit!920)

(assert (=> b!10760 (= lt!16972 Unit!930)))

(declare-fun lt!16975 () tuple2!1310)

(assert (=> b!10760 (= lt!16975 (reader!0 thiss!1486 (_2!696 lt!16953)))))

(declare-fun lt!16939 () (_ BitVec 64))

(assert (=> b!10760 (= lt!16939 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16954 () Unit!920)

(assert (=> b!10760 (= lt!16954 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!616 (_2!696 lt!16953)) lt!16939))))

(assert (=> b!10760 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16953)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) lt!16939)))

(declare-fun lt!16966 () Unit!920)

(assert (=> b!10760 (= lt!16966 lt!16954)))

(declare-fun lt!16934 () tuple2!1310)

(declare-fun call!202 () tuple2!1310)

(assert (=> b!10760 (= lt!16934 call!202)))

(declare-fun lt!16947 () (_ BitVec 64))

(assert (=> b!10760 (= lt!16947 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16951 () Unit!920)

(assert (=> b!10760 (= lt!16951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!696 lt!16943) (buf!616 (_2!696 lt!16953)) lt!16947))))

(assert (=> b!10760 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16953)))) ((_ sign_extend 32) (currentByte!1682 (_2!696 lt!16943))) ((_ sign_extend 32) (currentBit!1677 (_2!696 lt!16943))) lt!16947)))

(declare-fun lt!16969 () Unit!920)

(assert (=> b!10760 (= lt!16969 lt!16951)))

(declare-fun lt!16956 () List!153)

(assert (=> b!10760 (= lt!16956 (byteArrayBitContentToList!0 (_2!696 lt!16953) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16945 () List!153)

(assert (=> b!10760 (= lt!16945 (byteArrayBitContentToList!0 (_2!696 lt!16953) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16936 () List!153)

(assert (=> b!10760 (= lt!16936 (bitStreamReadBitsIntoList!0 (_2!696 lt!16953) (_1!698 lt!16975) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16952 () List!153)

(assert (=> b!10760 (= lt!16952 (bitStreamReadBitsIntoList!0 (_2!696 lt!16953) (_1!698 lt!16934) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16948 () (_ BitVec 64))

(assert (=> b!10760 (= lt!16948 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16938 () Unit!920)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!514 BitStream!514 BitStream!514 BitStream!514 (_ BitVec 64) List!153) Unit!920)

(assert (=> b!10760 (= lt!16938 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!696 lt!16953) (_2!696 lt!16953) (_1!698 lt!16975) (_1!698 lt!16934) lt!16948 lt!16936))))

(declare-fun tail!67 (List!153) List!153)

(assert (=> b!10760 (= (bitStreamReadBitsIntoList!0 (_2!696 lt!16953) (_1!698 lt!16934) (bvsub lt!16948 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!67 lt!16936))))

(declare-fun lt!16946 () Unit!920)

(assert (=> b!10760 (= lt!16946 lt!16938)))

(declare-fun lt!16949 () (_ BitVec 64))

(declare-fun lt!16955 () Unit!920)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!636 array!636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!920)

(assert (=> b!10760 (= lt!16955 (arrayBitRangesEqImpliesEq!0 (buf!616 (_2!696 lt!16943)) (buf!616 (_2!696 lt!16953)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!16949 (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16943))) (currentByte!1682 (_2!696 lt!16943)) (currentBit!1677 (_2!696 lt!16943)))))))

(declare-fun bitAt!0 (array!636 (_ BitVec 64)) Bool)

(assert (=> b!10760 (= (bitAt!0 (buf!616 (_2!696 lt!16943)) lt!16949) (bitAt!0 (buf!616 (_2!696 lt!16953)) lt!16949))))

(declare-fun lt!16977 () Unit!920)

(assert (=> b!10760 (= lt!16977 lt!16955)))

(declare-fun b!10761 () Bool)

(declare-fun Unit!932 () Unit!920)

(assert (=> b!10761 (= e!6606 (tuple2!1307 Unit!932 thiss!1486))))

(assert (=> b!10761 (= (size!274 (buf!616 thiss!1486)) (size!274 (buf!616 thiss!1486)))))

(declare-fun lt!16959 () Unit!920)

(declare-fun Unit!934 () Unit!920)

(assert (=> b!10761 (= lt!16959 Unit!934)))

(assert (=> b!10761 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!697 (readBits!0 (_1!698 call!202) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10762 () Bool)

(declare-fun res!10694 () Bool)

(declare-fun e!6604 () Bool)

(assert (=> b!10762 (=> (not res!10694) (not e!6604))))

(declare-fun lt!16958 () tuple2!1306)

(assert (=> b!10762 (= res!10694 (= (size!274 (buf!616 thiss!1486)) (size!274 (buf!616 (_2!696 lt!16958)))))))

(declare-fun lt!16971 () tuple2!1310)

(declare-fun b!10763 () Bool)

(assert (=> b!10763 (= e!6604 (= (bitStreamReadBitsIntoList!0 (_2!696 lt!16958) (_1!698 lt!16971) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!696 lt!16958) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10763 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10763 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16960 () Unit!920)

(declare-fun lt!16964 () Unit!920)

(assert (=> b!10763 (= lt!16960 lt!16964)))

(declare-fun lt!16970 () (_ BitVec 64))

(assert (=> b!10763 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16958)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) lt!16970)))

(assert (=> b!10763 (= lt!16964 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!616 (_2!696 lt!16958)) lt!16970))))

(declare-fun e!6605 () Bool)

(assert (=> b!10763 e!6605))

(declare-fun res!10696 () Bool)

(assert (=> b!10763 (=> (not res!10696) (not e!6605))))

(assert (=> b!10763 (= res!10696 (and (= (size!274 (buf!616 thiss!1486)) (size!274 (buf!616 (_2!696 lt!16958)))) (bvsge lt!16970 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10763 (= lt!16970 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10763 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10763 (= lt!16971 (reader!0 thiss!1486 (_2!696 lt!16958)))))

(declare-fun b!10764 () Bool)

(declare-fun res!10693 () Bool)

(assert (=> b!10764 (=> (not res!10693) (not e!6604))))

(assert (=> b!10764 (= res!10693 (invariant!0 (currentBit!1677 (_2!696 lt!16958)) (currentByte!1682 (_2!696 lt!16958)) (size!274 (buf!616 (_2!696 lt!16958)))))))

(declare-fun b!10766 () Bool)

(declare-fun res!10698 () Bool)

(assert (=> b!10766 (=> (not res!10698) (not e!6604))))

(assert (=> b!10766 (= res!10698 (isPrefixOf!0 thiss!1486 (_2!696 lt!16958)))))

(declare-fun d!3346 () Bool)

(assert (=> d!3346 e!6604))

(declare-fun res!10695 () Bool)

(assert (=> d!3346 (=> (not res!10695) (not e!6604))))

(declare-fun lt!16935 () (_ BitVec 64))

(assert (=> d!3346 (= res!10695 (= (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16958))) (currentByte!1682 (_2!696 lt!16958)) (currentBit!1677 (_2!696 lt!16958))) (bvsub lt!16935 from!367)))))

(assert (=> d!3346 (or (= (bvand lt!16935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16935 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16957 () (_ BitVec 64))

(assert (=> d!3346 (= lt!16935 (bvadd lt!16957 from!367 nBits!460))))

(assert (=> d!3346 (or (not (= (bvand lt!16957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!16957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!16957 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3346 (= lt!16957 (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)))))

(assert (=> d!3346 (= lt!16958 e!6606)))

(declare-fun c!724 () Bool)

(assert (=> d!3346 (= c!724 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!16944 () Unit!920)

(declare-fun lt!16940 () Unit!920)

(assert (=> d!3346 (= lt!16944 lt!16940)))

(assert (=> d!3346 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!514) Unit!920)

(assert (=> d!3346 (= lt!16940 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3346 (= lt!16949 (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)))))

(assert (=> d!3346 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3346 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!16958)))

(declare-fun b!10765 () Bool)

(declare-fun res!10697 () Bool)

(assert (=> b!10765 (=> (not res!10697) (not e!6604))))

(assert (=> b!10765 (= res!10697 (= (size!274 (buf!616 (_2!696 lt!16958))) (size!274 (buf!616 thiss!1486))))))

(declare-fun b!10767 () Bool)

(assert (=> b!10767 (= e!6605 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) lt!16970))))

(declare-fun bm!199 () Bool)

(assert (=> bm!199 (= call!202 (reader!0 (ite c!724 (_2!696 lt!16943) thiss!1486) (ite c!724 (_2!696 lt!16953) thiss!1486)))))

(assert (= (and d!3346 c!724) b!10760))

(assert (= (and d!3346 (not c!724)) b!10761))

(assert (= (or b!10760 b!10761) bm!199))

(assert (= (and d!3346 res!10695) b!10764))

(assert (= (and b!10764 res!10693) b!10762))

(assert (= (and b!10762 res!10694) b!10766))

(assert (= (and b!10766 res!10698) b!10765))

(assert (= (and b!10765 res!10697) b!10763))

(assert (= (and b!10763 res!10696) b!10767))

(declare-fun m!15661 () Bool)

(assert (=> bm!199 m!15661))

(declare-fun m!15663 () Bool)

(assert (=> b!10760 m!15663))

(declare-fun m!15665 () Bool)

(assert (=> b!10760 m!15665))

(declare-fun m!15667 () Bool)

(assert (=> b!10760 m!15667))

(declare-fun m!15669 () Bool)

(assert (=> b!10760 m!15669))

(declare-fun m!15671 () Bool)

(assert (=> b!10760 m!15671))

(declare-fun m!15673 () Bool)

(assert (=> b!10760 m!15673))

(declare-fun m!15675 () Bool)

(assert (=> b!10760 m!15675))

(declare-fun m!15677 () Bool)

(assert (=> b!10760 m!15677))

(declare-fun m!15679 () Bool)

(assert (=> b!10760 m!15679))

(assert (=> b!10760 m!15663))

(declare-fun m!15681 () Bool)

(assert (=> b!10760 m!15681))

(declare-fun m!15683 () Bool)

(assert (=> b!10760 m!15683))

(declare-fun m!15685 () Bool)

(assert (=> b!10760 m!15685))

(declare-fun m!15687 () Bool)

(assert (=> b!10760 m!15687))

(declare-fun m!15689 () Bool)

(assert (=> b!10760 m!15689))

(declare-fun m!15691 () Bool)

(assert (=> b!10760 m!15691))

(declare-fun m!15693 () Bool)

(assert (=> b!10760 m!15693))

(assert (=> b!10760 m!15671))

(declare-fun m!15695 () Bool)

(assert (=> b!10760 m!15695))

(declare-fun m!15697 () Bool)

(assert (=> b!10760 m!15697))

(declare-fun m!15699 () Bool)

(assert (=> b!10760 m!15699))

(declare-fun m!15701 () Bool)

(assert (=> b!10760 m!15701))

(declare-fun m!15703 () Bool)

(assert (=> b!10760 m!15703))

(declare-fun m!15705 () Bool)

(assert (=> b!10760 m!15705))

(declare-fun m!15707 () Bool)

(assert (=> b!10760 m!15707))

(declare-fun m!15709 () Bool)

(assert (=> b!10760 m!15709))

(assert (=> b!10760 m!15699))

(declare-fun m!15711 () Bool)

(assert (=> b!10760 m!15711))

(declare-fun m!15713 () Bool)

(assert (=> b!10760 m!15713))

(assert (=> b!10760 m!15557))

(assert (=> b!10760 m!15683))

(declare-fun m!15715 () Bool)

(assert (=> b!10760 m!15715))

(declare-fun m!15717 () Bool)

(assert (=> b!10760 m!15717))

(declare-fun m!15719 () Bool)

(assert (=> b!10760 m!15719))

(declare-fun m!15721 () Bool)

(assert (=> b!10760 m!15721))

(declare-fun m!15723 () Bool)

(assert (=> b!10760 m!15723))

(declare-fun m!15725 () Bool)

(assert (=> b!10766 m!15725))

(declare-fun m!15727 () Bool)

(assert (=> b!10767 m!15727))

(declare-fun m!15729 () Bool)

(assert (=> b!10761 m!15729))

(declare-fun m!15731 () Bool)

(assert (=> b!10761 m!15731))

(declare-fun m!15733 () Bool)

(assert (=> b!10764 m!15733))

(declare-fun m!15735 () Bool)

(assert (=> d!3346 m!15735))

(assert (=> d!3346 m!15557))

(declare-fun m!15737 () Bool)

(assert (=> d!3346 m!15737))

(declare-fun m!15739 () Bool)

(assert (=> d!3346 m!15739))

(declare-fun m!15741 () Bool)

(assert (=> b!10763 m!15741))

(declare-fun m!15743 () Bool)

(assert (=> b!10763 m!15743))

(declare-fun m!15745 () Bool)

(assert (=> b!10763 m!15745))

(declare-fun m!15747 () Bool)

(assert (=> b!10763 m!15747))

(declare-fun m!15749 () Bool)

(assert (=> b!10763 m!15749))

(assert (=> b!10639 d!3346))

(declare-fun d!3366 () Bool)

(declare-fun res!10712 () Bool)

(declare-fun e!6616 () Bool)

(assert (=> d!3366 (=> (not res!10712) (not e!6616))))

(assert (=> d!3366 (= res!10712 (= (size!274 (buf!616 thiss!1486)) (size!274 (buf!616 (_2!696 lt!16675)))))))

(assert (=> d!3366 (= (isPrefixOf!0 thiss!1486 (_2!696 lt!16675)) e!6616)))

(declare-fun b!10786 () Bool)

(declare-fun res!10711 () Bool)

(assert (=> b!10786 (=> (not res!10711) (not e!6616))))

(assert (=> b!10786 (= res!10711 (bvsle (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)) (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16675))) (currentByte!1682 (_2!696 lt!16675)) (currentBit!1677 (_2!696 lt!16675)))))))

(declare-fun b!10787 () Bool)

(declare-fun e!6617 () Bool)

(assert (=> b!10787 (= e!6616 e!6617)))

(declare-fun res!10713 () Bool)

(assert (=> b!10787 (=> res!10713 e!6617)))

(assert (=> b!10787 (= res!10713 (= (size!274 (buf!616 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!10788 () Bool)

(declare-fun arrayBitRangesEq!0 (array!636 array!636 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10788 (= e!6617 (arrayBitRangesEq!0 (buf!616 thiss!1486) (buf!616 (_2!696 lt!16675)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486))))))

(assert (= (and d!3366 res!10712) b!10786))

(assert (= (and b!10786 res!10711) b!10787))

(assert (= (and b!10787 (not res!10713)) b!10788))

(assert (=> b!10786 m!15557))

(assert (=> b!10786 m!15555))

(assert (=> b!10788 m!15557))

(assert (=> b!10788 m!15557))

(declare-fun m!15841 () Bool)

(assert (=> b!10788 m!15841))

(assert (=> b!10644 d!3366))

(declare-fun d!3372 () Bool)

(declare-fun e!6630 () Bool)

(assert (=> d!3372 e!6630))

(declare-fun res!10737 () Bool)

(assert (=> d!3372 (=> (not res!10737) (not e!6630))))

(declare-fun lt!17123 () (_ BitVec 64))

(declare-fun lt!17127 () (_ BitVec 64))

(declare-fun lt!17125 () (_ BitVec 64))

(assert (=> d!3372 (= res!10737 (= lt!17125 (bvsub lt!17127 lt!17123)))))

(assert (=> d!3372 (or (= (bvand lt!17127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17127 lt!17123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3372 (= lt!17123 (remainingBits!0 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))) ((_ sign_extend 32) (currentByte!1682 (_2!696 lt!16675))) ((_ sign_extend 32) (currentBit!1677 (_2!696 lt!16675)))))))

(declare-fun lt!17124 () (_ BitVec 64))

(declare-fun lt!17122 () (_ BitVec 64))

(assert (=> d!3372 (= lt!17127 (bvmul lt!17124 lt!17122))))

(assert (=> d!3372 (or (= lt!17124 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!17122 (bvsdiv (bvmul lt!17124 lt!17122) lt!17124)))))

(assert (=> d!3372 (= lt!17122 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3372 (= lt!17124 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))))))

(assert (=> d!3372 (= lt!17125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1682 (_2!696 lt!16675))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1677 (_2!696 lt!16675)))))))

(assert (=> d!3372 (invariant!0 (currentBit!1677 (_2!696 lt!16675)) (currentByte!1682 (_2!696 lt!16675)) (size!274 (buf!616 (_2!696 lt!16675))))))

(assert (=> d!3372 (= (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16675))) (currentByte!1682 (_2!696 lt!16675)) (currentBit!1677 (_2!696 lt!16675))) lt!17125)))

(declare-fun b!10811 () Bool)

(declare-fun res!10736 () Bool)

(assert (=> b!10811 (=> (not res!10736) (not e!6630))))

(assert (=> b!10811 (= res!10736 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17125))))

(declare-fun b!10812 () Bool)

(declare-fun lt!17126 () (_ BitVec 64))

(assert (=> b!10812 (= e!6630 (bvsle lt!17125 (bvmul lt!17126 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10812 (or (= lt!17126 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!17126 #b0000000000000000000000000000000000000000000000000000000000001000) lt!17126)))))

(assert (=> b!10812 (= lt!17126 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))))))

(assert (= (and d!3372 res!10737) b!10811))

(assert (= (and b!10811 res!10736) b!10812))

(declare-fun m!15851 () Bool)

(assert (=> d!3372 m!15851))

(assert (=> d!3372 m!15565))

(assert (=> b!10643 d!3372))

(declare-fun d!3376 () Bool)

(declare-fun e!6631 () Bool)

(assert (=> d!3376 e!6631))

(declare-fun res!10739 () Bool)

(assert (=> d!3376 (=> (not res!10739) (not e!6631))))

(declare-fun lt!17133 () (_ BitVec 64))

(declare-fun lt!17131 () (_ BitVec 64))

(declare-fun lt!17135 () (_ BitVec 64))

(assert (=> d!3376 (= res!10739 (= lt!17133 (bvsub lt!17135 lt!17131)))))

(assert (=> d!3376 (or (= (bvand lt!17135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17131 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17135 lt!17131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3376 (= lt!17131 (remainingBits!0 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486))))))

(declare-fun lt!17132 () (_ BitVec 64))

(declare-fun lt!17130 () (_ BitVec 64))

(assert (=> d!3376 (= lt!17135 (bvmul lt!17132 lt!17130))))

(assert (=> d!3376 (or (= lt!17132 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!17130 (bvsdiv (bvmul lt!17132 lt!17130) lt!17132)))))

(assert (=> d!3376 (= lt!17130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3376 (= lt!17132 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))))))

(assert (=> d!3376 (= lt!17133 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1682 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1677 thiss!1486))))))

(assert (=> d!3376 (invariant!0 (currentBit!1677 thiss!1486) (currentByte!1682 thiss!1486) (size!274 (buf!616 thiss!1486)))))

(assert (=> d!3376 (= (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)) lt!17133)))

(declare-fun b!10813 () Bool)

(declare-fun res!10738 () Bool)

(assert (=> b!10813 (=> (not res!10738) (not e!6631))))

(assert (=> b!10813 (= res!10738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17133))))

(declare-fun b!10814 () Bool)

(declare-fun lt!17134 () (_ BitVec 64))

(assert (=> b!10814 (= e!6631 (bvsle lt!17133 (bvmul lt!17134 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10814 (or (= lt!17134 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!17134 #b0000000000000000000000000000000000000000000000000000000000001000) lt!17134)))))

(assert (=> b!10814 (= lt!17134 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))))))

(assert (= (and d!3376 res!10739) b!10813))

(assert (= (and b!10813 res!10738) b!10814))

(declare-fun m!15855 () Bool)

(assert (=> d!3376 m!15855))

(declare-fun m!15857 () Bool)

(assert (=> d!3376 m!15857))

(assert (=> b!10643 d!3376))

(declare-fun d!3380 () Bool)

(declare-fun c!730 () Bool)

(assert (=> d!3380 (= c!730 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6634 () List!153)

(assert (=> d!3380 (= (byteArrayBitContentToList!0 (_2!696 lt!16675) srcBuffer!6 from!367 nBits!460) e!6634)))

(declare-fun b!10819 () Bool)

(assert (=> b!10819 (= e!6634 Nil!150)))

(declare-fun b!10820 () Bool)

(assert (=> b!10820 (= e!6634 (Cons!149 (not (= (bvand ((_ sign_extend 24) (select (arr!691 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!696 lt!16675) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3380 c!730) b!10819))

(assert (= (and d!3380 (not c!730)) b!10820))

(assert (=> b!10820 m!15671))

(declare-fun m!15859 () Bool)

(assert (=> b!10820 m!15859))

(declare-fun m!15861 () Bool)

(assert (=> b!10820 m!15861))

(assert (=> b!10637 d!3380))

(declare-fun d!3382 () Bool)

(assert (=> d!3382 (= (array_inv!266 srcBuffer!6) (bvsge (size!274 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2264 d!3382))

(declare-fun d!3384 () Bool)

(assert (=> d!3384 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1677 thiss!1486) (currentByte!1682 thiss!1486) (size!274 (buf!616 thiss!1486))))))

(declare-fun bs!1000 () Bool)

(assert (= bs!1000 d!3384))

(assert (=> bs!1000 m!15857))

(assert (=> start!2264 d!3384))

(declare-fun d!3386 () Bool)

(declare-fun c!732 () Bool)

(assert (=> d!3386 (= c!732 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6640 () List!153)

(assert (=> d!3386 (= (byteArrayBitContentToList!0 (_2!696 lt!16675) (_1!697 lt!16672) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6640)))

(declare-fun b!10829 () Bool)

(assert (=> b!10829 (= e!6640 Nil!150)))

(declare-fun b!10830 () Bool)

(assert (=> b!10830 (= e!6640 (Cons!149 (not (= (bvand ((_ sign_extend 24) (select (arr!691 (_1!697 lt!16672)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!696 lt!16675) (_1!697 lt!16672) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3386 c!732) b!10829))

(assert (= (and d!3386 (not c!732)) b!10830))

(declare-fun m!15863 () Bool)

(assert (=> b!10830 m!15863))

(declare-fun m!15865 () Bool)

(assert (=> b!10830 m!15865))

(declare-fun m!15867 () Bool)

(assert (=> b!10830 m!15867))

(assert (=> b!10642 d!3386))

(declare-fun b!10869 () Bool)

(declare-fun res!10765 () Bool)

(declare-fun e!6655 () Bool)

(assert (=> b!10869 (=> (not res!10765) (not e!6655))))

(declare-fun lt!17240 () tuple2!1308)

(assert (=> b!10869 (= res!10765 (bvsle (currentByte!1682 (_1!698 lt!16670)) (currentByte!1682 (_2!697 lt!17240))))))

(declare-fun b!10870 () Bool)

(declare-fun res!10764 () Bool)

(assert (=> b!10870 (=> (not res!10764) (not e!6655))))

(declare-fun lt!17236 () (_ BitVec 64))

(assert (=> b!10870 (= res!10764 (= (bvadd lt!17236 nBits!460) (bitIndex!0 (size!274 (buf!616 (_2!697 lt!17240))) (currentByte!1682 (_2!697 lt!17240)) (currentBit!1677 (_2!697 lt!17240)))))))

(assert (=> b!10870 (or (not (= (bvand lt!17236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17236 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10870 (= lt!17236 (bitIndex!0 (size!274 (buf!616 (_1!698 lt!16670))) (currentByte!1682 (_1!698 lt!16670)) (currentBit!1677 (_1!698 lt!16670))))))

(declare-fun d!3388 () Bool)

(assert (=> d!3388 e!6655))

(declare-fun res!10766 () Bool)

(assert (=> d!3388 (=> (not res!10766) (not e!6655))))

(assert (=> d!3388 (= res!10766 (= (buf!616 (_2!697 lt!17240)) (buf!616 (_1!698 lt!16670))))))

(declare-datatypes ((tuple3!80 0))(
  ( (tuple3!81 (_1!705 Unit!920) (_2!705 BitStream!514) (_3!43 array!636)) )
))
(declare-fun lt!17235 () tuple3!80)

(assert (=> d!3388 (= lt!17240 (tuple2!1309 (_3!43 lt!17235) (_2!705 lt!17235)))))

(declare-fun readBitsLoop!0 (BitStream!514 (_ BitVec 64) array!636 (_ BitVec 64) (_ BitVec 64)) tuple3!80)

(assert (=> d!3388 (= lt!17235 (readBitsLoop!0 (_1!698 lt!16670) nBits!460 (array!637 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3388 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3388 (= (readBits!0 (_1!698 lt!16670) nBits!460) lt!17240)))

(declare-fun b!10871 () Bool)

(assert (=> b!10871 (= e!6655 (= (byteArrayBitContentToList!0 (_2!697 lt!17240) (_1!697 lt!17240) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!697 lt!17240) (_1!698 lt!16670) nBits!460)))))

(declare-fun b!10872 () Bool)

(declare-fun res!10767 () Bool)

(assert (=> b!10872 (=> (not res!10767) (not e!6655))))

(declare-fun lt!17234 () (_ BitVec 64))

(assert (=> b!10872 (= res!10767 (= (size!274 (_1!697 lt!17240)) ((_ extract 31 0) lt!17234)))))

(assert (=> b!10872 (and (bvslt lt!17234 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!17234 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!17238 () (_ BitVec 64))

(declare-fun lt!17237 () (_ BitVec 64))

(assert (=> b!10872 (= lt!17234 (bvsdiv lt!17238 lt!17237))))

(assert (=> b!10872 (and (not (= lt!17237 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!17238 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!17237 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!10872 (= lt!17237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!17232 () (_ BitVec 64))

(declare-fun lt!17239 () (_ BitVec 64))

(assert (=> b!10872 (= lt!17238 (bvsub lt!17232 lt!17239))))

(assert (=> b!10872 (or (= (bvand lt!17232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17232 lt!17239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10872 (= lt!17239 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17233 () (_ BitVec 64))

(assert (=> b!10872 (= lt!17232 (bvadd nBits!460 lt!17233))))

(assert (=> b!10872 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17233 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!17233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10872 (= lt!17233 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!10873 () Bool)

(declare-fun res!10768 () Bool)

(assert (=> b!10873 (=> (not res!10768) (not e!6655))))

(assert (=> b!10873 (= res!10768 (invariant!0 (currentBit!1677 (_2!697 lt!17240)) (currentByte!1682 (_2!697 lt!17240)) (size!274 (buf!616 (_2!697 lt!17240)))))))

(assert (= (and d!3388 res!10766) b!10870))

(assert (= (and b!10870 res!10764) b!10873))

(assert (= (and b!10873 res!10768) b!10872))

(assert (= (and b!10872 res!10767) b!10869))

(assert (= (and b!10869 res!10765) b!10871))

(declare-fun m!15977 () Bool)

(assert (=> b!10870 m!15977))

(declare-fun m!15979 () Bool)

(assert (=> b!10870 m!15979))

(declare-fun m!15981 () Bool)

(assert (=> d!3388 m!15981))

(declare-fun m!15983 () Bool)

(assert (=> b!10871 m!15983))

(declare-fun m!15985 () Bool)

(assert (=> b!10871 m!15985))

(declare-fun m!15987 () Bool)

(assert (=> b!10873 m!15987))

(assert (=> b!10642 d!3388))

(declare-fun d!3416 () Bool)

(assert (=> d!3416 (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) nBits!460)))

(declare-fun lt!17271 () Unit!920)

(declare-fun choose!9 (BitStream!514 array!636 (_ BitVec 64) BitStream!514) Unit!920)

(assert (=> d!3416 (= lt!17271 (choose!9 thiss!1486 (buf!616 (_2!696 lt!16675)) nBits!460 (BitStream!515 (buf!616 (_2!696 lt!16675)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486))))))

(assert (=> d!3416 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!616 (_2!696 lt!16675)) nBits!460) lt!17271)))

(declare-fun bs!1005 () Bool)

(assert (= bs!1005 d!3416))

(assert (=> bs!1005 m!15547))

(declare-fun m!15989 () Bool)

(assert (=> bs!1005 m!15989))

(assert (=> b!10642 d!3416))

(declare-fun lt!17380 () (_ BitVec 64))

(declare-fun b!10914 () Bool)

(declare-fun lt!17387 () (_ BitVec 64))

(declare-fun e!6670 () Bool)

(declare-fun lt!17372 () tuple2!1310)

(declare-fun withMovedBitIndex!0 (BitStream!514 (_ BitVec 64)) BitStream!514)

(assert (=> b!10914 (= e!6670 (= (_1!698 lt!17372) (withMovedBitIndex!0 (_2!698 lt!17372) (bvsub lt!17380 lt!17387))))))

(assert (=> b!10914 (or (= (bvand lt!17380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17380 lt!17387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10914 (= lt!17387 (bitIndex!0 (size!274 (buf!616 (_2!696 lt!16675))) (currentByte!1682 (_2!696 lt!16675)) (currentBit!1677 (_2!696 lt!16675))))))

(assert (=> b!10914 (= lt!17380 (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)))))

(declare-fun b!10915 () Bool)

(declare-fun res!10799 () Bool)

(assert (=> b!10915 (=> (not res!10799) (not e!6670))))

(assert (=> b!10915 (= res!10799 (isPrefixOf!0 (_2!698 lt!17372) (_2!696 lt!16675)))))

(declare-fun b!10916 () Bool)

(declare-fun e!6669 () Unit!920)

(declare-fun Unit!947 () Unit!920)

(assert (=> b!10916 (= e!6669 Unit!947)))

(declare-fun d!3418 () Bool)

(assert (=> d!3418 e!6670))

(declare-fun res!10801 () Bool)

(assert (=> d!3418 (=> (not res!10801) (not e!6670))))

(assert (=> d!3418 (= res!10801 (isPrefixOf!0 (_1!698 lt!17372) (_2!698 lt!17372)))))

(declare-fun lt!17374 () BitStream!514)

(assert (=> d!3418 (= lt!17372 (tuple2!1311 lt!17374 (_2!696 lt!16675)))))

(declare-fun lt!17378 () Unit!920)

(declare-fun lt!17388 () Unit!920)

(assert (=> d!3418 (= lt!17378 lt!17388)))

(assert (=> d!3418 (isPrefixOf!0 lt!17374 (_2!696 lt!16675))))

(assert (=> d!3418 (= lt!17388 (lemmaIsPrefixTransitive!0 lt!17374 (_2!696 lt!16675) (_2!696 lt!16675)))))

(declare-fun lt!17376 () Unit!920)

(declare-fun lt!17384 () Unit!920)

(assert (=> d!3418 (= lt!17376 lt!17384)))

(assert (=> d!3418 (isPrefixOf!0 lt!17374 (_2!696 lt!16675))))

(assert (=> d!3418 (= lt!17384 (lemmaIsPrefixTransitive!0 lt!17374 thiss!1486 (_2!696 lt!16675)))))

(declare-fun lt!17382 () Unit!920)

(assert (=> d!3418 (= lt!17382 e!6669)))

(declare-fun c!748 () Bool)

(assert (=> d!3418 (= c!748 (not (= (size!274 (buf!616 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!17389 () Unit!920)

(declare-fun lt!17381 () Unit!920)

(assert (=> d!3418 (= lt!17389 lt!17381)))

(assert (=> d!3418 (isPrefixOf!0 (_2!696 lt!16675) (_2!696 lt!16675))))

(assert (=> d!3418 (= lt!17381 (lemmaIsPrefixRefl!0 (_2!696 lt!16675)))))

(declare-fun lt!17390 () Unit!920)

(declare-fun lt!17377 () Unit!920)

(assert (=> d!3418 (= lt!17390 lt!17377)))

(assert (=> d!3418 (= lt!17377 (lemmaIsPrefixRefl!0 (_2!696 lt!16675)))))

(declare-fun lt!17371 () Unit!920)

(declare-fun lt!17383 () Unit!920)

(assert (=> d!3418 (= lt!17371 lt!17383)))

(assert (=> d!3418 (isPrefixOf!0 lt!17374 lt!17374)))

(assert (=> d!3418 (= lt!17383 (lemmaIsPrefixRefl!0 lt!17374))))

(declare-fun lt!17385 () Unit!920)

(declare-fun lt!17375 () Unit!920)

(assert (=> d!3418 (= lt!17385 lt!17375)))

(assert (=> d!3418 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3418 (= lt!17375 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3418 (= lt!17374 (BitStream!515 (buf!616 (_2!696 lt!16675)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)))))

(assert (=> d!3418 (isPrefixOf!0 thiss!1486 (_2!696 lt!16675))))

(assert (=> d!3418 (= (reader!0 thiss!1486 (_2!696 lt!16675)) lt!17372)))

(declare-fun b!10917 () Bool)

(declare-fun res!10800 () Bool)

(assert (=> b!10917 (=> (not res!10800) (not e!6670))))

(assert (=> b!10917 (= res!10800 (isPrefixOf!0 (_1!698 lt!17372) thiss!1486))))

(declare-fun b!10918 () Bool)

(declare-fun lt!17386 () Unit!920)

(assert (=> b!10918 (= e!6669 lt!17386)))

(declare-fun lt!17373 () (_ BitVec 64))

(assert (=> b!10918 (= lt!17373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!17379 () (_ BitVec 64))

(assert (=> b!10918 (= lt!17379 (bitIndex!0 (size!274 (buf!616 thiss!1486)) (currentByte!1682 thiss!1486) (currentBit!1677 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!636 array!636 (_ BitVec 64) (_ BitVec 64)) Unit!920)

(assert (=> b!10918 (= lt!17386 (arrayBitRangesEqSymmetric!0 (buf!616 thiss!1486) (buf!616 (_2!696 lt!16675)) lt!17373 lt!17379))))

(assert (=> b!10918 (arrayBitRangesEq!0 (buf!616 (_2!696 lt!16675)) (buf!616 thiss!1486) lt!17373 lt!17379)))

(assert (= (and d!3418 c!748) b!10918))

(assert (= (and d!3418 (not c!748)) b!10916))

(assert (= (and d!3418 res!10801) b!10917))

(assert (= (and b!10917 res!10800) b!10915))

(assert (= (and b!10915 res!10799) b!10914))

(declare-fun m!16029 () Bool)

(assert (=> b!10917 m!16029))

(declare-fun m!16031 () Bool)

(assert (=> b!10914 m!16031))

(assert (=> b!10914 m!15555))

(assert (=> b!10914 m!15557))

(assert (=> b!10918 m!15557))

(declare-fun m!16033 () Bool)

(assert (=> b!10918 m!16033))

(declare-fun m!16035 () Bool)

(assert (=> b!10918 m!16035))

(declare-fun m!16037 () Bool)

(assert (=> b!10915 m!16037))

(declare-fun m!16039 () Bool)

(assert (=> d!3418 m!16039))

(declare-fun m!16041 () Bool)

(assert (=> d!3418 m!16041))

(declare-fun m!16043 () Bool)

(assert (=> d!3418 m!16043))

(assert (=> d!3418 m!15739))

(declare-fun m!16045 () Bool)

(assert (=> d!3418 m!16045))

(declare-fun m!16047 () Bool)

(assert (=> d!3418 m!16047))

(assert (=> d!3418 m!15737))

(assert (=> d!3418 m!15539))

(declare-fun m!16049 () Bool)

(assert (=> d!3418 m!16049))

(declare-fun m!16051 () Bool)

(assert (=> d!3418 m!16051))

(declare-fun m!16053 () Bool)

(assert (=> d!3418 m!16053))

(assert (=> b!10642 d!3418))

(declare-fun b!10947 () Bool)

(declare-datatypes ((tuple2!1328 0))(
  ( (tuple2!1329 (_1!709 List!153) (_2!709 BitStream!514)) )
))
(declare-fun e!6682 () tuple2!1328)

(assert (=> b!10947 (= e!6682 (tuple2!1329 Nil!150 (_1!698 lt!16670)))))

(declare-fun b!10948 () Bool)

(declare-datatypes ((tuple2!1330 0))(
  ( (tuple2!1331 (_1!710 Bool) (_2!710 BitStream!514)) )
))
(declare-fun lt!17455 () tuple2!1330)

(declare-fun lt!17457 () (_ BitVec 64))

(assert (=> b!10948 (= e!6682 (tuple2!1329 (Cons!149 (_1!710 lt!17455) (bitStreamReadBitsIntoList!0 (_2!696 lt!16675) (_2!710 lt!17455) (bvsub nBits!460 lt!17457))) (_2!710 lt!17455)))))

(declare-fun readBit!0 (BitStream!514) tuple2!1330)

(assert (=> b!10948 (= lt!17455 (readBit!0 (_1!698 lt!16670)))))

(assert (=> b!10948 (= lt!17457 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!10949 () Bool)

(declare-fun e!6681 () Bool)

(declare-fun lt!17456 () List!153)

(declare-fun isEmpty!35 (List!153) Bool)

(assert (=> b!10949 (= e!6681 (isEmpty!35 lt!17456))))

(declare-fun b!10950 () Bool)

(declare-fun length!30 (List!153) Int)

(assert (=> b!10950 (= e!6681 (> (length!30 lt!17456) 0))))

(declare-fun d!3424 () Bool)

(assert (=> d!3424 e!6681))

(declare-fun c!755 () Bool)

(assert (=> d!3424 (= c!755 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3424 (= lt!17456 (_1!709 e!6682))))

(declare-fun c!756 () Bool)

(assert (=> d!3424 (= c!756 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3424 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3424 (= (bitStreamReadBitsIntoList!0 (_2!696 lt!16675) (_1!698 lt!16670) nBits!460) lt!17456)))

(assert (= (and d!3424 c!756) b!10947))

(assert (= (and d!3424 (not c!756)) b!10948))

(assert (= (and d!3424 c!755) b!10949))

(assert (= (and d!3424 (not c!755)) b!10950))

(declare-fun m!16055 () Bool)

(assert (=> b!10948 m!16055))

(declare-fun m!16057 () Bool)

(assert (=> b!10948 m!16057))

(declare-fun m!16059 () Bool)

(assert (=> b!10949 m!16059))

(declare-fun m!16061 () Bool)

(assert (=> b!10950 m!16061))

(assert (=> b!10642 d!3424))

(declare-fun d!3426 () Bool)

(assert (=> d!3426 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!274 (buf!616 (_2!696 lt!16675)))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486))) nBits!460))))

(declare-fun bs!1006 () Bool)

(assert (= bs!1006 d!3426))

(declare-fun m!16063 () Bool)

(assert (=> bs!1006 m!16063))

(assert (=> b!10642 d!3426))

(declare-fun d!3428 () Bool)

(declare-fun res!10830 () Bool)

(declare-fun e!6693 () Bool)

(assert (=> d!3428 (=> res!10830 e!6693)))

(assert (=> d!3428 (= res!10830 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3428 (= (checkByteArrayBitContent!0 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6693)))

(declare-fun b!10971 () Bool)

(declare-fun e!6694 () Bool)

(assert (=> b!10971 (= e!6693 e!6694)))

(declare-fun res!10831 () Bool)

(assert (=> b!10971 (=> (not res!10831) (not e!6694))))

(assert (=> b!10971 (= res!10831 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!691 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!691 (_1!697 lt!16672)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!10972 () Bool)

(assert (=> b!10972 (= e!6694 (checkByteArrayBitContent!0 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3428 (not res!10830)) b!10971))

(assert (= (and b!10971 res!10831) b!10972))

(assert (=> b!10971 m!15671))

(assert (=> b!10971 m!15859))

(assert (=> b!10971 m!15863))

(assert (=> b!10971 m!15865))

(declare-fun m!16109 () Bool)

(assert (=> b!10972 m!16109))

(assert (=> b!10641 d!3428))

(declare-fun d!3440 () Bool)

(assert (=> d!3440 (checkByteArrayBitContent!0 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!17501 () Unit!920)

(declare-fun choose!65 (BitStream!514 array!636 array!636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!920)

(assert (=> d!3440 (= lt!17501 (choose!65 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3440 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3440 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!696 lt!16675) srcBuffer!6 (_1!697 lt!16672) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17501)))

(declare-fun bs!1011 () Bool)

(assert (= bs!1011 d!3440))

(assert (=> bs!1011 m!15535))

(declare-fun m!16115 () Bool)

(assert (=> bs!1011 m!16115))

(assert (=> b!10641 d!3440))

(declare-fun d!3448 () Bool)

(assert (=> d!3448 (= (array_inv!266 (buf!616 thiss!1486)) (bvsge (size!274 (buf!616 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!10636 d!3448))

(declare-fun d!3450 () Bool)

(assert (=> d!3450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!274 (buf!616 thiss!1486))) ((_ sign_extend 32) (currentByte!1682 thiss!1486)) ((_ sign_extend 32) (currentBit!1677 thiss!1486))) nBits!460))))

(declare-fun bs!1012 () Bool)

(assert (= bs!1012 d!3450))

(assert (=> bs!1012 m!15855))

(assert (=> b!10640 d!3450))

(push 1)

(assert (not d!3376))

(assert (not b!10830))

(assert (not b!10918))

(assert (not b!10786))

(assert (not b!10972))

(assert (not b!10788))

(assert (not d!3450))

(assert (not b!10948))

(assert (not b!10949))

(assert (not b!10767))

(assert (not b!10766))

(assert (not d!3440))

(assert (not b!10871))

(assert (not d!3384))

(assert (not b!10950))

(assert (not b!10760))

(assert (not d!3418))

(assert (not b!10917))

(assert (not b!10764))

(assert (not b!10761))

(assert (not d!3388))

(assert (not b!10763))

(assert (not b!10914))

(assert (not d!3346))

(assert (not b!10915))

(assert (not b!10870))

(assert (not b!10873))

(assert (not bm!199))

(assert (not d!3426))

(assert (not d!3372))

(assert (not d!3416))

(assert (not b!10820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2686 () Bool)

(assert start!2686)

(declare-fun b!12913 () Bool)

(declare-fun res!12290 () Bool)

(declare-fun e!7827 () Bool)

(assert (=> b!12913 (=> (not res!12290) (not e!7827))))

(declare-datatypes ((array!701 0))(
  ( (array!702 (arr!734 (Array (_ BitVec 32) (_ BitVec 8))) (size!305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!570 0))(
  ( (BitStream!571 (buf!656 array!701) (currentByte!1740 (_ BitVec 32)) (currentBit!1735 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!570)

(declare-datatypes ((Unit!1093 0))(
  ( (Unit!1094) )
))
(declare-datatypes ((tuple2!1516 0))(
  ( (tuple2!1517 (_1!813 Unit!1093) (_2!813 BitStream!570)) )
))
(declare-fun lt!20704 () tuple2!1516)

(assert (=> b!12913 (= res!12290 (= (size!305 (buf!656 thiss!1486)) (size!305 (buf!656 (_2!813 lt!20704)))))))

(declare-fun b!12914 () Bool)

(declare-fun e!7829 () Bool)

(assert (=> b!12914 (= e!7829 e!7827)))

(declare-fun res!12289 () Bool)

(assert (=> b!12914 (=> (not res!12289) (not e!7827))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12914 (= res!12289 (invariant!0 (currentBit!1735 (_2!813 lt!20704)) (currentByte!1740 (_2!813 lt!20704)) (size!305 (buf!656 (_2!813 lt!20704)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!701)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!570 array!701 (_ BitVec 64) (_ BitVec 64)) tuple2!1516)

(assert (=> b!12914 (= lt!20704 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12915 () Bool)

(declare-fun res!12295 () Bool)

(assert (=> b!12915 (=> (not res!12295) (not e!7827))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12915 (= res!12295 (= (bitIndex!0 (size!305 (buf!656 (_2!813 lt!20704))) (currentByte!1740 (_2!813 lt!20704)) (currentBit!1735 (_2!813 lt!20704))) (bvadd (bitIndex!0 (size!305 (buf!656 thiss!1486)) (currentByte!1740 thiss!1486) (currentBit!1735 thiss!1486)) nBits!460)))))

(declare-fun b!12916 () Bool)

(declare-fun res!12291 () Bool)

(assert (=> b!12916 (=> (not res!12291) (not e!7829))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12916 (= res!12291 (validate_offset_bits!1 ((_ sign_extend 32) (size!305 (buf!656 thiss!1486))) ((_ sign_extend 32) (currentByte!1740 thiss!1486)) ((_ sign_extend 32) (currentBit!1735 thiss!1486)) nBits!460))))

(declare-fun res!12294 () Bool)

(assert (=> start!2686 (=> (not res!12294) (not e!7829))))

(assert (=> start!2686 (= res!12294 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!305 srcBuffer!6))))))))

(assert (=> start!2686 e!7829))

(assert (=> start!2686 true))

(declare-fun array_inv!294 (array!701) Bool)

(assert (=> start!2686 (array_inv!294 srcBuffer!6)))

(declare-fun e!7824 () Bool)

(declare-fun inv!12 (BitStream!570) Bool)

(assert (=> start!2686 (and (inv!12 thiss!1486) e!7824)))

(declare-fun b!12917 () Bool)

(declare-fun e!7828 () Bool)

(assert (=> b!12917 (= e!7827 (not e!7828))))

(declare-fun res!12292 () Bool)

(assert (=> b!12917 (=> res!12292 e!7828)))

(declare-datatypes ((List!181 0))(
  ( (Nil!178) (Cons!177 (h!296 Bool) (t!931 List!181)) )
))
(declare-fun lt!20706 () List!181)

(declare-datatypes ((tuple2!1518 0))(
  ( (tuple2!1519 (_1!814 array!701) (_2!814 BitStream!570)) )
))
(declare-fun lt!20707 () tuple2!1518)

(declare-fun byteArrayBitContentToList!0 (BitStream!570 array!701 (_ BitVec 64) (_ BitVec 64)) List!181)

(assert (=> b!12917 (= res!12292 (not (= (byteArrayBitContentToList!0 (_2!813 lt!20704) (_1!814 lt!20707) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20706)))))

(declare-datatypes ((tuple2!1520 0))(
  ( (tuple2!1521 (_1!815 BitStream!570) (_2!815 BitStream!570)) )
))
(declare-fun lt!20705 () tuple2!1520)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!570 BitStream!570 (_ BitVec 64)) List!181)

(assert (=> b!12917 (= lt!20706 (bitStreamReadBitsIntoList!0 (_2!813 lt!20704) (_1!815 lt!20705) nBits!460))))

(declare-fun readBits!0 (BitStream!570 (_ BitVec 64)) tuple2!1518)

(assert (=> b!12917 (= lt!20707 (readBits!0 (_1!815 lt!20705) nBits!460))))

(assert (=> b!12917 (validate_offset_bits!1 ((_ sign_extend 32) (size!305 (buf!656 (_2!813 lt!20704)))) ((_ sign_extend 32) (currentByte!1740 thiss!1486)) ((_ sign_extend 32) (currentBit!1735 thiss!1486)) nBits!460)))

(declare-fun lt!20708 () Unit!1093)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!570 array!701 (_ BitVec 64)) Unit!1093)

(assert (=> b!12917 (= lt!20708 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!656 (_2!813 lt!20704)) nBits!460))))

(declare-fun reader!0 (BitStream!570 BitStream!570) tuple2!1520)

(assert (=> b!12917 (= lt!20705 (reader!0 thiss!1486 (_2!813 lt!20704)))))

(declare-fun b!12918 () Bool)

(assert (=> b!12918 (= e!7828 true)))

(declare-fun lt!20703 () Unit!1093)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!570 array!701 array!701 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1093)

(assert (=> b!12918 (= lt!20703 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!813 lt!20704) srcBuffer!6 (_1!814 lt!20707) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12919 () Bool)

(assert (=> b!12919 (= e!7824 (array_inv!294 (buf!656 thiss!1486)))))

(declare-fun b!12920 () Bool)

(declare-fun res!12293 () Bool)

(assert (=> b!12920 (=> res!12293 e!7828)))

(assert (=> b!12920 (= res!12293 (not (= lt!20706 (byteArrayBitContentToList!0 (_2!813 lt!20704) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12921 () Bool)

(declare-fun res!12288 () Bool)

(assert (=> b!12921 (=> (not res!12288) (not e!7827))))

(declare-fun isPrefixOf!0 (BitStream!570 BitStream!570) Bool)

(assert (=> b!12921 (= res!12288 (isPrefixOf!0 thiss!1486 (_2!813 lt!20704)))))

(assert (= (and start!2686 res!12294) b!12916))

(assert (= (and b!12916 res!12291) b!12914))

(assert (= (and b!12914 res!12289) b!12913))

(assert (= (and b!12913 res!12290) b!12915))

(assert (= (and b!12915 res!12295) b!12921))

(assert (= (and b!12921 res!12288) b!12917))

(assert (= (and b!12917 (not res!12292)) b!12920))

(assert (= (and b!12920 (not res!12293)) b!12918))

(assert (= start!2686 b!12919))

(declare-fun m!19491 () Bool)

(assert (=> b!12917 m!19491))

(declare-fun m!19493 () Bool)

(assert (=> b!12917 m!19493))

(declare-fun m!19495 () Bool)

(assert (=> b!12917 m!19495))

(declare-fun m!19497 () Bool)

(assert (=> b!12917 m!19497))

(declare-fun m!19499 () Bool)

(assert (=> b!12917 m!19499))

(declare-fun m!19501 () Bool)

(assert (=> b!12917 m!19501))

(declare-fun m!19503 () Bool)

(assert (=> b!12918 m!19503))

(declare-fun m!19505 () Bool)

(assert (=> b!12920 m!19505))

(declare-fun m!19507 () Bool)

(assert (=> b!12915 m!19507))

(declare-fun m!19509 () Bool)

(assert (=> b!12915 m!19509))

(declare-fun m!19511 () Bool)

(assert (=> b!12914 m!19511))

(declare-fun m!19513 () Bool)

(assert (=> b!12914 m!19513))

(declare-fun m!19515 () Bool)

(assert (=> b!12916 m!19515))

(declare-fun m!19517 () Bool)

(assert (=> start!2686 m!19517))

(declare-fun m!19519 () Bool)

(assert (=> start!2686 m!19519))

(declare-fun m!19521 () Bool)

(assert (=> b!12921 m!19521))

(declare-fun m!19523 () Bool)

(assert (=> b!12919 m!19523))

(check-sat (not b!12919) (not b!12920) (not b!12917) (not b!12914) (not b!12921) (not b!12915) (not b!12916) (not start!2686) (not b!12918))

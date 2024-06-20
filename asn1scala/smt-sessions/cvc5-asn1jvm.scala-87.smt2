; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1820 () Bool)

(assert start!1820)

(declare-fun b!8608 () Bool)

(declare-fun res!9123 () Bool)

(declare-fun e!5368 () Bool)

(assert (=> b!8608 (=> (not res!9123) (not e!5368))))

(declare-datatypes ((array!570 0))(
  ( (array!571 (arr!649 (Array (_ BitVec 32) (_ BitVec 8))) (size!244 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!466 0))(
  ( (BitStream!467 (buf!580 array!570) (currentByte!1619 (_ BitVec 32)) (currentBit!1614 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!742 0))(
  ( (Unit!743) )
))
(declare-datatypes ((tuple2!1156 0))(
  ( (tuple2!1157 (_1!609 Unit!742) (_2!609 BitStream!466)) )
))
(declare-fun lt!12507 () tuple2!1156)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!466)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8608 (= res!9123 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507))) (bvadd (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) nBits!460)))))

(declare-fun b!8609 () Bool)

(declare-datatypes ((tuple2!1158 0))(
  ( (tuple2!1159 (_1!610 BitStream!466) (_2!610 BitStream!466)) )
))
(declare-fun lt!12509 () tuple2!1158)

(declare-datatypes ((List!141 0))(
  ( (Nil!138) (Cons!137 (h!256 Bool) (t!891 List!141)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!466 array!570 (_ BitVec 64) (_ BitVec 64)) List!141)

(declare-datatypes ((tuple2!1160 0))(
  ( (tuple2!1161 (_1!611 array!570) (_2!611 BitStream!466)) )
))
(declare-fun readBits!0 (BitStream!466 (_ BitVec 64)) tuple2!1160)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!466 BitStream!466 (_ BitVec 64)) List!141)

(assert (=> b!8609 (= e!5368 (not (= (byteArrayBitContentToList!0 (_2!609 lt!12507) (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!609 lt!12507) (_1!610 lt!12509) nBits!460))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8609 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) nBits!460)))

(declare-fun lt!12508 () Unit!742)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!466 array!570 (_ BitVec 64)) Unit!742)

(assert (=> b!8609 (= lt!12508 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12507)) nBits!460))))

(declare-fun reader!0 (BitStream!466 BitStream!466) tuple2!1158)

(assert (=> b!8609 (= lt!12509 (reader!0 thiss!1486 (_2!609 lt!12507)))))

(declare-fun b!8610 () Bool)

(declare-fun e!5371 () Bool)

(assert (=> b!8610 (= e!5371 e!5368)))

(declare-fun res!9124 () Bool)

(assert (=> b!8610 (=> (not res!9124) (not e!5368))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8610 (= res!9124 (invariant!0 (currentBit!1614 (_2!609 lt!12507)) (currentByte!1619 (_2!609 lt!12507)) (size!244 (buf!580 (_2!609 lt!12507)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!570)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!466 array!570 (_ BitVec 64) (_ BitVec 64)) tuple2!1156)

(assert (=> b!8610 (= lt!12507 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8611 () Bool)

(declare-fun res!9122 () Bool)

(assert (=> b!8611 (=> (not res!9122) (not e!5371))))

(assert (=> b!8611 (= res!9122 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) nBits!460))))

(declare-fun b!8612 () Bool)

(declare-fun res!9125 () Bool)

(assert (=> b!8612 (=> (not res!9125) (not e!5368))))

(assert (=> b!8612 (= res!9125 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!12507)))))))

(declare-fun b!8613 () Bool)

(declare-fun res!9126 () Bool)

(assert (=> b!8613 (=> (not res!9126) (not e!5368))))

(declare-fun isPrefixOf!0 (BitStream!466 BitStream!466) Bool)

(assert (=> b!8613 (= res!9126 (isPrefixOf!0 thiss!1486 (_2!609 lt!12507)))))

(declare-fun res!9127 () Bool)

(assert (=> start!1820 (=> (not res!9127) (not e!5371))))

(assert (=> start!1820 (= res!9127 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!244 srcBuffer!6))))))))

(assert (=> start!1820 e!5371))

(assert (=> start!1820 true))

(declare-fun array_inv!239 (array!570) Bool)

(assert (=> start!1820 (array_inv!239 srcBuffer!6)))

(declare-fun e!5370 () Bool)

(declare-fun inv!12 (BitStream!466) Bool)

(assert (=> start!1820 (and (inv!12 thiss!1486) e!5370)))

(declare-fun b!8607 () Bool)

(assert (=> b!8607 (= e!5370 (array_inv!239 (buf!580 thiss!1486)))))

(assert (= (and start!1820 res!9127) b!8611))

(assert (= (and b!8611 res!9122) b!8610))

(assert (= (and b!8610 res!9124) b!8612))

(assert (= (and b!8612 res!9125) b!8608))

(assert (= (and b!8608 res!9123) b!8613))

(assert (= (and b!8613 res!9126) b!8609))

(assert (= start!1820 b!8607))

(declare-fun m!11775 () Bool)

(assert (=> b!8607 m!11775))

(declare-fun m!11777 () Bool)

(assert (=> b!8609 m!11777))

(declare-fun m!11779 () Bool)

(assert (=> b!8609 m!11779))

(declare-fun m!11781 () Bool)

(assert (=> b!8609 m!11781))

(declare-fun m!11783 () Bool)

(assert (=> b!8609 m!11783))

(declare-fun m!11785 () Bool)

(assert (=> b!8609 m!11785))

(declare-fun m!11787 () Bool)

(assert (=> b!8609 m!11787))

(declare-fun m!11789 () Bool)

(assert (=> b!8613 m!11789))

(declare-fun m!11791 () Bool)

(assert (=> b!8610 m!11791))

(declare-fun m!11793 () Bool)

(assert (=> b!8610 m!11793))

(declare-fun m!11795 () Bool)

(assert (=> b!8611 m!11795))

(declare-fun m!11797 () Bool)

(assert (=> start!1820 m!11797))

(declare-fun m!11799 () Bool)

(assert (=> start!1820 m!11799))

(declare-fun m!11801 () Bool)

(assert (=> b!8608 m!11801))

(declare-fun m!11803 () Bool)

(assert (=> b!8608 m!11803))

(push 1)

(assert (not b!8607))

(assert (not b!8608))

(assert (not b!8610))

(assert (not b!8609))

(assert (not b!8613))

(assert (not b!8611))

(assert (not start!1820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2542 () Bool)

(assert (=> d!2542 (= (invariant!0 (currentBit!1614 (_2!609 lt!12507)) (currentByte!1619 (_2!609 lt!12507)) (size!244 (buf!580 (_2!609 lt!12507)))) (and (bvsge (currentBit!1614 (_2!609 lt!12507)) #b00000000000000000000000000000000) (bvslt (currentBit!1614 (_2!609 lt!12507)) #b00000000000000000000000000001000) (bvsge (currentByte!1619 (_2!609 lt!12507)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1619 (_2!609 lt!12507)) (size!244 (buf!580 (_2!609 lt!12507)))) (and (= (currentBit!1614 (_2!609 lt!12507)) #b00000000000000000000000000000000) (= (currentByte!1619 (_2!609 lt!12507)) (size!244 (buf!580 (_2!609 lt!12507))))))))))

(assert (=> b!8610 d!2542))

(declare-fun b!8729 () Bool)

(declare-fun res!9224 () Bool)

(declare-fun e!5435 () Bool)

(assert (=> b!8729 (=> (not res!9224) (not e!5435))))

(declare-fun lt!12903 () tuple2!1156)

(assert (=> b!8729 (= res!9224 (invariant!0 (currentBit!1614 (_2!609 lt!12903)) (currentByte!1619 (_2!609 lt!12903)) (size!244 (buf!580 (_2!609 lt!12903)))))))

(declare-fun b!8730 () Bool)

(declare-fun res!9221 () Bool)

(assert (=> b!8730 (=> (not res!9221) (not e!5435))))

(assert (=> b!8730 (= res!9221 (= (size!244 (buf!580 (_2!609 lt!12903))) (size!244 (buf!580 thiss!1486))))))

(declare-fun call!137 () tuple2!1158)

(declare-fun c!482 () Bool)

(declare-fun lt!12918 () tuple2!1156)

(declare-fun bm!134 () Bool)

(declare-fun lt!12882 () tuple2!1156)

(assert (=> bm!134 (= call!137 (reader!0 (ite c!482 (_2!609 lt!12918) thiss!1486) (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun b!8731 () Bool)

(declare-fun e!5434 () Bool)

(declare-fun lt!12885 () (_ BitVec 64))

(assert (=> b!8731 (= e!5434 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12885))))

(declare-fun b!8732 () Bool)

(declare-fun e!5433 () tuple2!1156)

(declare-fun Unit!759 () Unit!742)

(assert (=> b!8732 (= e!5433 (tuple2!1157 Unit!759 thiss!1486))))

(assert (=> b!8732 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 thiss!1486)))))

(declare-fun lt!12881 () Unit!742)

(declare-fun Unit!760 () Unit!742)

(assert (=> b!8732 (= lt!12881 Unit!760)))

(declare-fun checkByteArrayBitContent!0 (BitStream!466 array!570 array!570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8732 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!611 (readBits!0 (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8733 () Bool)

(declare-fun Unit!762 () Unit!742)

(assert (=> b!8733 (= e!5433 (tuple2!1157 Unit!762 (_2!609 lt!12882)))))

(declare-fun appendBitFromByte!0 (BitStream!466 (_ BitVec 8) (_ BitVec 32)) tuple2!1156)

(assert (=> b!8733 (= lt!12918 (appendBitFromByte!0 thiss!1486 (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!12913 () (_ BitVec 64))

(assert (=> b!8733 (= lt!12913 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12923 () (_ BitVec 64))

(assert (=> b!8733 (= lt!12923 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12914 () Unit!742)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!466 BitStream!466 (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> b!8733 (= lt!12914 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!609 lt!12918) lt!12913 lt!12923))))

(assert (=> b!8733 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) (bvsub lt!12913 lt!12923))))

(declare-fun lt!12900 () Unit!742)

(assert (=> b!8733 (= lt!12900 lt!12914)))

(declare-fun lt!12921 () tuple2!1158)

(assert (=> b!8733 (= lt!12921 (reader!0 thiss!1486 (_2!609 lt!12918)))))

(declare-fun lt!12917 () (_ BitVec 64))

(assert (=> b!8733 (= lt!12917 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12892 () Unit!742)

(assert (=> b!8733 (= lt!12892 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12918)) lt!12917))))

(assert (=> b!8733 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12917)))

(declare-fun lt!12884 () Unit!742)

(assert (=> b!8733 (= lt!12884 lt!12892)))

(declare-fun head!49 (List!141) Bool)

(assert (=> b!8733 (= (head!49 (byteArrayBitContentToList!0 (_2!609 lt!12918) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!49 (bitStreamReadBitsIntoList!0 (_2!609 lt!12918) (_1!610 lt!12921) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12887 () Unit!742)

(declare-fun Unit!765 () Unit!742)

(assert (=> b!8733 (= lt!12887 Unit!765)))

(assert (=> b!8733 (= lt!12882 (appendBitsMSBFirstLoop!0 (_2!609 lt!12918) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!12904 () Unit!742)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!466 BitStream!466 BitStream!466) Unit!742)

(assert (=> b!8733 (= lt!12904 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!609 lt!12918) (_2!609 lt!12882)))))

(assert (=> b!8733 (isPrefixOf!0 thiss!1486 (_2!609 lt!12882))))

(declare-fun lt!12880 () Unit!742)

(assert (=> b!8733 (= lt!12880 lt!12904)))

(assert (=> b!8733 (= (size!244 (buf!580 (_2!609 lt!12882))) (size!244 (buf!580 thiss!1486)))))

(declare-fun lt!12894 () Unit!742)

(declare-fun Unit!766 () Unit!742)

(assert (=> b!8733 (= lt!12894 Unit!766)))

(assert (=> b!8733 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12882))) (currentByte!1619 (_2!609 lt!12882)) (currentBit!1614 (_2!609 lt!12882))) (bvsub (bvadd (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!12901 () Unit!742)

(declare-fun Unit!767 () Unit!742)

(assert (=> b!8733 (= lt!12901 Unit!767)))

(assert (=> b!8733 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12882))) (currentByte!1619 (_2!609 lt!12882)) (currentBit!1614 (_2!609 lt!12882))) (bvsub (bvsub (bvadd (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12899 () Unit!742)

(declare-fun Unit!768 () Unit!742)

(assert (=> b!8733 (= lt!12899 Unit!768)))

(declare-fun lt!12909 () tuple2!1158)

(assert (=> b!8733 (= lt!12909 (reader!0 thiss!1486 (_2!609 lt!12882)))))

(declare-fun lt!12919 () (_ BitVec 64))

(assert (=> b!8733 (= lt!12919 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12907 () Unit!742)

(assert (=> b!8733 (= lt!12907 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12882)) lt!12919))))

(assert (=> b!8733 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12919)))

(declare-fun lt!12896 () Unit!742)

(assert (=> b!8733 (= lt!12896 lt!12907)))

(declare-fun lt!12910 () tuple2!1158)

(assert (=> b!8733 (= lt!12910 call!137)))

(declare-fun lt!12922 () (_ BitVec 64))

(assert (=> b!8733 (= lt!12922 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12890 () Unit!742)

(assert (=> b!8733 (= lt!12890 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!609 lt!12918) (buf!580 (_2!609 lt!12882)) lt!12922))))

(assert (=> b!8733 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!12922)))

(declare-fun lt!12897 () Unit!742)

(assert (=> b!8733 (= lt!12897 lt!12890)))

(declare-fun lt!12902 () List!141)

(assert (=> b!8733 (= lt!12902 (byteArrayBitContentToList!0 (_2!609 lt!12882) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12906 () List!141)

(assert (=> b!8733 (= lt!12906 (byteArrayBitContentToList!0 (_2!609 lt!12882) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12893 () List!141)

(assert (=> b!8733 (= lt!12893 (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12909) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12920 () List!141)

(assert (=> b!8733 (= lt!12920 (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12910) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12886 () (_ BitVec 64))

(assert (=> b!8733 (= lt!12886 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12888 () Unit!742)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!466 BitStream!466 BitStream!466 BitStream!466 (_ BitVec 64) List!141) Unit!742)

(assert (=> b!8733 (= lt!12888 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!609 lt!12882) (_2!609 lt!12882) (_1!610 lt!12909) (_1!610 lt!12910) lt!12886 lt!12893))))

(declare-fun tail!57 (List!141) List!141)

(assert (=> b!8733 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12910) (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!57 lt!12893))))

(declare-fun lt!12912 () Unit!742)

(assert (=> b!8733 (= lt!12912 lt!12888)))

(declare-fun lt!12911 () (_ BitVec 64))

(declare-fun lt!12898 () Unit!742)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!570 array!570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> b!8733 (= lt!12898 (arrayBitRangesEqImpliesEq!0 (buf!580 (_2!609 lt!12918)) (buf!580 (_2!609 lt!12882)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12911 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918)))))))

(declare-fun bitAt!0 (array!570 (_ BitVec 64)) Bool)

(assert (=> b!8733 (= (bitAt!0 (buf!580 (_2!609 lt!12918)) lt!12911) (bitAt!0 (buf!580 (_2!609 lt!12882)) lt!12911))))

(declare-fun lt!12905 () Unit!742)

(assert (=> b!8733 (= lt!12905 lt!12898)))

(declare-fun b!8734 () Bool)

(declare-fun res!9226 () Bool)

(assert (=> b!8734 (=> (not res!9226) (not e!5435))))

(assert (=> b!8734 (= res!9226 (isPrefixOf!0 thiss!1486 (_2!609 lt!12903)))))

(declare-fun d!2546 () Bool)

(assert (=> d!2546 e!5435))

(declare-fun res!9222 () Bool)

(assert (=> d!2546 (=> (not res!9222) (not e!5435))))

(declare-fun lt!12895 () (_ BitVec 64))

(assert (=> d!2546 (= res!9222 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12903))) (currentByte!1619 (_2!609 lt!12903)) (currentBit!1614 (_2!609 lt!12903))) (bvsub lt!12895 from!367)))))

(assert (=> d!2546 (or (= (bvand lt!12895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12895 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12891 () (_ BitVec 64))

(assert (=> d!2546 (= lt!12895 (bvadd lt!12891 from!367 nBits!460))))

(assert (=> d!2546 (or (not (= (bvand lt!12891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!12891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!12891 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2546 (= lt!12891 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> d!2546 (= lt!12903 e!5433)))

(assert (=> d!2546 (= c!482 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12889 () Unit!742)

(declare-fun lt!12883 () Unit!742)

(assert (=> d!2546 (= lt!12889 lt!12883)))

(assert (=> d!2546 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!466) Unit!742)

(assert (=> d!2546 (= lt!12883 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2546 (= lt!12911 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> d!2546 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2546 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12903)))

(declare-fun b!8735 () Bool)

(declare-fun lt!12916 () tuple2!1158)

(assert (=> b!8735 (= e!5435 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12903) (_1!610 lt!12916) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!609 lt!12903) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8735 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8735 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12908 () Unit!742)

(declare-fun lt!12915 () Unit!742)

(assert (=> b!8735 (= lt!12908 lt!12915)))

(assert (=> b!8735 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12885)))

(assert (=> b!8735 (= lt!12915 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12903)) lt!12885))))

(assert (=> b!8735 e!5434))

(declare-fun res!9223 () Bool)

(assert (=> b!8735 (=> (not res!9223) (not e!5434))))

(assert (=> b!8735 (= res!9223 (and (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!12903)))) (bvsge lt!12885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8735 (= lt!12885 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8735 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8735 (= lt!12916 (reader!0 thiss!1486 (_2!609 lt!12903)))))

(declare-fun b!8736 () Bool)

(declare-fun res!9225 () Bool)

(assert (=> b!8736 (=> (not res!9225) (not e!5435))))

(assert (=> b!8736 (= res!9225 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!12903)))))))

(assert (= (and d!2546 c!482) b!8733))

(assert (= (and d!2546 (not c!482)) b!8732))

(assert (= (or b!8733 b!8732) bm!134))

(assert (= (and d!2546 res!9222) b!8729))

(assert (= (and b!8729 res!9224) b!8736))

(assert (= (and b!8736 res!9225) b!8734))

(assert (= (and b!8734 res!9226) b!8730))

(assert (= (and b!8730 res!9221) b!8735))

(assert (= (and b!8735 res!9223) b!8731))

(declare-fun m!12059 () Bool)

(assert (=> d!2546 m!12059))

(assert (=> d!2546 m!11803))

(declare-fun m!12061 () Bool)

(assert (=> d!2546 m!12061))

(declare-fun m!12063 () Bool)

(assert (=> d!2546 m!12063))

(declare-fun m!12065 () Bool)

(assert (=> b!8735 m!12065))

(declare-fun m!12067 () Bool)

(assert (=> b!8735 m!12067))

(declare-fun m!12069 () Bool)

(assert (=> b!8735 m!12069))

(declare-fun m!12071 () Bool)

(assert (=> b!8735 m!12071))

(declare-fun m!12073 () Bool)

(assert (=> b!8735 m!12073))

(declare-fun m!12075 () Bool)

(assert (=> b!8733 m!12075))

(declare-fun m!12077 () Bool)

(assert (=> b!8733 m!12077))

(declare-fun m!12079 () Bool)

(assert (=> b!8733 m!12079))

(declare-fun m!12081 () Bool)

(assert (=> b!8733 m!12081))

(declare-fun m!12083 () Bool)

(assert (=> b!8733 m!12083))

(declare-fun m!12085 () Bool)

(assert (=> b!8733 m!12085))

(declare-fun m!12087 () Bool)

(assert (=> b!8733 m!12087))

(declare-fun m!12089 () Bool)

(assert (=> b!8733 m!12089))

(declare-fun m!12091 () Bool)

(assert (=> b!8733 m!12091))

(assert (=> b!8733 m!11803))

(declare-fun m!12093 () Bool)

(assert (=> b!8733 m!12093))

(declare-fun m!12095 () Bool)

(assert (=> b!8733 m!12095))

(declare-fun m!12097 () Bool)

(assert (=> b!8733 m!12097))

(declare-fun m!12099 () Bool)

(assert (=> b!8733 m!12099))

(declare-fun m!12101 () Bool)

(assert (=> b!8733 m!12101))

(declare-fun m!12103 () Bool)

(assert (=> b!8733 m!12103))

(declare-fun m!12105 () Bool)

(assert (=> b!8733 m!12105))

(declare-fun m!12107 () Bool)

(assert (=> b!8733 m!12107))

(assert (=> b!8733 m!12095))

(declare-fun m!12109 () Bool)

(assert (=> b!8733 m!12109))

(declare-fun m!12111 () Bool)

(assert (=> b!8733 m!12111))

(declare-fun m!12113 () Bool)

(assert (=> b!8733 m!12113))

(declare-fun m!12115 () Bool)

(assert (=> b!8733 m!12115))

(declare-fun m!12117 () Bool)

(assert (=> b!8733 m!12117))

(assert (=> b!8733 m!12093))

(declare-fun m!12119 () Bool)

(assert (=> b!8733 m!12119))

(assert (=> b!8733 m!12113))

(declare-fun m!12121 () Bool)

(assert (=> b!8733 m!12121))

(declare-fun m!12123 () Bool)

(assert (=> b!8733 m!12123))

(declare-fun m!12125 () Bool)

(assert (=> b!8733 m!12125))

(declare-fun m!12127 () Bool)

(assert (=> b!8733 m!12127))

(declare-fun m!12129 () Bool)

(assert (=> b!8733 m!12129))

(assert (=> b!8733 m!12081))

(declare-fun m!12131 () Bool)

(assert (=> b!8733 m!12131))

(declare-fun m!12133 () Bool)

(assert (=> b!8733 m!12133))

(declare-fun m!12135 () Bool)

(assert (=> b!8733 m!12135))

(declare-fun m!12137 () Bool)

(assert (=> bm!134 m!12137))

(declare-fun m!12139 () Bool)

(assert (=> b!8734 m!12139))

(declare-fun m!12141 () Bool)

(assert (=> b!8729 m!12141))

(declare-fun m!12143 () Bool)

(assert (=> b!8732 m!12143))

(declare-fun m!12145 () Bool)

(assert (=> b!8732 m!12145))

(declare-fun m!12147 () Bool)

(assert (=> b!8731 m!12147))

(assert (=> b!8610 d!2546))

(declare-fun d!2572 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) nBits!460))))

(declare-fun bs!851 () Bool)

(assert (= bs!851 d!2572))

(declare-fun m!12151 () Bool)

(assert (=> bs!851 m!12151))

(assert (=> b!8609 d!2572))

(declare-fun d!2578 () Bool)

(declare-fun e!5456 () Bool)

(assert (=> d!2578 e!5456))

(declare-fun c!499 () Bool)

(assert (=> d!2578 (= c!499 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!12963 () List!141)

(declare-datatypes ((tuple2!1174 0))(
  ( (tuple2!1175 (_1!618 List!141) (_2!618 BitStream!466)) )
))
(declare-fun e!5457 () tuple2!1174)

(assert (=> d!2578 (= lt!12963 (_1!618 e!5457))))

(declare-fun c!500 () Bool)

(assert (=> d!2578 (= c!500 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2578 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2578 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12507) (_1!610 lt!12509) nBits!460) lt!12963)))

(declare-fun b!8778 () Bool)

(declare-fun lt!12965 () (_ BitVec 64))

(declare-datatypes ((tuple2!1176 0))(
  ( (tuple2!1177 (_1!619 Bool) (_2!619 BitStream!466)) )
))
(declare-fun lt!12964 () tuple2!1176)

(assert (=> b!8778 (= e!5457 (tuple2!1175 (Cons!137 (_1!619 lt!12964) (bitStreamReadBitsIntoList!0 (_2!609 lt!12507) (_2!619 lt!12964) (bvsub nBits!460 lt!12965))) (_2!619 lt!12964)))))

(declare-fun readBit!0 (BitStream!466) tuple2!1176)

(assert (=> b!8778 (= lt!12964 (readBit!0 (_1!610 lt!12509)))))

(assert (=> b!8778 (= lt!12965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!8780 () Bool)

(declare-fun length!20 (List!141) Int)

(assert (=> b!8780 (= e!5456 (> (length!20 lt!12963) 0))))

(declare-fun b!8777 () Bool)

(assert (=> b!8777 (= e!5457 (tuple2!1175 Nil!138 (_1!610 lt!12509)))))

(declare-fun b!8779 () Bool)

(declare-fun isEmpty!25 (List!141) Bool)

(assert (=> b!8779 (= e!5456 (isEmpty!25 lt!12963))))

(assert (= (and d!2578 c!500) b!8777))

(assert (= (and d!2578 (not c!500)) b!8778))

(assert (= (and d!2578 c!499) b!8779))

(assert (= (and d!2578 (not c!499)) b!8780))

(declare-fun m!12167 () Bool)

(assert (=> b!8778 m!12167))

(declare-fun m!12169 () Bool)

(assert (=> b!8778 m!12169))

(declare-fun m!12171 () Bool)

(assert (=> b!8780 m!12171))

(declare-fun m!12173 () Bool)

(assert (=> b!8779 m!12173))

(assert (=> b!8609 d!2578))

(declare-fun b!8821 () Bool)

(declare-fun res!9264 () Bool)

(declare-fun e!5472 () Bool)

(assert (=> b!8821 (=> (not res!9264) (not e!5472))))

(declare-fun lt!13109 () tuple2!1160)

(declare-fun lt!13113 () (_ BitVec 64))

(assert (=> b!8821 (= res!9264 (= (bvadd lt!13113 nBits!460) (bitIndex!0 (size!244 (buf!580 (_2!611 lt!13109))) (currentByte!1619 (_2!611 lt!13109)) (currentBit!1614 (_2!611 lt!13109)))))))

(assert (=> b!8821 (or (not (= (bvand lt!13113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13113 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8821 (= lt!13113 (bitIndex!0 (size!244 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)) (currentBit!1614 (_1!610 lt!12509))))))

(declare-fun d!2586 () Bool)

(assert (=> d!2586 e!5472))

(declare-fun res!9266 () Bool)

(assert (=> d!2586 (=> (not res!9266) (not e!5472))))

(assert (=> d!2586 (= res!9266 (= (buf!580 (_2!611 lt!13109)) (buf!580 (_1!610 lt!12509))))))

(declare-datatypes ((tuple3!62 0))(
  ( (tuple3!63 (_1!620 Unit!742) (_2!620 BitStream!466) (_3!31 array!570)) )
))
(declare-fun lt!13110 () tuple3!62)

(assert (=> d!2586 (= lt!13109 (tuple2!1161 (_3!31 lt!13110) (_2!620 lt!13110)))))

(declare-fun readBitsLoop!0 (BitStream!466 (_ BitVec 64) array!570 (_ BitVec 64) (_ BitVec 64)) tuple3!62)

(assert (=> d!2586 (= lt!13110 (readBitsLoop!0 (_1!610 lt!12509) nBits!460 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2586 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2586 (= (readBits!0 (_1!610 lt!12509) nBits!460) lt!13109)))

(declare-fun b!8822 () Bool)

(declare-fun res!9263 () Bool)

(assert (=> b!8822 (=> (not res!9263) (not e!5472))))

(declare-fun lt!13114 () (_ BitVec 64))

(assert (=> b!8822 (= res!9263 (= (size!244 (_1!611 lt!13109)) ((_ extract 31 0) lt!13114)))))

(assert (=> b!8822 (and (bvslt lt!13114 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!13114 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!13111 () (_ BitVec 64))

(declare-fun lt!13107 () (_ BitVec 64))

(assert (=> b!8822 (= lt!13114 (bvsdiv lt!13111 lt!13107))))

(assert (=> b!8822 (and (not (= lt!13107 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!13111 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!13107 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!8822 (= lt!13107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!13108 () (_ BitVec 64))

(declare-fun lt!13112 () (_ BitVec 64))

(assert (=> b!8822 (= lt!13111 (bvsub lt!13108 lt!13112))))

(assert (=> b!8822 (or (= (bvand lt!13108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13112 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13108 lt!13112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8822 (= lt!13112 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13115 () (_ BitVec 64))

(assert (=> b!8822 (= lt!13108 (bvadd nBits!460 lt!13115))))

(assert (=> b!8822 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13115 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!13115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8822 (= lt!13115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!8823 () Bool)

(declare-fun res!9267 () Bool)

(assert (=> b!8823 (=> (not res!9267) (not e!5472))))

(assert (=> b!8823 (= res!9267 (bvsle (currentByte!1619 (_1!610 lt!12509)) (currentByte!1619 (_2!611 lt!13109))))))

(declare-fun b!8824 () Bool)

(assert (=> b!8824 (= e!5472 (= (byteArrayBitContentToList!0 (_2!611 lt!13109) (_1!611 lt!13109) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!611 lt!13109) (_1!610 lt!12509) nBits!460)))))

(declare-fun b!8825 () Bool)

(declare-fun res!9265 () Bool)

(assert (=> b!8825 (=> (not res!9265) (not e!5472))))

(assert (=> b!8825 (= res!9265 (invariant!0 (currentBit!1614 (_2!611 lt!13109)) (currentByte!1619 (_2!611 lt!13109)) (size!244 (buf!580 (_2!611 lt!13109)))))))

(assert (= (and d!2586 res!9266) b!8821))

(assert (= (and b!8821 res!9264) b!8825))

(assert (= (and b!8825 res!9265) b!8822))

(assert (= (and b!8822 res!9263) b!8823))

(assert (= (and b!8823 res!9267) b!8824))

(declare-fun m!12231 () Bool)

(assert (=> b!8821 m!12231))

(declare-fun m!12233 () Bool)

(assert (=> b!8821 m!12233))

(declare-fun m!12235 () Bool)

(assert (=> d!2586 m!12235))

(declare-fun m!12237 () Bool)

(assert (=> b!8824 m!12237))

(declare-fun m!12239 () Bool)

(assert (=> b!8824 m!12239))

(declare-fun m!12241 () Bool)

(assert (=> b!8825 m!12241))

(assert (=> b!8609 d!2586))

(declare-fun d!2596 () Bool)

(assert (=> d!2596 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) nBits!460)))

(declare-fun lt!13118 () Unit!742)

(declare-fun choose!9 (BitStream!466 array!570 (_ BitVec 64) BitStream!466) Unit!742)

(assert (=> d!2596 (= lt!13118 (choose!9 thiss!1486 (buf!580 (_2!609 lt!12507)) nBits!460 (BitStream!467 (buf!580 (_2!609 lt!12507)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (=> d!2596 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12507)) nBits!460) lt!13118)))

(declare-fun bs!854 () Bool)

(assert (= bs!854 d!2596))

(assert (=> bs!854 m!11781))

(declare-fun m!12243 () Bool)

(assert (=> bs!854 m!12243))

(assert (=> b!8609 d!2596))

(declare-fun b!8866 () Bool)

(declare-fun res!9305 () Bool)

(declare-fun e!5484 () Bool)

(assert (=> b!8866 (=> (not res!9305) (not e!5484))))

(declare-fun lt!13216 () tuple2!1158)

(assert (=> b!8866 (= res!9305 (isPrefixOf!0 (_1!610 lt!13216) thiss!1486))))

(declare-fun b!8867 () Bool)

(declare-fun res!9304 () Bool)

(assert (=> b!8867 (=> (not res!9304) (not e!5484))))

(assert (=> b!8867 (= res!9304 (isPrefixOf!0 (_2!610 lt!13216) (_2!609 lt!12507)))))

(declare-fun b!8868 () Bool)

(declare-fun e!5483 () Unit!742)

(declare-fun Unit!770 () Unit!742)

(assert (=> b!8868 (= e!5483 Unit!770)))

(declare-fun d!2598 () Bool)

(assert (=> d!2598 e!5484))

(declare-fun res!9306 () Bool)

(assert (=> d!2598 (=> (not res!9306) (not e!5484))))

(assert (=> d!2598 (= res!9306 (isPrefixOf!0 (_1!610 lt!13216) (_2!610 lt!13216)))))

(declare-fun lt!13222 () BitStream!466)

(assert (=> d!2598 (= lt!13216 (tuple2!1159 lt!13222 (_2!609 lt!12507)))))

(declare-fun lt!13225 () Unit!742)

(declare-fun lt!13232 () Unit!742)

(assert (=> d!2598 (= lt!13225 lt!13232)))

(assert (=> d!2598 (isPrefixOf!0 lt!13222 (_2!609 lt!12507))))

(assert (=> d!2598 (= lt!13232 (lemmaIsPrefixTransitive!0 lt!13222 (_2!609 lt!12507) (_2!609 lt!12507)))))

(declare-fun lt!13217 () Unit!742)

(declare-fun lt!13233 () Unit!742)

(assert (=> d!2598 (= lt!13217 lt!13233)))

(assert (=> d!2598 (isPrefixOf!0 lt!13222 (_2!609 lt!12507))))

(assert (=> d!2598 (= lt!13233 (lemmaIsPrefixTransitive!0 lt!13222 thiss!1486 (_2!609 lt!12507)))))

(declare-fun lt!13235 () Unit!742)

(assert (=> d!2598 (= lt!13235 e!5483)))

(declare-fun c!509 () Bool)

(assert (=> d!2598 (= c!509 (not (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13221 () Unit!742)

(declare-fun lt!13229 () Unit!742)

(assert (=> d!2598 (= lt!13221 lt!13229)))

(assert (=> d!2598 (isPrefixOf!0 (_2!609 lt!12507) (_2!609 lt!12507))))

(assert (=> d!2598 (= lt!13229 (lemmaIsPrefixRefl!0 (_2!609 lt!12507)))))

(declare-fun lt!13231 () Unit!742)

(declare-fun lt!13227 () Unit!742)

(assert (=> d!2598 (= lt!13231 lt!13227)))

(assert (=> d!2598 (= lt!13227 (lemmaIsPrefixRefl!0 (_2!609 lt!12507)))))

(declare-fun lt!13218 () Unit!742)

(declare-fun lt!13219 () Unit!742)

(assert (=> d!2598 (= lt!13218 lt!13219)))

(assert (=> d!2598 (isPrefixOf!0 lt!13222 lt!13222)))

(assert (=> d!2598 (= lt!13219 (lemmaIsPrefixRefl!0 lt!13222))))

(declare-fun lt!13220 () Unit!742)

(declare-fun lt!13228 () Unit!742)

(assert (=> d!2598 (= lt!13220 lt!13228)))

(assert (=> d!2598 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2598 (= lt!13228 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2598 (= lt!13222 (BitStream!467 (buf!580 (_2!609 lt!12507)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> d!2598 (isPrefixOf!0 thiss!1486 (_2!609 lt!12507))))

(assert (=> d!2598 (= (reader!0 thiss!1486 (_2!609 lt!12507)) lt!13216)))

(declare-fun b!8869 () Bool)

(declare-fun lt!13230 () Unit!742)

(assert (=> b!8869 (= e!5483 lt!13230)))

(declare-fun lt!13234 () (_ BitVec 64))

(assert (=> b!8869 (= lt!13234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13224 () (_ BitVec 64))

(assert (=> b!8869 (= lt!13224 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!570 array!570 (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> b!8869 (= lt!13230 (arrayBitRangesEqSymmetric!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12507)) lt!13234 lt!13224))))

(declare-fun arrayBitRangesEq!0 (array!570 array!570 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8869 (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12507)) (buf!580 thiss!1486) lt!13234 lt!13224)))

(declare-fun b!8870 () Bool)

(declare-fun lt!13226 () (_ BitVec 64))

(declare-fun lt!13223 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!466 (_ BitVec 64)) BitStream!466)

(assert (=> b!8870 (= e!5484 (= (_1!610 lt!13216) (withMovedBitIndex!0 (_2!610 lt!13216) (bvsub lt!13223 lt!13226))))))

(assert (=> b!8870 (or (= (bvand lt!13223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13223 lt!13226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8870 (= lt!13226 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507))))))

(assert (=> b!8870 (= lt!13223 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (= (and d!2598 c!509) b!8869))

(assert (= (and d!2598 (not c!509)) b!8868))

(assert (= (and d!2598 res!9306) b!8866))

(assert (= (and b!8866 res!9305) b!8867))

(assert (= (and b!8867 res!9304) b!8870))

(declare-fun m!12273 () Bool)

(assert (=> b!8866 m!12273))

(declare-fun m!12275 () Bool)

(assert (=> d!2598 m!12275))

(declare-fun m!12277 () Bool)

(assert (=> d!2598 m!12277))

(declare-fun m!12279 () Bool)

(assert (=> d!2598 m!12279))

(assert (=> d!2598 m!12063))

(declare-fun m!12281 () Bool)

(assert (=> d!2598 m!12281))

(assert (=> d!2598 m!12061))

(declare-fun m!12283 () Bool)

(assert (=> d!2598 m!12283))

(declare-fun m!12285 () Bool)

(assert (=> d!2598 m!12285))

(declare-fun m!12287 () Bool)

(assert (=> d!2598 m!12287))

(declare-fun m!12289 () Bool)

(assert (=> d!2598 m!12289))

(assert (=> d!2598 m!11789))

(assert (=> b!8869 m!11803))

(declare-fun m!12291 () Bool)

(assert (=> b!8869 m!12291))

(declare-fun m!12293 () Bool)

(assert (=> b!8869 m!12293))

(declare-fun m!12295 () Bool)

(assert (=> b!8870 m!12295))

(assert (=> b!8870 m!11801))

(assert (=> b!8870 m!11803))

(declare-fun m!12297 () Bool)

(assert (=> b!8867 m!12297))

(assert (=> b!8609 d!2598))

(declare-fun d!2608 () Bool)

(declare-fun c!516 () Bool)

(assert (=> d!2608 (= c!516 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5493 () List!141)

(assert (=> d!2608 (= (byteArrayBitContentToList!0 (_2!609 lt!12507) (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5493)))

(declare-fun b!8887 () Bool)

(assert (=> b!8887 (= e!5493 Nil!138)))

(declare-fun b!8888 () Bool)

(assert (=> b!8888 (= e!5493 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!609 lt!12507) (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2608 c!516) b!8887))

(assert (= (and d!2608 (not c!516)) b!8888))

(declare-fun m!12299 () Bool)

(assert (=> b!8888 m!12299))

(declare-fun m!12301 () Bool)

(assert (=> b!8888 m!12301))

(declare-fun m!12303 () Bool)

(assert (=> b!8888 m!12303))

(assert (=> b!8609 d!2608))

(declare-fun d!2610 () Bool)

(assert (=> d!2610 (= (array_inv!239 srcBuffer!6) (bvsge (size!244 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1820 d!2610))

(declare-fun d!2612 () Bool)

(assert (=> d!2612 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1614 thiss!1486) (currentByte!1619 thiss!1486) (size!244 (buf!580 thiss!1486))))))

(declare-fun bs!857 () Bool)

(assert (= bs!857 d!2612))

(declare-fun m!12315 () Bool)

(assert (=> bs!857 m!12315))

(assert (=> start!1820 d!2612))

(declare-fun d!2616 () Bool)

(declare-fun res!9329 () Bool)

(declare-fun e!5507 () Bool)

(assert (=> d!2616 (=> (not res!9329) (not e!5507))))

(assert (=> d!2616 (= res!9329 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!12507)))))))

(assert (=> d!2616 (= (isPrefixOf!0 thiss!1486 (_2!609 lt!12507)) e!5507)))

(declare-fun b!8909 () Bool)

(declare-fun res!9327 () Bool)

(assert (=> b!8909 (=> (not res!9327) (not e!5507))))

(assert (=> b!8909 (= res!9327 (bvsle (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507)))))))

(declare-fun b!8910 () Bool)

(declare-fun e!5506 () Bool)

(assert (=> b!8910 (= e!5507 e!5506)))

(declare-fun res!9328 () Bool)

(assert (=> b!8910 (=> res!9328 e!5506)))

(assert (=> b!8910 (= res!9328 (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8911 () Bool)

(assert (=> b!8911 (= e!5506 (arrayBitRangesEq!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12507)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (= (and d!2616 res!9329) b!8909))

(assert (= (and b!8909 res!9327) b!8910))

(assert (= (and b!8910 (not res!9328)) b!8911))

(assert (=> b!8909 m!11803))

(assert (=> b!8909 m!11801))

(assert (=> b!8911 m!11803))

(assert (=> b!8911 m!11803))

(declare-fun m!12319 () Bool)

(assert (=> b!8911 m!12319))

(assert (=> b!8613 d!2616))

(declare-fun d!2620 () Bool)

(declare-fun e!5512 () Bool)

(assert (=> d!2620 e!5512))

(declare-fun res!9337 () Bool)

(assert (=> d!2620 (=> (not res!9337) (not e!5512))))

(declare-fun lt!13285 () (_ BitVec 64))

(declare-fun lt!13284 () (_ BitVec 64))

(declare-fun lt!13286 () (_ BitVec 64))

(assert (=> d!2620 (= res!9337 (= lt!13284 (bvsub lt!13285 lt!13286)))))

(assert (=> d!2620 (or (= (bvand lt!13285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13285 lt!13286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2620 (= lt!13286 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12507))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12507)))))))

(declare-fun lt!13281 () (_ BitVec 64))

(declare-fun lt!13283 () (_ BitVec 64))

(assert (=> d!2620 (= lt!13285 (bvmul lt!13281 lt!13283))))

(assert (=> d!2620 (or (= lt!13281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13283 (bvsdiv (bvmul lt!13281 lt!13283) lt!13281)))))

(assert (=> d!2620 (= lt!13283 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2620 (= lt!13281 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))))))

(assert (=> d!2620 (= lt!13284 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12507))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12507)))))))

(assert (=> d!2620 (invariant!0 (currentBit!1614 (_2!609 lt!12507)) (currentByte!1619 (_2!609 lt!12507)) (size!244 (buf!580 (_2!609 lt!12507))))))

(assert (=> d!2620 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507))) lt!13284)))

(declare-fun b!8919 () Bool)

(declare-fun res!9338 () Bool)

(assert (=> b!8919 (=> (not res!9338) (not e!5512))))

(assert (=> b!8919 (= res!9338 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13284))))

(declare-fun b!8920 () Bool)

(declare-fun lt!13282 () (_ BitVec 64))

(assert (=> b!8920 (= e!5512 (bvsle lt!13284 (bvmul lt!13282 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8920 (or (= lt!13282 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13282 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13282)))))

(assert (=> b!8920 (= lt!13282 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))))))

(assert (= (and d!2620 res!9337) b!8919))

(assert (= (and b!8919 res!9338) b!8920))

(declare-fun m!12323 () Bool)

(assert (=> d!2620 m!12323))

(assert (=> d!2620 m!11791))

(assert (=> b!8608 d!2620))

(declare-fun d!2626 () Bool)

(declare-fun e!5513 () Bool)

(assert (=> d!2626 e!5513))

(declare-fun res!9339 () Bool)

(assert (=> d!2626 (=> (not res!9339) (not e!5513))))

(declare-fun lt!13291 () (_ BitVec 64))

(declare-fun lt!13292 () (_ BitVec 64))

(declare-fun lt!13290 () (_ BitVec 64))

(assert (=> d!2626 (= res!9339 (= lt!13290 (bvsub lt!13291 lt!13292)))))

(assert (=> d!2626 (or (= (bvand lt!13291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13291 lt!13292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2626 (= lt!13292 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))))))

(declare-fun lt!13287 () (_ BitVec 64))

(declare-fun lt!13289 () (_ BitVec 64))

(assert (=> d!2626 (= lt!13291 (bvmul lt!13287 lt!13289))))

(assert (=> d!2626 (or (= lt!13287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13289 (bvsdiv (bvmul lt!13287 lt!13289) lt!13287)))))

(assert (=> d!2626 (= lt!13289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2626 (= lt!13287 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))))))

(assert (=> d!2626 (= lt!13290 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 thiss!1486))))))

(assert (=> d!2626 (invariant!0 (currentBit!1614 thiss!1486) (currentByte!1619 thiss!1486) (size!244 (buf!580 thiss!1486)))))

(assert (=> d!2626 (= (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) lt!13290)))

(declare-fun b!8921 () Bool)

(declare-fun res!9340 () Bool)

(assert (=> b!8921 (=> (not res!9340) (not e!5513))))

(assert (=> b!8921 (= res!9340 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13290))))

(declare-fun b!8922 () Bool)

(declare-fun lt!13288 () (_ BitVec 64))

(assert (=> b!8922 (= e!5513 (bvsle lt!13290 (bvmul lt!13288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8922 (or (= lt!13288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13288)))))

(assert (=> b!8922 (= lt!13288 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))))))

(assert (= (and d!2626 res!9339) b!8921))

(assert (= (and b!8921 res!9340) b!8922))

(declare-fun m!12325 () Bool)

(assert (=> d!2626 m!12325))

(assert (=> d!2626 m!12315))

(assert (=> b!8608 d!2626))

(declare-fun d!2628 () Bool)

(assert (=> d!2628 (= (array_inv!239 (buf!580 thiss!1486)) (bvsge (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8607 d!2628))

(declare-fun d!2630 () Bool)

(assert (=> d!2630 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) nBits!460))))

(declare-fun bs!859 () Bool)

(assert (= bs!859 d!2630))

(assert (=> bs!859 m!12325))

(assert (=> b!8611 d!2630))

(push 1)

(assert (not b!8780))

(assert (not b!8866))

(assert (not d!2626))

(assert (not b!8729))

(assert (not b!8888))

(assert (not b!8731))

(assert (not d!2620))

(assert (not d!2596))

(assert (not b!8867))

(assert (not b!8735))

(assert (not d!2612))

(assert (not b!8911))

(assert (not b!8821))

(assert (not b!8779))

(assert (not b!8824))

(assert (not d!2572))

(assert (not d!2546))

(assert (not b!8870))

(assert (not b!8778))

(assert (not b!8909))

(assert (not b!8734))

(assert (not d!2630))

(assert (not d!2586))

(assert (not b!8825))

(assert (not bm!134))

(assert (not d!2598))

(assert (not b!8733))

(assert (not b!8732))

(assert (not b!8869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2928 () Bool)

(declare-fun res!9631 () Bool)

(declare-fun e!5768 () Bool)

(assert (=> d!2928 (=> res!9631 e!5768)))

(assert (=> d!2928 (= res!9631 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2928 (= (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!611 (readBits!0 (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) e!5768)))

(declare-fun b!9343 () Bool)

(declare-fun e!5769 () Bool)

(assert (=> b!9343 (= e!5768 e!5769)))

(declare-fun res!9632 () Bool)

(assert (=> b!9343 (=> (not res!9632) (not e!5769))))

(assert (=> b!9343 (= res!9632 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!649 (_1!611 (readBits!0 (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367)))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!9344 () Bool)

(assert (=> b!9344 (= e!5769 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!611 (readBits!0 (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2928 (not res!9631)) b!9343))

(assert (= (and b!9343 res!9632) b!9344))

(assert (=> b!9343 m!12081))

(declare-fun m!13331 () Bool)

(assert (=> b!9343 m!13331))

(declare-fun m!13333 () Bool)

(assert (=> b!9343 m!13333))

(assert (=> b!9343 m!12301))

(declare-fun m!13335 () Bool)

(assert (=> b!9344 m!13335))

(assert (=> b!8732 d!2928))

(declare-fun b!9345 () Bool)

(declare-fun res!9634 () Bool)

(declare-fun e!5770 () Bool)

(assert (=> b!9345 (=> (not res!9634) (not e!5770))))

(declare-fun lt!14087 () tuple2!1160)

(declare-fun lt!14091 () (_ BitVec 64))

(assert (=> b!9345 (= res!9634 (= (bvadd lt!14091 (bvsub (bvadd from!367 nBits!460) from!367)) (bitIndex!0 (size!244 (buf!580 (_2!611 lt!14087))) (currentByte!1619 (_2!611 lt!14087)) (currentBit!1614 (_2!611 lt!14087)))))))

(assert (=> b!9345 (or (not (= (bvand lt!14091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14091 (bvsub (bvadd from!367 nBits!460) from!367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9345 (= lt!14091 (bitIndex!0 (size!244 (buf!580 (_1!610 call!137))) (currentByte!1619 (_1!610 call!137)) (currentBit!1614 (_1!610 call!137))))))

(declare-fun d!2930 () Bool)

(assert (=> d!2930 e!5770))

(declare-fun res!9636 () Bool)

(assert (=> d!2930 (=> (not res!9636) (not e!5770))))

(assert (=> d!2930 (= res!9636 (= (buf!580 (_2!611 lt!14087)) (buf!580 (_1!610 call!137))))))

(declare-fun lt!14088 () tuple3!62)

(assert (=> d!2930 (= lt!14087 (tuple2!1161 (_3!31 lt!14088) (_2!620 lt!14088)))))

(assert (=> d!2930 (= lt!14088 (readBitsLoop!0 (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367) (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)))))

(assert (=> d!2930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bvsle (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2930 (= (readBits!0 (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367)) lt!14087)))

(declare-fun b!9346 () Bool)

(declare-fun res!9633 () Bool)

(assert (=> b!9346 (=> (not res!9633) (not e!5770))))

(declare-fun lt!14092 () (_ BitVec 64))

(assert (=> b!9346 (= res!9633 (= (size!244 (_1!611 lt!14087)) ((_ extract 31 0) lt!14092)))))

(assert (=> b!9346 (and (bvslt lt!14092 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!14092 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!14089 () (_ BitVec 64))

(declare-fun lt!14085 () (_ BitVec 64))

(assert (=> b!9346 (= lt!14092 (bvsdiv lt!14089 lt!14085))))

(assert (=> b!9346 (and (not (= lt!14085 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!14089 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!14085 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!9346 (= lt!14085 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!14086 () (_ BitVec 64))

(declare-fun lt!14090 () (_ BitVec 64))

(assert (=> b!9346 (= lt!14089 (bvsub lt!14086 lt!14090))))

(assert (=> b!9346 (or (= (bvand lt!14086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14086 lt!14090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9346 (= lt!14090 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14093 () (_ BitVec 64))

(assert (=> b!9346 (= lt!14086 (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!14093))))

(assert (=> b!9346 (or (not (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14093 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!14093) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9346 (= lt!14093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!9347 () Bool)

(declare-fun res!9637 () Bool)

(assert (=> b!9347 (=> (not res!9637) (not e!5770))))

(assert (=> b!9347 (= res!9637 (bvsle (currentByte!1619 (_1!610 call!137)) (currentByte!1619 (_2!611 lt!14087))))))

(declare-fun b!9348 () Bool)

(assert (=> b!9348 (= e!5770 (= (byteArrayBitContentToList!0 (_2!611 lt!14087) (_1!611 lt!14087) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bitStreamReadBitsIntoList!0 (_2!611 lt!14087) (_1!610 call!137) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun b!9349 () Bool)

(declare-fun res!9635 () Bool)

(assert (=> b!9349 (=> (not res!9635) (not e!5770))))

(assert (=> b!9349 (= res!9635 (invariant!0 (currentBit!1614 (_2!611 lt!14087)) (currentByte!1619 (_2!611 lt!14087)) (size!244 (buf!580 (_2!611 lt!14087)))))))

(assert (= (and d!2930 res!9636) b!9345))

(assert (= (and b!9345 res!9634) b!9349))

(assert (= (and b!9349 res!9635) b!9346))

(assert (= (and b!9346 res!9633) b!9347))

(assert (= (and b!9347 res!9637) b!9348))

(declare-fun m!13337 () Bool)

(assert (=> b!9345 m!13337))

(declare-fun m!13339 () Bool)

(assert (=> b!9345 m!13339))

(declare-fun m!13341 () Bool)

(assert (=> d!2930 m!13341))

(declare-fun m!13343 () Bool)

(assert (=> b!9348 m!13343))

(declare-fun m!13345 () Bool)

(assert (=> b!9348 m!13345))

(declare-fun m!13347 () Bool)

(assert (=> b!9349 m!13347))

(assert (=> b!8732 d!2930))

(declare-fun d!2932 () Bool)

(assert (=> d!2932 (= (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 thiss!1486)))))))

(assert (=> d!2626 d!2932))

(declare-fun d!2934 () Bool)

(assert (=> d!2934 (= (invariant!0 (currentBit!1614 thiss!1486) (currentByte!1619 thiss!1486) (size!244 (buf!580 thiss!1486))) (and (bvsge (currentBit!1614 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1614 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1619 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1619 thiss!1486) (size!244 (buf!580 thiss!1486))) (and (= (currentBit!1614 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1619 thiss!1486) (size!244 (buf!580 thiss!1486)))))))))

(assert (=> d!2626 d!2934))

(declare-fun d!2936 () Bool)

(declare-fun res!9640 () Bool)

(declare-fun e!5772 () Bool)

(assert (=> d!2936 (=> (not res!9640) (not e!5772))))

(assert (=> d!2936 (= res!9640 (= (size!244 (buf!580 (_1!610 lt!13216))) (size!244 (buf!580 thiss!1486))))))

(assert (=> d!2936 (= (isPrefixOf!0 (_1!610 lt!13216) thiss!1486) e!5772)))

(declare-fun b!9350 () Bool)

(declare-fun res!9638 () Bool)

(assert (=> b!9350 (=> (not res!9638) (not e!5772))))

(assert (=> b!9350 (= res!9638 (bvsle (bitIndex!0 (size!244 (buf!580 (_1!610 lt!13216))) (currentByte!1619 (_1!610 lt!13216)) (currentBit!1614 (_1!610 lt!13216))) (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(declare-fun b!9351 () Bool)

(declare-fun e!5771 () Bool)

(assert (=> b!9351 (= e!5772 e!5771)))

(declare-fun res!9639 () Bool)

(assert (=> b!9351 (=> res!9639 e!5771)))

(assert (=> b!9351 (= res!9639 (= (size!244 (buf!580 (_1!610 lt!13216))) #b00000000000000000000000000000000))))

(declare-fun b!9352 () Bool)

(assert (=> b!9352 (= e!5771 (arrayBitRangesEq!0 (buf!580 (_1!610 lt!13216)) (buf!580 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 (_1!610 lt!13216))) (currentByte!1619 (_1!610 lt!13216)) (currentBit!1614 (_1!610 lt!13216)))))))

(assert (= (and d!2936 res!9640) b!9350))

(assert (= (and b!9350 res!9638) b!9351))

(assert (= (and b!9351 (not res!9639)) b!9352))

(declare-fun m!13349 () Bool)

(assert (=> b!9350 m!13349))

(assert (=> b!9350 m!11803))

(assert (=> b!9352 m!13349))

(assert (=> b!9352 m!13349))

(declare-fun m!13351 () Bool)

(assert (=> b!9352 m!13351))

(assert (=> b!8866 d!2936))

(declare-fun d!2938 () Bool)

(declare-fun c!583 () Bool)

(assert (=> d!2938 (= c!583 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5773 () List!141)

(assert (=> d!2938 (= (byteArrayBitContentToList!0 (_2!609 lt!12507) (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!5773)))

(declare-fun b!9353 () Bool)

(assert (=> b!9353 (= e!5773 Nil!138)))

(declare-fun b!9354 () Bool)

(assert (=> b!9354 (= e!5773 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460))) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!609 lt!12507) (_1!611 (readBits!0 (_1!610 lt!12509) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2938 c!583) b!9353))

(assert (= (and d!2938 (not c!583)) b!9354))

(declare-fun m!13353 () Bool)

(assert (=> b!9354 m!13353))

(declare-fun m!13355 () Bool)

(assert (=> b!9354 m!13355))

(declare-fun m!13357 () Bool)

(assert (=> b!9354 m!13357))

(assert (=> b!8888 d!2938))

(assert (=> d!2612 d!2934))

(declare-fun d!2940 () Bool)

(assert (=> d!2940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12885) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 thiss!1486))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) lt!12885))))

(declare-fun bs!906 () Bool)

(assert (= bs!906 d!2940))

(assert (=> bs!906 m!12325))

(assert (=> b!8731 d!2940))

(declare-fun b!9355 () Bool)

(declare-fun res!9642 () Bool)

(declare-fun e!5775 () Bool)

(assert (=> b!9355 (=> (not res!9642) (not e!5775))))

(declare-fun lt!14094 () tuple2!1158)

(assert (=> b!9355 (= res!9642 (isPrefixOf!0 (_1!610 lt!14094) (ite c!482 (_2!609 lt!12918) thiss!1486)))))

(declare-fun b!9356 () Bool)

(declare-fun res!9641 () Bool)

(assert (=> b!9356 (=> (not res!9641) (not e!5775))))

(assert (=> b!9356 (= res!9641 (isPrefixOf!0 (_2!610 lt!14094) (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun b!9357 () Bool)

(declare-fun e!5774 () Unit!742)

(declare-fun Unit!802 () Unit!742)

(assert (=> b!9357 (= e!5774 Unit!802)))

(declare-fun d!2942 () Bool)

(assert (=> d!2942 e!5775))

(declare-fun res!9643 () Bool)

(assert (=> d!2942 (=> (not res!9643) (not e!5775))))

(assert (=> d!2942 (= res!9643 (isPrefixOf!0 (_1!610 lt!14094) (_2!610 lt!14094)))))

(declare-fun lt!14100 () BitStream!466)

(assert (=> d!2942 (= lt!14094 (tuple2!1159 lt!14100 (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun lt!14103 () Unit!742)

(declare-fun lt!14110 () Unit!742)

(assert (=> d!2942 (= lt!14103 lt!14110)))

(assert (=> d!2942 (isPrefixOf!0 lt!14100 (ite c!482 (_2!609 lt!12882) thiss!1486))))

(assert (=> d!2942 (= lt!14110 (lemmaIsPrefixTransitive!0 lt!14100 (ite c!482 (_2!609 lt!12882) thiss!1486) (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun lt!14095 () Unit!742)

(declare-fun lt!14111 () Unit!742)

(assert (=> d!2942 (= lt!14095 lt!14111)))

(assert (=> d!2942 (isPrefixOf!0 lt!14100 (ite c!482 (_2!609 lt!12882) thiss!1486))))

(assert (=> d!2942 (= lt!14111 (lemmaIsPrefixTransitive!0 lt!14100 (ite c!482 (_2!609 lt!12918) thiss!1486) (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun lt!14113 () Unit!742)

(assert (=> d!2942 (= lt!14113 e!5774)))

(declare-fun c!584 () Bool)

(assert (=> d!2942 (= c!584 (not (= (size!244 (buf!580 (ite c!482 (_2!609 lt!12918) thiss!1486))) #b00000000000000000000000000000000)))))

(declare-fun lt!14099 () Unit!742)

(declare-fun lt!14107 () Unit!742)

(assert (=> d!2942 (= lt!14099 lt!14107)))

(assert (=> d!2942 (isPrefixOf!0 (ite c!482 (_2!609 lt!12882) thiss!1486) (ite c!482 (_2!609 lt!12882) thiss!1486))))

(assert (=> d!2942 (= lt!14107 (lemmaIsPrefixRefl!0 (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun lt!14109 () Unit!742)

(declare-fun lt!14105 () Unit!742)

(assert (=> d!2942 (= lt!14109 lt!14105)))

(assert (=> d!2942 (= lt!14105 (lemmaIsPrefixRefl!0 (ite c!482 (_2!609 lt!12882) thiss!1486)))))

(declare-fun lt!14096 () Unit!742)

(declare-fun lt!14097 () Unit!742)

(assert (=> d!2942 (= lt!14096 lt!14097)))

(assert (=> d!2942 (isPrefixOf!0 lt!14100 lt!14100)))

(assert (=> d!2942 (= lt!14097 (lemmaIsPrefixRefl!0 lt!14100))))

(declare-fun lt!14098 () Unit!742)

(declare-fun lt!14106 () Unit!742)

(assert (=> d!2942 (= lt!14098 lt!14106)))

(assert (=> d!2942 (isPrefixOf!0 (ite c!482 (_2!609 lt!12918) thiss!1486) (ite c!482 (_2!609 lt!12918) thiss!1486))))

(assert (=> d!2942 (= lt!14106 (lemmaIsPrefixRefl!0 (ite c!482 (_2!609 lt!12918) thiss!1486)))))

(assert (=> d!2942 (= lt!14100 (BitStream!467 (buf!580 (ite c!482 (_2!609 lt!12882) thiss!1486)) (currentByte!1619 (ite c!482 (_2!609 lt!12918) thiss!1486)) (currentBit!1614 (ite c!482 (_2!609 lt!12918) thiss!1486))))))

(assert (=> d!2942 (isPrefixOf!0 (ite c!482 (_2!609 lt!12918) thiss!1486) (ite c!482 (_2!609 lt!12882) thiss!1486))))

(assert (=> d!2942 (= (reader!0 (ite c!482 (_2!609 lt!12918) thiss!1486) (ite c!482 (_2!609 lt!12882) thiss!1486)) lt!14094)))

(declare-fun b!9358 () Bool)

(declare-fun lt!14108 () Unit!742)

(assert (=> b!9358 (= e!5774 lt!14108)))

(declare-fun lt!14112 () (_ BitVec 64))

(assert (=> b!9358 (= lt!14112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14102 () (_ BitVec 64))

(assert (=> b!9358 (= lt!14102 (bitIndex!0 (size!244 (buf!580 (ite c!482 (_2!609 lt!12918) thiss!1486))) (currentByte!1619 (ite c!482 (_2!609 lt!12918) thiss!1486)) (currentBit!1614 (ite c!482 (_2!609 lt!12918) thiss!1486))))))

(assert (=> b!9358 (= lt!14108 (arrayBitRangesEqSymmetric!0 (buf!580 (ite c!482 (_2!609 lt!12918) thiss!1486)) (buf!580 (ite c!482 (_2!609 lt!12882) thiss!1486)) lt!14112 lt!14102))))

(assert (=> b!9358 (arrayBitRangesEq!0 (buf!580 (ite c!482 (_2!609 lt!12882) thiss!1486)) (buf!580 (ite c!482 (_2!609 lt!12918) thiss!1486)) lt!14112 lt!14102)))

(declare-fun b!9359 () Bool)

(declare-fun lt!14101 () (_ BitVec 64))

(declare-fun lt!14104 () (_ BitVec 64))

(assert (=> b!9359 (= e!5775 (= (_1!610 lt!14094) (withMovedBitIndex!0 (_2!610 lt!14094) (bvsub lt!14101 lt!14104))))))

(assert (=> b!9359 (or (= (bvand lt!14101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14101 lt!14104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9359 (= lt!14104 (bitIndex!0 (size!244 (buf!580 (ite c!482 (_2!609 lt!12882) thiss!1486))) (currentByte!1619 (ite c!482 (_2!609 lt!12882) thiss!1486)) (currentBit!1614 (ite c!482 (_2!609 lt!12882) thiss!1486))))))

(assert (=> b!9359 (= lt!14101 (bitIndex!0 (size!244 (buf!580 (ite c!482 (_2!609 lt!12918) thiss!1486))) (currentByte!1619 (ite c!482 (_2!609 lt!12918) thiss!1486)) (currentBit!1614 (ite c!482 (_2!609 lt!12918) thiss!1486))))))

(assert (= (and d!2942 c!584) b!9358))

(assert (= (and d!2942 (not c!584)) b!9357))

(assert (= (and d!2942 res!9643) b!9355))

(assert (= (and b!9355 res!9642) b!9356))

(assert (= (and b!9356 res!9641) b!9359))

(declare-fun m!13359 () Bool)

(assert (=> b!9355 m!13359))

(declare-fun m!13361 () Bool)

(assert (=> d!2942 m!13361))

(declare-fun m!13363 () Bool)

(assert (=> d!2942 m!13363))

(declare-fun m!13365 () Bool)

(assert (=> d!2942 m!13365))

(declare-fun m!13367 () Bool)

(assert (=> d!2942 m!13367))

(declare-fun m!13369 () Bool)

(assert (=> d!2942 m!13369))

(declare-fun m!13371 () Bool)

(assert (=> d!2942 m!13371))

(declare-fun m!13373 () Bool)

(assert (=> d!2942 m!13373))

(declare-fun m!13375 () Bool)

(assert (=> d!2942 m!13375))

(declare-fun m!13377 () Bool)

(assert (=> d!2942 m!13377))

(declare-fun m!13379 () Bool)

(assert (=> d!2942 m!13379))

(declare-fun m!13381 () Bool)

(assert (=> d!2942 m!13381))

(declare-fun m!13383 () Bool)

(assert (=> b!9358 m!13383))

(declare-fun m!13385 () Bool)

(assert (=> b!9358 m!13385))

(declare-fun m!13387 () Bool)

(assert (=> b!9358 m!13387))

(declare-fun m!13389 () Bool)

(assert (=> b!9359 m!13389))

(declare-fun m!13391 () Bool)

(assert (=> b!9359 m!13391))

(assert (=> b!9359 m!13383))

(declare-fun m!13393 () Bool)

(assert (=> b!9356 m!13393))

(assert (=> bm!134 d!2942))

(assert (=> d!2596 d!2572))

(declare-fun d!2944 () Bool)

(assert (=> d!2944 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) nBits!460)))

(assert (=> d!2944 true))

(declare-fun _$6!165 () Unit!742)

(assert (=> d!2944 (= (choose!9 thiss!1486 (buf!580 (_2!609 lt!12507)) nBits!460 (BitStream!467 (buf!580 (_2!609 lt!12507)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))) _$6!165)))

(declare-fun bs!907 () Bool)

(assert (= bs!907 d!2944))

(assert (=> bs!907 m!11781))

(assert (=> d!2596 d!2944))

(declare-fun d!2946 () Bool)

(assert (=> d!2946 (= (invariant!0 (currentBit!1614 (_2!609 lt!12903)) (currentByte!1619 (_2!609 lt!12903)) (size!244 (buf!580 (_2!609 lt!12903)))) (and (bvsge (currentBit!1614 (_2!609 lt!12903)) #b00000000000000000000000000000000) (bvslt (currentBit!1614 (_2!609 lt!12903)) #b00000000000000000000000000001000) (bvsge (currentByte!1619 (_2!609 lt!12903)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1619 (_2!609 lt!12903)) (size!244 (buf!580 (_2!609 lt!12903)))) (and (= (currentBit!1614 (_2!609 lt!12903)) #b00000000000000000000000000000000) (= (currentByte!1619 (_2!609 lt!12903)) (size!244 (buf!580 (_2!609 lt!12903))))))))))

(assert (=> b!8729 d!2946))

(assert (=> d!2630 d!2932))

(declare-fun b!9378 () Bool)

(declare-fun res!9659 () Bool)

(declare-fun e!5787 () Bool)

(assert (=> b!9378 (=> (not res!9659) (not e!5787))))

(declare-fun lt!14203 () tuple3!62)

(assert (=> b!9378 (= res!9659 (and (= (buf!580 (_1!610 lt!12509)) (buf!580 (_2!620 lt!14203))) (= (size!244 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!244 (_3!31 lt!14203)))))))

(declare-fun d!2948 () Bool)

(assert (=> d!2948 e!5787))

(declare-fun res!9664 () Bool)

(assert (=> d!2948 (=> (not res!9664) (not e!5787))))

(declare-fun lt!14190 () (_ BitVec 64))

(assert (=> d!2948 (= res!9664 (= (bvsub lt!14190 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!244 (buf!580 (_2!620 lt!14203))) (currentByte!1619 (_2!620 lt!14203)) (currentBit!1614 (_2!620 lt!14203)))))))

(assert (=> d!2948 (or (= (bvand lt!14190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14190 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14208 () (_ BitVec 64))

(assert (=> d!2948 (= lt!14190 (bvadd lt!14208 nBits!460))))

(assert (=> d!2948 (or (not (= (bvand lt!14208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14208 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2948 (= lt!14208 (bitIndex!0 (size!244 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)) (currentBit!1614 (_1!610 lt!12509))))))

(declare-fun e!5785 () tuple3!62)

(assert (=> d!2948 (= lt!14203 e!5785)))

(declare-fun c!587 () Bool)

(assert (=> d!2948 (= c!587 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2948 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2948 (= (readBitsLoop!0 (_1!610 lt!12509) nBits!460 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!14203)))

(declare-fun b!9379 () Bool)

(declare-fun lt!14221 () Unit!742)

(declare-fun lt!14202 () tuple3!62)

(assert (=> b!9379 (= e!5785 (tuple3!63 lt!14221 (_2!620 lt!14202) (_3!31 lt!14202)))))

(declare-fun lt!14211 () tuple2!1176)

(assert (=> b!9379 (= lt!14211 (readBit!0 (_1!610 lt!12509)))))

(declare-fun lt!14196 () (_ BitVec 32))

(assert (=> b!9379 (= lt!14196 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!14217 () (_ BitVec 32))

(assert (=> b!9379 (= lt!14217 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!14187 () array!570)

(assert (=> b!9379 (= lt!14187 (array!571 (store (arr!649 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!14196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!649 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!14196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!14217)))) ((_ sign_extend 24) (ite (_1!619 lt!14211) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!14217) #b00000000))))) (size!244 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!14215 () (_ BitVec 64))

(assert (=> b!9379 (= lt!14215 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14186 () (_ BitVec 64))

(assert (=> b!9379 (= lt!14186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14219 () Unit!742)

(assert (=> b!9379 (= lt!14219 (validateOffsetBitsIneqLemma!0 (_1!610 lt!12509) (_2!619 lt!14211) lt!14215 lt!14186))))

(assert (=> b!9379 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!619 lt!14211)))) ((_ sign_extend 32) (currentByte!1619 (_2!619 lt!14211))) ((_ sign_extend 32) (currentBit!1614 (_2!619 lt!14211))) (bvsub lt!14215 lt!14186))))

(declare-fun lt!14191 () Unit!742)

(assert (=> b!9379 (= lt!14191 lt!14219)))

(assert (=> b!9379 (= lt!14202 (readBitsLoop!0 (_2!619 lt!14211) nBits!460 lt!14187 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!460))))

(declare-fun res!9662 () Bool)

(assert (=> b!9379 (= res!9662 (= (bvsub (bvadd (bitIndex!0 (size!244 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)) (currentBit!1614 (_1!610 lt!12509))) nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!244 (buf!580 (_2!620 lt!14202))) (currentByte!1619 (_2!620 lt!14202)) (currentBit!1614 (_2!620 lt!14202)))))))

(declare-fun e!5784 () Bool)

(assert (=> b!9379 (=> (not res!9662) (not e!5784))))

(assert (=> b!9379 e!5784))

(declare-fun lt!14189 () Unit!742)

(declare-fun Unit!803 () Unit!742)

(assert (=> b!9379 (= lt!14189 Unit!803)))

(declare-fun lt!14194 () (_ BitVec 32))

(assert (=> b!9379 (= lt!14194 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!14201 () (_ BitVec 32))

(assert (=> b!9379 (= lt!14201 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!14207 () Unit!742)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!570 (_ BitVec 64) Bool) Unit!742)

(assert (=> b!9379 (= lt!14207 (arrayBitRangesUpdatedAtLemma!0 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!619 lt!14211)))))

(declare-fun call!164 () Bool)

(assert (=> b!9379 call!164))

(declare-fun lt!14212 () Unit!742)

(assert (=> b!9379 (= lt!14212 lt!14207)))

(declare-fun lt!14204 () (_ BitVec 64))

(assert (=> b!9379 (= lt!14204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14216 () Unit!742)

(declare-fun arrayBitRangesEqTransitive!0 (array!570 array!570 array!570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> b!9379 (= lt!14216 (arrayBitRangesEqTransitive!0 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!14187 (_3!31 lt!14202) lt!14204 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!165 () Bool)

(assert (=> b!9379 call!165))

(declare-fun lt!14197 () Unit!742)

(assert (=> b!9379 (= lt!14197 lt!14216)))

(assert (=> b!9379 (arrayBitRangesEq!0 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!31 lt!14202) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14218 () Unit!742)

(declare-fun Unit!804 () Unit!742)

(assert (=> b!9379 (= lt!14218 Unit!804)))

(declare-fun lt!14188 () Unit!742)

(assert (=> b!9379 (= lt!14188 (arrayBitRangesEqImpliesEq!0 lt!14187 (_3!31 lt!14202) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!9379 (= (bitAt!0 lt!14187 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!31 lt!14202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14193 () Unit!742)

(assert (=> b!9379 (= lt!14193 lt!14188)))

(declare-fun lt!14195 () Unit!742)

(declare-fun Unit!805 () Unit!742)

(assert (=> b!9379 (= lt!14195 Unit!805)))

(declare-fun lt!14200 () Bool)

(assert (=> b!9379 (= lt!14200 (= (bitAt!0 (_3!31 lt!14202) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!619 lt!14211)))))

(declare-fun Unit!806 () Unit!742)

(assert (=> b!9379 (= lt!14221 Unit!806)))

(assert (=> b!9379 lt!14200))

(declare-fun lt!14209 () (_ BitVec 64))

(declare-fun bm!161 () Bool)

(declare-fun lt!14213 () array!570)

(declare-fun lt!14210 () (_ BitVec 64))

(declare-fun lt!14206 () array!570)

(assert (=> bm!161 (= call!165 (arrayBitRangesEq!0 (ite c!587 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!14213) (ite c!587 (_3!31 lt!14202) lt!14206) (ite c!587 lt!14204 lt!14209) (ite c!587 #b0000000000000000000000000000000000000000000000000000000000000000 lt!14210)))))

(declare-fun b!9380 () Bool)

(declare-fun res!9663 () Bool)

(assert (=> b!9380 (=> (not res!9663) (not e!5787))))

(assert (=> b!9380 (= res!9663 (invariant!0 (currentBit!1614 (_2!620 lt!14203)) (currentByte!1619 (_2!620 lt!14203)) (size!244 (buf!580 (_2!620 lt!14203)))))))

(declare-fun b!9381 () Bool)

(assert (=> b!9381 (= e!5784 (and (= (buf!580 (_1!610 lt!12509)) (buf!580 (_2!620 lt!14202))) (= (size!244 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!244 (_3!31 lt!14202)))))))

(declare-fun b!9382 () Bool)

(declare-fun lt!14220 () Unit!742)

(assert (=> b!9382 (= e!5785 (tuple3!63 lt!14220 (_1!610 lt!12509) (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!14198 () Unit!742)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!570) Unit!742)

(assert (=> b!9382 (= lt!14198 (arrayBitRangesEqReflexiveLemma!0 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!9382 call!164))

(declare-fun lt!14214 () Unit!742)

(assert (=> b!9382 (= lt!14214 lt!14198)))

(assert (=> b!9382 (= lt!14213 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!9382 (= lt!14206 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!14199 () (_ BitVec 64))

(assert (=> b!9382 (= lt!14199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14205 () (_ BitVec 64))

(assert (=> b!9382 (= lt!14205 ((_ sign_extend 32) (size!244 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!14192 () (_ BitVec 64))

(assert (=> b!9382 (= lt!14192 (bvmul lt!14205 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!9382 (= lt!14209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!9382 (= lt!14210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!570 array!570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> b!9382 (= lt!14220 (arrayBitRangesEqSlicedLemma!0 lt!14213 lt!14206 lt!14199 lt!14192 lt!14209 lt!14210))))

(assert (=> b!9382 call!165))

(declare-fun b!9383 () Bool)

(declare-fun res!9660 () Bool)

(assert (=> b!9383 (=> (not res!9660) (not e!5787))))

(assert (=> b!9383 (= res!9660 (arrayBitRangesEq!0 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!31 lt!14203) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9384 () Bool)

(declare-fun res!9661 () Bool)

(assert (=> b!9384 (=> (not res!9661) (not e!5787))))

(declare-fun e!5786 () Bool)

(assert (=> b!9384 (= res!9661 e!5786)))

(declare-fun res!9658 () Bool)

(assert (=> b!9384 (=> res!9658 e!5786)))

(assert (=> b!9384 (= res!9658 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun b!9385 () Bool)

(declare-datatypes ((tuple2!1190 0))(
  ( (tuple2!1191 (_1!631 BitStream!466) (_2!631 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!466) tuple2!1190)

(assert (=> b!9385 (= e!5786 (= (bitAt!0 (_3!31 lt!14203) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!631 (readBitPure!0 (_1!610 lt!12509)))))))

(declare-fun bm!162 () Bool)

(assert (=> bm!162 (= call!164 (arrayBitRangesEq!0 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!587 (array!571 (store (arr!649 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!14194 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!649 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!14194)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!14201)))) ((_ sign_extend 24) (ite (_1!619 lt!14211) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!14201) #b00000000))))) (size!244 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!587 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!244 (array!571 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!9386 () Bool)

(assert (=> b!9386 (= e!5787 (= (byteArrayBitContentToList!0 (_2!620 lt!14203) (_3!31 lt!14203) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!620 lt!14203) (_1!610 lt!12509) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9386 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9386 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!2948 c!587) b!9379))

(assert (= (and d!2948 (not c!587)) b!9382))

(assert (= (and b!9379 res!9662) b!9381))

(assert (= (or b!9379 b!9382) bm!161))

(assert (= (or b!9379 b!9382) bm!162))

(assert (= (and d!2948 res!9664) b!9378))

(assert (= (and b!9378 res!9659) b!9383))

(assert (= (and b!9383 res!9660) b!9384))

(assert (= (and b!9384 (not res!9658)) b!9385))

(assert (= (and b!9384 res!9661) b!9380))

(assert (= (and b!9380 res!9663) b!9386))

(declare-fun m!13395 () Bool)

(assert (=> b!9382 m!13395))

(declare-fun m!13397 () Bool)

(assert (=> b!9382 m!13397))

(declare-fun m!13399 () Bool)

(assert (=> d!2948 m!13399))

(assert (=> d!2948 m!12233))

(declare-fun m!13401 () Bool)

(assert (=> b!9385 m!13401))

(declare-fun m!13403 () Bool)

(assert (=> b!9385 m!13403))

(declare-fun m!13405 () Bool)

(assert (=> bm!161 m!13405))

(declare-fun m!13407 () Bool)

(assert (=> b!9379 m!13407))

(declare-fun m!13409 () Bool)

(assert (=> b!9379 m!13409))

(declare-fun m!13411 () Bool)

(assert (=> b!9379 m!13411))

(declare-fun m!13413 () Bool)

(assert (=> b!9379 m!13413))

(declare-fun m!13415 () Bool)

(assert (=> b!9379 m!13415))

(declare-fun m!13417 () Bool)

(assert (=> b!9379 m!13417))

(declare-fun m!13419 () Bool)

(assert (=> b!9379 m!13419))

(assert (=> b!9379 m!12233))

(declare-fun m!13421 () Bool)

(assert (=> b!9379 m!13421))

(declare-fun m!13423 () Bool)

(assert (=> b!9379 m!13423))

(assert (=> b!9379 m!12169))

(declare-fun m!13425 () Bool)

(assert (=> b!9379 m!13425))

(declare-fun m!13427 () Bool)

(assert (=> b!9379 m!13427))

(declare-fun m!13429 () Bool)

(assert (=> b!9379 m!13429))

(declare-fun m!13431 () Bool)

(assert (=> b!9379 m!13431))

(declare-fun m!13433 () Bool)

(assert (=> b!9386 m!13433))

(declare-fun m!13435 () Bool)

(assert (=> b!9386 m!13435))

(declare-fun m!13437 () Bool)

(assert (=> bm!162 m!13437))

(declare-fun m!13439 () Bool)

(assert (=> bm!162 m!13439))

(declare-fun m!13441 () Bool)

(assert (=> bm!162 m!13441))

(declare-fun m!13443 () Bool)

(assert (=> bm!162 m!13443))

(declare-fun m!13445 () Bool)

(assert (=> b!9383 m!13445))

(declare-fun m!13447 () Bool)

(assert (=> b!9380 m!13447))

(assert (=> d!2586 d!2948))

(declare-fun d!2950 () Bool)

(assert (=> d!2950 (= (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12507))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12507)))) (bvsub (bvmul ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12507))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12507))))))))

(assert (=> d!2620 d!2950))

(assert (=> d!2620 d!2542))

(declare-fun d!2952 () Bool)

(declare-fun e!5788 () Bool)

(assert (=> d!2952 e!5788))

(declare-fun res!9665 () Bool)

(assert (=> d!2952 (=> (not res!9665) (not e!5788))))

(declare-fun lt!14226 () (_ BitVec 64))

(declare-fun lt!14225 () (_ BitVec 64))

(declare-fun lt!14227 () (_ BitVec 64))

(assert (=> d!2952 (= res!9665 (= lt!14225 (bvsub lt!14226 lt!14227)))))

(assert (=> d!2952 (or (= (bvand lt!14226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14226 lt!14227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2952 (= lt!14227 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12903))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12903)))))))

(declare-fun lt!14222 () (_ BitVec 64))

(declare-fun lt!14224 () (_ BitVec 64))

(assert (=> d!2952 (= lt!14226 (bvmul lt!14222 lt!14224))))

(assert (=> d!2952 (or (= lt!14222 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14224 (bvsdiv (bvmul lt!14222 lt!14224) lt!14222)))))

(assert (=> d!2952 (= lt!14224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2952 (= lt!14222 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))))))

(assert (=> d!2952 (= lt!14225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12903))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12903)))))))

(assert (=> d!2952 (invariant!0 (currentBit!1614 (_2!609 lt!12903)) (currentByte!1619 (_2!609 lt!12903)) (size!244 (buf!580 (_2!609 lt!12903))))))

(assert (=> d!2952 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12903))) (currentByte!1619 (_2!609 lt!12903)) (currentBit!1614 (_2!609 lt!12903))) lt!14225)))

(declare-fun b!9387 () Bool)

(declare-fun res!9666 () Bool)

(assert (=> b!9387 (=> (not res!9666) (not e!5788))))

(assert (=> b!9387 (= res!9666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14225))))

(declare-fun b!9388 () Bool)

(declare-fun lt!14223 () (_ BitVec 64))

(assert (=> b!9388 (= e!5788 (bvsle lt!14225 (bvmul lt!14223 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9388 (or (= lt!14223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14223)))))

(assert (=> b!9388 (= lt!14223 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))))))

(assert (= (and d!2952 res!9665) b!9387))

(assert (= (and b!9387 res!9666) b!9388))

(declare-fun m!13449 () Bool)

(assert (=> d!2952 m!13449))

(assert (=> d!2952 m!12141))

(assert (=> d!2546 d!2952))

(assert (=> d!2546 d!2626))

(declare-fun d!2954 () Bool)

(declare-fun res!9669 () Bool)

(declare-fun e!5790 () Bool)

(assert (=> d!2954 (=> (not res!9669) (not e!5790))))

(assert (=> d!2954 (= res!9669 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 thiss!1486))))))

(assert (=> d!2954 (= (isPrefixOf!0 thiss!1486 thiss!1486) e!5790)))

(declare-fun b!9389 () Bool)

(declare-fun res!9667 () Bool)

(assert (=> b!9389 (=> (not res!9667) (not e!5790))))

(assert (=> b!9389 (= res!9667 (bvsle (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(declare-fun b!9390 () Bool)

(declare-fun e!5789 () Bool)

(assert (=> b!9390 (= e!5790 e!5789)))

(declare-fun res!9668 () Bool)

(assert (=> b!9390 (=> res!9668 e!5789)))

(assert (=> b!9390 (= res!9668 (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9391 () Bool)

(assert (=> b!9391 (= e!5789 (arrayBitRangesEq!0 (buf!580 thiss!1486) (buf!580 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (= (and d!2954 res!9669) b!9389))

(assert (= (and b!9389 res!9667) b!9390))

(assert (= (and b!9390 (not res!9668)) b!9391))

(assert (=> b!9389 m!11803))

(assert (=> b!9389 m!11803))

(assert (=> b!9391 m!11803))

(assert (=> b!9391 m!11803))

(declare-fun m!13451 () Bool)

(assert (=> b!9391 m!13451))

(assert (=> d!2546 d!2954))

(declare-fun d!2956 () Bool)

(assert (=> d!2956 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lt!14230 () Unit!742)

(declare-fun choose!11 (BitStream!466) Unit!742)

(assert (=> d!2956 (= lt!14230 (choose!11 thiss!1486))))

(assert (=> d!2956 (= (lemmaIsPrefixRefl!0 thiss!1486) lt!14230)))

(declare-fun bs!909 () Bool)

(assert (= bs!909 d!2956))

(assert (=> bs!909 m!12061))

(declare-fun m!13453 () Bool)

(assert (=> bs!909 m!13453))

(assert (=> d!2546 d!2956))

(declare-fun d!2958 () Bool)

(assert (=> d!2958 (= (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12507)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 thiss!1486)))))))

(assert (=> d!2572 d!2958))

(assert (=> d!2598 d!2956))

(declare-fun d!2960 () Bool)

(declare-fun res!9672 () Bool)

(declare-fun e!5792 () Bool)

(assert (=> d!2960 (=> (not res!9672) (not e!5792))))

(assert (=> d!2960 (= res!9672 (= (size!244 (buf!580 lt!13222)) (size!244 (buf!580 lt!13222))))))

(assert (=> d!2960 (= (isPrefixOf!0 lt!13222 lt!13222) e!5792)))

(declare-fun b!9392 () Bool)

(declare-fun res!9670 () Bool)

(assert (=> b!9392 (=> (not res!9670) (not e!5792))))

(assert (=> b!9392 (= res!9670 (bvsle (bitIndex!0 (size!244 (buf!580 lt!13222)) (currentByte!1619 lt!13222) (currentBit!1614 lt!13222)) (bitIndex!0 (size!244 (buf!580 lt!13222)) (currentByte!1619 lt!13222) (currentBit!1614 lt!13222))))))

(declare-fun b!9393 () Bool)

(declare-fun e!5791 () Bool)

(assert (=> b!9393 (= e!5792 e!5791)))

(declare-fun res!9671 () Bool)

(assert (=> b!9393 (=> res!9671 e!5791)))

(assert (=> b!9393 (= res!9671 (= (size!244 (buf!580 lt!13222)) #b00000000000000000000000000000000))))

(declare-fun b!9394 () Bool)

(assert (=> b!9394 (= e!5791 (arrayBitRangesEq!0 (buf!580 lt!13222) (buf!580 lt!13222) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 lt!13222)) (currentByte!1619 lt!13222) (currentBit!1614 lt!13222))))))

(assert (= (and d!2960 res!9672) b!9392))

(assert (= (and b!9392 res!9670) b!9393))

(assert (= (and b!9393 (not res!9671)) b!9394))

(declare-fun m!13455 () Bool)

(assert (=> b!9392 m!13455))

(assert (=> b!9392 m!13455))

(assert (=> b!9394 m!13455))

(assert (=> b!9394 m!13455))

(declare-fun m!13457 () Bool)

(assert (=> b!9394 m!13457))

(assert (=> d!2598 d!2960))

(declare-fun d!2962 () Bool)

(assert (=> d!2962 (isPrefixOf!0 lt!13222 lt!13222)))

(declare-fun lt!14231 () Unit!742)

(assert (=> d!2962 (= lt!14231 (choose!11 lt!13222))))

(assert (=> d!2962 (= (lemmaIsPrefixRefl!0 lt!13222) lt!14231)))

(declare-fun bs!910 () Bool)

(assert (= bs!910 d!2962))

(assert (=> bs!910 m!12281))

(declare-fun m!13459 () Bool)

(assert (=> bs!910 m!13459))

(assert (=> d!2598 d!2962))

(assert (=> d!2598 d!2616))

(declare-fun d!2964 () Bool)

(assert (=> d!2964 (isPrefixOf!0 lt!13222 (_2!609 lt!12507))))

(declare-fun lt!14234 () Unit!742)

(declare-fun choose!30 (BitStream!466 BitStream!466 BitStream!466) Unit!742)

(assert (=> d!2964 (= lt!14234 (choose!30 lt!13222 (_2!609 lt!12507) (_2!609 lt!12507)))))

(assert (=> d!2964 (isPrefixOf!0 lt!13222 (_2!609 lt!12507))))

(assert (=> d!2964 (= (lemmaIsPrefixTransitive!0 lt!13222 (_2!609 lt!12507) (_2!609 lt!12507)) lt!14234)))

(declare-fun bs!911 () Bool)

(assert (= bs!911 d!2964))

(assert (=> bs!911 m!12287))

(declare-fun m!13461 () Bool)

(assert (=> bs!911 m!13461))

(assert (=> bs!911 m!12287))

(assert (=> d!2598 d!2964))

(declare-fun d!2966 () Bool)

(assert (=> d!2966 (isPrefixOf!0 (_2!609 lt!12507) (_2!609 lt!12507))))

(declare-fun lt!14235 () Unit!742)

(assert (=> d!2966 (= lt!14235 (choose!11 (_2!609 lt!12507)))))

(assert (=> d!2966 (= (lemmaIsPrefixRefl!0 (_2!609 lt!12507)) lt!14235)))

(declare-fun bs!912 () Bool)

(assert (= bs!912 d!2966))

(assert (=> bs!912 m!12289))

(declare-fun m!13463 () Bool)

(assert (=> bs!912 m!13463))

(assert (=> d!2598 d!2966))

(declare-fun d!2968 () Bool)

(assert (=> d!2968 (isPrefixOf!0 lt!13222 (_2!609 lt!12507))))

(declare-fun lt!14236 () Unit!742)

(assert (=> d!2968 (= lt!14236 (choose!30 lt!13222 thiss!1486 (_2!609 lt!12507)))))

(assert (=> d!2968 (isPrefixOf!0 lt!13222 thiss!1486)))

(assert (=> d!2968 (= (lemmaIsPrefixTransitive!0 lt!13222 thiss!1486 (_2!609 lt!12507)) lt!14236)))

(declare-fun bs!913 () Bool)

(assert (= bs!913 d!2968))

(assert (=> bs!913 m!12287))

(declare-fun m!13465 () Bool)

(assert (=> bs!913 m!13465))

(declare-fun m!13467 () Bool)

(assert (=> bs!913 m!13467))

(assert (=> d!2598 d!2968))

(declare-fun d!2970 () Bool)

(declare-fun res!9675 () Bool)

(declare-fun e!5794 () Bool)

(assert (=> d!2970 (=> (not res!9675) (not e!5794))))

(assert (=> d!2970 (= res!9675 (= (size!244 (buf!580 (_2!609 lt!12507))) (size!244 (buf!580 (_2!609 lt!12507)))))))

(assert (=> d!2970 (= (isPrefixOf!0 (_2!609 lt!12507) (_2!609 lt!12507)) e!5794)))

(declare-fun b!9395 () Bool)

(declare-fun res!9673 () Bool)

(assert (=> b!9395 (=> (not res!9673) (not e!5794))))

(assert (=> b!9395 (= res!9673 (bvsle (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507))) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507)))))))

(declare-fun b!9396 () Bool)

(declare-fun e!5793 () Bool)

(assert (=> b!9396 (= e!5794 e!5793)))

(declare-fun res!9674 () Bool)

(assert (=> b!9396 (=> res!9674 e!5793)))

(assert (=> b!9396 (= res!9674 (= (size!244 (buf!580 (_2!609 lt!12507))) #b00000000000000000000000000000000))))

(declare-fun b!9397 () Bool)

(assert (=> b!9397 (= e!5793 (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12507)) (buf!580 (_2!609 lt!12507)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507)))))))

(assert (= (and d!2970 res!9675) b!9395))

(assert (= (and b!9395 res!9673) b!9396))

(assert (= (and b!9396 (not res!9674)) b!9397))

(assert (=> b!9395 m!11801))

(assert (=> b!9395 m!11801))

(assert (=> b!9397 m!11801))

(assert (=> b!9397 m!11801))

(declare-fun m!13469 () Bool)

(assert (=> b!9397 m!13469))

(assert (=> d!2598 d!2970))

(assert (=> d!2598 d!2954))

(declare-fun d!2972 () Bool)

(declare-fun res!9678 () Bool)

(declare-fun e!5796 () Bool)

(assert (=> d!2972 (=> (not res!9678) (not e!5796))))

(assert (=> d!2972 (= res!9678 (= (size!244 (buf!580 (_1!610 lt!13216))) (size!244 (buf!580 (_2!610 lt!13216)))))))

(assert (=> d!2972 (= (isPrefixOf!0 (_1!610 lt!13216) (_2!610 lt!13216)) e!5796)))

(declare-fun b!9398 () Bool)

(declare-fun res!9676 () Bool)

(assert (=> b!9398 (=> (not res!9676) (not e!5796))))

(assert (=> b!9398 (= res!9676 (bvsle (bitIndex!0 (size!244 (buf!580 (_1!610 lt!13216))) (currentByte!1619 (_1!610 lt!13216)) (currentBit!1614 (_1!610 lt!13216))) (bitIndex!0 (size!244 (buf!580 (_2!610 lt!13216))) (currentByte!1619 (_2!610 lt!13216)) (currentBit!1614 (_2!610 lt!13216)))))))

(declare-fun b!9399 () Bool)

(declare-fun e!5795 () Bool)

(assert (=> b!9399 (= e!5796 e!5795)))

(declare-fun res!9677 () Bool)

(assert (=> b!9399 (=> res!9677 e!5795)))

(assert (=> b!9399 (= res!9677 (= (size!244 (buf!580 (_1!610 lt!13216))) #b00000000000000000000000000000000))))

(declare-fun b!9400 () Bool)

(assert (=> b!9400 (= e!5795 (arrayBitRangesEq!0 (buf!580 (_1!610 lt!13216)) (buf!580 (_2!610 lt!13216)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 (_1!610 lt!13216))) (currentByte!1619 (_1!610 lt!13216)) (currentBit!1614 (_1!610 lt!13216)))))))

(assert (= (and d!2972 res!9678) b!9398))

(assert (= (and b!9398 res!9676) b!9399))

(assert (= (and b!9399 (not res!9677)) b!9400))

(assert (=> b!9398 m!13349))

(declare-fun m!13471 () Bool)

(assert (=> b!9398 m!13471))

(assert (=> b!9400 m!13349))

(assert (=> b!9400 m!13349))

(declare-fun m!13473 () Bool)

(assert (=> b!9400 m!13473))

(assert (=> d!2598 d!2972))

(declare-fun d!2974 () Bool)

(declare-fun res!9681 () Bool)

(declare-fun e!5798 () Bool)

(assert (=> d!2974 (=> (not res!9681) (not e!5798))))

(assert (=> d!2974 (= res!9681 (= (size!244 (buf!580 lt!13222)) (size!244 (buf!580 (_2!609 lt!12507)))))))

(assert (=> d!2974 (= (isPrefixOf!0 lt!13222 (_2!609 lt!12507)) e!5798)))

(declare-fun b!9401 () Bool)

(declare-fun res!9679 () Bool)

(assert (=> b!9401 (=> (not res!9679) (not e!5798))))

(assert (=> b!9401 (= res!9679 (bvsle (bitIndex!0 (size!244 (buf!580 lt!13222)) (currentByte!1619 lt!13222) (currentBit!1614 lt!13222)) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507)))))))

(declare-fun b!9402 () Bool)

(declare-fun e!5797 () Bool)

(assert (=> b!9402 (= e!5798 e!5797)))

(declare-fun res!9680 () Bool)

(assert (=> b!9402 (=> res!9680 e!5797)))

(assert (=> b!9402 (= res!9680 (= (size!244 (buf!580 lt!13222)) #b00000000000000000000000000000000))))

(declare-fun b!9403 () Bool)

(assert (=> b!9403 (= e!5797 (arrayBitRangesEq!0 (buf!580 lt!13222) (buf!580 (_2!609 lt!12507)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 lt!13222)) (currentByte!1619 lt!13222) (currentBit!1614 lt!13222))))))

(assert (= (and d!2974 res!9681) b!9401))

(assert (= (and b!9401 res!9679) b!9402))

(assert (= (and b!9402 (not res!9680)) b!9403))

(assert (=> b!9401 m!13455))

(assert (=> b!9401 m!11801))

(assert (=> b!9403 m!13455))

(assert (=> b!9403 m!13455))

(declare-fun m!13475 () Bool)

(assert (=> b!9403 m!13475))

(assert (=> d!2598 d!2974))

(declare-fun d!2976 () Bool)

(declare-fun res!9694 () Bool)

(declare-fun e!5815 () Bool)

(assert (=> d!2976 (=> res!9694 e!5815)))

(assert (=> d!2976 (= res!9694 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (=> d!2976 (= (arrayBitRangesEq!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12507)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))) e!5815)))

(declare-fun b!9418 () Bool)

(declare-fun e!5813 () Bool)

(declare-fun call!168 () Bool)

(assert (=> b!9418 (= e!5813 call!168)))

(declare-fun b!9419 () Bool)

(declare-fun e!5811 () Bool)

(declare-fun e!5814 () Bool)

(assert (=> b!9419 (= e!5811 e!5814)))

(declare-fun c!590 () Bool)

(declare-datatypes ((tuple4!4 0))(
  ( (tuple4!5 (_1!632 (_ BitVec 32)) (_2!632 (_ BitVec 32)) (_3!36 (_ BitVec 32)) (_4!2 (_ BitVec 32))) )
))
(declare-fun lt!14243 () tuple4!4)

(assert (=> b!9419 (= c!590 (= (_3!36 lt!14243) (_4!2 lt!14243)))))

(declare-fun b!9420 () Bool)

(declare-fun res!9692 () Bool)

(declare-fun lt!14245 () (_ BitVec 32))

(assert (=> b!9420 (= res!9692 (= lt!14245 #b00000000000000000000000000000000))))

(assert (=> b!9420 (=> res!9692 e!5813)))

(declare-fun e!5816 () Bool)

(assert (=> b!9420 (= e!5816 e!5813)))

(declare-fun b!9421 () Bool)

(assert (=> b!9421 (= e!5815 e!5811)))

(declare-fun res!9695 () Bool)

(assert (=> b!9421 (=> (not res!9695) (not e!5811))))

(declare-fun e!5812 () Bool)

(assert (=> b!9421 (= res!9695 e!5812)))

(declare-fun res!9696 () Bool)

(assert (=> b!9421 (=> res!9696 e!5812)))

(assert (=> b!9421 (= res!9696 (bvsge (_1!632 lt!14243) (_2!632 lt!14243)))))

(assert (=> b!9421 (= lt!14245 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!14244 () (_ BitVec 32))

(assert (=> b!9421 (= lt!14244 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!4)

(assert (=> b!9421 (= lt!14243 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(declare-fun b!9422 () Bool)

(declare-fun arrayRangesEq!3 (array!570 array!570 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9422 (= e!5812 (arrayRangesEq!3 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12507)) (_1!632 lt!14243) (_2!632 lt!14243)))))

(declare-fun b!9423 () Bool)

(assert (=> b!9423 (= e!5814 e!5816)))

(declare-fun res!9693 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9423 (= res!9693 (byteRangesEq!0 (select (arr!649 (buf!580 thiss!1486)) (_3!36 lt!14243)) (select (arr!649 (buf!580 (_2!609 lt!12507))) (_3!36 lt!14243)) lt!14244 #b00000000000000000000000000001000))))

(assert (=> b!9423 (=> (not res!9693) (not e!5816))))

(declare-fun bm!165 () Bool)

(assert (=> bm!165 (= call!168 (byteRangesEq!0 (ite c!590 (select (arr!649 (buf!580 thiss!1486)) (_3!36 lt!14243)) (select (arr!649 (buf!580 thiss!1486)) (_4!2 lt!14243))) (ite c!590 (select (arr!649 (buf!580 (_2!609 lt!12507))) (_3!36 lt!14243)) (select (arr!649 (buf!580 (_2!609 lt!12507))) (_4!2 lt!14243))) (ite c!590 lt!14244 #b00000000000000000000000000000000) lt!14245))))

(declare-fun b!9424 () Bool)

(assert (=> b!9424 (= e!5814 call!168)))

(assert (= (and d!2976 (not res!9694)) b!9421))

(assert (= (and b!9421 (not res!9696)) b!9422))

(assert (= (and b!9421 res!9695) b!9419))

(assert (= (and b!9419 c!590) b!9424))

(assert (= (and b!9419 (not c!590)) b!9423))

(assert (= (and b!9423 res!9693) b!9420))

(assert (= (and b!9420 (not res!9692)) b!9418))

(assert (= (or b!9424 b!9418) bm!165))

(assert (=> b!9421 m!11803))

(declare-fun m!13477 () Bool)

(assert (=> b!9421 m!13477))

(declare-fun m!13479 () Bool)

(assert (=> b!9422 m!13479))

(declare-fun m!13481 () Bool)

(assert (=> b!9423 m!13481))

(declare-fun m!13483 () Bool)

(assert (=> b!9423 m!13483))

(assert (=> b!9423 m!13481))

(assert (=> b!9423 m!13483))

(declare-fun m!13485 () Bool)

(assert (=> b!9423 m!13485))

(declare-fun m!13487 () Bool)

(assert (=> bm!165 m!13487))

(declare-fun m!13489 () Bool)

(assert (=> bm!165 m!13489))

(declare-fun m!13491 () Bool)

(assert (=> bm!165 m!13491))

(assert (=> bm!165 m!13481))

(assert (=> bm!165 m!13483))

(assert (=> b!8911 d!2976))

(assert (=> b!8911 d!2626))

(assert (=> b!8909 d!2626))

(assert (=> b!8909 d!2620))

(declare-fun d!2978 () Bool)

(assert (=> d!2978 (= (invariant!0 (currentBit!1614 (_2!611 lt!13109)) (currentByte!1619 (_2!611 lt!13109)) (size!244 (buf!580 (_2!611 lt!13109)))) (and (bvsge (currentBit!1614 (_2!611 lt!13109)) #b00000000000000000000000000000000) (bvslt (currentBit!1614 (_2!611 lt!13109)) #b00000000000000000000000000001000) (bvsge (currentByte!1619 (_2!611 lt!13109)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1619 (_2!611 lt!13109)) (size!244 (buf!580 (_2!611 lt!13109)))) (and (= (currentBit!1614 (_2!611 lt!13109)) #b00000000000000000000000000000000) (= (currentByte!1619 (_2!611 lt!13109)) (size!244 (buf!580 (_2!611 lt!13109))))))))))

(assert (=> b!8825 d!2978))

(declare-fun d!2980 () Bool)

(declare-fun c!591 () Bool)

(assert (=> d!2980 (= c!591 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5817 () List!141)

(assert (=> d!2980 (= (byteArrayBitContentToList!0 (_2!611 lt!13109) (_1!611 lt!13109) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5817)))

(declare-fun b!9425 () Bool)

(assert (=> b!9425 (= e!5817 Nil!138)))

(declare-fun b!9426 () Bool)

(assert (=> b!9426 (= e!5817 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (_1!611 lt!13109)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!611 lt!13109) (_1!611 lt!13109) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2980 c!591) b!9425))

(assert (= (and d!2980 (not c!591)) b!9426))

(declare-fun m!13493 () Bool)

(assert (=> b!9426 m!13493))

(assert (=> b!9426 m!12301))

(declare-fun m!13495 () Bool)

(assert (=> b!9426 m!13495))

(assert (=> b!8824 d!2980))

(declare-fun d!2982 () Bool)

(declare-fun e!5818 () Bool)

(assert (=> d!2982 e!5818))

(declare-fun c!592 () Bool)

(assert (=> d!2982 (= c!592 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14246 () List!141)

(declare-fun e!5819 () tuple2!1174)

(assert (=> d!2982 (= lt!14246 (_1!618 e!5819))))

(declare-fun c!593 () Bool)

(assert (=> d!2982 (= c!593 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2982 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2982 (= (bitStreamReadBitsIntoList!0 (_2!611 lt!13109) (_1!610 lt!12509) nBits!460) lt!14246)))

(declare-fun lt!14247 () tuple2!1176)

(declare-fun lt!14248 () (_ BitVec 64))

(declare-fun b!9428 () Bool)

(assert (=> b!9428 (= e!5819 (tuple2!1175 (Cons!137 (_1!619 lt!14247) (bitStreamReadBitsIntoList!0 (_2!611 lt!13109) (_2!619 lt!14247) (bvsub nBits!460 lt!14248))) (_2!619 lt!14247)))))

(assert (=> b!9428 (= lt!14247 (readBit!0 (_1!610 lt!12509)))))

(assert (=> b!9428 (= lt!14248 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9430 () Bool)

(assert (=> b!9430 (= e!5818 (> (length!20 lt!14246) 0))))

(declare-fun b!9427 () Bool)

(assert (=> b!9427 (= e!5819 (tuple2!1175 Nil!138 (_1!610 lt!12509)))))

(declare-fun b!9429 () Bool)

(assert (=> b!9429 (= e!5818 (isEmpty!25 lt!14246))))

(assert (= (and d!2982 c!593) b!9427))

(assert (= (and d!2982 (not c!593)) b!9428))

(assert (= (and d!2982 c!592) b!9429))

(assert (= (and d!2982 (not c!592)) b!9430))

(declare-fun m!13497 () Bool)

(assert (=> b!9428 m!13497))

(assert (=> b!9428 m!12169))

(declare-fun m!13499 () Bool)

(assert (=> b!9430 m!13499))

(declare-fun m!13501 () Bool)

(assert (=> b!9429 m!13501))

(assert (=> b!8824 d!2982))

(declare-fun d!2984 () Bool)

(declare-fun e!5822 () Bool)

(assert (=> d!2984 e!5822))

(declare-fun res!9699 () Bool)

(assert (=> d!2984 (=> (not res!9699) (not e!5822))))

(declare-fun lt!14253 () BitStream!466)

(declare-fun lt!14254 () (_ BitVec 64))

(assert (=> d!2984 (= res!9699 (= (bvadd lt!14254 (bvsub lt!13223 lt!13226)) (bitIndex!0 (size!244 (buf!580 lt!14253)) (currentByte!1619 lt!14253) (currentBit!1614 lt!14253))))))

(assert (=> d!2984 (or (not (= (bvand lt!14254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13223 lt!13226) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14254 (bvsub lt!13223 lt!13226)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2984 (= lt!14254 (bitIndex!0 (size!244 (buf!580 (_2!610 lt!13216))) (currentByte!1619 (_2!610 lt!13216)) (currentBit!1614 (_2!610 lt!13216))))))

(declare-fun moveBitIndex!0 (BitStream!466 (_ BitVec 64)) tuple2!1156)

(assert (=> d!2984 (= lt!14253 (_2!609 (moveBitIndex!0 (_2!610 lt!13216) (bvsub lt!13223 lt!13226))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!466 (_ BitVec 64)) Bool)

(assert (=> d!2984 (moveBitIndexPrecond!0 (_2!610 lt!13216) (bvsub lt!13223 lt!13226))))

(assert (=> d!2984 (= (withMovedBitIndex!0 (_2!610 lt!13216) (bvsub lt!13223 lt!13226)) lt!14253)))

(declare-fun b!9433 () Bool)

(assert (=> b!9433 (= e!5822 (= (size!244 (buf!580 (_2!610 lt!13216))) (size!244 (buf!580 lt!14253))))))

(assert (= (and d!2984 res!9699) b!9433))

(declare-fun m!13503 () Bool)

(assert (=> d!2984 m!13503))

(assert (=> d!2984 m!13471))

(declare-fun m!13505 () Bool)

(assert (=> d!2984 m!13505))

(declare-fun m!13507 () Bool)

(assert (=> d!2984 m!13507))

(assert (=> b!8870 d!2984))

(assert (=> b!8870 d!2620))

(assert (=> b!8870 d!2626))

(declare-fun d!2986 () Bool)

(declare-fun size!249 (List!141) Int)

(assert (=> d!2986 (= (length!20 lt!12963) (size!249 lt!12963))))

(declare-fun bs!914 () Bool)

(assert (= bs!914 d!2986))

(declare-fun m!13509 () Bool)

(assert (=> bs!914 m!13509))

(assert (=> b!8780 d!2986))

(declare-fun d!2988 () Bool)

(declare-fun e!5823 () Bool)

(assert (=> d!2988 e!5823))

(declare-fun c!594 () Bool)

(assert (=> d!2988 (= c!594 (= (bvsub nBits!460 lt!12965) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14255 () List!141)

(declare-fun e!5824 () tuple2!1174)

(assert (=> d!2988 (= lt!14255 (_1!618 e!5824))))

(declare-fun c!595 () Bool)

(assert (=> d!2988 (= c!595 (= (bvsub nBits!460 lt!12965) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2988 (bvsge (bvsub nBits!460 lt!12965) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2988 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12507) (_2!619 lt!12964) (bvsub nBits!460 lt!12965)) lt!14255)))

(declare-fun lt!14256 () tuple2!1176)

(declare-fun lt!14257 () (_ BitVec 64))

(declare-fun b!9435 () Bool)

(assert (=> b!9435 (= e!5824 (tuple2!1175 (Cons!137 (_1!619 lt!14256) (bitStreamReadBitsIntoList!0 (_2!609 lt!12507) (_2!619 lt!14256) (bvsub (bvsub nBits!460 lt!12965) lt!14257))) (_2!619 lt!14256)))))

(assert (=> b!9435 (= lt!14256 (readBit!0 (_2!619 lt!12964)))))

(assert (=> b!9435 (= lt!14257 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9437 () Bool)

(assert (=> b!9437 (= e!5823 (> (length!20 lt!14255) 0))))

(declare-fun b!9434 () Bool)

(assert (=> b!9434 (= e!5824 (tuple2!1175 Nil!138 (_2!619 lt!12964)))))

(declare-fun b!9436 () Bool)

(assert (=> b!9436 (= e!5823 (isEmpty!25 lt!14255))))

(assert (= (and d!2988 c!595) b!9434))

(assert (= (and d!2988 (not c!595)) b!9435))

(assert (= (and d!2988 c!594) b!9436))

(assert (= (and d!2988 (not c!594)) b!9437))

(declare-fun m!13511 () Bool)

(assert (=> b!9435 m!13511))

(declare-fun m!13513 () Bool)

(assert (=> b!9435 m!13513))

(declare-fun m!13515 () Bool)

(assert (=> b!9437 m!13515))

(declare-fun m!13517 () Bool)

(assert (=> b!9436 m!13517))

(assert (=> b!8778 d!2988))

(declare-fun d!2990 () Bool)

(declare-fun e!5831 () Bool)

(assert (=> d!2990 e!5831))

(declare-fun res!9702 () Bool)

(assert (=> d!2990 (=> (not res!9702) (not e!5831))))

(declare-fun increaseBitIndex!0 (BitStream!466) tuple2!1156)

(assert (=> d!2990 (= res!9702 (= (buf!580 (_2!609 (increaseBitIndex!0 (_1!610 lt!12509)))) (buf!580 (_1!610 lt!12509))))))

(declare-fun lt!14277 () Bool)

(assert (=> d!2990 (= lt!14277 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1614 (_1!610 lt!12509))))) #b00000000000000000000000000000000)))))

(declare-fun lt!14274 () tuple2!1176)

(assert (=> d!2990 (= lt!14274 (tuple2!1177 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1614 (_1!610 lt!12509))))) #b00000000000000000000000000000000)) (_2!609 (increaseBitIndex!0 (_1!610 lt!12509)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!2990 (validate_offset_bit!0 ((_ sign_extend 32) (size!244 (buf!580 (_1!610 lt!12509)))) ((_ sign_extend 32) (currentByte!1619 (_1!610 lt!12509))) ((_ sign_extend 32) (currentBit!1614 (_1!610 lt!12509))))))

(assert (=> d!2990 (= (readBit!0 (_1!610 lt!12509)) lt!14274)))

(declare-fun lt!14278 () (_ BitVec 64))

(declare-fun lt!14276 () (_ BitVec 64))

(declare-fun b!9440 () Bool)

(assert (=> b!9440 (= e!5831 (= (bitIndex!0 (size!244 (buf!580 (_2!609 (increaseBitIndex!0 (_1!610 lt!12509))))) (currentByte!1619 (_2!609 (increaseBitIndex!0 (_1!610 lt!12509)))) (currentBit!1614 (_2!609 (increaseBitIndex!0 (_1!610 lt!12509))))) (bvadd lt!14276 lt!14278)))))

(assert (=> b!9440 (or (not (= (bvand lt!14276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14278 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14276 lt!14278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9440 (= lt!14278 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!9440 (= lt!14276 (bitIndex!0 (size!244 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)) (currentBit!1614 (_1!610 lt!12509))))))

(declare-fun lt!14275 () Bool)

(assert (=> b!9440 (= lt!14275 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1614 (_1!610 lt!12509))))) #b00000000000000000000000000000000)))))

(declare-fun lt!14272 () Bool)

(assert (=> b!9440 (= lt!14272 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1614 (_1!610 lt!12509))))) #b00000000000000000000000000000000)))))

(declare-fun lt!14273 () Bool)

(assert (=> b!9440 (= lt!14273 (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1614 (_1!610 lt!12509))))) #b00000000000000000000000000000000)))))

(assert (= (and d!2990 res!9702) b!9440))

(declare-fun m!13519 () Bool)

(assert (=> d!2990 m!13519))

(declare-fun m!13521 () Bool)

(assert (=> d!2990 m!13521))

(declare-fun m!13523 () Bool)

(assert (=> d!2990 m!13523))

(declare-fun m!13525 () Bool)

(assert (=> d!2990 m!13525))

(assert (=> b!9440 m!13519))

(assert (=> b!9440 m!13521))

(declare-fun m!13527 () Bool)

(assert (=> b!9440 m!13527))

(assert (=> b!9440 m!13523))

(assert (=> b!9440 m!12233))

(assert (=> b!8778 d!2990))

(declare-fun d!2992 () Bool)

(assert (=> d!2992 (= (isEmpty!25 lt!12963) (is-Nil!138 lt!12963))))

(assert (=> b!8779 d!2992))

(declare-fun d!2994 () Bool)

(assert (=> d!2994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12885) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) lt!12885))))

(declare-fun bs!915 () Bool)

(assert (= bs!915 d!2994))

(declare-fun m!13529 () Bool)

(assert (=> bs!915 m!13529))

(assert (=> b!8735 d!2994))

(declare-fun d!2996 () Bool)

(declare-fun e!5832 () Bool)

(assert (=> d!2996 e!5832))

(declare-fun c!596 () Bool)

(assert (=> d!2996 (= c!596 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14279 () List!141)

(declare-fun e!5833 () tuple2!1174)

(assert (=> d!2996 (= lt!14279 (_1!618 e!5833))))

(declare-fun c!597 () Bool)

(assert (=> d!2996 (= c!597 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2996 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2996 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12903) (_1!610 lt!12916) (bvsub (bvadd from!367 nBits!460) from!367)) lt!14279)))

(declare-fun lt!14280 () tuple2!1176)

(declare-fun lt!14281 () (_ BitVec 64))

(declare-fun b!9442 () Bool)

(assert (=> b!9442 (= e!5833 (tuple2!1175 (Cons!137 (_1!619 lt!14280) (bitStreamReadBitsIntoList!0 (_2!609 lt!12903) (_2!619 lt!14280) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!14281))) (_2!619 lt!14280)))))

(assert (=> b!9442 (= lt!14280 (readBit!0 (_1!610 lt!12916)))))

(assert (=> b!9442 (= lt!14281 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9444 () Bool)

(assert (=> b!9444 (= e!5832 (> (length!20 lt!14279) 0))))

(declare-fun b!9441 () Bool)

(assert (=> b!9441 (= e!5833 (tuple2!1175 Nil!138 (_1!610 lt!12916)))))

(declare-fun b!9443 () Bool)

(assert (=> b!9443 (= e!5832 (isEmpty!25 lt!14279))))

(assert (= (and d!2996 c!597) b!9441))

(assert (= (and d!2996 (not c!597)) b!9442))

(assert (= (and d!2996 c!596) b!9443))

(assert (= (and d!2996 (not c!596)) b!9444))

(declare-fun m!13531 () Bool)

(assert (=> b!9442 m!13531))

(declare-fun m!13533 () Bool)

(assert (=> b!9442 m!13533))

(declare-fun m!13535 () Bool)

(assert (=> b!9444 m!13535))

(declare-fun m!13537 () Bool)

(assert (=> b!9443 m!13537))

(assert (=> b!8735 d!2996))

(declare-fun d!2998 () Bool)

(declare-fun c!598 () Bool)

(assert (=> d!2998 (= c!598 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5834 () List!141)

(assert (=> d!2998 (= (byteArrayBitContentToList!0 (_2!609 lt!12903) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!5834)))

(declare-fun b!9445 () Bool)

(assert (=> b!9445 (= e!5834 Nil!138)))

(declare-fun b!9446 () Bool)

(assert (=> b!9446 (= e!5834 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!609 lt!12903) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2998 c!598) b!9445))

(assert (= (and d!2998 (not c!598)) b!9446))

(assert (=> b!9446 m!12081))

(assert (=> b!9446 m!13331))

(declare-fun m!13539 () Bool)

(assert (=> b!9446 m!13539))

(assert (=> b!8735 d!2998))

(declare-fun b!9447 () Bool)

(declare-fun res!9704 () Bool)

(declare-fun e!5836 () Bool)

(assert (=> b!9447 (=> (not res!9704) (not e!5836))))

(declare-fun lt!14282 () tuple2!1158)

(assert (=> b!9447 (= res!9704 (isPrefixOf!0 (_1!610 lt!14282) thiss!1486))))

(declare-fun b!9448 () Bool)

(declare-fun res!9703 () Bool)

(assert (=> b!9448 (=> (not res!9703) (not e!5836))))

(assert (=> b!9448 (= res!9703 (isPrefixOf!0 (_2!610 lt!14282) (_2!609 lt!12903)))))

(declare-fun b!9449 () Bool)

(declare-fun e!5835 () Unit!742)

(declare-fun Unit!807 () Unit!742)

(assert (=> b!9449 (= e!5835 Unit!807)))

(declare-fun d!3000 () Bool)

(assert (=> d!3000 e!5836))

(declare-fun res!9705 () Bool)

(assert (=> d!3000 (=> (not res!9705) (not e!5836))))

(assert (=> d!3000 (= res!9705 (isPrefixOf!0 (_1!610 lt!14282) (_2!610 lt!14282)))))

(declare-fun lt!14288 () BitStream!466)

(assert (=> d!3000 (= lt!14282 (tuple2!1159 lt!14288 (_2!609 lt!12903)))))

(declare-fun lt!14291 () Unit!742)

(declare-fun lt!14298 () Unit!742)

(assert (=> d!3000 (= lt!14291 lt!14298)))

(assert (=> d!3000 (isPrefixOf!0 lt!14288 (_2!609 lt!12903))))

(assert (=> d!3000 (= lt!14298 (lemmaIsPrefixTransitive!0 lt!14288 (_2!609 lt!12903) (_2!609 lt!12903)))))

(declare-fun lt!14283 () Unit!742)

(declare-fun lt!14299 () Unit!742)

(assert (=> d!3000 (= lt!14283 lt!14299)))

(assert (=> d!3000 (isPrefixOf!0 lt!14288 (_2!609 lt!12903))))

(assert (=> d!3000 (= lt!14299 (lemmaIsPrefixTransitive!0 lt!14288 thiss!1486 (_2!609 lt!12903)))))

(declare-fun lt!14301 () Unit!742)

(assert (=> d!3000 (= lt!14301 e!5835)))

(declare-fun c!599 () Bool)

(assert (=> d!3000 (= c!599 (not (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!14287 () Unit!742)

(declare-fun lt!14295 () Unit!742)

(assert (=> d!3000 (= lt!14287 lt!14295)))

(assert (=> d!3000 (isPrefixOf!0 (_2!609 lt!12903) (_2!609 lt!12903))))

(assert (=> d!3000 (= lt!14295 (lemmaIsPrefixRefl!0 (_2!609 lt!12903)))))

(declare-fun lt!14297 () Unit!742)

(declare-fun lt!14293 () Unit!742)

(assert (=> d!3000 (= lt!14297 lt!14293)))

(assert (=> d!3000 (= lt!14293 (lemmaIsPrefixRefl!0 (_2!609 lt!12903)))))

(declare-fun lt!14284 () Unit!742)

(declare-fun lt!14285 () Unit!742)

(assert (=> d!3000 (= lt!14284 lt!14285)))

(assert (=> d!3000 (isPrefixOf!0 lt!14288 lt!14288)))

(assert (=> d!3000 (= lt!14285 (lemmaIsPrefixRefl!0 lt!14288))))

(declare-fun lt!14286 () Unit!742)

(declare-fun lt!14294 () Unit!742)

(assert (=> d!3000 (= lt!14286 lt!14294)))

(assert (=> d!3000 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3000 (= lt!14294 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3000 (= lt!14288 (BitStream!467 (buf!580 (_2!609 lt!12903)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> d!3000 (isPrefixOf!0 thiss!1486 (_2!609 lt!12903))))

(assert (=> d!3000 (= (reader!0 thiss!1486 (_2!609 lt!12903)) lt!14282)))

(declare-fun b!9450 () Bool)

(declare-fun lt!14296 () Unit!742)

(assert (=> b!9450 (= e!5835 lt!14296)))

(declare-fun lt!14300 () (_ BitVec 64))

(assert (=> b!9450 (= lt!14300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14290 () (_ BitVec 64))

(assert (=> b!9450 (= lt!14290 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> b!9450 (= lt!14296 (arrayBitRangesEqSymmetric!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12903)) lt!14300 lt!14290))))

(assert (=> b!9450 (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12903)) (buf!580 thiss!1486) lt!14300 lt!14290)))

(declare-fun lt!14292 () (_ BitVec 64))

(declare-fun lt!14289 () (_ BitVec 64))

(declare-fun b!9451 () Bool)

(assert (=> b!9451 (= e!5836 (= (_1!610 lt!14282) (withMovedBitIndex!0 (_2!610 lt!14282) (bvsub lt!14289 lt!14292))))))

(assert (=> b!9451 (or (= (bvand lt!14289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14289 lt!14292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9451 (= lt!14292 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12903))) (currentByte!1619 (_2!609 lt!12903)) (currentBit!1614 (_2!609 lt!12903))))))

(assert (=> b!9451 (= lt!14289 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (= (and d!3000 c!599) b!9450))

(assert (= (and d!3000 (not c!599)) b!9449))

(assert (= (and d!3000 res!9705) b!9447))

(assert (= (and b!9447 res!9704) b!9448))

(assert (= (and b!9448 res!9703) b!9451))

(declare-fun m!13541 () Bool)

(assert (=> b!9447 m!13541))

(declare-fun m!13543 () Bool)

(assert (=> d!3000 m!13543))

(declare-fun m!13545 () Bool)

(assert (=> d!3000 m!13545))

(declare-fun m!13547 () Bool)

(assert (=> d!3000 m!13547))

(assert (=> d!3000 m!12063))

(declare-fun m!13549 () Bool)

(assert (=> d!3000 m!13549))

(assert (=> d!3000 m!12061))

(declare-fun m!13551 () Bool)

(assert (=> d!3000 m!13551))

(declare-fun m!13553 () Bool)

(assert (=> d!3000 m!13553))

(declare-fun m!13555 () Bool)

(assert (=> d!3000 m!13555))

(declare-fun m!13557 () Bool)

(assert (=> d!3000 m!13557))

(assert (=> d!3000 m!12139))

(assert (=> b!9450 m!11803))

(declare-fun m!13559 () Bool)

(assert (=> b!9450 m!13559))

(declare-fun m!13561 () Bool)

(assert (=> b!9450 m!13561))

(declare-fun m!13563 () Bool)

(assert (=> b!9451 m!13563))

(assert (=> b!9451 m!12059))

(assert (=> b!9451 m!11803))

(declare-fun m!13565 () Bool)

(assert (=> b!9448 m!13565))

(assert (=> b!8735 d!3000))

(declare-fun d!3002 () Bool)

(assert (=> d!3002 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12903)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12885)))

(declare-fun lt!14302 () Unit!742)

(assert (=> d!3002 (= lt!14302 (choose!9 thiss!1486 (buf!580 (_2!609 lt!12903)) lt!12885 (BitStream!467 (buf!580 (_2!609 lt!12903)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (=> d!3002 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12903)) lt!12885) lt!14302)))

(declare-fun bs!916 () Bool)

(assert (= bs!916 d!3002))

(assert (=> bs!916 m!12067))

(declare-fun m!13567 () Bool)

(assert (=> bs!916 m!13567))

(assert (=> b!8735 d!3002))

(assert (=> b!8869 d!2626))

(declare-fun d!3004 () Bool)

(assert (=> d!3004 (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12507)) (buf!580 thiss!1486) lt!13234 lt!13224)))

(declare-fun lt!14305 () Unit!742)

(declare-fun choose!8 (array!570 array!570 (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> d!3004 (= lt!14305 (choose!8 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12507)) lt!13234 lt!13224))))

(assert (=> d!3004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13234) (bvsle lt!13234 lt!13224))))

(assert (=> d!3004 (= (arrayBitRangesEqSymmetric!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12507)) lt!13234 lt!13224) lt!14305)))

(declare-fun bs!917 () Bool)

(assert (= bs!917 d!3004))

(assert (=> bs!917 m!12293))

(declare-fun m!13569 () Bool)

(assert (=> bs!917 m!13569))

(assert (=> b!8869 d!3004))

(declare-fun d!3006 () Bool)

(declare-fun res!9708 () Bool)

(declare-fun e!5841 () Bool)

(assert (=> d!3006 (=> res!9708 e!5841)))

(assert (=> d!3006 (= res!9708 (bvsge lt!13234 lt!13224))))

(assert (=> d!3006 (= (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12507)) (buf!580 thiss!1486) lt!13234 lt!13224) e!5841)))

(declare-fun b!9452 () Bool)

(declare-fun e!5839 () Bool)

(declare-fun call!169 () Bool)

(assert (=> b!9452 (= e!5839 call!169)))

(declare-fun b!9453 () Bool)

(declare-fun e!5837 () Bool)

(declare-fun e!5840 () Bool)

(assert (=> b!9453 (= e!5837 e!5840)))

(declare-fun c!600 () Bool)

(declare-fun lt!14306 () tuple4!4)

(assert (=> b!9453 (= c!600 (= (_3!36 lt!14306) (_4!2 lt!14306)))))

(declare-fun b!9454 () Bool)

(declare-fun res!9706 () Bool)

(declare-fun lt!14308 () (_ BitVec 32))

(assert (=> b!9454 (= res!9706 (= lt!14308 #b00000000000000000000000000000000))))

(assert (=> b!9454 (=> res!9706 e!5839)))

(declare-fun e!5842 () Bool)

(assert (=> b!9454 (= e!5842 e!5839)))

(declare-fun b!9455 () Bool)

(assert (=> b!9455 (= e!5841 e!5837)))

(declare-fun res!9709 () Bool)

(assert (=> b!9455 (=> (not res!9709) (not e!5837))))

(declare-fun e!5838 () Bool)

(assert (=> b!9455 (= res!9709 e!5838)))

(declare-fun res!9710 () Bool)

(assert (=> b!9455 (=> res!9710 e!5838)))

(assert (=> b!9455 (= res!9710 (bvsge (_1!632 lt!14306) (_2!632 lt!14306)))))

(assert (=> b!9455 (= lt!14308 ((_ extract 31 0) (bvsrem lt!13224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!14307 () (_ BitVec 32))

(assert (=> b!9455 (= lt!14307 ((_ extract 31 0) (bvsrem lt!13234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9455 (= lt!14306 (arrayBitIndices!0 lt!13234 lt!13224))))

(declare-fun b!9456 () Bool)

(assert (=> b!9456 (= e!5838 (arrayRangesEq!3 (buf!580 (_2!609 lt!12507)) (buf!580 thiss!1486) (_1!632 lt!14306) (_2!632 lt!14306)))))

(declare-fun b!9457 () Bool)

(assert (=> b!9457 (= e!5840 e!5842)))

(declare-fun res!9707 () Bool)

(assert (=> b!9457 (= res!9707 (byteRangesEq!0 (select (arr!649 (buf!580 (_2!609 lt!12507))) (_3!36 lt!14306)) (select (arr!649 (buf!580 thiss!1486)) (_3!36 lt!14306)) lt!14307 #b00000000000000000000000000001000))))

(assert (=> b!9457 (=> (not res!9707) (not e!5842))))

(declare-fun bm!166 () Bool)

(assert (=> bm!166 (= call!169 (byteRangesEq!0 (ite c!600 (select (arr!649 (buf!580 (_2!609 lt!12507))) (_3!36 lt!14306)) (select (arr!649 (buf!580 (_2!609 lt!12507))) (_4!2 lt!14306))) (ite c!600 (select (arr!649 (buf!580 thiss!1486)) (_3!36 lt!14306)) (select (arr!649 (buf!580 thiss!1486)) (_4!2 lt!14306))) (ite c!600 lt!14307 #b00000000000000000000000000000000) lt!14308))))

(declare-fun b!9458 () Bool)

(assert (=> b!9458 (= e!5840 call!169)))

(assert (= (and d!3006 (not res!9708)) b!9455))

(assert (= (and b!9455 (not res!9710)) b!9456))

(assert (= (and b!9455 res!9709) b!9453))

(assert (= (and b!9453 c!600) b!9458))

(assert (= (and b!9453 (not c!600)) b!9457))

(assert (= (and b!9457 res!9707) b!9454))

(assert (= (and b!9454 (not res!9706)) b!9452))

(assert (= (or b!9458 b!9452) bm!166))

(declare-fun m!13571 () Bool)

(assert (=> b!9455 m!13571))

(declare-fun m!13573 () Bool)

(assert (=> b!9456 m!13573))

(declare-fun m!13575 () Bool)

(assert (=> b!9457 m!13575))

(declare-fun m!13577 () Bool)

(assert (=> b!9457 m!13577))

(assert (=> b!9457 m!13575))

(assert (=> b!9457 m!13577))

(declare-fun m!13579 () Bool)

(assert (=> b!9457 m!13579))

(declare-fun m!13581 () Bool)

(assert (=> bm!166 m!13581))

(declare-fun m!13583 () Bool)

(assert (=> bm!166 m!13583))

(declare-fun m!13585 () Bool)

(assert (=> bm!166 m!13585))

(assert (=> bm!166 m!13575))

(assert (=> bm!166 m!13577))

(assert (=> b!8869 d!3006))

(declare-fun d!3008 () Bool)

(declare-fun e!5843 () Bool)

(assert (=> d!3008 e!5843))

(declare-fun res!9711 () Bool)

(assert (=> d!3008 (=> (not res!9711) (not e!5843))))

(declare-fun lt!14314 () (_ BitVec 64))

(declare-fun lt!14312 () (_ BitVec 64))

(declare-fun lt!14313 () (_ BitVec 64))

(assert (=> d!3008 (= res!9711 (= lt!14312 (bvsub lt!14313 lt!14314)))))

(assert (=> d!3008 (or (= (bvand lt!14313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14314 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14313 lt!14314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3008 (= lt!14314 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!611 lt!13109)))) ((_ sign_extend 32) (currentByte!1619 (_2!611 lt!13109))) ((_ sign_extend 32) (currentBit!1614 (_2!611 lt!13109)))))))

(declare-fun lt!14309 () (_ BitVec 64))

(declare-fun lt!14311 () (_ BitVec 64))

(assert (=> d!3008 (= lt!14313 (bvmul lt!14309 lt!14311))))

(assert (=> d!3008 (or (= lt!14309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14311 (bvsdiv (bvmul lt!14309 lt!14311) lt!14309)))))

(assert (=> d!3008 (= lt!14311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3008 (= lt!14309 ((_ sign_extend 32) (size!244 (buf!580 (_2!611 lt!13109)))))))

(assert (=> d!3008 (= lt!14312 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_2!611 lt!13109))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_2!611 lt!13109)))))))

(assert (=> d!3008 (invariant!0 (currentBit!1614 (_2!611 lt!13109)) (currentByte!1619 (_2!611 lt!13109)) (size!244 (buf!580 (_2!611 lt!13109))))))

(assert (=> d!3008 (= (bitIndex!0 (size!244 (buf!580 (_2!611 lt!13109))) (currentByte!1619 (_2!611 lt!13109)) (currentBit!1614 (_2!611 lt!13109))) lt!14312)))

(declare-fun b!9459 () Bool)

(declare-fun res!9712 () Bool)

(assert (=> b!9459 (=> (not res!9712) (not e!5843))))

(assert (=> b!9459 (= res!9712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14312))))

(declare-fun b!9460 () Bool)

(declare-fun lt!14310 () (_ BitVec 64))

(assert (=> b!9460 (= e!5843 (bvsle lt!14312 (bvmul lt!14310 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9460 (or (= lt!14310 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14310 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14310)))))

(assert (=> b!9460 (= lt!14310 ((_ sign_extend 32) (size!244 (buf!580 (_2!611 lt!13109)))))))

(assert (= (and d!3008 res!9711) b!9459))

(assert (= (and b!9459 res!9712) b!9460))

(declare-fun m!13587 () Bool)

(assert (=> d!3008 m!13587))

(assert (=> d!3008 m!12241))

(assert (=> b!8821 d!3008))

(declare-fun d!3010 () Bool)

(declare-fun e!5844 () Bool)

(assert (=> d!3010 e!5844))

(declare-fun res!9713 () Bool)

(assert (=> d!3010 (=> (not res!9713) (not e!5844))))

(declare-fun lt!14318 () (_ BitVec 64))

(declare-fun lt!14320 () (_ BitVec 64))

(declare-fun lt!14319 () (_ BitVec 64))

(assert (=> d!3010 (= res!9713 (= lt!14318 (bvsub lt!14319 lt!14320)))))

(assert (=> d!3010 (or (= (bvand lt!14319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14319 lt!14320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3010 (= lt!14320 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_1!610 lt!12509)))) ((_ sign_extend 32) (currentByte!1619 (_1!610 lt!12509))) ((_ sign_extend 32) (currentBit!1614 (_1!610 lt!12509)))))))

(declare-fun lt!14315 () (_ BitVec 64))

(declare-fun lt!14317 () (_ BitVec 64))

(assert (=> d!3010 (= lt!14319 (bvmul lt!14315 lt!14317))))

(assert (=> d!3010 (or (= lt!14315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14317 (bvsdiv (bvmul lt!14315 lt!14317) lt!14315)))))

(assert (=> d!3010 (= lt!14317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3010 (= lt!14315 ((_ sign_extend 32) (size!244 (buf!580 (_1!610 lt!12509)))))))

(assert (=> d!3010 (= lt!14318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_1!610 lt!12509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_1!610 lt!12509)))))))

(assert (=> d!3010 (invariant!0 (currentBit!1614 (_1!610 lt!12509)) (currentByte!1619 (_1!610 lt!12509)) (size!244 (buf!580 (_1!610 lt!12509))))))

(assert (=> d!3010 (= (bitIndex!0 (size!244 (buf!580 (_1!610 lt!12509))) (currentByte!1619 (_1!610 lt!12509)) (currentBit!1614 (_1!610 lt!12509))) lt!14318)))

(declare-fun b!9461 () Bool)

(declare-fun res!9714 () Bool)

(assert (=> b!9461 (=> (not res!9714) (not e!5844))))

(assert (=> b!9461 (= res!9714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14318))))

(declare-fun b!9462 () Bool)

(declare-fun lt!14316 () (_ BitVec 64))

(assert (=> b!9462 (= e!5844 (bvsle lt!14318 (bvmul lt!14316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9462 (or (= lt!14316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14316)))))

(assert (=> b!9462 (= lt!14316 ((_ sign_extend 32) (size!244 (buf!580 (_1!610 lt!12509)))))))

(assert (= (and d!3010 res!9713) b!9461))

(assert (= (and b!9461 res!9714) b!9462))

(declare-fun m!13589 () Bool)

(assert (=> d!3010 m!13589))

(declare-fun m!13591 () Bool)

(assert (=> d!3010 m!13591))

(assert (=> b!8821 d!3010))

(declare-fun d!3012 () Bool)

(declare-fun c!601 () Bool)

(assert (=> d!3012 (= c!601 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5845 () List!141)

(assert (=> d!3012 (= (byteArrayBitContentToList!0 (_2!609 lt!12882) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) e!5845)))

(declare-fun b!9463 () Bool)

(assert (=> b!9463 (= e!5845 Nil!138)))

(declare-fun b!9464 () Bool)

(assert (=> b!9464 (= e!5845 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!609 lt!12882) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3012 c!601) b!9463))

(assert (= (and d!3012 (not c!601)) b!9464))

(declare-fun m!13593 () Bool)

(assert (=> b!9464 m!13593))

(declare-fun m!13595 () Bool)

(assert (=> b!9464 m!13595))

(declare-fun m!13597 () Bool)

(assert (=> b!9464 m!13597))

(assert (=> b!8733 d!3012))

(declare-fun d!3014 () Bool)

(declare-fun e!5848 () Bool)

(assert (=> d!3014 e!5848))

(declare-fun res!9717 () Bool)

(assert (=> d!3014 (=> (not res!9717) (not e!5848))))

(assert (=> d!3014 (= res!9717 (or (= (bvand lt!12913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12913 lt!12923) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!14323 () Unit!742)

(declare-fun choose!27 (BitStream!466 BitStream!466 (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> d!3014 (= lt!14323 (choose!27 thiss!1486 (_2!609 lt!12918) lt!12913 lt!12923))))

(assert (=> d!3014 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12923) (bvsle lt!12923 lt!12913))))

(assert (=> d!3014 (= (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!609 lt!12918) lt!12913 lt!12923) lt!14323)))

(declare-fun b!9467 () Bool)

(assert (=> b!9467 (= e!5848 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) (bvsub lt!12913 lt!12923)))))

(assert (= (and d!3014 res!9717) b!9467))

(declare-fun m!13599 () Bool)

(assert (=> d!3014 m!13599))

(assert (=> b!9467 m!12107))

(assert (=> b!8733 d!3014))

(declare-fun d!3016 () Bool)

(declare-fun c!602 () Bool)

(assert (=> d!3016 (= c!602 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5849 () List!141)

(assert (=> d!3016 (= (byteArrayBitContentToList!0 (_2!609 lt!12918) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001) e!5849)))

(declare-fun b!9468 () Bool)

(assert (=> b!9468 (= e!5849 Nil!138)))

(declare-fun b!9469 () Bool)

(assert (=> b!9469 (= e!5849 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!609 lt!12918) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3016 c!602) b!9468))

(assert (= (and d!3016 (not c!602)) b!9469))

(assert (=> b!9469 m!12081))

(assert (=> b!9469 m!13331))

(declare-fun m!13601 () Bool)

(assert (=> b!9469 m!13601))

(assert (=> b!8733 d!3016))

(declare-fun d!3018 () Bool)

(assert (=> d!3018 (= (bitAt!0 (buf!580 (_2!609 lt!12882)) lt!12911) (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_2!609 lt!12882))) ((_ extract 31 0) (bvsdiv lt!12911 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!12911 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!918 () Bool)

(assert (= bs!918 d!3018))

(declare-fun m!13603 () Bool)

(assert (=> bs!918 m!13603))

(declare-fun m!13605 () Bool)

(assert (=> bs!918 m!13605))

(assert (=> b!8733 d!3018))

(declare-fun d!3020 () Bool)

(assert (=> d!3020 (= (bitAt!0 (buf!580 (_2!609 lt!12918)) lt!12911) (bitAt!0 (buf!580 (_2!609 lt!12882)) lt!12911))))

(declare-fun lt!14326 () Unit!742)

(declare-fun choose!31 (array!570 array!570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!742)

(assert (=> d!3020 (= lt!14326 (choose!31 (buf!580 (_2!609 lt!12918)) (buf!580 (_2!609 lt!12882)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12911 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918)))))))

(assert (=> d!3020 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918)))))))

(assert (=> d!3020 (= (arrayBitRangesEqImpliesEq!0 (buf!580 (_2!609 lt!12918)) (buf!580 (_2!609 lt!12882)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12911 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918)))) lt!14326)))

(declare-fun bs!919 () Bool)

(assert (= bs!919 d!3020))

(assert (=> bs!919 m!12109))

(assert (=> bs!919 m!12123))

(assert (=> bs!919 m!12093))

(declare-fun m!13607 () Bool)

(assert (=> bs!919 m!13607))

(assert (=> b!8733 d!3020))

(declare-fun d!3022 () Bool)

(declare-fun res!9720 () Bool)

(declare-fun e!5851 () Bool)

(assert (=> d!3022 (=> (not res!9720) (not e!5851))))

(assert (=> d!3022 (= res!9720 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!12882)))))))

(assert (=> d!3022 (= (isPrefixOf!0 thiss!1486 (_2!609 lt!12882)) e!5851)))

(declare-fun b!9470 () Bool)

(declare-fun res!9718 () Bool)

(assert (=> b!9470 (=> (not res!9718) (not e!5851))))

(assert (=> b!9470 (= res!9718 (bvsle (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12882))) (currentByte!1619 (_2!609 lt!12882)) (currentBit!1614 (_2!609 lt!12882)))))))

(declare-fun b!9471 () Bool)

(declare-fun e!5850 () Bool)

(assert (=> b!9471 (= e!5851 e!5850)))

(declare-fun res!9719 () Bool)

(assert (=> b!9471 (=> res!9719 e!5850)))

(assert (=> b!9471 (= res!9719 (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9472 () Bool)

(assert (=> b!9472 (= e!5850 (arrayBitRangesEq!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12882)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (= (and d!3022 res!9720) b!9470))

(assert (= (and b!9470 res!9718) b!9471))

(assert (= (and b!9471 (not res!9719)) b!9472))

(assert (=> b!9470 m!11803))

(assert (=> b!9470 m!12103))

(assert (=> b!9472 m!11803))

(assert (=> b!9472 m!11803))

(declare-fun m!13609 () Bool)

(assert (=> b!9472 m!13609))

(assert (=> b!8733 d!3022))

(declare-fun d!3024 () Bool)

(declare-fun e!5854 () Bool)

(assert (=> d!3024 e!5854))

(declare-fun res!9723 () Bool)

(assert (=> d!3024 (=> (not res!9723) (not e!5854))))

(declare-fun lt!14332 () (_ BitVec 64))

(assert (=> d!3024 (= res!9723 (or (= (bvand lt!12886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12886 lt!14332) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3024 (= lt!14332 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14331 () Unit!742)

(declare-fun choose!42 (BitStream!466 BitStream!466 BitStream!466 BitStream!466 (_ BitVec 64) List!141) Unit!742)

(assert (=> d!3024 (= lt!14331 (choose!42 (_2!609 lt!12882) (_2!609 lt!12882) (_1!610 lt!12909) (_1!610 lt!12910) lt!12886 lt!12893))))

(assert (=> d!3024 (bvsgt lt!12886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3024 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!609 lt!12882) (_2!609 lt!12882) (_1!610 lt!12909) (_1!610 lt!12910) lt!12886 lt!12893) lt!14331)))

(declare-fun b!9475 () Bool)

(assert (=> b!9475 (= e!5854 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12910) (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!57 lt!12893)))))

(assert (= (and d!3024 res!9723) b!9475))

(declare-fun m!13611 () Bool)

(assert (=> d!3024 m!13611))

(assert (=> b!9475 m!12079))

(assert (=> b!9475 m!12075))

(assert (=> b!8733 d!3024))

(declare-fun d!3026 () Bool)

(assert (=> d!3026 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!12922)))

(declare-fun lt!14333 () Unit!742)

(assert (=> d!3026 (= lt!14333 (choose!9 (_2!609 lt!12918) (buf!580 (_2!609 lt!12882)) lt!12922 (BitStream!467 (buf!580 (_2!609 lt!12882)) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918)))))))

(assert (=> d!3026 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!609 lt!12918) (buf!580 (_2!609 lt!12882)) lt!12922) lt!14333)))

(declare-fun bs!920 () Bool)

(assert (= bs!920 d!3026))

(assert (=> bs!920 m!12105))

(declare-fun m!13613 () Bool)

(assert (=> bs!920 m!13613))

(assert (=> b!8733 d!3026))

(declare-fun b!9476 () Bool)

(declare-fun res!9725 () Bool)

(declare-fun e!5856 () Bool)

(assert (=> b!9476 (=> (not res!9725) (not e!5856))))

(declare-fun lt!14334 () tuple2!1158)

(assert (=> b!9476 (= res!9725 (isPrefixOf!0 (_1!610 lt!14334) thiss!1486))))

(declare-fun b!9477 () Bool)

(declare-fun res!9724 () Bool)

(assert (=> b!9477 (=> (not res!9724) (not e!5856))))

(assert (=> b!9477 (= res!9724 (isPrefixOf!0 (_2!610 lt!14334) (_2!609 lt!12918)))))

(declare-fun b!9478 () Bool)

(declare-fun e!5855 () Unit!742)

(declare-fun Unit!808 () Unit!742)

(assert (=> b!9478 (= e!5855 Unit!808)))

(declare-fun d!3028 () Bool)

(assert (=> d!3028 e!5856))

(declare-fun res!9726 () Bool)

(assert (=> d!3028 (=> (not res!9726) (not e!5856))))

(assert (=> d!3028 (= res!9726 (isPrefixOf!0 (_1!610 lt!14334) (_2!610 lt!14334)))))

(declare-fun lt!14340 () BitStream!466)

(assert (=> d!3028 (= lt!14334 (tuple2!1159 lt!14340 (_2!609 lt!12918)))))

(declare-fun lt!14343 () Unit!742)

(declare-fun lt!14350 () Unit!742)

(assert (=> d!3028 (= lt!14343 lt!14350)))

(assert (=> d!3028 (isPrefixOf!0 lt!14340 (_2!609 lt!12918))))

(assert (=> d!3028 (= lt!14350 (lemmaIsPrefixTransitive!0 lt!14340 (_2!609 lt!12918) (_2!609 lt!12918)))))

(declare-fun lt!14335 () Unit!742)

(declare-fun lt!14351 () Unit!742)

(assert (=> d!3028 (= lt!14335 lt!14351)))

(assert (=> d!3028 (isPrefixOf!0 lt!14340 (_2!609 lt!12918))))

(assert (=> d!3028 (= lt!14351 (lemmaIsPrefixTransitive!0 lt!14340 thiss!1486 (_2!609 lt!12918)))))

(declare-fun lt!14353 () Unit!742)

(assert (=> d!3028 (= lt!14353 e!5855)))

(declare-fun c!603 () Bool)

(assert (=> d!3028 (= c!603 (not (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!14339 () Unit!742)

(declare-fun lt!14347 () Unit!742)

(assert (=> d!3028 (= lt!14339 lt!14347)))

(assert (=> d!3028 (isPrefixOf!0 (_2!609 lt!12918) (_2!609 lt!12918))))

(assert (=> d!3028 (= lt!14347 (lemmaIsPrefixRefl!0 (_2!609 lt!12918)))))

(declare-fun lt!14349 () Unit!742)

(declare-fun lt!14345 () Unit!742)

(assert (=> d!3028 (= lt!14349 lt!14345)))

(assert (=> d!3028 (= lt!14345 (lemmaIsPrefixRefl!0 (_2!609 lt!12918)))))

(declare-fun lt!14336 () Unit!742)

(declare-fun lt!14337 () Unit!742)

(assert (=> d!3028 (= lt!14336 lt!14337)))

(assert (=> d!3028 (isPrefixOf!0 lt!14340 lt!14340)))

(assert (=> d!3028 (= lt!14337 (lemmaIsPrefixRefl!0 lt!14340))))

(declare-fun lt!14338 () Unit!742)

(declare-fun lt!14346 () Unit!742)

(assert (=> d!3028 (= lt!14338 lt!14346)))

(assert (=> d!3028 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3028 (= lt!14346 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3028 (= lt!14340 (BitStream!467 (buf!580 (_2!609 lt!12918)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> d!3028 (isPrefixOf!0 thiss!1486 (_2!609 lt!12918))))

(assert (=> d!3028 (= (reader!0 thiss!1486 (_2!609 lt!12918)) lt!14334)))

(declare-fun b!9479 () Bool)

(declare-fun lt!14348 () Unit!742)

(assert (=> b!9479 (= e!5855 lt!14348)))

(declare-fun lt!14352 () (_ BitVec 64))

(assert (=> b!9479 (= lt!14352 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14342 () (_ BitVec 64))

(assert (=> b!9479 (= lt!14342 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> b!9479 (= lt!14348 (arrayBitRangesEqSymmetric!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12918)) lt!14352 lt!14342))))

(assert (=> b!9479 (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12918)) (buf!580 thiss!1486) lt!14352 lt!14342)))

(declare-fun b!9480 () Bool)

(declare-fun lt!14341 () (_ BitVec 64))

(declare-fun lt!14344 () (_ BitVec 64))

(assert (=> b!9480 (= e!5856 (= (_1!610 lt!14334) (withMovedBitIndex!0 (_2!610 lt!14334) (bvsub lt!14341 lt!14344))))))

(assert (=> b!9480 (or (= (bvand lt!14341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14341 lt!14344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9480 (= lt!14344 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918))))))

(assert (=> b!9480 (= lt!14341 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (= (and d!3028 c!603) b!9479))

(assert (= (and d!3028 (not c!603)) b!9478))

(assert (= (and d!3028 res!9726) b!9476))

(assert (= (and b!9476 res!9725) b!9477))

(assert (= (and b!9477 res!9724) b!9480))

(declare-fun m!13615 () Bool)

(assert (=> b!9476 m!13615))

(declare-fun m!13617 () Bool)

(assert (=> d!3028 m!13617))

(declare-fun m!13619 () Bool)

(assert (=> d!3028 m!13619))

(declare-fun m!13621 () Bool)

(assert (=> d!3028 m!13621))

(assert (=> d!3028 m!12063))

(declare-fun m!13623 () Bool)

(assert (=> d!3028 m!13623))

(assert (=> d!3028 m!12061))

(declare-fun m!13625 () Bool)

(assert (=> d!3028 m!13625))

(declare-fun m!13627 () Bool)

(assert (=> d!3028 m!13627))

(declare-fun m!13629 () Bool)

(assert (=> d!3028 m!13629))

(declare-fun m!13631 () Bool)

(assert (=> d!3028 m!13631))

(declare-fun m!13633 () Bool)

(assert (=> d!3028 m!13633))

(assert (=> b!9479 m!11803))

(declare-fun m!13635 () Bool)

(assert (=> b!9479 m!13635))

(declare-fun m!13637 () Bool)

(assert (=> b!9479 m!13637))

(declare-fun m!13639 () Bool)

(assert (=> b!9480 m!13639))

(assert (=> b!9480 m!12093))

(assert (=> b!9480 m!11803))

(declare-fun m!13641 () Bool)

(assert (=> b!9477 m!13641))

(assert (=> b!8733 d!3028))

(declare-fun d!3030 () Bool)

(assert (=> d!3030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!12922) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918)))) lt!12922))))

(declare-fun bs!921 () Bool)

(assert (= bs!921 d!3030))

(declare-fun m!13643 () Bool)

(assert (=> bs!921 m!13643))

(assert (=> b!8733 d!3030))

(declare-fun d!3032 () Bool)

(declare-fun e!5857 () Bool)

(assert (=> d!3032 e!5857))

(declare-fun c!604 () Bool)

(assert (=> d!3032 (= c!604 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14354 () List!141)

(declare-fun e!5858 () tuple2!1174)

(assert (=> d!3032 (= lt!14354 (_1!618 e!5858))))

(declare-fun c!605 () Bool)

(assert (=> d!3032 (= c!605 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3032 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3032 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12918) (_1!610 lt!12921) #b0000000000000000000000000000000000000000000000000000000000000001) lt!14354)))

(declare-fun lt!14356 () (_ BitVec 64))

(declare-fun b!9482 () Bool)

(declare-fun lt!14355 () tuple2!1176)

(assert (=> b!9482 (= e!5858 (tuple2!1175 (Cons!137 (_1!619 lt!14355) (bitStreamReadBitsIntoList!0 (_2!609 lt!12918) (_2!619 lt!14355) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!14356))) (_2!619 lt!14355)))))

(assert (=> b!9482 (= lt!14355 (readBit!0 (_1!610 lt!12921)))))

(assert (=> b!9482 (= lt!14356 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9484 () Bool)

(assert (=> b!9484 (= e!5857 (> (length!20 lt!14354) 0))))

(declare-fun b!9481 () Bool)

(assert (=> b!9481 (= e!5858 (tuple2!1175 Nil!138 (_1!610 lt!12921)))))

(declare-fun b!9483 () Bool)

(assert (=> b!9483 (= e!5857 (isEmpty!25 lt!14354))))

(assert (= (and d!3032 c!605) b!9481))

(assert (= (and d!3032 (not c!605)) b!9482))

(assert (= (and d!3032 c!604) b!9483))

(assert (= (and d!3032 (not c!604)) b!9484))

(declare-fun m!13645 () Bool)

(assert (=> b!9482 m!13645))

(declare-fun m!13647 () Bool)

(assert (=> b!9482 m!13647))

(declare-fun m!13649 () Bool)

(assert (=> b!9484 m!13649))

(declare-fun m!13651 () Bool)

(assert (=> b!9483 m!13651))

(assert (=> b!8733 d!3032))

(declare-fun d!3034 () Bool)

(assert (=> d!3034 (= (head!49 (byteArrayBitContentToList!0 (_2!609 lt!12918) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!256 (byteArrayBitContentToList!0 (_2!609 lt!12918) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8733 d!3034))

(declare-fun d!3036 () Bool)

(assert (=> d!3036 (isPrefixOf!0 thiss!1486 (_2!609 lt!12882))))

(declare-fun lt!14357 () Unit!742)

(assert (=> d!3036 (= lt!14357 (choose!30 thiss!1486 (_2!609 lt!12918) (_2!609 lt!12882)))))

(assert (=> d!3036 (isPrefixOf!0 thiss!1486 (_2!609 lt!12918))))

(assert (=> d!3036 (= (lemmaIsPrefixTransitive!0 thiss!1486 (_2!609 lt!12918) (_2!609 lt!12882)) lt!14357)))

(declare-fun bs!922 () Bool)

(assert (= bs!922 d!3036))

(assert (=> bs!922 m!12127))

(declare-fun m!13653 () Bool)

(assert (=> bs!922 m!13653))

(assert (=> bs!922 m!13633))

(assert (=> b!8733 d!3036))

(declare-fun d!3038 () Bool)

(assert (=> d!3038 (= (bitAt!0 (buf!580 (_2!609 lt!12918)) lt!12911) (not (= (bvand ((_ sign_extend 24) (select (arr!649 (buf!580 (_2!609 lt!12918))) ((_ extract 31 0) (bvsdiv lt!12911 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!12911 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!923 () Bool)

(assert (= bs!923 d!3038))

(declare-fun m!13655 () Bool)

(assert (=> bs!923 m!13655))

(assert (=> bs!923 m!13605))

(assert (=> b!8733 d!3038))

(declare-fun d!3040 () Bool)

(assert (=> d!3040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) (bvsub lt!12913 lt!12923)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918)))) (bvsub lt!12913 lt!12923)))))

(declare-fun bs!924 () Bool)

(assert (= bs!924 d!3040))

(declare-fun m!13657 () Bool)

(assert (=> bs!924 m!13657))

(assert (=> b!8733 d!3040))

(declare-fun d!3042 () Bool)

(declare-fun e!5859 () Bool)

(assert (=> d!3042 e!5859))

(declare-fun res!9727 () Bool)

(assert (=> d!3042 (=> (not res!9727) (not e!5859))))

(declare-fun lt!14361 () (_ BitVec 64))

(declare-fun lt!14362 () (_ BitVec 64))

(declare-fun lt!14363 () (_ BitVec 64))

(assert (=> d!3042 (= res!9727 (= lt!14361 (bvsub lt!14362 lt!14363)))))

(assert (=> d!3042 (or (= (bvand lt!14362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14362 lt!14363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3042 (= lt!14363 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12882))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12882)))))))

(declare-fun lt!14358 () (_ BitVec 64))

(declare-fun lt!14360 () (_ BitVec 64))

(assert (=> d!3042 (= lt!14362 (bvmul lt!14358 lt!14360))))

(assert (=> d!3042 (or (= lt!14358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14360 (bvsdiv (bvmul lt!14358 lt!14360) lt!14358)))))

(assert (=> d!3042 (= lt!14360 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3042 (= lt!14358 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))))))

(assert (=> d!3042 (= lt!14361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12882)))))))

(assert (=> d!3042 (invariant!0 (currentBit!1614 (_2!609 lt!12882)) (currentByte!1619 (_2!609 lt!12882)) (size!244 (buf!580 (_2!609 lt!12882))))))

(assert (=> d!3042 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12882))) (currentByte!1619 (_2!609 lt!12882)) (currentBit!1614 (_2!609 lt!12882))) lt!14361)))

(declare-fun b!9485 () Bool)

(declare-fun res!9728 () Bool)

(assert (=> b!9485 (=> (not res!9728) (not e!5859))))

(assert (=> b!9485 (= res!9728 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14361))))

(declare-fun b!9486 () Bool)

(declare-fun lt!14359 () (_ BitVec 64))

(assert (=> b!9486 (= e!5859 (bvsle lt!14361 (bvmul lt!14359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9486 (or (= lt!14359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14359)))))

(assert (=> b!9486 (= lt!14359 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))))))

(assert (= (and d!3042 res!9727) b!9485))

(assert (= (and b!9485 res!9728) b!9486))

(declare-fun m!13659 () Bool)

(assert (=> d!3042 m!13659))

(declare-fun m!13661 () Bool)

(assert (=> d!3042 m!13661))

(assert (=> b!8733 d!3042))

(declare-fun d!3044 () Bool)

(assert (=> d!3044 (= (tail!57 lt!12893) (t!891 lt!12893))))

(assert (=> b!8733 d!3044))

(declare-fun d!3046 () Bool)

(declare-fun c!606 () Bool)

(assert (=> d!3046 (= c!606 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5860 () List!141)

(assert (=> d!3046 (= (byteArrayBitContentToList!0 (_2!609 lt!12882) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!5860)))

(declare-fun b!9487 () Bool)

(assert (=> b!9487 (= e!5860 Nil!138)))

(declare-fun b!9488 () Bool)

(assert (=> b!9488 (= e!5860 (Cons!137 (not (= (bvand ((_ sign_extend 24) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!609 lt!12882) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3046 c!606) b!9487))

(assert (= (and d!3046 (not c!606)) b!9488))

(assert (=> b!9488 m!12081))

(assert (=> b!9488 m!13331))

(assert (=> b!9488 m!12077))

(assert (=> b!8733 d!3046))

(declare-fun d!3048 () Bool)

(declare-fun e!5861 () Bool)

(assert (=> d!3048 e!5861))

(declare-fun c!607 () Bool)

(assert (=> d!3048 (= c!607 (= (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14364 () List!141)

(declare-fun e!5862 () tuple2!1174)

(assert (=> d!3048 (= lt!14364 (_1!618 e!5862))))

(declare-fun c!608 () Bool)

(assert (=> d!3048 (= c!608 (= (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3048 (bvsge (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3048 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12910) (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!14364)))

(declare-fun lt!14366 () (_ BitVec 64))

(declare-fun lt!14365 () tuple2!1176)

(declare-fun b!9490 () Bool)

(assert (=> b!9490 (= e!5862 (tuple2!1175 (Cons!137 (_1!619 lt!14365) (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_2!619 lt!14365) (bvsub (bvsub lt!12886 #b0000000000000000000000000000000000000000000000000000000000000001) lt!14366))) (_2!619 lt!14365)))))

(assert (=> b!9490 (= lt!14365 (readBit!0 (_1!610 lt!12910)))))

(assert (=> b!9490 (= lt!14366 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9492 () Bool)

(assert (=> b!9492 (= e!5861 (> (length!20 lt!14364) 0))))

(declare-fun b!9489 () Bool)

(assert (=> b!9489 (= e!5862 (tuple2!1175 Nil!138 (_1!610 lt!12910)))))

(declare-fun b!9491 () Bool)

(assert (=> b!9491 (= e!5861 (isEmpty!25 lt!14364))))

(assert (= (and d!3048 c!608) b!9489))

(assert (= (and d!3048 (not c!608)) b!9490))

(assert (= (and d!3048 c!607) b!9491))

(assert (= (and d!3048 (not c!607)) b!9492))

(declare-fun m!13663 () Bool)

(assert (=> b!9490 m!13663))

(declare-fun m!13665 () Bool)

(assert (=> b!9490 m!13665))

(declare-fun m!13667 () Bool)

(assert (=> b!9492 m!13667))

(declare-fun m!13669 () Bool)

(assert (=> b!9491 m!13669))

(assert (=> b!8733 d!3048))

(declare-fun b!9493 () Bool)

(declare-fun res!9732 () Bool)

(declare-fun e!5865 () Bool)

(assert (=> b!9493 (=> (not res!9732) (not e!5865))))

(declare-fun lt!14390 () tuple2!1156)

(assert (=> b!9493 (= res!9732 (invariant!0 (currentBit!1614 (_2!609 lt!14390)) (currentByte!1619 (_2!609 lt!14390)) (size!244 (buf!580 (_2!609 lt!14390)))))))

(declare-fun b!9494 () Bool)

(declare-fun res!9729 () Bool)

(assert (=> b!9494 (=> (not res!9729) (not e!5865))))

(assert (=> b!9494 (= res!9729 (= (size!244 (buf!580 (_2!609 lt!14390))) (size!244 (buf!580 (_2!609 lt!12918)))))))

(declare-fun call!170 () tuple2!1158)

(declare-fun c!609 () Bool)

(declare-fun bm!167 () Bool)

(declare-fun lt!14369 () tuple2!1156)

(declare-fun lt!14405 () tuple2!1156)

(assert (=> bm!167 (= call!170 (reader!0 (ite c!609 (_2!609 lt!14405) (_2!609 lt!12918)) (ite c!609 (_2!609 lt!14369) (_2!609 lt!12918))))))

(declare-fun b!9495 () Bool)

(declare-fun e!5864 () Bool)

(declare-fun lt!14372 () (_ BitVec 64))

(assert (=> b!9495 (= e!5864 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!14372))))

(declare-fun b!9496 () Bool)

(declare-fun e!5863 () tuple2!1156)

(declare-fun Unit!809 () Unit!742)

(assert (=> b!9496 (= e!5863 (tuple2!1157 Unit!809 (_2!609 lt!12918)))))

(assert (=> b!9496 (= (size!244 (buf!580 (_2!609 lt!12918))) (size!244 (buf!580 (_2!609 lt!12918))))))

(declare-fun lt!14368 () Unit!742)

(declare-fun Unit!810 () Unit!742)

(assert (=> b!9496 (= lt!14368 Unit!810)))

(assert (=> b!9496 (checkByteArrayBitContent!0 (_2!609 lt!12918) srcBuffer!6 (_1!611 (readBits!0 (_1!610 call!170) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!9497 () Bool)

(declare-fun Unit!811 () Unit!742)

(assert (=> b!9497 (= e!5863 (tuple2!1157 Unit!811 (_2!609 lt!14369)))))

(assert (=> b!9497 (= lt!14405 (appendBitFromByte!0 (_2!609 lt!12918) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!14400 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14400 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14410 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14410 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14401 () Unit!742)

(assert (=> b!9497 (= lt!14401 (validateOffsetBitsIneqLemma!0 (_2!609 lt!12918) (_2!609 lt!14405) lt!14400 lt!14410))))

(assert (=> b!9497 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!14405)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!14405))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!14405))) (bvsub lt!14400 lt!14410))))

(declare-fun lt!14387 () Unit!742)

(assert (=> b!9497 (= lt!14387 lt!14401)))

(declare-fun lt!14408 () tuple2!1158)

(assert (=> b!9497 (= lt!14408 (reader!0 (_2!609 lt!12918) (_2!609 lt!14405)))))

(declare-fun lt!14404 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14404 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14379 () Unit!742)

(assert (=> b!9497 (= lt!14379 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!609 lt!12918) (buf!580 (_2!609 lt!14405)) lt!14404))))

(assert (=> b!9497 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!14405)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!14404)))

(declare-fun lt!14371 () Unit!742)

(assert (=> b!9497 (= lt!14371 lt!14379)))

(assert (=> b!9497 (= (head!49 (byteArrayBitContentToList!0 (_2!609 lt!14405) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!49 (bitStreamReadBitsIntoList!0 (_2!609 lt!14405) (_1!610 lt!14408) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14374 () Unit!742)

(declare-fun Unit!812 () Unit!742)

(assert (=> b!9497 (= lt!14374 Unit!812)))

(assert (=> b!9497 (= lt!14369 (appendBitsMSBFirstLoop!0 (_2!609 lt!14405) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!14391 () Unit!742)

(assert (=> b!9497 (= lt!14391 (lemmaIsPrefixTransitive!0 (_2!609 lt!12918) (_2!609 lt!14405) (_2!609 lt!14369)))))

(assert (=> b!9497 (isPrefixOf!0 (_2!609 lt!12918) (_2!609 lt!14369))))

(declare-fun lt!14367 () Unit!742)

(assert (=> b!9497 (= lt!14367 lt!14391)))

(assert (=> b!9497 (= (size!244 (buf!580 (_2!609 lt!14369))) (size!244 (buf!580 (_2!609 lt!12918))))))

(declare-fun lt!14381 () Unit!742)

(declare-fun Unit!813 () Unit!742)

(assert (=> b!9497 (= lt!14381 Unit!813)))

(assert (=> b!9497 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14369))) (currentByte!1619 (_2!609 lt!14369)) (currentBit!1614 (_2!609 lt!14369))) (bvsub (bvadd (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14388 () Unit!742)

(declare-fun Unit!814 () Unit!742)

(assert (=> b!9497 (= lt!14388 Unit!814)))

(assert (=> b!9497 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14369))) (currentByte!1619 (_2!609 lt!14369)) (currentBit!1614 (_2!609 lt!14369))) (bvsub (bvsub (bvadd (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14405))) (currentByte!1619 (_2!609 lt!14405)) (currentBit!1614 (_2!609 lt!14405))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!14386 () Unit!742)

(declare-fun Unit!815 () Unit!742)

(assert (=> b!9497 (= lt!14386 Unit!815)))

(declare-fun lt!14396 () tuple2!1158)

(assert (=> b!9497 (= lt!14396 (reader!0 (_2!609 lt!12918) (_2!609 lt!14369)))))

(declare-fun lt!14406 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14406 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14394 () Unit!742)

(assert (=> b!9497 (= lt!14394 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!609 lt!12918) (buf!580 (_2!609 lt!14369)) lt!14406))))

(assert (=> b!9497 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!14369)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!14406)))

(declare-fun lt!14383 () Unit!742)

(assert (=> b!9497 (= lt!14383 lt!14394)))

(declare-fun lt!14397 () tuple2!1158)

(assert (=> b!9497 (= lt!14397 call!170)))

(declare-fun lt!14409 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14409 (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!14377 () Unit!742)

(assert (=> b!9497 (= lt!14377 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!609 lt!14405) (buf!580 (_2!609 lt!14369)) lt!14409))))

(assert (=> b!9497 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!14369)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!14405))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!14405))) lt!14409)))

(declare-fun lt!14384 () Unit!742)

(assert (=> b!9497 (= lt!14384 lt!14377)))

(declare-fun lt!14389 () List!141)

(assert (=> b!9497 (= lt!14389 (byteArrayBitContentToList!0 (_2!609 lt!14369) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!14393 () List!141)

(assert (=> b!9497 (= lt!14393 (byteArrayBitContentToList!0 (_2!609 lt!14369) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14380 () List!141)

(assert (=> b!9497 (= lt!14380 (bitStreamReadBitsIntoList!0 (_2!609 lt!14369) (_1!610 lt!14396) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!14407 () List!141)

(assert (=> b!9497 (= lt!14407 (bitStreamReadBitsIntoList!0 (_2!609 lt!14369) (_1!610 lt!14397) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14373 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14373 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14375 () Unit!742)

(assert (=> b!9497 (= lt!14375 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!609 lt!14369) (_2!609 lt!14369) (_1!610 lt!14396) (_1!610 lt!14397) lt!14373 lt!14380))))

(assert (=> b!9497 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!14369) (_1!610 lt!14397) (bvsub lt!14373 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!57 lt!14380))))

(declare-fun lt!14399 () Unit!742)

(assert (=> b!9497 (= lt!14399 lt!14375)))

(declare-fun lt!14385 () Unit!742)

(declare-fun lt!14398 () (_ BitVec 64))

(assert (=> b!9497 (= lt!14385 (arrayBitRangesEqImpliesEq!0 (buf!580 (_2!609 lt!14405)) (buf!580 (_2!609 lt!14369)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!14398 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14405))) (currentByte!1619 (_2!609 lt!14405)) (currentBit!1614 (_2!609 lt!14405)))))))

(assert (=> b!9497 (= (bitAt!0 (buf!580 (_2!609 lt!14405)) lt!14398) (bitAt!0 (buf!580 (_2!609 lt!14369)) lt!14398))))

(declare-fun lt!14392 () Unit!742)

(assert (=> b!9497 (= lt!14392 lt!14385)))

(declare-fun b!9498 () Bool)

(declare-fun res!9734 () Bool)

(assert (=> b!9498 (=> (not res!9734) (not e!5865))))

(assert (=> b!9498 (= res!9734 (isPrefixOf!0 (_2!609 lt!12918) (_2!609 lt!14390)))))

(declare-fun d!3050 () Bool)

(assert (=> d!3050 e!5865))

(declare-fun res!9730 () Bool)

(assert (=> d!3050 (=> (not res!9730) (not e!5865))))

(declare-fun lt!14382 () (_ BitVec 64))

(assert (=> d!3050 (= res!9730 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14390))) (currentByte!1619 (_2!609 lt!14390)) (currentBit!1614 (_2!609 lt!14390))) (bvsub lt!14382 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!3050 (or (= (bvand lt!14382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14382 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14378 () (_ BitVec 64))

(assert (=> d!3050 (= lt!14382 (bvadd lt!14378 from!367 nBits!460))))

(assert (=> d!3050 (or (not (= (bvand lt!14378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14378 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3050 (= lt!14378 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918))))))

(assert (=> d!3050 (= lt!14390 e!5863)))

(assert (=> d!3050 (= c!609 (bvslt (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!14376 () Unit!742)

(declare-fun lt!14370 () Unit!742)

(assert (=> d!3050 (= lt!14376 lt!14370)))

(assert (=> d!3050 (isPrefixOf!0 (_2!609 lt!12918) (_2!609 lt!12918))))

(assert (=> d!3050 (= lt!14370 (lemmaIsPrefixRefl!0 (_2!609 lt!12918)))))

(assert (=> d!3050 (= lt!14398 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918))))))

(assert (=> d!3050 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3050 (= (appendBitsMSBFirstLoop!0 (_2!609 lt!12918) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)) lt!14390)))

(declare-fun lt!14403 () tuple2!1158)

(declare-fun b!9499 () Bool)

(assert (=> b!9499 (= e!5865 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!14390) (_1!610 lt!14403) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!609 lt!14390) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!9499 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9499 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14395 () Unit!742)

(declare-fun lt!14402 () Unit!742)

(assert (=> b!9499 (= lt!14395 lt!14402)))

(assert (=> b!9499 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!14390)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918))) lt!14372)))

(assert (=> b!9499 (= lt!14402 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!609 lt!12918) (buf!580 (_2!609 lt!14390)) lt!14372))))

(assert (=> b!9499 e!5864))

(declare-fun res!9731 () Bool)

(assert (=> b!9499 (=> (not res!9731) (not e!5864))))

(assert (=> b!9499 (= res!9731 (and (= (size!244 (buf!580 (_2!609 lt!12918))) (size!244 (buf!580 (_2!609 lt!14390)))) (bvsge lt!14372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9499 (= lt!14372 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!9499 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9499 (= lt!14403 (reader!0 (_2!609 lt!12918) (_2!609 lt!14390)))))

(declare-fun b!9500 () Bool)

(declare-fun res!9733 () Bool)

(assert (=> b!9500 (=> (not res!9733) (not e!5865))))

(assert (=> b!9500 (= res!9733 (= (size!244 (buf!580 (_2!609 lt!12918))) (size!244 (buf!580 (_2!609 lt!14390)))))))

(assert (= (and d!3050 c!609) b!9497))

(assert (= (and d!3050 (not c!609)) b!9496))

(assert (= (or b!9497 b!9496) bm!167))

(assert (= (and d!3050 res!9730) b!9493))

(assert (= (and b!9493 res!9732) b!9500))

(assert (= (and b!9500 res!9733) b!9498))

(assert (= (and b!9498 res!9734) b!9494))

(assert (= (and b!9494 res!9729) b!9499))

(assert (= (and b!9499 res!9731) b!9495))

(declare-fun m!13671 () Bool)

(assert (=> d!3050 m!13671))

(assert (=> d!3050 m!12093))

(assert (=> d!3050 m!13631))

(assert (=> d!3050 m!13621))

(declare-fun m!13673 () Bool)

(assert (=> b!9499 m!13673))

(declare-fun m!13675 () Bool)

(assert (=> b!9499 m!13675))

(declare-fun m!13677 () Bool)

(assert (=> b!9499 m!13677))

(declare-fun m!13679 () Bool)

(assert (=> b!9499 m!13679))

(declare-fun m!13681 () Bool)

(assert (=> b!9499 m!13681))

(declare-fun m!13683 () Bool)

(assert (=> b!9497 m!13683))

(declare-fun m!13685 () Bool)

(assert (=> b!9497 m!13685))

(declare-fun m!13687 () Bool)

(assert (=> b!9497 m!13687))

(assert (=> b!9497 m!13593))

(declare-fun m!13689 () Bool)

(assert (=> b!9497 m!13689))

(declare-fun m!13691 () Bool)

(assert (=> b!9497 m!13691))

(declare-fun m!13693 () Bool)

(assert (=> b!9497 m!13693))

(declare-fun m!13695 () Bool)

(assert (=> b!9497 m!13695))

(declare-fun m!13697 () Bool)

(assert (=> b!9497 m!13697))

(assert (=> b!9497 m!12093))

(declare-fun m!13699 () Bool)

(assert (=> b!9497 m!13699))

(declare-fun m!13701 () Bool)

(assert (=> b!9497 m!13701))

(declare-fun m!13703 () Bool)

(assert (=> b!9497 m!13703))

(declare-fun m!13705 () Bool)

(assert (=> b!9497 m!13705))

(declare-fun m!13707 () Bool)

(assert (=> b!9497 m!13707))

(declare-fun m!13709 () Bool)

(assert (=> b!9497 m!13709))

(declare-fun m!13711 () Bool)

(assert (=> b!9497 m!13711))

(declare-fun m!13713 () Bool)

(assert (=> b!9497 m!13713))

(assert (=> b!9497 m!13701))

(declare-fun m!13715 () Bool)

(assert (=> b!9497 m!13715))

(declare-fun m!13717 () Bool)

(assert (=> b!9497 m!13717))

(declare-fun m!13719 () Bool)

(assert (=> b!9497 m!13719))

(declare-fun m!13721 () Bool)

(assert (=> b!9497 m!13721))

(declare-fun m!13723 () Bool)

(assert (=> b!9497 m!13723))

(assert (=> b!9497 m!13699))

(declare-fun m!13725 () Bool)

(assert (=> b!9497 m!13725))

(assert (=> b!9497 m!13719))

(declare-fun m!13727 () Bool)

(assert (=> b!9497 m!13727))

(declare-fun m!13729 () Bool)

(assert (=> b!9497 m!13729))

(declare-fun m!13731 () Bool)

(assert (=> b!9497 m!13731))

(declare-fun m!13733 () Bool)

(assert (=> b!9497 m!13733))

(declare-fun m!13735 () Bool)

(assert (=> b!9497 m!13735))

(assert (=> b!9497 m!13593))

(declare-fun m!13737 () Bool)

(assert (=> b!9497 m!13737))

(declare-fun m!13739 () Bool)

(assert (=> b!9497 m!13739))

(declare-fun m!13741 () Bool)

(assert (=> b!9497 m!13741))

(declare-fun m!13743 () Bool)

(assert (=> bm!167 m!13743))

(declare-fun m!13745 () Bool)

(assert (=> b!9498 m!13745))

(declare-fun m!13747 () Bool)

(assert (=> b!9493 m!13747))

(declare-fun m!13749 () Bool)

(assert (=> b!9496 m!13749))

(declare-fun m!13751 () Bool)

(assert (=> b!9496 m!13751))

(declare-fun m!13753 () Bool)

(assert (=> b!9495 m!13753))

(assert (=> b!8733 d!3050))

(declare-fun d!3052 () Bool)

(assert (=> d!3052 (= (head!49 (bitStreamReadBitsIntoList!0 (_2!609 lt!12918) (_1!610 lt!12921) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!256 (bitStreamReadBitsIntoList!0 (_2!609 lt!12918) (_1!610 lt!12921) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8733 d!3052))

(declare-fun d!3054 () Bool)

(assert (=> d!3054 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12917)))

(declare-fun lt!14411 () Unit!742)

(assert (=> d!3054 (= lt!14411 (choose!9 thiss!1486 (buf!580 (_2!609 lt!12918)) lt!12917 (BitStream!467 (buf!580 (_2!609 lt!12918)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (=> d!3054 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12918)) lt!12917) lt!14411)))

(declare-fun bs!925 () Bool)

(assert (= bs!925 d!3054))

(assert (=> bs!925 m!12101))

(declare-fun m!13755 () Bool)

(assert (=> bs!925 m!13755))

(assert (=> b!8733 d!3054))

(declare-fun b!9501 () Bool)

(declare-fun res!9736 () Bool)

(declare-fun e!5867 () Bool)

(assert (=> b!9501 (=> (not res!9736) (not e!5867))))

(declare-fun lt!14412 () tuple2!1158)

(assert (=> b!9501 (= res!9736 (isPrefixOf!0 (_1!610 lt!14412) thiss!1486))))

(declare-fun b!9502 () Bool)

(declare-fun res!9735 () Bool)

(assert (=> b!9502 (=> (not res!9735) (not e!5867))))

(assert (=> b!9502 (= res!9735 (isPrefixOf!0 (_2!610 lt!14412) (_2!609 lt!12882)))))

(declare-fun b!9503 () Bool)

(declare-fun e!5866 () Unit!742)

(declare-fun Unit!816 () Unit!742)

(assert (=> b!9503 (= e!5866 Unit!816)))

(declare-fun d!3056 () Bool)

(assert (=> d!3056 e!5867))

(declare-fun res!9737 () Bool)

(assert (=> d!3056 (=> (not res!9737) (not e!5867))))

(assert (=> d!3056 (= res!9737 (isPrefixOf!0 (_1!610 lt!14412) (_2!610 lt!14412)))))

(declare-fun lt!14418 () BitStream!466)

(assert (=> d!3056 (= lt!14412 (tuple2!1159 lt!14418 (_2!609 lt!12882)))))

(declare-fun lt!14421 () Unit!742)

(declare-fun lt!14428 () Unit!742)

(assert (=> d!3056 (= lt!14421 lt!14428)))

(assert (=> d!3056 (isPrefixOf!0 lt!14418 (_2!609 lt!12882))))

(assert (=> d!3056 (= lt!14428 (lemmaIsPrefixTransitive!0 lt!14418 (_2!609 lt!12882) (_2!609 lt!12882)))))

(declare-fun lt!14413 () Unit!742)

(declare-fun lt!14429 () Unit!742)

(assert (=> d!3056 (= lt!14413 lt!14429)))

(assert (=> d!3056 (isPrefixOf!0 lt!14418 (_2!609 lt!12882))))

(assert (=> d!3056 (= lt!14429 (lemmaIsPrefixTransitive!0 lt!14418 thiss!1486 (_2!609 lt!12882)))))

(declare-fun lt!14431 () Unit!742)

(assert (=> d!3056 (= lt!14431 e!5866)))

(declare-fun c!610 () Bool)

(assert (=> d!3056 (= c!610 (not (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!14417 () Unit!742)

(declare-fun lt!14425 () Unit!742)

(assert (=> d!3056 (= lt!14417 lt!14425)))

(assert (=> d!3056 (isPrefixOf!0 (_2!609 lt!12882) (_2!609 lt!12882))))

(assert (=> d!3056 (= lt!14425 (lemmaIsPrefixRefl!0 (_2!609 lt!12882)))))

(declare-fun lt!14427 () Unit!742)

(declare-fun lt!14423 () Unit!742)

(assert (=> d!3056 (= lt!14427 lt!14423)))

(assert (=> d!3056 (= lt!14423 (lemmaIsPrefixRefl!0 (_2!609 lt!12882)))))

(declare-fun lt!14414 () Unit!742)

(declare-fun lt!14415 () Unit!742)

(assert (=> d!3056 (= lt!14414 lt!14415)))

(assert (=> d!3056 (isPrefixOf!0 lt!14418 lt!14418)))

(assert (=> d!3056 (= lt!14415 (lemmaIsPrefixRefl!0 lt!14418))))

(declare-fun lt!14416 () Unit!742)

(declare-fun lt!14424 () Unit!742)

(assert (=> d!3056 (= lt!14416 lt!14424)))

(assert (=> d!3056 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3056 (= lt!14424 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3056 (= lt!14418 (BitStream!467 (buf!580 (_2!609 lt!12882)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> d!3056 (isPrefixOf!0 thiss!1486 (_2!609 lt!12882))))

(assert (=> d!3056 (= (reader!0 thiss!1486 (_2!609 lt!12882)) lt!14412)))

(declare-fun b!9504 () Bool)

(declare-fun lt!14426 () Unit!742)

(assert (=> b!9504 (= e!5866 lt!14426)))

(declare-fun lt!14430 () (_ BitVec 64))

(assert (=> b!9504 (= lt!14430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14420 () (_ BitVec 64))

(assert (=> b!9504 (= lt!14420 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (=> b!9504 (= lt!14426 (arrayBitRangesEqSymmetric!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12882)) lt!14430 lt!14420))))

(assert (=> b!9504 (arrayBitRangesEq!0 (buf!580 (_2!609 lt!12882)) (buf!580 thiss!1486) lt!14430 lt!14420)))

(declare-fun b!9505 () Bool)

(declare-fun lt!14419 () (_ BitVec 64))

(declare-fun lt!14422 () (_ BitVec 64))

(assert (=> b!9505 (= e!5867 (= (_1!610 lt!14412) (withMovedBitIndex!0 (_2!610 lt!14412) (bvsub lt!14419 lt!14422))))))

(assert (=> b!9505 (or (= (bvand lt!14419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14419 lt!14422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9505 (= lt!14422 (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12882))) (currentByte!1619 (_2!609 lt!12882)) (currentBit!1614 (_2!609 lt!12882))))))

(assert (=> b!9505 (= lt!14419 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(assert (= (and d!3056 c!610) b!9504))

(assert (= (and d!3056 (not c!610)) b!9503))

(assert (= (and d!3056 res!9737) b!9501))

(assert (= (and b!9501 res!9736) b!9502))

(assert (= (and b!9502 res!9735) b!9505))

(declare-fun m!13757 () Bool)

(assert (=> b!9501 m!13757))

(declare-fun m!13759 () Bool)

(assert (=> d!3056 m!13759))

(declare-fun m!13761 () Bool)

(assert (=> d!3056 m!13761))

(declare-fun m!13763 () Bool)

(assert (=> d!3056 m!13763))

(assert (=> d!3056 m!12063))

(declare-fun m!13765 () Bool)

(assert (=> d!3056 m!13765))

(assert (=> d!3056 m!12061))

(declare-fun m!13767 () Bool)

(assert (=> d!3056 m!13767))

(declare-fun m!13769 () Bool)

(assert (=> d!3056 m!13769))

(declare-fun m!13771 () Bool)

(assert (=> d!3056 m!13771))

(declare-fun m!13773 () Bool)

(assert (=> d!3056 m!13773))

(assert (=> d!3056 m!12127))

(assert (=> b!9504 m!11803))

(declare-fun m!13775 () Bool)

(assert (=> b!9504 m!13775))

(declare-fun m!13777 () Bool)

(assert (=> b!9504 m!13777))

(declare-fun m!13779 () Bool)

(assert (=> b!9505 m!13779))

(assert (=> b!9505 m!12103))

(assert (=> b!9505 m!11803))

(declare-fun m!13781 () Bool)

(assert (=> b!9502 m!13781))

(assert (=> b!8733 d!3056))

(declare-fun d!3058 () Bool)

(assert (=> d!3058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12919) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) lt!12919))))

(declare-fun bs!926 () Bool)

(assert (= bs!926 d!3058))

(declare-fun m!13783 () Bool)

(assert (=> bs!926 m!13783))

(assert (=> b!8733 d!3058))

(assert (=> b!8733 d!2626))

(declare-fun d!3060 () Bool)

(declare-fun e!5868 () Bool)

(assert (=> d!3060 e!5868))

(declare-fun c!611 () Bool)

(assert (=> d!3060 (= c!611 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14432 () List!141)

(declare-fun e!5869 () tuple2!1174)

(assert (=> d!3060 (= lt!14432 (_1!618 e!5869))))

(declare-fun c!612 () Bool)

(assert (=> d!3060 (= c!612 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3060 (bvsge (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3060 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12910) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!14432)))

(declare-fun b!9507 () Bool)

(declare-fun lt!14433 () tuple2!1176)

(declare-fun lt!14434 () (_ BitVec 64))

(assert (=> b!9507 (= e!5869 (tuple2!1175 (Cons!137 (_1!619 lt!14433) (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_2!619 lt!14433) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) lt!14434))) (_2!619 lt!14433)))))

(assert (=> b!9507 (= lt!14433 (readBit!0 (_1!610 lt!12910)))))

(assert (=> b!9507 (= lt!14434 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9509 () Bool)

(assert (=> b!9509 (= e!5868 (> (length!20 lt!14432) 0))))

(declare-fun b!9506 () Bool)

(assert (=> b!9506 (= e!5869 (tuple2!1175 Nil!138 (_1!610 lt!12910)))))

(declare-fun b!9508 () Bool)

(assert (=> b!9508 (= e!5868 (isEmpty!25 lt!14432))))

(assert (= (and d!3060 c!612) b!9506))

(assert (= (and d!3060 (not c!612)) b!9507))

(assert (= (and d!3060 c!611) b!9508))

(assert (= (and d!3060 (not c!611)) b!9509))

(declare-fun m!13785 () Bool)

(assert (=> b!9507 m!13785))

(assert (=> b!9507 m!13665))

(declare-fun m!13787 () Bool)

(assert (=> b!9509 m!13787))

(declare-fun m!13789 () Bool)

(assert (=> b!9508 m!13789))

(assert (=> b!8733 d!3060))

(declare-fun d!3062 () Bool)

(assert (=> d!3062 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12917) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486))) lt!12917))))

(declare-fun bs!927 () Bool)

(assert (= bs!927 d!3062))

(declare-fun m!13791 () Bool)

(assert (=> bs!927 m!13791))

(assert (=> b!8733 d!3062))

(declare-fun d!3064 () Bool)

(declare-fun e!5870 () Bool)

(assert (=> d!3064 e!5870))

(declare-fun c!613 () Bool)

(assert (=> d!3064 (= c!613 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!14435 () List!141)

(declare-fun e!5871 () tuple2!1174)

(assert (=> d!3064 (= lt!14435 (_1!618 e!5871))))

(declare-fun c!614 () Bool)

(assert (=> d!3064 (= c!614 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3064 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3064 (= (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_1!610 lt!12909) (bvsub (bvadd from!367 nBits!460) from!367)) lt!14435)))

(declare-fun b!9511 () Bool)

(declare-fun lt!14437 () (_ BitVec 64))

(declare-fun lt!14436 () tuple2!1176)

(assert (=> b!9511 (= e!5871 (tuple2!1175 (Cons!137 (_1!619 lt!14436) (bitStreamReadBitsIntoList!0 (_2!609 lt!12882) (_2!619 lt!14436) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!14437))) (_2!619 lt!14436)))))

(assert (=> b!9511 (= lt!14436 (readBit!0 (_1!610 lt!12909)))))

(assert (=> b!9511 (= lt!14437 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9513 () Bool)

(assert (=> b!9513 (= e!5870 (> (length!20 lt!14435) 0))))

(declare-fun b!9510 () Bool)

(assert (=> b!9510 (= e!5871 (tuple2!1175 Nil!138 (_1!610 lt!12909)))))

(declare-fun b!9512 () Bool)

(assert (=> b!9512 (= e!5870 (isEmpty!25 lt!14435))))

(assert (= (and d!3064 c!614) b!9510))

(assert (= (and d!3064 (not c!614)) b!9511))

(assert (= (and d!3064 c!613) b!9512))

(assert (= (and d!3064 (not c!613)) b!9513))

(declare-fun m!13793 () Bool)

(assert (=> b!9511 m!13793))

(declare-fun m!13795 () Bool)

(assert (=> b!9511 m!13795))

(declare-fun m!13797 () Bool)

(assert (=> b!9513 m!13797))

(declare-fun m!13799 () Bool)

(assert (=> b!9512 m!13799))

(assert (=> b!8733 d!3064))

(declare-fun b!9531 () Bool)

(declare-fun e!5883 () Bool)

(declare-fun lt!14464 () tuple2!1190)

(declare-fun lt!14473 () tuple2!1156)

(assert (=> b!9531 (= e!5883 (= (bitIndex!0 (size!244 (buf!580 (_1!631 lt!14464))) (currentByte!1619 (_1!631 lt!14464)) (currentBit!1614 (_1!631 lt!14464))) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14473))) (currentByte!1619 (_2!609 lt!14473)) (currentBit!1614 (_2!609 lt!14473)))))))

(declare-fun b!9532 () Bool)

(declare-fun res!9755 () Bool)

(declare-fun e!5881 () Bool)

(assert (=> b!9532 (=> (not res!9755) (not e!5881))))

(declare-fun lt!14471 () (_ BitVec 64))

(declare-fun lt!14472 () (_ BitVec 64))

(assert (=> b!9532 (= res!9755 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14473))) (currentByte!1619 (_2!609 lt!14473)) (currentBit!1614 (_2!609 lt!14473))) (bvadd lt!14471 lt!14472)))))

(assert (=> b!9532 (or (not (= (bvand lt!14471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14472 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14471 lt!14472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9532 (= lt!14472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!9532 (= lt!14471 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)))))

(declare-fun b!9533 () Bool)

(declare-fun e!5882 () Bool)

(declare-fun e!5880 () Bool)

(assert (=> b!9533 (= e!5882 e!5880)))

(declare-fun res!9756 () Bool)

(assert (=> b!9533 (=> (not res!9756) (not e!5880))))

(declare-fun lt!14470 () tuple2!1156)

(declare-fun lt!14469 () Bool)

(declare-fun lt!14463 () tuple2!1190)

(assert (=> b!9533 (= res!9756 (and (= (_2!631 lt!14463) lt!14469) (= (_1!631 lt!14463) (_2!609 lt!14470))))))

(declare-fun readerFrom!0 (BitStream!466 (_ BitVec 32) (_ BitVec 32)) BitStream!466)

(assert (=> b!9533 (= lt!14463 (readBitPure!0 (readerFrom!0 (_2!609 lt!14470) (currentBit!1614 thiss!1486) (currentByte!1619 thiss!1486))))))

(declare-fun b!9534 () Bool)

(assert (=> b!9534 (= e!5881 e!5883)))

(declare-fun res!9759 () Bool)

(assert (=> b!9534 (=> (not res!9759) (not e!5883))))

(declare-fun lt!14468 () (_ BitVec 8))

(assert (=> b!9534 (= res!9759 (and (= (_2!631 lt!14464) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!14468)) #b00000000000000000000000000000000))) (= (_1!631 lt!14464) (_2!609 lt!14473))))))

(declare-fun lt!14465 () tuple2!1160)

(declare-fun lt!14467 () BitStream!466)

(assert (=> b!9534 (= lt!14465 (readBits!0 lt!14467 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!9534 (= lt!14464 (readBitPure!0 lt!14467))))

(assert (=> b!9534 (= lt!14467 (readerFrom!0 (_2!609 lt!14473) (currentBit!1614 thiss!1486) (currentByte!1619 thiss!1486)))))

(declare-fun b!9535 () Bool)

(declare-fun res!9757 () Bool)

(assert (=> b!9535 (=> (not res!9757) (not e!5882))))

(assert (=> b!9535 (= res!9757 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14470))) (currentByte!1619 (_2!609 lt!14470)) (currentBit!1614 (_2!609 lt!14470))) (bvadd (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!9536 () Bool)

(declare-fun res!9758 () Bool)

(assert (=> b!9536 (=> (not res!9758) (not e!5882))))

(assert (=> b!9536 (= res!9758 (isPrefixOf!0 thiss!1486 (_2!609 lt!14470)))))

(declare-fun b!9537 () Bool)

(assert (=> b!9537 (= e!5880 (= (bitIndex!0 (size!244 (buf!580 (_1!631 lt!14463))) (currentByte!1619 (_1!631 lt!14463)) (currentBit!1614 (_1!631 lt!14463))) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!14470))) (currentByte!1619 (_2!609 lt!14470)) (currentBit!1614 (_2!609 lt!14470)))))))

(declare-fun d!3066 () Bool)

(assert (=> d!3066 e!5881))

(declare-fun res!9761 () Bool)

(assert (=> d!3066 (=> (not res!9761) (not e!5881))))

(assert (=> d!3066 (= res!9761 (= (size!244 (buf!580 (_2!609 lt!14473))) (size!244 (buf!580 thiss!1486))))))

(declare-fun lt!14462 () array!570)

(assert (=> d!3066 (= lt!14468 (select (arr!649 lt!14462) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!3066 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!244 lt!14462)))))

(assert (=> d!3066 (= lt!14462 (array!571 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!14466 () tuple2!1156)

(assert (=> d!3066 (= lt!14473 (tuple2!1157 (_1!609 lt!14466) (_2!609 lt!14466)))))

(assert (=> d!3066 (= lt!14466 lt!14470)))

(assert (=> d!3066 e!5882))

(declare-fun res!9760 () Bool)

(assert (=> d!3066 (=> (not res!9760) (not e!5882))))

(assert (=> d!3066 (= res!9760 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!14470)))))))

(declare-fun appendBit!0 (BitStream!466 Bool) tuple2!1156)

(assert (=> d!3066 (= lt!14470 (appendBit!0 thiss!1486 lt!14469))))

(assert (=> d!3066 (= lt!14469 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!3066 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!3066 (= (appendBitFromByte!0 thiss!1486 (select (arr!649 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!14473)))

(declare-fun b!9538 () Bool)

(declare-fun res!9754 () Bool)

(assert (=> b!9538 (=> (not res!9754) (not e!5881))))

(assert (=> b!9538 (= res!9754 (isPrefixOf!0 thiss!1486 (_2!609 lt!14473)))))

(assert (= (and d!3066 res!9760) b!9535))

(assert (= (and b!9535 res!9757) b!9536))

(assert (= (and b!9536 res!9758) b!9533))

(assert (= (and b!9533 res!9756) b!9537))

(assert (= (and d!3066 res!9761) b!9532))

(assert (= (and b!9532 res!9755) b!9538))

(assert (= (and b!9538 res!9754) b!9534))

(assert (= (and b!9534 res!9759) b!9531))

(declare-fun m!13801 () Bool)

(assert (=> b!9536 m!13801))

(declare-fun m!13803 () Bool)

(assert (=> b!9533 m!13803))

(assert (=> b!9533 m!13803))

(declare-fun m!13805 () Bool)

(assert (=> b!9533 m!13805))

(declare-fun m!13807 () Bool)

(assert (=> b!9538 m!13807))

(declare-fun m!13809 () Bool)

(assert (=> b!9534 m!13809))

(declare-fun m!13811 () Bool)

(assert (=> b!9534 m!13811))

(declare-fun m!13813 () Bool)

(assert (=> b!9534 m!13813))

(declare-fun m!13815 () Bool)

(assert (=> b!9532 m!13815))

(assert (=> b!9532 m!11803))

(declare-fun m!13817 () Bool)

(assert (=> d!3066 m!13817))

(declare-fun m!13819 () Bool)

(assert (=> d!3066 m!13819))

(assert (=> d!3066 m!13331))

(declare-fun m!13821 () Bool)

(assert (=> b!9531 m!13821))

(assert (=> b!9531 m!13815))

(declare-fun m!13823 () Bool)

(assert (=> b!9537 m!13823))

(declare-fun m!13825 () Bool)

(assert (=> b!9537 m!13825))

(assert (=> b!9535 m!13825))

(assert (=> b!9535 m!11803))

(assert (=> b!8733 d!3066))

(declare-fun d!3068 () Bool)

(declare-fun e!5884 () Bool)

(assert (=> d!3068 e!5884))

(declare-fun res!9762 () Bool)

(assert (=> d!3068 (=> (not res!9762) (not e!5884))))

(declare-fun lt!14477 () (_ BitVec 64))

(declare-fun lt!14478 () (_ BitVec 64))

(declare-fun lt!14479 () (_ BitVec 64))

(assert (=> d!3068 (= res!9762 (= lt!14477 (bvsub lt!14478 lt!14479)))))

(assert (=> d!3068 (or (= (bvand lt!14478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14478 lt!14479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3068 (= lt!14479 (remainingBits!0 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))) ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918)))))))

(declare-fun lt!14474 () (_ BitVec 64))

(declare-fun lt!14476 () (_ BitVec 64))

(assert (=> d!3068 (= lt!14478 (bvmul lt!14474 lt!14476))))

(assert (=> d!3068 (or (= lt!14474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14476 (bvsdiv (bvmul lt!14474 lt!14476) lt!14474)))))

(assert (=> d!3068 (= lt!14476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3068 (= lt!14474 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))))))

(assert (=> d!3068 (= lt!14477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1619 (_2!609 lt!12918))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1614 (_2!609 lt!12918)))))))

(assert (=> d!3068 (invariant!0 (currentBit!1614 (_2!609 lt!12918)) (currentByte!1619 (_2!609 lt!12918)) (size!244 (buf!580 (_2!609 lt!12918))))))

(assert (=> d!3068 (= (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12918))) (currentByte!1619 (_2!609 lt!12918)) (currentBit!1614 (_2!609 lt!12918))) lt!14477)))

(declare-fun b!9539 () Bool)

(declare-fun res!9763 () Bool)

(assert (=> b!9539 (=> (not res!9763) (not e!5884))))

(assert (=> b!9539 (= res!9763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14477))))

(declare-fun b!9540 () Bool)

(declare-fun lt!14475 () (_ BitVec 64))

(assert (=> b!9540 (= e!5884 (bvsle lt!14477 (bvmul lt!14475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9540 (or (= lt!14475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14475)))))

(assert (=> b!9540 (= lt!14475 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12918)))))))

(assert (= (and d!3068 res!9762) b!9539))

(assert (= (and b!9539 res!9763) b!9540))

(assert (=> d!3068 m!13657))

(declare-fun m!13827 () Bool)

(assert (=> d!3068 m!13827))

(assert (=> b!8733 d!3068))

(declare-fun d!3070 () Bool)

(assert (=> d!3070 (validate_offset_bits!1 ((_ sign_extend 32) (size!244 (buf!580 (_2!609 lt!12882)))) ((_ sign_extend 32) (currentByte!1619 thiss!1486)) ((_ sign_extend 32) (currentBit!1614 thiss!1486)) lt!12919)))

(declare-fun lt!14480 () Unit!742)

(assert (=> d!3070 (= lt!14480 (choose!9 thiss!1486 (buf!580 (_2!609 lt!12882)) lt!12919 (BitStream!467 (buf!580 (_2!609 lt!12882)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (=> d!3070 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!580 (_2!609 lt!12882)) lt!12919) lt!14480)))

(declare-fun bs!928 () Bool)

(assert (= bs!928 d!3070))

(assert (=> bs!928 m!12117))

(declare-fun m!13829 () Bool)

(assert (=> bs!928 m!13829))

(assert (=> b!8733 d!3070))

(declare-fun d!3072 () Bool)

(declare-fun res!9766 () Bool)

(declare-fun e!5886 () Bool)

(assert (=> d!3072 (=> (not res!9766) (not e!5886))))

(assert (=> d!3072 (= res!9766 (= (size!244 (buf!580 (_2!610 lt!13216))) (size!244 (buf!580 (_2!609 lt!12507)))))))

(assert (=> d!3072 (= (isPrefixOf!0 (_2!610 lt!13216) (_2!609 lt!12507)) e!5886)))

(declare-fun b!9541 () Bool)

(declare-fun res!9764 () Bool)

(assert (=> b!9541 (=> (not res!9764) (not e!5886))))

(assert (=> b!9541 (= res!9764 (bvsle (bitIndex!0 (size!244 (buf!580 (_2!610 lt!13216))) (currentByte!1619 (_2!610 lt!13216)) (currentBit!1614 (_2!610 lt!13216))) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12507))) (currentByte!1619 (_2!609 lt!12507)) (currentBit!1614 (_2!609 lt!12507)))))))

(declare-fun b!9542 () Bool)

(declare-fun e!5885 () Bool)

(assert (=> b!9542 (= e!5886 e!5885)))

(declare-fun res!9765 () Bool)

(assert (=> b!9542 (=> res!9765 e!5885)))

(assert (=> b!9542 (= res!9765 (= (size!244 (buf!580 (_2!610 lt!13216))) #b00000000000000000000000000000000))))

(declare-fun b!9543 () Bool)

(assert (=> b!9543 (= e!5885 (arrayBitRangesEq!0 (buf!580 (_2!610 lt!13216)) (buf!580 (_2!609 lt!12507)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 (_2!610 lt!13216))) (currentByte!1619 (_2!610 lt!13216)) (currentBit!1614 (_2!610 lt!13216)))))))

(assert (= (and d!3072 res!9766) b!9541))

(assert (= (and b!9541 res!9764) b!9542))

(assert (= (and b!9542 (not res!9765)) b!9543))

(assert (=> b!9541 m!13471))

(assert (=> b!9541 m!11801))

(assert (=> b!9543 m!13471))

(assert (=> b!9543 m!13471))

(declare-fun m!13831 () Bool)

(assert (=> b!9543 m!13831))

(assert (=> b!8867 d!3072))

(declare-fun d!3074 () Bool)

(declare-fun res!9769 () Bool)

(declare-fun e!5888 () Bool)

(assert (=> d!3074 (=> (not res!9769) (not e!5888))))

(assert (=> d!3074 (= res!9769 (= (size!244 (buf!580 thiss!1486)) (size!244 (buf!580 (_2!609 lt!12903)))))))

(assert (=> d!3074 (= (isPrefixOf!0 thiss!1486 (_2!609 lt!12903)) e!5888)))

(declare-fun b!9544 () Bool)

(declare-fun res!9767 () Bool)

(assert (=> b!9544 (=> (not res!9767) (not e!5888))))

(assert (=> b!9544 (= res!9767 (bvsle (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486)) (bitIndex!0 (size!244 (buf!580 (_2!609 lt!12903))) (currentByte!1619 (_2!609 lt!12903)) (currentBit!1614 (_2!609 lt!12903)))))))

(declare-fun b!9545 () Bool)

(declare-fun e!5887 () Bool)

(assert (=> b!9545 (= e!5888 e!5887)))

(declare-fun res!9768 () Bool)

(assert (=> b!9545 (=> res!9768 e!5887)))

(assert (=> b!9545 (= res!9768 (= (size!244 (buf!580 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9546 () Bool)

(assert (=> b!9546 (= e!5887 (arrayBitRangesEq!0 (buf!580 thiss!1486) (buf!580 (_2!609 lt!12903)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!244 (buf!580 thiss!1486)) (currentByte!1619 thiss!1486) (currentBit!1614 thiss!1486))))))

(assert (= (and d!3074 res!9769) b!9544))

(assert (= (and b!9544 res!9767) b!9545))

(assert (= (and b!9545 (not res!9768)) b!9546))

(assert (=> b!9544 m!11803))

(assert (=> b!9544 m!12059))

(assert (=> b!9546 m!11803))

(assert (=> b!9546 m!11803))

(declare-fun m!13833 () Bool)

(assert (=> b!9546 m!13833))

(assert (=> b!8734 d!3074))

(push 1)

(assert (not bm!165))

(assert (not b!9535))

(assert (not b!9391))

(assert (not d!3050))

(assert (not b!9444))

(assert (not b!9423))

(assert (not b!9349))

(assert (not d!3008))

(assert (not b!9380))

(assert (not d!2948))

(assert (not d!2962))

(assert (not b!9395))

(assert (not b!9484))

(assert (not b!9534))

(assert (not d!3010))

(assert (not d!2990))

(assert (not b!9385))

(assert (not b!9475))

(assert (not b!9455))

(assert (not d!3004))

(assert (not d!2984))

(assert (not b!9430))

(assert (not d!3062))

(assert (not d!3026))

(assert (not b!9400))

(assert (not b!9472))

(assert (not d!3036))

(assert (not b!9476))

(assert (not b!9493))

(assert (not b!9448))

(assert (not b!9532))

(assert (not b!9443))

(assert (not b!9426))

(assert (not b!9497))

(assert (not b!9437))

(assert (not b!9501))

(assert (not b!9436))

(assert (not b!9450))

(assert (not d!3070))

(assert (not b!9442))

(assert (not b!9467))

(assert (not b!9355))

(assert (not d!2940))

(assert (not b!9429))

(assert (not b!9499))

(assert (not d!3014))

(assert (not b!9544))

(assert (not b!9451))

(assert (not b!9447))

(assert (not d!3020))

(assert (not d!2930))

(assert (not d!2966))

(assert (not b!9536))

(assert (not b!9397))

(assert (not b!9428))

(assert (not b!9533))

(assert (not b!9483))

(assert (not d!3040))

(assert (not bm!161))

(assert (not bm!162))

(assert (not b!9505))

(assert (not b!9358))

(assert (not b!9403))

(assert (not b!9359))

(assert (not b!9382))

(assert (not b!9480))

(assert (not b!9508))

(assert (not b!9511))

(assert (not b!9531))

(assert (not b!9537))

(assert (not b!9504))

(assert (not b!9477))

(assert (not b!9394))

(assert (not b!9488))

(assert (not b!9513))

(assert (not d!2964))

(assert (not d!2952))

(assert (not d!3054))

(assert (not b!9541))

(assert (not b!9512))

(assert (not d!3024))

(assert (not b!9457))

(assert (not b!9392))

(assert (not d!2944))

(assert (not b!9502))

(assert (not b!9495))

(assert (not b!9543))

(assert (not d!3002))

(assert (not d!3056))

(assert (not d!3042))

(assert (not d!2942))

(assert (not b!9421))

(assert (not d!3058))

(assert (not b!9348))

(assert (not d!2986))

(assert (not b!9435))

(assert (not b!9389))

(assert (not b!9344))

(assert (not b!9386))

(assert (not b!9401))

(assert (not b!9491))

(assert (not b!9379))

(assert (not b!9422))

(assert (not b!9464))

(assert (not b!9440))

(assert (not b!9350))

(assert (not b!9470))

(assert (not b!9498))

(assert (not b!9509))

(assert (not d!2956))

(assert (not b!9354))

(assert (not b!9345))

(assert (not b!9482))

(assert (not d!3030))

(assert (not d!3028))

(assert (not bm!167))

(assert (not b!9507))

(assert (not d!3068))

(assert (not d!2994))

(assert (not b!9356))

(assert (not d!3000))

(assert (not d!3066))

(assert (not b!9496))

(assert (not bm!166))

(assert (not b!9479))

(assert (not b!9469))

(assert (not b!9446))

(assert (not b!9546))

(assert (not b!9352))

(assert (not b!9456))

(assert (not d!2968))

(assert (not b!9398))

(assert (not b!9492))

(assert (not b!9490))

(assert (not b!9538))

(assert (not b!9383))

(check-sat)

(pop 1)

(push 1)

(check-sat)


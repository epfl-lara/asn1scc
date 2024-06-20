; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11862 () Bool)

(assert start!11862)

(declare-fun b!59706 () Bool)

(declare-fun e!39757 () Bool)

(declare-fun e!39758 () Bool)

(assert (=> b!59706 (= e!39757 e!39758)))

(declare-fun res!49713 () Bool)

(assert (=> b!59706 (=> res!49713 e!39758)))

(declare-datatypes ((array!2719 0))(
  ( (array!2720 (arr!1799 (Array (_ BitVec 32) (_ BitVec 8))) (size!1235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2158 0))(
  ( (BitStream!2159 (buf!1616 array!2719) (currentByte!3234 (_ BitVec 32)) (currentBit!3229 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4093 0))(
  ( (Unit!4094) )
))
(declare-datatypes ((tuple2!5438 0))(
  ( (tuple2!5439 (_1!2830 Unit!4093) (_2!2830 BitStream!2158)) )
))
(declare-fun lt!93523 () tuple2!5438)

(declare-fun lt!93519 () tuple2!5438)

(declare-fun isPrefixOf!0 (BitStream!2158 BitStream!2158) Bool)

(assert (=> b!59706 (= res!49713 (not (isPrefixOf!0 (_2!2830 lt!93523) (_2!2830 lt!93519))))))

(declare-fun thiss!1379 () BitStream!2158)

(assert (=> b!59706 (isPrefixOf!0 thiss!1379 (_2!2830 lt!93519))))

(declare-fun lt!93520 () Unit!4093)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2158 BitStream!2158 BitStream!2158) Unit!4093)

(assert (=> b!59706 (= lt!93520 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2830 lt!93523) (_2!2830 lt!93519)))))

(declare-fun srcBuffer!2 () array!2719)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2158 array!2719 (_ BitVec 64) (_ BitVec 64)) tuple2!5438)

(assert (=> b!59706 (= lt!93519 (appendBitsMSBFirstLoop!0 (_2!2830 lt!93523) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39756 () Bool)

(assert (=> b!59706 e!39756))

(declare-fun res!49720 () Bool)

(assert (=> b!59706 (=> (not res!49720) (not e!39756))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59706 (= res!49720 (validate_offset_bits!1 ((_ sign_extend 32) (size!1235 (buf!1616 (_2!2830 lt!93523)))) ((_ sign_extend 32) (currentByte!3234 thiss!1379)) ((_ sign_extend 32) (currentBit!3229 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93514 () Unit!4093)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2158 array!2719 (_ BitVec 64)) Unit!4093)

(assert (=> b!59706 (= lt!93514 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1616 (_2!2830 lt!93523)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5440 0))(
  ( (tuple2!5441 (_1!2831 BitStream!2158) (_2!2831 BitStream!2158)) )
))
(declare-fun lt!93518 () tuple2!5440)

(declare-fun reader!0 (BitStream!2158 BitStream!2158) tuple2!5440)

(assert (=> b!59706 (= lt!93518 (reader!0 thiss!1379 (_2!2830 lt!93523)))))

(declare-fun b!59707 () Bool)

(declare-fun res!49725 () Bool)

(declare-fun e!39760 () Bool)

(assert (=> b!59707 (=> res!49725 e!39760)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59707 (= res!49725 (not (invariant!0 (currentBit!3229 (_2!2830 lt!93523)) (currentByte!3234 (_2!2830 lt!93523)) (size!1235 (buf!1616 (_2!2830 lt!93523))))))))

(declare-fun b!59708 () Bool)

(declare-datatypes ((List!654 0))(
  ( (Nil!651) (Cons!650 (h!769 Bool) (t!1404 List!654)) )
))
(declare-fun head!473 (List!654) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2158 array!2719 (_ BitVec 64) (_ BitVec 64)) List!654)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2158 BitStream!2158 (_ BitVec 64)) List!654)

(assert (=> b!59708 (= e!39756 (= (head!473 (byteArrayBitContentToList!0 (_2!2830 lt!93523) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!473 (bitStreamReadBitsIntoList!0 (_2!2830 lt!93523) (_1!2831 lt!93518) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!49724 () Bool)

(declare-fun e!39762 () Bool)

(assert (=> start!11862 (=> (not res!49724) (not e!39762))))

(assert (=> start!11862 (= res!49724 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1235 srcBuffer!2))))))))

(assert (=> start!11862 e!39762))

(assert (=> start!11862 true))

(declare-fun array_inv!1138 (array!2719) Bool)

(assert (=> start!11862 (array_inv!1138 srcBuffer!2)))

(declare-fun e!39761 () Bool)

(declare-fun inv!12 (BitStream!2158) Bool)

(assert (=> start!11862 (and (inv!12 thiss!1379) e!39761)))

(declare-fun b!59709 () Bool)

(assert (=> b!59709 (= e!39761 (array_inv!1138 (buf!1616 thiss!1379)))))

(declare-fun b!59710 () Bool)

(declare-fun e!39763 () Bool)

(assert (=> b!59710 (= e!39763 e!39757)))

(declare-fun res!49717 () Bool)

(assert (=> b!59710 (=> res!49717 e!39757)))

(assert (=> b!59710 (= res!49717 (not (isPrefixOf!0 thiss!1379 (_2!2830 lt!93523))))))

(declare-fun lt!93511 () (_ BitVec 64))

(assert (=> b!59710 (validate_offset_bits!1 ((_ sign_extend 32) (size!1235 (buf!1616 (_2!2830 lt!93523)))) ((_ sign_extend 32) (currentByte!3234 (_2!2830 lt!93523))) ((_ sign_extend 32) (currentBit!3229 (_2!2830 lt!93523))) lt!93511)))

(assert (=> b!59710 (= lt!93511 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93512 () Unit!4093)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2158 BitStream!2158 (_ BitVec 64) (_ BitVec 64)) Unit!4093)

(assert (=> b!59710 (= lt!93512 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2830 lt!93523) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2158 (_ BitVec 8) (_ BitVec 32)) tuple2!5438)

(assert (=> b!59710 (= lt!93523 (appendBitFromByte!0 thiss!1379 (select (arr!1799 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59711 () Bool)

(declare-fun e!39755 () Bool)

(assert (=> b!59711 (= e!39758 e!39755)))

(declare-fun res!49721 () Bool)

(assert (=> b!59711 (=> res!49721 e!39755)))

(declare-fun lt!93513 () (_ BitVec 64))

(declare-fun lt!93515 () (_ BitVec 64))

(assert (=> b!59711 (= res!49721 (not (= lt!93513 (bvsub (bvadd lt!93515 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59711 (= lt!93513 (bitIndex!0 (size!1235 (buf!1616 (_2!2830 lt!93519))) (currentByte!3234 (_2!2830 lt!93519)) (currentBit!3229 (_2!2830 lt!93519))))))

(declare-fun b!59712 () Bool)

(declare-fun res!49714 () Bool)

(assert (=> b!59712 (=> res!49714 e!39755)))

(assert (=> b!59712 (= res!49714 (not (= (size!1235 (buf!1616 thiss!1379)) (size!1235 (buf!1616 (_2!2830 lt!93519))))))))

(declare-fun b!59713 () Bool)

(declare-fun e!39759 () Bool)

(assert (=> b!59713 (= e!39759 (= lt!93513 (bvsub (bvsub (bvadd (bitIndex!0 (size!1235 (buf!1616 (_2!2830 lt!93523))) (currentByte!3234 (_2!2830 lt!93523)) (currentBit!3229 (_2!2830 lt!93523))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59714 () Bool)

(assert (=> b!59714 (= e!39755 e!39760)))

(declare-fun res!49716 () Bool)

(assert (=> b!59714 (=> res!49716 e!39760)))

(assert (=> b!59714 (= res!49716 (not (= (size!1235 (buf!1616 (_2!2830 lt!93523))) (size!1235 (buf!1616 (_2!2830 lt!93519))))))))

(assert (=> b!59714 e!39759))

(declare-fun res!49719 () Bool)

(assert (=> b!59714 (=> (not res!49719) (not e!39759))))

(assert (=> b!59714 (= res!49719 (= (size!1235 (buf!1616 (_2!2830 lt!93519))) (size!1235 (buf!1616 thiss!1379))))))

(declare-fun b!59715 () Bool)

(assert (=> b!59715 (= e!39760 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!59715 (validate_offset_bits!1 ((_ sign_extend 32) (size!1235 (buf!1616 (_2!2830 lt!93519)))) ((_ sign_extend 32) (currentByte!3234 (_2!2830 lt!93523))) ((_ sign_extend 32) (currentBit!3229 (_2!2830 lt!93523))) lt!93511)))

(declare-fun lt!93522 () Unit!4093)

(assert (=> b!59715 (= lt!93522 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2830 lt!93523) (buf!1616 (_2!2830 lt!93519)) lt!93511))))

(declare-fun lt!93517 () tuple2!5440)

(assert (=> b!59715 (= lt!93517 (reader!0 (_2!2830 lt!93523) (_2!2830 lt!93519)))))

(assert (=> b!59715 (validate_offset_bits!1 ((_ sign_extend 32) (size!1235 (buf!1616 (_2!2830 lt!93519)))) ((_ sign_extend 32) (currentByte!3234 thiss!1379)) ((_ sign_extend 32) (currentBit!3229 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93516 () Unit!4093)

(assert (=> b!59715 (= lt!93516 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1616 (_2!2830 lt!93519)) (bvsub to!314 i!635)))))

(declare-fun lt!93510 () tuple2!5440)

(assert (=> b!59715 (= lt!93510 (reader!0 thiss!1379 (_2!2830 lt!93519)))))

(declare-fun b!59716 () Bool)

(declare-fun res!49723 () Bool)

(assert (=> b!59716 (=> res!49723 e!39760)))

(assert (=> b!59716 (= res!49723 (not (invariant!0 (currentBit!3229 (_2!2830 lt!93523)) (currentByte!3234 (_2!2830 lt!93523)) (size!1235 (buf!1616 (_2!2830 lt!93519))))))))

(declare-fun b!59717 () Bool)

(declare-fun res!49715 () Bool)

(assert (=> b!59717 (=> (not res!49715) (not e!39762))))

(assert (=> b!59717 (= res!49715 (validate_offset_bits!1 ((_ sign_extend 32) (size!1235 (buf!1616 thiss!1379))) ((_ sign_extend 32) (currentByte!3234 thiss!1379)) ((_ sign_extend 32) (currentBit!3229 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59718 () Bool)

(declare-fun res!49718 () Bool)

(assert (=> b!59718 (=> res!49718 e!39755)))

(assert (=> b!59718 (= res!49718 (not (invariant!0 (currentBit!3229 (_2!2830 lt!93519)) (currentByte!3234 (_2!2830 lt!93519)) (size!1235 (buf!1616 (_2!2830 lt!93519))))))))

(declare-fun b!59719 () Bool)

(assert (=> b!59719 (= e!39762 (not e!39763))))

(declare-fun res!49722 () Bool)

(assert (=> b!59719 (=> res!49722 e!39763)))

(assert (=> b!59719 (= res!49722 (bvsge i!635 to!314))))

(assert (=> b!59719 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93521 () Unit!4093)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2158) Unit!4093)

(assert (=> b!59719 (= lt!93521 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59719 (= lt!93515 (bitIndex!0 (size!1235 (buf!1616 thiss!1379)) (currentByte!3234 thiss!1379) (currentBit!3229 thiss!1379)))))

(assert (= (and start!11862 res!49724) b!59717))

(assert (= (and b!59717 res!49715) b!59719))

(assert (= (and b!59719 (not res!49722)) b!59710))

(assert (= (and b!59710 (not res!49717)) b!59706))

(assert (= (and b!59706 res!49720) b!59708))

(assert (= (and b!59706 (not res!49713)) b!59711))

(assert (= (and b!59711 (not res!49721)) b!59718))

(assert (= (and b!59718 (not res!49718)) b!59712))

(assert (= (and b!59712 (not res!49714)) b!59714))

(assert (= (and b!59714 res!49719) b!59713))

(assert (= (and b!59714 (not res!49716)) b!59707))

(assert (= (and b!59707 (not res!49725)) b!59716))

(assert (= (and b!59716 (not res!49723)) b!59715))

(assert (= start!11862 b!59709))

(declare-fun m!94033 () Bool)

(assert (=> b!59708 m!94033))

(assert (=> b!59708 m!94033))

(declare-fun m!94035 () Bool)

(assert (=> b!59708 m!94035))

(declare-fun m!94037 () Bool)

(assert (=> b!59708 m!94037))

(assert (=> b!59708 m!94037))

(declare-fun m!94039 () Bool)

(assert (=> b!59708 m!94039))

(declare-fun m!94041 () Bool)

(assert (=> b!59706 m!94041))

(declare-fun m!94043 () Bool)

(assert (=> b!59706 m!94043))

(declare-fun m!94045 () Bool)

(assert (=> b!59706 m!94045))

(declare-fun m!94047 () Bool)

(assert (=> b!59706 m!94047))

(declare-fun m!94049 () Bool)

(assert (=> b!59706 m!94049))

(declare-fun m!94051 () Bool)

(assert (=> b!59706 m!94051))

(declare-fun m!94053 () Bool)

(assert (=> b!59706 m!94053))

(declare-fun m!94055 () Bool)

(assert (=> b!59719 m!94055))

(declare-fun m!94057 () Bool)

(assert (=> b!59719 m!94057))

(declare-fun m!94059 () Bool)

(assert (=> b!59719 m!94059))

(declare-fun m!94061 () Bool)

(assert (=> b!59716 m!94061))

(declare-fun m!94063 () Bool)

(assert (=> b!59718 m!94063))

(declare-fun m!94065 () Bool)

(assert (=> b!59709 m!94065))

(declare-fun m!94067 () Bool)

(assert (=> b!59713 m!94067))

(declare-fun m!94069 () Bool)

(assert (=> b!59715 m!94069))

(declare-fun m!94071 () Bool)

(assert (=> b!59715 m!94071))

(declare-fun m!94073 () Bool)

(assert (=> b!59715 m!94073))

(declare-fun m!94075 () Bool)

(assert (=> b!59715 m!94075))

(declare-fun m!94077 () Bool)

(assert (=> b!59715 m!94077))

(declare-fun m!94079 () Bool)

(assert (=> b!59715 m!94079))

(declare-fun m!94081 () Bool)

(assert (=> b!59707 m!94081))

(declare-fun m!94083 () Bool)

(assert (=> b!59710 m!94083))

(declare-fun m!94085 () Bool)

(assert (=> b!59710 m!94085))

(declare-fun m!94087 () Bool)

(assert (=> b!59710 m!94087))

(declare-fun m!94089 () Bool)

(assert (=> b!59710 m!94089))

(declare-fun m!94091 () Bool)

(assert (=> b!59710 m!94091))

(assert (=> b!59710 m!94087))

(declare-fun m!94093 () Bool)

(assert (=> start!11862 m!94093))

(declare-fun m!94095 () Bool)

(assert (=> start!11862 m!94095))

(declare-fun m!94097 () Bool)

(assert (=> b!59711 m!94097))

(declare-fun m!94099 () Bool)

(assert (=> b!59717 m!94099))

(push 1)

(assert (not b!59710))

(assert (not b!59716))

(assert (not b!59715))

(assert (not start!11862))

(assert (not b!59709))

(assert (not b!59713))

(assert (not b!59717))

(assert (not b!59719))

(assert (not b!59706))

(assert (not b!59708))

(assert (not b!59718))

(assert (not b!59707))

(assert (not b!59711))

(check-sat)

(pop 1)

(push 1)

(check-sat)


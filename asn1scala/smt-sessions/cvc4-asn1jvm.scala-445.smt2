; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11866 () Bool)

(assert start!11866)

(declare-fun b!59790 () Bool)

(declare-fun e!39830 () Bool)

(declare-fun e!39828 () Bool)

(assert (=> b!59790 (= e!39830 e!39828)))

(declare-fun res!49803 () Bool)

(assert (=> b!59790 (=> res!49803 e!39828)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!93605 () (_ BitVec 64))

(declare-fun lt!93596 () (_ BitVec 64))

(assert (=> b!59790 (= res!49803 (not (= lt!93596 (bvsub (bvadd lt!93605 to!314) i!635))))))

(declare-datatypes ((array!2723 0))(
  ( (array!2724 (arr!1801 (Array (_ BitVec 32) (_ BitVec 8))) (size!1237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2162 0))(
  ( (BitStream!2163 (buf!1618 array!2723) (currentByte!3236 (_ BitVec 32)) (currentBit!3231 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4097 0))(
  ( (Unit!4098) )
))
(declare-datatypes ((tuple2!5446 0))(
  ( (tuple2!5447 (_1!2834 Unit!4097) (_2!2834 BitStream!2162)) )
))
(declare-fun lt!93607 () tuple2!5446)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59790 (= lt!93596 (bitIndex!0 (size!1237 (buf!1618 (_2!2834 lt!93607))) (currentByte!3236 (_2!2834 lt!93607)) (currentBit!3231 (_2!2834 lt!93607))))))

(declare-fun b!59791 () Bool)

(declare-fun res!49799 () Bool)

(declare-fun e!39825 () Bool)

(assert (=> b!59791 (=> res!49799 e!39825)))

(declare-fun lt!93603 () tuple2!5446)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59791 (= res!49799 (not (invariant!0 (currentBit!3231 (_2!2834 lt!93603)) (currentByte!3236 (_2!2834 lt!93603)) (size!1237 (buf!1618 (_2!2834 lt!93603))))))))

(declare-fun e!39821 () Bool)

(declare-fun b!59792 () Bool)

(assert (=> b!59792 (= e!39821 (= lt!93596 (bvsub (bvsub (bvadd (bitIndex!0 (size!1237 (buf!1618 (_2!2834 lt!93603))) (currentByte!3236 (_2!2834 lt!93603)) (currentBit!3231 (_2!2834 lt!93603))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59793 () Bool)

(declare-fun e!39829 () Bool)

(declare-fun thiss!1379 () BitStream!2162)

(declare-fun array_inv!1140 (array!2723) Bool)

(assert (=> b!59793 (= e!39829 (array_inv!1140 (buf!1618 thiss!1379)))))

(declare-fun b!59794 () Bool)

(declare-fun e!39820 () Bool)

(declare-fun e!39826 () Bool)

(assert (=> b!59794 (= e!39820 e!39826)))

(declare-fun res!49801 () Bool)

(assert (=> b!59794 (=> res!49801 e!39826)))

(declare-fun isPrefixOf!0 (BitStream!2162 BitStream!2162) Bool)

(assert (=> b!59794 (= res!49801 (not (isPrefixOf!0 thiss!1379 (_2!2834 lt!93603))))))

(declare-fun lt!93602 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59794 (validate_offset_bits!1 ((_ sign_extend 32) (size!1237 (buf!1618 (_2!2834 lt!93603)))) ((_ sign_extend 32) (currentByte!3236 (_2!2834 lt!93603))) ((_ sign_extend 32) (currentBit!3231 (_2!2834 lt!93603))) lt!93602)))

(assert (=> b!59794 (= lt!93602 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93599 () Unit!4097)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2162 BitStream!2162 (_ BitVec 64) (_ BitVec 64)) Unit!4097)

(assert (=> b!59794 (= lt!93599 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2834 lt!93603) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2723)

(declare-fun appendBitFromByte!0 (BitStream!2162 (_ BitVec 8) (_ BitVec 32)) tuple2!5446)

(assert (=> b!59794 (= lt!93603 (appendBitFromByte!0 thiss!1379 (select (arr!1801 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!5448 0))(
  ( (tuple2!5449 (_1!2835 BitStream!2162) (_2!2835 BitStream!2162)) )
))
(declare-fun lt!93594 () tuple2!5448)

(declare-fun b!59795 () Bool)

(declare-fun e!39827 () Bool)

(declare-datatypes ((List!656 0))(
  ( (Nil!653) (Cons!652 (h!771 Bool) (t!1406 List!656)) )
))
(declare-fun head!475 (List!656) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2162 array!2723 (_ BitVec 64) (_ BitVec 64)) List!656)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2162 BitStream!2162 (_ BitVec 64)) List!656)

(assert (=> b!59795 (= e!39827 (= (head!475 (byteArrayBitContentToList!0 (_2!2834 lt!93603) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!475 (bitStreamReadBitsIntoList!0 (_2!2834 lt!93603) (_1!2835 lt!93594) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59796 () Bool)

(assert (=> b!59796 (= e!39828 e!39825)))

(declare-fun res!49791 () Bool)

(assert (=> b!59796 (=> res!49791 e!39825)))

(assert (=> b!59796 (= res!49791 (not (= (size!1237 (buf!1618 (_2!2834 lt!93603))) (size!1237 (buf!1618 (_2!2834 lt!93607))))))))

(assert (=> b!59796 e!39821))

(declare-fun res!49794 () Bool)

(assert (=> b!59796 (=> (not res!49794) (not e!39821))))

(assert (=> b!59796 (= res!49794 (= (size!1237 (buf!1618 (_2!2834 lt!93607))) (size!1237 (buf!1618 thiss!1379))))))

(declare-fun b!59797 () Bool)

(assert (=> b!59797 (= e!39826 e!39830)))

(declare-fun res!49800 () Bool)

(assert (=> b!59797 (=> res!49800 e!39830)))

(assert (=> b!59797 (= res!49800 (not (isPrefixOf!0 (_2!2834 lt!93603) (_2!2834 lt!93607))))))

(assert (=> b!59797 (isPrefixOf!0 thiss!1379 (_2!2834 lt!93607))))

(declare-fun lt!93601 () Unit!4097)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2162 BitStream!2162 BitStream!2162) Unit!4097)

(assert (=> b!59797 (= lt!93601 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2834 lt!93603) (_2!2834 lt!93607)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2162 array!2723 (_ BitVec 64) (_ BitVec 64)) tuple2!5446)

(assert (=> b!59797 (= lt!93607 (appendBitsMSBFirstLoop!0 (_2!2834 lt!93603) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59797 e!39827))

(declare-fun res!49797 () Bool)

(assert (=> b!59797 (=> (not res!49797) (not e!39827))))

(assert (=> b!59797 (= res!49797 (validate_offset_bits!1 ((_ sign_extend 32) (size!1237 (buf!1618 (_2!2834 lt!93603)))) ((_ sign_extend 32) (currentByte!3236 thiss!1379)) ((_ sign_extend 32) (currentBit!3231 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93595 () Unit!4097)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2162 array!2723 (_ BitVec 64)) Unit!4097)

(assert (=> b!59797 (= lt!93595 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1618 (_2!2834 lt!93603)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2162 BitStream!2162) tuple2!5448)

(assert (=> b!59797 (= lt!93594 (reader!0 thiss!1379 (_2!2834 lt!93603)))))

(declare-fun res!49796 () Bool)

(declare-fun e!39822 () Bool)

(assert (=> start!11866 (=> (not res!49796) (not e!39822))))

(assert (=> start!11866 (= res!49796 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1237 srcBuffer!2))))))))

(assert (=> start!11866 e!39822))

(assert (=> start!11866 true))

(assert (=> start!11866 (array_inv!1140 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2162) Bool)

(assert (=> start!11866 (and (inv!12 thiss!1379) e!39829)))

(declare-fun b!59798 () Bool)

(declare-fun res!49798 () Bool)

(assert (=> b!59798 (=> res!49798 e!39825)))

(assert (=> b!59798 (= res!49798 (not (invariant!0 (currentBit!3231 (_2!2834 lt!93603)) (currentByte!3236 (_2!2834 lt!93603)) (size!1237 (buf!1618 (_2!2834 lt!93607))))))))

(declare-fun b!59799 () Bool)

(declare-fun res!49792 () Bool)

(assert (=> b!59799 (=> res!49792 e!39828)))

(assert (=> b!59799 (= res!49792 (not (= (size!1237 (buf!1618 thiss!1379)) (size!1237 (buf!1618 (_2!2834 lt!93607))))))))

(declare-fun b!59800 () Bool)

(declare-fun res!49802 () Bool)

(assert (=> b!59800 (=> (not res!49802) (not e!39822))))

(assert (=> b!59800 (= res!49802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1237 (buf!1618 thiss!1379))) ((_ sign_extend 32) (currentByte!3236 thiss!1379)) ((_ sign_extend 32) (currentBit!3231 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59801 () Bool)

(assert (=> b!59801 (= e!39822 (not e!39820))))

(declare-fun res!49795 () Bool)

(assert (=> b!59801 (=> res!49795 e!39820)))

(assert (=> b!59801 (= res!49795 (bvsge i!635 to!314))))

(assert (=> b!59801 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93597 () Unit!4097)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2162) Unit!4097)

(assert (=> b!59801 (= lt!93597 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59801 (= lt!93605 (bitIndex!0 (size!1237 (buf!1618 thiss!1379)) (currentByte!3236 thiss!1379) (currentBit!3231 thiss!1379)))))

(declare-fun b!59802 () Bool)

(declare-fun res!49793 () Bool)

(assert (=> b!59802 (=> res!49793 e!39828)))

(assert (=> b!59802 (= res!49793 (not (invariant!0 (currentBit!3231 (_2!2834 lt!93607)) (currentByte!3236 (_2!2834 lt!93607)) (size!1237 (buf!1618 (_2!2834 lt!93607))))))))

(declare-fun b!59803 () Bool)

(assert (=> b!59803 (= e!39825 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!59803 (validate_offset_bits!1 ((_ sign_extend 32) (size!1237 (buf!1618 (_2!2834 lt!93607)))) ((_ sign_extend 32) (currentByte!3236 (_2!2834 lt!93603))) ((_ sign_extend 32) (currentBit!3231 (_2!2834 lt!93603))) lt!93602)))

(declare-fun lt!93598 () Unit!4097)

(assert (=> b!59803 (= lt!93598 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2834 lt!93603) (buf!1618 (_2!2834 lt!93607)) lt!93602))))

(declare-fun lt!93604 () tuple2!5448)

(assert (=> b!59803 (= lt!93604 (reader!0 (_2!2834 lt!93603) (_2!2834 lt!93607)))))

(assert (=> b!59803 (validate_offset_bits!1 ((_ sign_extend 32) (size!1237 (buf!1618 (_2!2834 lt!93607)))) ((_ sign_extend 32) (currentByte!3236 thiss!1379)) ((_ sign_extend 32) (currentBit!3231 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93600 () Unit!4097)

(assert (=> b!59803 (= lt!93600 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1618 (_2!2834 lt!93607)) (bvsub to!314 i!635)))))

(declare-fun lt!93606 () tuple2!5448)

(assert (=> b!59803 (= lt!93606 (reader!0 thiss!1379 (_2!2834 lt!93607)))))

(assert (= (and start!11866 res!49796) b!59800))

(assert (= (and b!59800 res!49802) b!59801))

(assert (= (and b!59801 (not res!49795)) b!59794))

(assert (= (and b!59794 (not res!49801)) b!59797))

(assert (= (and b!59797 res!49797) b!59795))

(assert (= (and b!59797 (not res!49800)) b!59790))

(assert (= (and b!59790 (not res!49803)) b!59802))

(assert (= (and b!59802 (not res!49793)) b!59799))

(assert (= (and b!59799 (not res!49792)) b!59796))

(assert (= (and b!59796 res!49794) b!59792))

(assert (= (and b!59796 (not res!49791)) b!59791))

(assert (= (and b!59791 (not res!49799)) b!59798))

(assert (= (and b!59798 (not res!49798)) b!59803))

(assert (= start!11866 b!59793))

(declare-fun m!94169 () Bool)

(assert (=> b!59798 m!94169))

(declare-fun m!94171 () Bool)

(assert (=> b!59802 m!94171))

(declare-fun m!94173 () Bool)

(assert (=> b!59803 m!94173))

(declare-fun m!94175 () Bool)

(assert (=> b!59803 m!94175))

(declare-fun m!94177 () Bool)

(assert (=> b!59803 m!94177))

(declare-fun m!94179 () Bool)

(assert (=> b!59803 m!94179))

(declare-fun m!94181 () Bool)

(assert (=> b!59803 m!94181))

(declare-fun m!94183 () Bool)

(assert (=> b!59803 m!94183))

(declare-fun m!94185 () Bool)

(assert (=> b!59801 m!94185))

(declare-fun m!94187 () Bool)

(assert (=> b!59801 m!94187))

(declare-fun m!94189 () Bool)

(assert (=> b!59801 m!94189))

(declare-fun m!94191 () Bool)

(assert (=> b!59793 m!94191))

(declare-fun m!94193 () Bool)

(assert (=> b!59795 m!94193))

(assert (=> b!59795 m!94193))

(declare-fun m!94195 () Bool)

(assert (=> b!59795 m!94195))

(declare-fun m!94197 () Bool)

(assert (=> b!59795 m!94197))

(assert (=> b!59795 m!94197))

(declare-fun m!94199 () Bool)

(assert (=> b!59795 m!94199))

(declare-fun m!94201 () Bool)

(assert (=> b!59797 m!94201))

(declare-fun m!94203 () Bool)

(assert (=> b!59797 m!94203))

(declare-fun m!94205 () Bool)

(assert (=> b!59797 m!94205))

(declare-fun m!94207 () Bool)

(assert (=> b!59797 m!94207))

(declare-fun m!94209 () Bool)

(assert (=> b!59797 m!94209))

(declare-fun m!94211 () Bool)

(assert (=> b!59797 m!94211))

(declare-fun m!94213 () Bool)

(assert (=> b!59797 m!94213))

(declare-fun m!94215 () Bool)

(assert (=> b!59791 m!94215))

(declare-fun m!94217 () Bool)

(assert (=> b!59794 m!94217))

(declare-fun m!94219 () Bool)

(assert (=> b!59794 m!94219))

(declare-fun m!94221 () Bool)

(assert (=> b!59794 m!94221))

(declare-fun m!94223 () Bool)

(assert (=> b!59794 m!94223))

(declare-fun m!94225 () Bool)

(assert (=> b!59794 m!94225))

(assert (=> b!59794 m!94221))

(declare-fun m!94227 () Bool)

(assert (=> b!59790 m!94227))

(declare-fun m!94229 () Bool)

(assert (=> b!59792 m!94229))

(declare-fun m!94231 () Bool)

(assert (=> b!59800 m!94231))

(declare-fun m!94233 () Bool)

(assert (=> start!11866 m!94233))

(declare-fun m!94235 () Bool)

(assert (=> start!11866 m!94235))

(push 1)

(assert (not b!59800))

(assert (not b!59791))

(assert (not b!59803))

(assert (not b!59798))

(assert (not b!59794))

(assert (not b!59793))

(assert (not start!11866))

(assert (not b!59795))

(assert (not b!59802))

(assert (not b!59797))

(assert (not b!59801))

(assert (not b!59790))

(assert (not b!59792))

(check-sat)

(pop 1)

(push 1)

(check-sat)


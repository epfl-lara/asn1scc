; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11868 () Bool)

(assert start!11868)

(declare-fun b!59832 () Bool)

(declare-fun e!39863 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!59832 (= e!39863 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!2725 0))(
  ( (array!2726 (arr!1802 (Array (_ BitVec 32) (_ BitVec 8))) (size!1238 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2164 0))(
  ( (BitStream!2165 (buf!1619 array!2725) (currentByte!3237 (_ BitVec 32)) (currentBit!3232 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4099 0))(
  ( (Unit!4100) )
))
(declare-datatypes ((tuple2!5450 0))(
  ( (tuple2!5451 (_1!2836 Unit!4099) (_2!2836 BitStream!2164)) )
))
(declare-fun lt!93649 () tuple2!5450)

(declare-datatypes ((List!657 0))(
  ( (Nil!654) (Cons!653 (h!772 Bool) (t!1407 List!657)) )
))
(declare-fun lt!93645 () List!657)

(declare-datatypes ((tuple2!5452 0))(
  ( (tuple2!5453 (_1!2837 BitStream!2164) (_2!2837 BitStream!2164)) )
))
(declare-fun lt!93644 () tuple2!5452)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2164 BitStream!2164 (_ BitVec 64)) List!657)

(assert (=> b!59832 (= lt!93645 (bitStreamReadBitsIntoList!0 (_2!2836 lt!93649) (_1!2837 lt!93644) (bvsub to!314 i!635)))))

(declare-fun lt!93651 () tuple2!5450)

(declare-fun lt!93646 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59832 (validate_offset_bits!1 ((_ sign_extend 32) (size!1238 (buf!1619 (_2!2836 lt!93649)))) ((_ sign_extend 32) (currentByte!3237 (_2!2836 lt!93651))) ((_ sign_extend 32) (currentBit!3232 (_2!2836 lt!93651))) lt!93646)))

(declare-fun lt!93641 () Unit!4099)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2164 array!2725 (_ BitVec 64)) Unit!4099)

(assert (=> b!59832 (= lt!93641 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2836 lt!93651) (buf!1619 (_2!2836 lt!93649)) lt!93646))))

(declare-fun lt!93652 () tuple2!5452)

(declare-fun reader!0 (BitStream!2164 BitStream!2164) tuple2!5452)

(assert (=> b!59832 (= lt!93652 (reader!0 (_2!2836 lt!93651) (_2!2836 lt!93649)))))

(declare-fun thiss!1379 () BitStream!2164)

(assert (=> b!59832 (validate_offset_bits!1 ((_ sign_extend 32) (size!1238 (buf!1619 (_2!2836 lt!93649)))) ((_ sign_extend 32) (currentByte!3237 thiss!1379)) ((_ sign_extend 32) (currentBit!3232 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93650 () Unit!4099)

(assert (=> b!59832 (= lt!93650 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1619 (_2!2836 lt!93649)) (bvsub to!314 i!635)))))

(assert (=> b!59832 (= lt!93644 (reader!0 thiss!1379 (_2!2836 lt!93649)))))

(declare-fun b!59833 () Bool)

(declare-fun res!49832 () Bool)

(assert (=> b!59833 (=> res!49832 e!39863)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59833 (= res!49832 (not (invariant!0 (currentBit!3232 (_2!2836 lt!93651)) (currentByte!3237 (_2!2836 lt!93651)) (size!1238 (buf!1619 (_2!2836 lt!93651))))))))

(declare-fun b!59834 () Bool)

(declare-fun e!39860 () Bool)

(declare-fun e!39857 () Bool)

(assert (=> b!59834 (= e!39860 e!39857)))

(declare-fun res!49840 () Bool)

(assert (=> b!59834 (=> res!49840 e!39857)))

(declare-fun isPrefixOf!0 (BitStream!2164 BitStream!2164) Bool)

(assert (=> b!59834 (= res!49840 (not (isPrefixOf!0 (_2!2836 lt!93651) (_2!2836 lt!93649))))))

(assert (=> b!59834 (isPrefixOf!0 thiss!1379 (_2!2836 lt!93649))))

(declare-fun lt!93638 () Unit!4099)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2164 BitStream!2164 BitStream!2164) Unit!4099)

(assert (=> b!59834 (= lt!93638 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2836 lt!93651) (_2!2836 lt!93649)))))

(declare-fun srcBuffer!2 () array!2725)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2164 array!2725 (_ BitVec 64) (_ BitVec 64)) tuple2!5450)

(assert (=> b!59834 (= lt!93649 (appendBitsMSBFirstLoop!0 (_2!2836 lt!93651) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39856 () Bool)

(assert (=> b!59834 e!39856))

(declare-fun res!49835 () Bool)

(assert (=> b!59834 (=> (not res!49835) (not e!39856))))

(assert (=> b!59834 (= res!49835 (validate_offset_bits!1 ((_ sign_extend 32) (size!1238 (buf!1619 (_2!2836 lt!93651)))) ((_ sign_extend 32) (currentByte!3237 thiss!1379)) ((_ sign_extend 32) (currentBit!3232 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93642 () Unit!4099)

(assert (=> b!59834 (= lt!93642 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1619 (_2!2836 lt!93651)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93639 () tuple2!5452)

(assert (=> b!59834 (= lt!93639 (reader!0 thiss!1379 (_2!2836 lt!93651)))))

(declare-fun res!49839 () Bool)

(declare-fun e!39854 () Bool)

(assert (=> start!11868 (=> (not res!49839) (not e!39854))))

(assert (=> start!11868 (= res!49839 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1238 srcBuffer!2))))))))

(assert (=> start!11868 e!39854))

(assert (=> start!11868 true))

(declare-fun array_inv!1141 (array!2725) Bool)

(assert (=> start!11868 (array_inv!1141 srcBuffer!2)))

(declare-fun e!39853 () Bool)

(declare-fun inv!12 (BitStream!2164) Bool)

(assert (=> start!11868 (and (inv!12 thiss!1379) e!39853)))

(declare-fun b!59835 () Bool)

(declare-fun res!49838 () Bool)

(declare-fun e!39859 () Bool)

(assert (=> b!59835 (=> res!49838 e!39859)))

(assert (=> b!59835 (= res!49838 (not (invariant!0 (currentBit!3232 (_2!2836 lt!93649)) (currentByte!3237 (_2!2836 lt!93649)) (size!1238 (buf!1619 (_2!2836 lt!93649))))))))

(declare-fun b!59836 () Bool)

(assert (=> b!59836 (= e!39853 (array_inv!1141 (buf!1619 thiss!1379)))))

(declare-fun b!59837 () Bool)

(declare-fun res!49830 () Bool)

(assert (=> b!59837 (=> (not res!49830) (not e!39854))))

(assert (=> b!59837 (= res!49830 (validate_offset_bits!1 ((_ sign_extend 32) (size!1238 (buf!1619 thiss!1379))) ((_ sign_extend 32) (currentByte!3237 thiss!1379)) ((_ sign_extend 32) (currentBit!3232 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59838 () Bool)

(declare-fun head!476 (List!657) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2164 array!2725 (_ BitVec 64) (_ BitVec 64)) List!657)

(assert (=> b!59838 (= e!39856 (= (head!476 (byteArrayBitContentToList!0 (_2!2836 lt!93651) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!476 (bitStreamReadBitsIntoList!0 (_2!2836 lt!93651) (_1!2837 lt!93639) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59839 () Bool)

(assert (=> b!59839 (= e!39859 e!39863)))

(declare-fun res!49834 () Bool)

(assert (=> b!59839 (=> res!49834 e!39863)))

(assert (=> b!59839 (= res!49834 (not (= (size!1238 (buf!1619 (_2!2836 lt!93651))) (size!1238 (buf!1619 (_2!2836 lt!93649))))))))

(declare-fun e!39858 () Bool)

(assert (=> b!59839 e!39858))

(declare-fun res!49837 () Bool)

(assert (=> b!59839 (=> (not res!49837) (not e!39858))))

(assert (=> b!59839 (= res!49837 (= (size!1238 (buf!1619 (_2!2836 lt!93649))) (size!1238 (buf!1619 thiss!1379))))))

(declare-fun b!59840 () Bool)

(declare-fun res!49833 () Bool)

(assert (=> b!59840 (=> res!49833 e!39859)))

(assert (=> b!59840 (= res!49833 (not (= (size!1238 (buf!1619 thiss!1379)) (size!1238 (buf!1619 (_2!2836 lt!93649))))))))

(declare-fun b!59841 () Bool)

(assert (=> b!59841 (= e!39857 e!39859)))

(declare-fun res!49842 () Bool)

(assert (=> b!59841 (=> res!49842 e!39859)))

(declare-fun lt!93648 () (_ BitVec 64))

(declare-fun lt!93640 () (_ BitVec 64))

(assert (=> b!59841 (= res!49842 (not (= lt!93640 (bvsub (bvadd lt!93648 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59841 (= lt!93640 (bitIndex!0 (size!1238 (buf!1619 (_2!2836 lt!93649))) (currentByte!3237 (_2!2836 lt!93649)) (currentBit!3232 (_2!2836 lt!93649))))))

(declare-fun b!59842 () Bool)

(declare-fun e!39861 () Bool)

(assert (=> b!59842 (= e!39854 (not e!39861))))

(declare-fun res!49831 () Bool)

(assert (=> b!59842 (=> res!49831 e!39861)))

(assert (=> b!59842 (= res!49831 (bvsge i!635 to!314))))

(assert (=> b!59842 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93647 () Unit!4099)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2164) Unit!4099)

(assert (=> b!59842 (= lt!93647 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59842 (= lt!93648 (bitIndex!0 (size!1238 (buf!1619 thiss!1379)) (currentByte!3237 thiss!1379) (currentBit!3232 thiss!1379)))))

(declare-fun b!59843 () Bool)

(assert (=> b!59843 (= e!39858 (= lt!93640 (bvsub (bvsub (bvadd (bitIndex!0 (size!1238 (buf!1619 (_2!2836 lt!93651))) (currentByte!3237 (_2!2836 lt!93651)) (currentBit!3232 (_2!2836 lt!93651))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59844 () Bool)

(declare-fun res!49841 () Bool)

(assert (=> b!59844 (=> res!49841 e!39863)))

(assert (=> b!59844 (= res!49841 (not (invariant!0 (currentBit!3232 (_2!2836 lt!93651)) (currentByte!3237 (_2!2836 lt!93651)) (size!1238 (buf!1619 (_2!2836 lt!93649))))))))

(declare-fun b!59845 () Bool)

(assert (=> b!59845 (= e!39861 e!39860)))

(declare-fun res!49836 () Bool)

(assert (=> b!59845 (=> res!49836 e!39860)))

(assert (=> b!59845 (= res!49836 (not (isPrefixOf!0 thiss!1379 (_2!2836 lt!93651))))))

(assert (=> b!59845 (validate_offset_bits!1 ((_ sign_extend 32) (size!1238 (buf!1619 (_2!2836 lt!93651)))) ((_ sign_extend 32) (currentByte!3237 (_2!2836 lt!93651))) ((_ sign_extend 32) (currentBit!3232 (_2!2836 lt!93651))) lt!93646)))

(assert (=> b!59845 (= lt!93646 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93643 () Unit!4099)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2164 BitStream!2164 (_ BitVec 64) (_ BitVec 64)) Unit!4099)

(assert (=> b!59845 (= lt!93643 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2836 lt!93651) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2164 (_ BitVec 8) (_ BitVec 32)) tuple2!5450)

(assert (=> b!59845 (= lt!93651 (appendBitFromByte!0 thiss!1379 (select (arr!1802 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11868 res!49839) b!59837))

(assert (= (and b!59837 res!49830) b!59842))

(assert (= (and b!59842 (not res!49831)) b!59845))

(assert (= (and b!59845 (not res!49836)) b!59834))

(assert (= (and b!59834 res!49835) b!59838))

(assert (= (and b!59834 (not res!49840)) b!59841))

(assert (= (and b!59841 (not res!49842)) b!59835))

(assert (= (and b!59835 (not res!49838)) b!59840))

(assert (= (and b!59840 (not res!49833)) b!59839))

(assert (= (and b!59839 res!49837) b!59843))

(assert (= (and b!59839 (not res!49834)) b!59833))

(assert (= (and b!59833 (not res!49832)) b!59844))

(assert (= (and b!59844 (not res!49841)) b!59832))

(assert (= start!11868 b!59836))

(declare-fun m!94237 () Bool)

(assert (=> start!11868 m!94237))

(declare-fun m!94239 () Bool)

(assert (=> start!11868 m!94239))

(declare-fun m!94241 () Bool)

(assert (=> b!59832 m!94241))

(declare-fun m!94243 () Bool)

(assert (=> b!59832 m!94243))

(declare-fun m!94245 () Bool)

(assert (=> b!59832 m!94245))

(declare-fun m!94247 () Bool)

(assert (=> b!59832 m!94247))

(declare-fun m!94249 () Bool)

(assert (=> b!59832 m!94249))

(declare-fun m!94251 () Bool)

(assert (=> b!59832 m!94251))

(declare-fun m!94253 () Bool)

(assert (=> b!59832 m!94253))

(declare-fun m!94255 () Bool)

(assert (=> b!59841 m!94255))

(declare-fun m!94257 () Bool)

(assert (=> b!59844 m!94257))

(declare-fun m!94259 () Bool)

(assert (=> b!59842 m!94259))

(declare-fun m!94261 () Bool)

(assert (=> b!59842 m!94261))

(declare-fun m!94263 () Bool)

(assert (=> b!59842 m!94263))

(declare-fun m!94265 () Bool)

(assert (=> b!59838 m!94265))

(assert (=> b!59838 m!94265))

(declare-fun m!94267 () Bool)

(assert (=> b!59838 m!94267))

(declare-fun m!94269 () Bool)

(assert (=> b!59838 m!94269))

(assert (=> b!59838 m!94269))

(declare-fun m!94271 () Bool)

(assert (=> b!59838 m!94271))

(declare-fun m!94273 () Bool)

(assert (=> b!59835 m!94273))

(declare-fun m!94275 () Bool)

(assert (=> b!59833 m!94275))

(declare-fun m!94277 () Bool)

(assert (=> b!59845 m!94277))

(declare-fun m!94279 () Bool)

(assert (=> b!59845 m!94279))

(declare-fun m!94281 () Bool)

(assert (=> b!59845 m!94281))

(declare-fun m!94283 () Bool)

(assert (=> b!59845 m!94283))

(assert (=> b!59845 m!94277))

(declare-fun m!94285 () Bool)

(assert (=> b!59845 m!94285))

(declare-fun m!94287 () Bool)

(assert (=> b!59837 m!94287))

(declare-fun m!94289 () Bool)

(assert (=> b!59834 m!94289))

(declare-fun m!94291 () Bool)

(assert (=> b!59834 m!94291))

(declare-fun m!94293 () Bool)

(assert (=> b!59834 m!94293))

(declare-fun m!94295 () Bool)

(assert (=> b!59834 m!94295))

(declare-fun m!94297 () Bool)

(assert (=> b!59834 m!94297))

(declare-fun m!94299 () Bool)

(assert (=> b!59834 m!94299))

(declare-fun m!94301 () Bool)

(assert (=> b!59834 m!94301))

(declare-fun m!94303 () Bool)

(assert (=> b!59836 m!94303))

(declare-fun m!94305 () Bool)

(assert (=> b!59843 m!94305))

(push 1)

(assert (not b!59844))

(assert (not b!59835))

(assert (not b!59842))

(assert (not b!59836))

(assert (not b!59833))

(assert (not b!59845))

(assert (not start!11868))

(assert (not b!59837))

(assert (not b!59841))

(assert (not b!59832))

(assert (not b!59834))

(assert (not b!59843))

(assert (not b!59838))

(check-sat)

(pop 1)

(push 1)

(check-sat)


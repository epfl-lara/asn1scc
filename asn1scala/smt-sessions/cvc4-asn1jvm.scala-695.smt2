; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19564 () Bool)

(assert start!19564)

(declare-fun res!80087 () Bool)

(declare-fun e!63934 () Bool)

(assert (=> start!19564 (=> (not res!80087) (not e!63934))))

(declare-fun nBits!388 () (_ BitVec 32))

(assert (=> start!19564 (= res!80087 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19564 e!63934))

(assert (=> start!19564 true))

(declare-datatypes ((array!4568 0))(
  ( (array!4569 (arr!2681 (Array (_ BitVec 32) (_ BitVec 8))) (size!2088 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3650 0))(
  ( (BitStream!3651 (buf!2436 array!4568) (currentByte!4857 (_ BitVec 32)) (currentBit!4852 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3650)

(declare-fun e!63933 () Bool)

(declare-fun inv!12 (BitStream!3650) Bool)

(assert (=> start!19564 (and (inv!12 thiss!1288) e!63933)))

(declare-fun b!97607 () Bool)

(declare-fun res!80089 () Bool)

(assert (=> b!97607 (=> (not res!80089) (not e!63934))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97607 (= res!80089 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97608 () Bool)

(declare-fun res!80085 () Bool)

(declare-fun e!63935 () Bool)

(assert (=> b!97608 (=> (not res!80085) (not e!63935))))

(declare-datatypes ((Unit!5946 0))(
  ( (Unit!5947) )
))
(declare-datatypes ((tuple2!7824 0))(
  ( (tuple2!7825 (_1!4164 Unit!5946) (_2!4164 BitStream!3650)) )
))
(declare-fun lt!141309 () tuple2!7824)

(declare-fun isPrefixOf!0 (BitStream!3650 BitStream!3650) Bool)

(assert (=> b!97608 (= res!80085 (isPrefixOf!0 thiss!1288 (_2!4164 lt!141309)))))

(declare-fun b!97609 () Bool)

(declare-fun res!80086 () Bool)

(assert (=> b!97609 (=> (not res!80086) (not e!63934))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97609 (= res!80086 (validate_offset_bits!1 ((_ sign_extend 32) (size!2088 (buf!2436 thiss!1288))) ((_ sign_extend 32) (currentByte!4857 thiss!1288)) ((_ sign_extend 32) (currentBit!4852 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97610 () Bool)

(assert (=> b!97610 (= e!63935 false)))

(declare-datatypes ((tuple2!7826 0))(
  ( (tuple2!7827 (_1!4165 BitStream!3650) (_2!4165 BitStream!3650)) )
))
(declare-fun lt!141310 () tuple2!7826)

(declare-fun reader!0 (BitStream!3650 BitStream!3650) tuple2!7826)

(assert (=> b!97610 (= lt!141310 (reader!0 thiss!1288 (_2!4164 lt!141309)))))

(declare-fun b!97611 () Bool)

(declare-fun array_inv!1890 (array!4568) Bool)

(assert (=> b!97611 (= e!63933 (array_inv!1890 (buf!2436 thiss!1288)))))

(declare-fun b!97612 () Bool)

(declare-fun res!80090 () Bool)

(assert (=> b!97612 (=> (not res!80090) (not e!63935))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97612 (= res!80090 (= (bitIndex!0 (size!2088 (buf!2436 (_2!4164 lt!141309))) (currentByte!4857 (_2!4164 lt!141309)) (currentBit!4852 (_2!4164 lt!141309))) (bvadd (bitIndex!0 (size!2088 (buf!2436 thiss!1288)) (currentByte!4857 thiss!1288) (currentBit!4852 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97613 () Bool)

(assert (=> b!97613 (= e!63934 e!63935)))

(declare-fun res!80088 () Bool)

(assert (=> b!97613 (=> (not res!80088) (not e!63935))))

(assert (=> b!97613 (= res!80088 (= (size!2088 (buf!2436 thiss!1288)) (size!2088 (buf!2436 (_2!4164 lt!141309)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7824)

(assert (=> b!97613 (= lt!141309 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(assert (= (and start!19564 res!80087) b!97609))

(assert (= (and b!97609 res!80086) b!97607))

(assert (= (and b!97607 res!80089) b!97613))

(assert (= (and b!97613 res!80088) b!97612))

(assert (= (and b!97612 res!80090) b!97608))

(assert (= (and b!97608 res!80085) b!97610))

(assert (= start!19564 b!97611))

(declare-fun m!141871 () Bool)

(assert (=> b!97611 m!141871))

(declare-fun m!141873 () Bool)

(assert (=> b!97610 m!141873))

(declare-fun m!141875 () Bool)

(assert (=> start!19564 m!141875))

(declare-fun m!141877 () Bool)

(assert (=> b!97612 m!141877))

(declare-fun m!141879 () Bool)

(assert (=> b!97612 m!141879))

(declare-fun m!141881 () Bool)

(assert (=> b!97608 m!141881))

(declare-fun m!141883 () Bool)

(assert (=> b!97613 m!141883))

(declare-fun m!141885 () Bool)

(assert (=> b!97607 m!141885))

(declare-fun m!141887 () Bool)

(assert (=> b!97609 m!141887))

(push 1)


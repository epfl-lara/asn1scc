; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19574 () Bool)

(assert start!19574)

(declare-fun b!97712 () Bool)

(declare-fun e!63994 () Bool)

(assert (=> b!97712 (= e!63994 (not true))))

(declare-datatypes ((array!4578 0))(
  ( (array!4579 (arr!2686 (Array (_ BitVec 32) (_ BitVec 8))) (size!2093 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3660 0))(
  ( (BitStream!3661 (buf!2441 array!4578) (currentByte!4862 (_ BitVec 32)) (currentBit!4857 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5956 0))(
  ( (Unit!5957) )
))
(declare-datatypes ((tuple2!7844 0))(
  ( (tuple2!7845 (_1!4174 Unit!5956) (_2!4174 BitStream!3660)) )
))
(declare-fun lt!141346 () tuple2!7844)

(declare-fun thiss!1288 () BitStream!3660)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97712 (validate_offset_bits!1 ((_ sign_extend 32) (size!2093 (buf!2441 (_2!4174 lt!141346)))) ((_ sign_extend 32) (currentByte!4862 thiss!1288)) ((_ sign_extend 32) (currentBit!4857 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141345 () Unit!5956)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3660 array!4578 (_ BitVec 64)) Unit!5956)

(assert (=> b!97712 (= lt!141345 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2441 (_2!4174 lt!141346)) ((_ sign_extend 32) nBits!388)))))

(declare-datatypes ((tuple2!7846 0))(
  ( (tuple2!7847 (_1!4175 BitStream!3660) (_2!4175 BitStream!3660)) )
))
(declare-fun lt!141344 () tuple2!7846)

(declare-fun reader!0 (BitStream!3660 BitStream!3660) tuple2!7846)

(assert (=> b!97712 (= lt!141344 (reader!0 thiss!1288 (_2!4174 lt!141346)))))

(declare-fun b!97713 () Bool)

(declare-fun res!80176 () Bool)

(assert (=> b!97713 (=> (not res!80176) (not e!63994))))

(declare-fun isPrefixOf!0 (BitStream!3660 BitStream!3660) Bool)

(assert (=> b!97713 (= res!80176 (isPrefixOf!0 thiss!1288 (_2!4174 lt!141346)))))

(declare-fun b!97714 () Bool)

(declare-fun e!63993 () Bool)

(declare-fun array_inv!1895 (array!4578) Bool)

(assert (=> b!97714 (= e!63993 (array_inv!1895 (buf!2441 thiss!1288)))))

(declare-fun b!97715 () Bool)

(declare-fun res!80178 () Bool)

(declare-fun e!63995 () Bool)

(assert (=> b!97715 (=> (not res!80178) (not e!63995))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97715 (= res!80178 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97716 () Bool)

(assert (=> b!97716 (= e!63995 e!63994)))

(declare-fun res!80179 () Bool)

(assert (=> b!97716 (=> (not res!80179) (not e!63994))))

(assert (=> b!97716 (= res!80179 (= (size!2093 (buf!2441 thiss!1288)) (size!2093 (buf!2441 (_2!4174 lt!141346)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7844)

(assert (=> b!97716 (= lt!141346 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun res!80177 () Bool)

(assert (=> start!19574 (=> (not res!80177) (not e!63995))))

(assert (=> start!19574 (= res!80177 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19574 e!63995))

(assert (=> start!19574 true))

(declare-fun inv!12 (BitStream!3660) Bool)

(assert (=> start!19574 (and (inv!12 thiss!1288) e!63993)))

(declare-fun b!97717 () Bool)

(declare-fun res!80180 () Bool)

(assert (=> b!97717 (=> (not res!80180) (not e!63994))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97717 (= res!80180 (= (bitIndex!0 (size!2093 (buf!2441 (_2!4174 lt!141346))) (currentByte!4862 (_2!4174 lt!141346)) (currentBit!4857 (_2!4174 lt!141346))) (bvadd (bitIndex!0 (size!2093 (buf!2441 thiss!1288)) (currentByte!4862 thiss!1288) (currentBit!4857 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97718 () Bool)

(declare-fun res!80175 () Bool)

(assert (=> b!97718 (=> (not res!80175) (not e!63995))))

(assert (=> b!97718 (= res!80175 (validate_offset_bits!1 ((_ sign_extend 32) (size!2093 (buf!2441 thiss!1288))) ((_ sign_extend 32) (currentByte!4862 thiss!1288)) ((_ sign_extend 32) (currentBit!4857 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(assert (= (and start!19574 res!80177) b!97718))

(assert (= (and b!97718 res!80175) b!97715))

(assert (= (and b!97715 res!80178) b!97716))

(assert (= (and b!97716 res!80179) b!97717))

(assert (= (and b!97717 res!80180) b!97713))

(assert (= (and b!97713 res!80176) b!97712))

(assert (= start!19574 b!97714))

(declare-fun m!141965 () Bool)

(assert (=> b!97715 m!141965))

(declare-fun m!141967 () Bool)

(assert (=> start!19574 m!141967))

(declare-fun m!141969 () Bool)

(assert (=> b!97716 m!141969))

(declare-fun m!141971 () Bool)

(assert (=> b!97717 m!141971))

(declare-fun m!141973 () Bool)

(assert (=> b!97717 m!141973))

(declare-fun m!141975 () Bool)

(assert (=> b!97718 m!141975))

(declare-fun m!141977 () Bool)

(assert (=> b!97712 m!141977))

(declare-fun m!141979 () Bool)

(assert (=> b!97712 m!141979))

(declare-fun m!141981 () Bool)

(assert (=> b!97712 m!141981))

(declare-fun m!141983 () Bool)

(assert (=> b!97714 m!141983))

(declare-fun m!141985 () Bool)

(assert (=> b!97713 m!141985))

(check-sat (not b!97712) (not b!97717) (not b!97715) (not b!97716) (not start!19574) (not b!97713) (not b!97718) (not b!97714))

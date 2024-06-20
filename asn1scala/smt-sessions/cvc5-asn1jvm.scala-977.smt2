; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27450 () Bool)

(assert start!27450)

(declare-fun b!141063 () Bool)

(declare-fun res!117643 () Bool)

(declare-fun e!93974 () Bool)

(assert (=> b!141063 (=> (not res!117643) (not e!93974))))

(declare-datatypes ((array!6465 0))(
  ( (array!6466 (arr!3633 (Array (_ BitVec 32) (_ BitVec 8))) (size!2926 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5110 0))(
  ( (BitStream!5111 (buf!3347 array!6465) (currentByte!6207 (_ BitVec 32)) (currentBit!6202 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5110)

(declare-datatypes ((Unit!8834 0))(
  ( (Unit!8835) )
))
(declare-datatypes ((tuple2!12436 0))(
  ( (tuple2!12437 (_1!6548 Unit!8834) (_2!6548 BitStream!5110)) )
))
(declare-fun lt!219267 () tuple2!12436)

(declare-fun isPrefixOf!0 (BitStream!5110 BitStream!5110) Bool)

(assert (=> b!141063 (= res!117643 (isPrefixOf!0 thiss!1634 (_2!6548 lt!219267)))))

(declare-fun res!117639 () Bool)

(declare-fun e!93977 () Bool)

(assert (=> start!27450 (=> (not res!117639) (not e!93977))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6465)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27450 (= res!117639 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2926 arr!237))))))

(assert (=> start!27450 e!93977))

(assert (=> start!27450 true))

(declare-fun array_inv!2715 (array!6465) Bool)

(assert (=> start!27450 (array_inv!2715 arr!237)))

(declare-fun e!93978 () Bool)

(declare-fun inv!12 (BitStream!5110) Bool)

(assert (=> start!27450 (and (inv!12 thiss!1634) e!93978)))

(declare-fun b!141064 () Bool)

(declare-fun res!117637 () Bool)

(assert (=> b!141064 (=> (not res!117637) (not e!93977))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141064 (= res!117637 (invariant!0 (currentBit!6202 thiss!1634) (currentByte!6207 thiss!1634) (size!2926 (buf!3347 thiss!1634))))))

(declare-fun b!141065 () Bool)

(declare-fun e!93973 () Bool)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141065 (= e!93973 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2926 (buf!3347 (_2!6548 lt!219267)))) ((_ sign_extend 32) (currentByte!6207 (_2!6548 lt!219267))) ((_ sign_extend 32) (currentBit!6202 (_2!6548 lt!219267))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141066 () Bool)

(assert (=> b!141066 (= e!93978 (array_inv!2715 (buf!3347 thiss!1634)))))

(declare-fun b!141067 () Bool)

(declare-fun res!117636 () Bool)

(assert (=> b!141067 (=> (not res!117636) (not e!93974))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141067 (= res!117636 (= (bitIndex!0 (size!2926 (buf!3347 (_2!6548 lt!219267))) (currentByte!6207 (_2!6548 lt!219267)) (currentBit!6202 (_2!6548 lt!219267))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2926 (buf!3347 thiss!1634)) (currentByte!6207 thiss!1634) (currentBit!6202 thiss!1634)))))))

(declare-fun b!141068 () Bool)

(declare-datatypes ((tuple2!12438 0))(
  ( (tuple2!12439 (_1!6549 BitStream!5110) (_2!6549 (_ BitVec 8))) )
))
(declare-fun lt!219266 () tuple2!12438)

(declare-datatypes ((tuple2!12440 0))(
  ( (tuple2!12441 (_1!6550 BitStream!5110) (_2!6550 BitStream!5110)) )
))
(declare-fun lt!219268 () tuple2!12440)

(assert (=> b!141068 (= e!93974 (and (= (_2!6549 lt!219266) (select (arr!3633 arr!237) from!447)) (= (_1!6549 lt!219266) (_2!6550 lt!219268))))))

(declare-fun readBytePure!0 (BitStream!5110) tuple2!12438)

(assert (=> b!141068 (= lt!219266 (readBytePure!0 (_1!6550 lt!219268)))))

(declare-fun reader!0 (BitStream!5110 BitStream!5110) tuple2!12440)

(assert (=> b!141068 (= lt!219268 (reader!0 thiss!1634 (_2!6548 lt!219267)))))

(declare-fun b!141069 () Bool)

(assert (=> b!141069 (= e!93977 (not e!93973))))

(declare-fun res!117638 () Bool)

(assert (=> b!141069 (=> res!117638 e!93973)))

(assert (=> b!141069 (= res!117638 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (=> b!141069 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2926 (buf!3347 (_2!6548 lt!219267)))) ((_ sign_extend 32) (currentByte!6207 (_2!6548 lt!219267))) ((_ sign_extend 32) (currentBit!6202 (_2!6548 lt!219267))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219269 () Unit!8834)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5110 BitStream!5110 (_ BitVec 64) (_ BitVec 32)) Unit!8834)

(assert (=> b!141069 (= lt!219269 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6548 lt!219267) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141069 e!93974))

(declare-fun res!117642 () Bool)

(assert (=> b!141069 (=> (not res!117642) (not e!93974))))

(assert (=> b!141069 (= res!117642 (= (size!2926 (buf!3347 thiss!1634)) (size!2926 (buf!3347 (_2!6548 lt!219267)))))))

(declare-fun appendByte!0 (BitStream!5110 (_ BitVec 8)) tuple2!12436)

(assert (=> b!141069 (= lt!219267 (appendByte!0 thiss!1634 (select (arr!3633 arr!237) from!447)))))

(declare-fun b!141070 () Bool)

(declare-fun res!117640 () Bool)

(assert (=> b!141070 (=> (not res!117640) (not e!93977))))

(assert (=> b!141070 (= res!117640 (bvslt from!447 to!404))))

(declare-fun b!141071 () Bool)

(declare-fun res!117641 () Bool)

(assert (=> b!141071 (=> (not res!117641) (not e!93977))))

(assert (=> b!141071 (= res!117641 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2926 (buf!3347 thiss!1634))) ((_ sign_extend 32) (currentByte!6207 thiss!1634)) ((_ sign_extend 32) (currentBit!6202 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27450 res!117639) b!141071))

(assert (= (and b!141071 res!117641) b!141070))

(assert (= (and b!141070 res!117640) b!141064))

(assert (= (and b!141064 res!117637) b!141069))

(assert (= (and b!141069 res!117642) b!141067))

(assert (= (and b!141067 res!117636) b!141063))

(assert (= (and b!141063 res!117643) b!141068))

(assert (= (and b!141069 (not res!117638)) b!141065))

(assert (= start!27450 b!141066))

(declare-fun m!216893 () Bool)

(assert (=> b!141063 m!216893))

(declare-fun m!216895 () Bool)

(assert (=> start!27450 m!216895))

(declare-fun m!216897 () Bool)

(assert (=> start!27450 m!216897))

(declare-fun m!216899 () Bool)

(assert (=> b!141064 m!216899))

(declare-fun m!216901 () Bool)

(assert (=> b!141069 m!216901))

(declare-fun m!216903 () Bool)

(assert (=> b!141069 m!216903))

(declare-fun m!216905 () Bool)

(assert (=> b!141069 m!216905))

(assert (=> b!141069 m!216905))

(declare-fun m!216907 () Bool)

(assert (=> b!141069 m!216907))

(declare-fun m!216909 () Bool)

(assert (=> b!141071 m!216909))

(assert (=> b!141068 m!216905))

(declare-fun m!216911 () Bool)

(assert (=> b!141068 m!216911))

(declare-fun m!216913 () Bool)

(assert (=> b!141068 m!216913))

(declare-fun m!216915 () Bool)

(assert (=> b!141067 m!216915))

(declare-fun m!216917 () Bool)

(assert (=> b!141067 m!216917))

(declare-fun m!216919 () Bool)

(assert (=> b!141066 m!216919))

(declare-fun m!216921 () Bool)

(assert (=> b!141065 m!216921))

(push 1)

(assert (not b!141064))

(assert (not b!141066))

(assert (not b!141063))

(assert (not start!27450))

(assert (not b!141071))

(assert (not b!141068))

(assert (not b!141067))

(assert (not b!141069))

(assert (not b!141065))

(check-sat)

(pop 1)

(push 1)

(check-sat)


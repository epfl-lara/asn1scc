; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27458 () Bool)

(assert start!27458)

(declare-fun b!141176 () Bool)

(declare-fun res!117744 () Bool)

(declare-fun e!94054 () Bool)

(assert (=> b!141176 (=> (not res!117744) (not e!94054))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6473 0))(
  ( (array!6474 (arr!3637 (Array (_ BitVec 32) (_ BitVec 8))) (size!2930 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5118 0))(
  ( (BitStream!5119 (buf!3351 array!6473) (currentByte!6211 (_ BitVec 32)) (currentBit!6206 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5118)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141176 (= res!117744 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2930 (buf!3351 thiss!1634))) ((_ sign_extend 32) (currentByte!6211 thiss!1634)) ((_ sign_extend 32) (currentBit!6206 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141177 () Bool)

(declare-fun res!117745 () Bool)

(declare-fun e!94056 () Bool)

(assert (=> b!141177 (=> (not res!117745) (not e!94056))))

(declare-datatypes ((Unit!8842 0))(
  ( (Unit!8843) )
))
(declare-datatypes ((tuple2!12460 0))(
  ( (tuple2!12461 (_1!6560 Unit!8842) (_2!6560 BitStream!5118)) )
))
(declare-fun lt!219322 () tuple2!12460)

(declare-fun isPrefixOf!0 (BitStream!5118 BitStream!5118) Bool)

(assert (=> b!141177 (= res!117745 (isPrefixOf!0 thiss!1634 (_2!6560 lt!219322)))))

(declare-fun b!141178 () Bool)

(declare-fun e!94052 () Bool)

(assert (=> b!141178 (= e!94054 (not e!94052))))

(declare-fun res!117740 () Bool)

(assert (=> b!141178 (=> res!117740 e!94052)))

(assert (=> b!141178 (= res!117740 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (=> b!141178 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2930 (buf!3351 (_2!6560 lt!219322)))) ((_ sign_extend 32) (currentByte!6211 (_2!6560 lt!219322))) ((_ sign_extend 32) (currentBit!6206 (_2!6560 lt!219322))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219319 () Unit!8842)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5118 BitStream!5118 (_ BitVec 64) (_ BitVec 32)) Unit!8842)

(assert (=> b!141178 (= lt!219319 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6560 lt!219322) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141178 e!94056))

(declare-fun res!117742 () Bool)

(assert (=> b!141178 (=> (not res!117742) (not e!94056))))

(assert (=> b!141178 (= res!117742 (= (size!2930 (buf!3351 thiss!1634)) (size!2930 (buf!3351 (_2!6560 lt!219322)))))))

(declare-fun arr!237 () array!6473)

(declare-fun appendByte!0 (BitStream!5118 (_ BitVec 8)) tuple2!12460)

(assert (=> b!141178 (= lt!219322 (appendByte!0 thiss!1634 (select (arr!3637 arr!237) from!447)))))

(declare-fun b!141179 () Bool)

(declare-fun res!117743 () Bool)

(assert (=> b!141179 (=> (not res!117743) (not e!94056))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141179 (= res!117743 (= (bitIndex!0 (size!2930 (buf!3351 (_2!6560 lt!219322))) (currentByte!6211 (_2!6560 lt!219322)) (currentBit!6206 (_2!6560 lt!219322))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2930 (buf!3351 thiss!1634)) (currentByte!6211 thiss!1634) (currentBit!6206 thiss!1634)))))))

(declare-fun b!141180 () Bool)

(declare-fun e!94055 () Bool)

(declare-fun array_inv!2719 (array!6473) Bool)

(assert (=> b!141180 (= e!94055 (array_inv!2719 (buf!3351 thiss!1634)))))

(declare-fun b!141181 () Bool)

(declare-fun res!117737 () Bool)

(assert (=> b!141181 (=> (not res!117737) (not e!94054))))

(assert (=> b!141181 (= res!117737 (bvslt from!447 to!404))))

(declare-fun b!141182 () Bool)

(declare-fun res!117738 () Bool)

(assert (=> b!141182 (=> (not res!117738) (not e!94054))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141182 (= res!117738 (invariant!0 (currentBit!6206 thiss!1634) (currentByte!6211 thiss!1634) (size!2930 (buf!3351 thiss!1634))))))

(declare-fun b!141184 () Bool)

(declare-datatypes ((tuple2!12462 0))(
  ( (tuple2!12463 (_1!6561 BitStream!5118) (_2!6561 BitStream!5118)) )
))
(declare-fun lt!219323 () tuple2!12462)

(declare-datatypes ((tuple2!12464 0))(
  ( (tuple2!12465 (_1!6562 BitStream!5118) (_2!6562 (_ BitVec 8))) )
))
(declare-fun lt!219320 () tuple2!12464)

(assert (=> b!141184 (= e!94056 (and (= (_2!6562 lt!219320) (select (arr!3637 arr!237) from!447)) (= (_1!6562 lt!219320) (_2!6561 lt!219323))))))

(declare-fun readBytePure!0 (BitStream!5118) tuple2!12464)

(assert (=> b!141184 (= lt!219320 (readBytePure!0 (_1!6561 lt!219323)))))

(declare-fun reader!0 (BitStream!5118 BitStream!5118) tuple2!12462)

(assert (=> b!141184 (= lt!219323 (reader!0 thiss!1634 (_2!6560 lt!219322)))))

(declare-fun b!141185 () Bool)

(declare-fun e!94053 () Bool)

(assert (=> b!141185 (= e!94052 e!94053)))

(declare-fun res!117739 () Bool)

(assert (=> b!141185 (=> res!117739 e!94053)))

(declare-fun lt!219321 () (_ BitVec 32))

(assert (=> b!141185 (= res!117739 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2930 (buf!3351 (_2!6560 lt!219322)))) ((_ sign_extend 32) (currentByte!6211 (_2!6560 lt!219322))) ((_ sign_extend 32) (currentBit!6206 (_2!6560 lt!219322))) lt!219321)))))

(assert (=> b!141185 (= lt!219321 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!141183 () Bool)

(assert (=> b!141183 (= e!94053 (bvslt lt!219321 (bvsub to!404 from!447)))))

(declare-fun res!117741 () Bool)

(assert (=> start!27458 (=> (not res!117741) (not e!94054))))

(assert (=> start!27458 (= res!117741 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2930 arr!237))))))

(assert (=> start!27458 e!94054))

(assert (=> start!27458 true))

(assert (=> start!27458 (array_inv!2719 arr!237)))

(declare-fun inv!12 (BitStream!5118) Bool)

(assert (=> start!27458 (and (inv!12 thiss!1634) e!94055)))

(assert (= (and start!27458 res!117741) b!141176))

(assert (= (and b!141176 res!117744) b!141181))

(assert (= (and b!141181 res!117737) b!141182))

(assert (= (and b!141182 res!117738) b!141178))

(assert (= (and b!141178 res!117742) b!141179))

(assert (= (and b!141179 res!117743) b!141177))

(assert (= (and b!141177 res!117745) b!141184))

(assert (= (and b!141178 (not res!117740)) b!141185))

(assert (= (and b!141185 (not res!117739)) b!141183))

(assert (= start!27458 b!141180))

(declare-fun m!217013 () Bool)

(assert (=> b!141185 m!217013))

(declare-fun m!217015 () Bool)

(assert (=> b!141178 m!217015))

(declare-fun m!217017 () Bool)

(assert (=> b!141178 m!217017))

(declare-fun m!217019 () Bool)

(assert (=> b!141178 m!217019))

(assert (=> b!141178 m!217019))

(declare-fun m!217021 () Bool)

(assert (=> b!141178 m!217021))

(declare-fun m!217023 () Bool)

(assert (=> b!141176 m!217023))

(declare-fun m!217025 () Bool)

(assert (=> b!141179 m!217025))

(declare-fun m!217027 () Bool)

(assert (=> b!141179 m!217027))

(declare-fun m!217029 () Bool)

(assert (=> start!27458 m!217029))

(declare-fun m!217031 () Bool)

(assert (=> start!27458 m!217031))

(assert (=> b!141184 m!217019))

(declare-fun m!217033 () Bool)

(assert (=> b!141184 m!217033))

(declare-fun m!217035 () Bool)

(assert (=> b!141184 m!217035))

(declare-fun m!217037 () Bool)

(assert (=> b!141177 m!217037))

(declare-fun m!217039 () Bool)

(assert (=> b!141182 m!217039))

(declare-fun m!217041 () Bool)

(assert (=> b!141180 m!217041))

(check-sat (not start!27458) (not b!141180) (not b!141185) (not b!141179) (not b!141177) (not b!141182) (not b!141184) (not b!141178) (not b!141176))
(check-sat)

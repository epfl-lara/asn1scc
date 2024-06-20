; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27454 () Bool)

(assert start!27454)

(declare-fun b!141117 () Bool)

(declare-fun res!117691 () Bool)

(declare-fun e!94011 () Bool)

(assert (=> b!141117 (=> (not res!117691) (not e!94011))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!141117 (= res!117691 (bvslt from!447 to!404))))

(declare-fun b!141118 () Bool)

(declare-fun res!117690 () Bool)

(assert (=> b!141118 (=> (not res!117690) (not e!94011))))

(declare-datatypes ((array!6469 0))(
  ( (array!6470 (arr!3635 (Array (_ BitVec 32) (_ BitVec 8))) (size!2928 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5114 0))(
  ( (BitStream!5115 (buf!3349 array!6469) (currentByte!6209 (_ BitVec 32)) (currentBit!6204 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5114)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141118 (= res!117690 (invariant!0 (currentBit!6204 thiss!1634) (currentByte!6209 thiss!1634) (size!2928 (buf!3349 thiss!1634))))))

(declare-fun b!141119 () Bool)

(declare-fun e!94010 () Bool)

(declare-fun array_inv!2717 (array!6469) Bool)

(assert (=> b!141119 (= e!94010 (array_inv!2717 (buf!3349 thiss!1634)))))

(declare-fun b!141120 () Bool)

(declare-fun e!94013 () Bool)

(assert (=> b!141120 (= e!94011 (not e!94013))))

(declare-fun res!117687 () Bool)

(assert (=> b!141120 (=> res!117687 e!94013)))

(assert (=> b!141120 (= res!117687 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-datatypes ((Unit!8838 0))(
  ( (Unit!8839) )
))
(declare-datatypes ((tuple2!12448 0))(
  ( (tuple2!12449 (_1!6554 Unit!8838) (_2!6554 BitStream!5114)) )
))
(declare-fun lt!219290 () tuple2!12448)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141120 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2928 (buf!3349 (_2!6554 lt!219290)))) ((_ sign_extend 32) (currentByte!6209 (_2!6554 lt!219290))) ((_ sign_extend 32) (currentBit!6204 (_2!6554 lt!219290))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219291 () Unit!8838)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5114 BitStream!5114 (_ BitVec 64) (_ BitVec 32)) Unit!8838)

(assert (=> b!141120 (= lt!219291 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6554 lt!219290) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94012 () Bool)

(assert (=> b!141120 e!94012))

(declare-fun res!117686 () Bool)

(assert (=> b!141120 (=> (not res!117686) (not e!94012))))

(assert (=> b!141120 (= res!117686 (= (size!2928 (buf!3349 thiss!1634)) (size!2928 (buf!3349 (_2!6554 lt!219290)))))))

(declare-fun arr!237 () array!6469)

(declare-fun appendByte!0 (BitStream!5114 (_ BitVec 8)) tuple2!12448)

(assert (=> b!141120 (= lt!219290 (appendByte!0 thiss!1634 (select (arr!3635 arr!237) from!447)))))

(declare-fun b!141121 () Bool)

(declare-fun res!117688 () Bool)

(assert (=> b!141121 (=> (not res!117688) (not e!94011))))

(assert (=> b!141121 (= res!117688 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2928 (buf!3349 thiss!1634))) ((_ sign_extend 32) (currentByte!6209 thiss!1634)) ((_ sign_extend 32) (currentBit!6204 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!117684 () Bool)

(assert (=> start!27454 (=> (not res!117684) (not e!94011))))

(assert (=> start!27454 (= res!117684 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2928 arr!237))))))

(assert (=> start!27454 e!94011))

(assert (=> start!27454 true))

(assert (=> start!27454 (array_inv!2717 arr!237)))

(declare-fun inv!12 (BitStream!5114) Bool)

(assert (=> start!27454 (and (inv!12 thiss!1634) e!94010)))

(declare-fun b!141122 () Bool)

(declare-fun res!117689 () Bool)

(assert (=> b!141122 (=> (not res!117689) (not e!94012))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141122 (= res!117689 (= (bitIndex!0 (size!2928 (buf!3349 (_2!6554 lt!219290))) (currentByte!6209 (_2!6554 lt!219290)) (currentBit!6204 (_2!6554 lt!219290))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2928 (buf!3349 thiss!1634)) (currentByte!6209 thiss!1634) (currentBit!6204 thiss!1634)))))))

(declare-fun b!141123 () Bool)

(declare-fun res!117685 () Bool)

(assert (=> b!141123 (=> (not res!117685) (not e!94012))))

(declare-fun isPrefixOf!0 (BitStream!5114 BitStream!5114) Bool)

(assert (=> b!141123 (= res!117685 (isPrefixOf!0 thiss!1634 (_2!6554 lt!219290)))))

(declare-datatypes ((tuple2!12450 0))(
  ( (tuple2!12451 (_1!6555 BitStream!5114) (_2!6555 BitStream!5114)) )
))
(declare-fun lt!219292 () tuple2!12450)

(declare-fun b!141124 () Bool)

(declare-datatypes ((tuple2!12452 0))(
  ( (tuple2!12453 (_1!6556 BitStream!5114) (_2!6556 (_ BitVec 8))) )
))
(declare-fun lt!219293 () tuple2!12452)

(assert (=> b!141124 (= e!94012 (and (= (_2!6556 lt!219293) (select (arr!3635 arr!237) from!447)) (= (_1!6556 lt!219293) (_2!6555 lt!219292))))))

(declare-fun readBytePure!0 (BitStream!5114) tuple2!12452)

(assert (=> b!141124 (= lt!219293 (readBytePure!0 (_1!6555 lt!219292)))))

(declare-fun reader!0 (BitStream!5114 BitStream!5114) tuple2!12450)

(assert (=> b!141124 (= lt!219292 (reader!0 thiss!1634 (_2!6554 lt!219290)))))

(declare-fun b!141125 () Bool)

(assert (=> b!141125 (= e!94013 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2928 (buf!3349 (_2!6554 lt!219290)))) ((_ sign_extend 32) (currentByte!6209 (_2!6554 lt!219290))) ((_ sign_extend 32) (currentBit!6204 (_2!6554 lt!219290))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27454 res!117684) b!141121))

(assert (= (and b!141121 res!117688) b!141117))

(assert (= (and b!141117 res!117691) b!141118))

(assert (= (and b!141118 res!117690) b!141120))

(assert (= (and b!141120 res!117686) b!141122))

(assert (= (and b!141122 res!117689) b!141123))

(assert (= (and b!141123 res!117685) b!141124))

(assert (= (and b!141120 (not res!117687)) b!141125))

(assert (= start!27454 b!141119))

(declare-fun m!216953 () Bool)

(assert (=> start!27454 m!216953))

(declare-fun m!216955 () Bool)

(assert (=> start!27454 m!216955))

(declare-fun m!216957 () Bool)

(assert (=> b!141119 m!216957))

(declare-fun m!216959 () Bool)

(assert (=> b!141121 m!216959))

(declare-fun m!216961 () Bool)

(assert (=> b!141125 m!216961))

(declare-fun m!216963 () Bool)

(assert (=> b!141124 m!216963))

(declare-fun m!216965 () Bool)

(assert (=> b!141124 m!216965))

(declare-fun m!216967 () Bool)

(assert (=> b!141124 m!216967))

(declare-fun m!216969 () Bool)

(assert (=> b!141118 m!216969))

(declare-fun m!216971 () Bool)

(assert (=> b!141122 m!216971))

(declare-fun m!216973 () Bool)

(assert (=> b!141122 m!216973))

(declare-fun m!216975 () Bool)

(assert (=> b!141123 m!216975))

(declare-fun m!216977 () Bool)

(assert (=> b!141120 m!216977))

(declare-fun m!216979 () Bool)

(assert (=> b!141120 m!216979))

(assert (=> b!141120 m!216963))

(assert (=> b!141120 m!216963))

(declare-fun m!216981 () Bool)

(assert (=> b!141120 m!216981))

(push 1)

(assert (not b!141121))

(assert (not b!141118))

(assert (not b!141122))

(assert (not b!141119))

(assert (not b!141123))

(assert (not b!141124))

(assert (not b!141125))

(assert (not b!141120))

(assert (not start!27454))

(check-sat)

(pop 1)

(push 1)

(check-sat)


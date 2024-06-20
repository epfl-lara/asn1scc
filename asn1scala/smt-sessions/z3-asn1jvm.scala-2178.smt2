; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55170 () Bool)

(assert start!55170)

(declare-fun b!257514 () Bool)

(declare-fun e!178574 () Bool)

(declare-datatypes ((array!14006 0))(
  ( (array!14007 (arr!7130 (Array (_ BitVec 32) (_ BitVec 8))) (size!6143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11208 0))(
  ( (BitStream!11209 (buf!6665 array!14006) (currentByte!12210 (_ BitVec 32)) (currentBit!12205 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11208)

(declare-fun array_inv!5884 (array!14006) Bool)

(assert (=> b!257514 (= e!178574 (array_inv!5884 (buf!6665 thiss!1754)))))

(declare-fun b!257515 () Bool)

(declare-fun e!178576 () Bool)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257515 (= e!178576 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))))

(declare-datatypes ((tuple2!22036 0))(
  ( (tuple2!22037 (_1!11954 Bool) (_2!11954 BitStream!11208)) )
))
(declare-fun lt!398755 () tuple2!22036)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257515 (validate_offset_bits!1 ((_ sign_extend 32) (size!6143 (buf!6665 (_2!11954 lt!398755)))) ((_ sign_extend 32) (currentByte!12210 (_2!11954 lt!398755))) ((_ sign_extend 32) (currentBit!12205 (_2!11954 lt!398755))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18389 0))(
  ( (Unit!18390) )
))
(declare-fun lt!398756 () Unit!18389)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11208 BitStream!11208 (_ BitVec 64) (_ BitVec 64)) Unit!18389)

(assert (=> b!257515 (= lt!398756 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11954 lt!398755) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257516 () Bool)

(declare-fun res!215815 () Bool)

(declare-fun e!178575 () Bool)

(assert (=> b!257516 (=> (not res!215815) (not e!178575))))

(assert (=> b!257516 (= res!215815 (not (= from!526 nBits!535)))))

(declare-fun res!215814 () Bool)

(assert (=> start!55170 (=> (not res!215814) (not e!178575))))

(assert (=> start!55170 (= res!215814 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55170 e!178575))

(assert (=> start!55170 true))

(declare-fun inv!12 (BitStream!11208) Bool)

(assert (=> start!55170 (and (inv!12 thiss!1754) e!178574)))

(declare-fun b!257517 () Bool)

(assert (=> b!257517 (= e!178575 e!178576)))

(declare-fun res!215812 () Bool)

(assert (=> b!257517 (=> (not res!215812) (not e!178576))))

(declare-fun expected!109 () Bool)

(assert (=> b!257517 (= res!215812 (= (_1!11954 lt!398755) expected!109))))

(declare-fun readBit!0 (BitStream!11208) tuple2!22036)

(assert (=> b!257517 (= lt!398755 (readBit!0 thiss!1754))))

(declare-fun b!257518 () Bool)

(declare-fun res!215813 () Bool)

(assert (=> b!257518 (=> (not res!215813) (not e!178575))))

(assert (=> b!257518 (= res!215813 (validate_offset_bits!1 ((_ sign_extend 32) (size!6143 (buf!6665 thiss!1754))) ((_ sign_extend 32) (currentByte!12210 thiss!1754)) ((_ sign_extend 32) (currentBit!12205 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55170 res!215814) b!257518))

(assert (= (and b!257518 res!215813) b!257516))

(assert (= (and b!257516 res!215815) b!257517))

(assert (= (and b!257517 res!215812) b!257515))

(assert (= start!55170 b!257514))

(declare-fun m!387005 () Bool)

(assert (=> b!257518 m!387005))

(declare-fun m!387007 () Bool)

(assert (=> b!257514 m!387007))

(declare-fun m!387009 () Bool)

(assert (=> b!257517 m!387009))

(declare-fun m!387011 () Bool)

(assert (=> start!55170 m!387011))

(declare-fun m!387013 () Bool)

(assert (=> b!257515 m!387013))

(declare-fun m!387015 () Bool)

(assert (=> b!257515 m!387015))

(check-sat (not b!257514) (not b!257515) (not start!55170) (not b!257518) (not b!257517))
(check-sat)

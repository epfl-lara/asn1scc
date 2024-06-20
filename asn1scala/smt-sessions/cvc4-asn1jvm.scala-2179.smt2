; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55178 () Bool)

(assert start!55178)

(declare-fun b!257582 () Bool)

(declare-fun res!215871 () Bool)

(declare-fun e!178631 () Bool)

(assert (=> b!257582 (=> (not res!215871) (not e!178631))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257582 (= res!215871 (not (= from!526 nBits!535)))))

(declare-fun b!257583 () Bool)

(declare-fun e!178633 () Bool)

(declare-fun e!178629 () Bool)

(assert (=> b!257583 (= e!178633 (not e!178629))))

(declare-fun res!215870 () Bool)

(assert (=> b!257583 (=> res!215870 e!178629)))

(assert (=> b!257583 (= res!215870 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-datatypes ((array!14014 0))(
  ( (array!14015 (arr!7134 (Array (_ BitVec 32) (_ BitVec 8))) (size!6147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11216 0))(
  ( (BitStream!11217 (buf!6669 array!14014) (currentByte!12214 (_ BitVec 32)) (currentBit!12209 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22044 0))(
  ( (tuple2!22045 (_1!11958 Bool) (_2!11958 BitStream!11216)) )
))
(declare-fun lt!398779 () tuple2!22044)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257583 (validate_offset_bits!1 ((_ sign_extend 32) (size!6147 (buf!6669 (_2!11958 lt!398779)))) ((_ sign_extend 32) (currentByte!12214 (_2!11958 lt!398779))) ((_ sign_extend 32) (currentBit!12209 (_2!11958 lt!398779))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1754 () BitStream!11216)

(declare-datatypes ((Unit!18397 0))(
  ( (Unit!18398) )
))
(declare-fun lt!398780 () Unit!18397)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11216 BitStream!11216 (_ BitVec 64) (_ BitVec 64)) Unit!18397)

(assert (=> b!257583 (= lt!398780 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11958 lt!398779) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257584 () Bool)

(declare-fun e!178630 () Bool)

(declare-fun array_inv!5888 (array!14014) Bool)

(assert (=> b!257584 (= e!178630 (array_inv!5888 (buf!6669 thiss!1754)))))

(declare-fun b!257585 () Bool)

(declare-fun res!215869 () Bool)

(assert (=> b!257585 (=> (not res!215869) (not e!178631))))

(assert (=> b!257585 (= res!215869 (validate_offset_bits!1 ((_ sign_extend 32) (size!6147 (buf!6669 thiss!1754))) ((_ sign_extend 32) (currentByte!12214 thiss!1754)) ((_ sign_extend 32) (currentBit!12209 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215872 () Bool)

(assert (=> start!55178 (=> (not res!215872) (not e!178631))))

(assert (=> start!55178 (= res!215872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55178 e!178631))

(assert (=> start!55178 true))

(declare-fun inv!12 (BitStream!11216) Bool)

(assert (=> start!55178 (and (inv!12 thiss!1754) e!178630)))

(declare-fun b!257586 () Bool)

(assert (=> b!257586 (= e!178631 e!178633)))

(declare-fun res!215868 () Bool)

(assert (=> b!257586 (=> (not res!215868) (not e!178633))))

(declare-fun expected!109 () Bool)

(assert (=> b!257586 (= res!215868 (= (_1!11958 lt!398779) expected!109))))

(declare-fun readBit!0 (BitStream!11216) tuple2!22044)

(assert (=> b!257586 (= lt!398779 (readBit!0 thiss!1754))))

(declare-fun b!257587 () Bool)

(assert (=> b!257587 (= e!178629 (validate_offset_bits!1 ((_ sign_extend 32) (size!6147 (buf!6669 (_2!11958 lt!398779)))) ((_ sign_extend 32) (currentByte!12214 (_2!11958 lt!398779))) ((_ sign_extend 32) (currentBit!12209 (_2!11958 lt!398779))) (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))))))

(assert (= (and start!55178 res!215872) b!257585))

(assert (= (and b!257585 res!215869) b!257582))

(assert (= (and b!257582 res!215871) b!257586))

(assert (= (and b!257586 res!215868) b!257583))

(assert (= (and b!257583 (not res!215870)) b!257587))

(assert (= start!55178 b!257584))

(declare-fun m!387057 () Bool)

(assert (=> start!55178 m!387057))

(declare-fun m!387059 () Bool)

(assert (=> b!257583 m!387059))

(declare-fun m!387061 () Bool)

(assert (=> b!257583 m!387061))

(declare-fun m!387063 () Bool)

(assert (=> b!257586 m!387063))

(declare-fun m!387065 () Bool)

(assert (=> b!257585 m!387065))

(declare-fun m!387067 () Bool)

(assert (=> b!257584 m!387067))

(declare-fun m!387069 () Bool)

(assert (=> b!257587 m!387069))

(push 1)

(assert (not b!257587))

(assert (not b!257585))

(assert (not b!257586))

(assert (not b!257583))

(assert (not start!55178))

(assert (not b!257584))

(check-sat)

(pop 1)

(push 1)

(check-sat)


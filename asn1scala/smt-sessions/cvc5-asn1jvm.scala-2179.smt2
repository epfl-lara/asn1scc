; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55174 () Bool)

(assert start!55174)

(declare-fun b!257546 () Bool)

(declare-fun e!178600 () Bool)

(declare-datatypes ((array!14010 0))(
  ( (array!14011 (arr!7132 (Array (_ BitVec 32) (_ BitVec 8))) (size!6145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11212 0))(
  ( (BitStream!11213 (buf!6667 array!14010) (currentByte!12212 (_ BitVec 32)) (currentBit!12207 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11212)

(declare-fun array_inv!5886 (array!14010) Bool)

(assert (=> b!257546 (= e!178600 (array_inv!5886 (buf!6667 thiss!1754)))))

(declare-fun b!257547 () Bool)

(declare-fun e!178602 () Bool)

(declare-fun e!178603 () Bool)

(assert (=> b!257547 (= e!178602 (not e!178603))))

(declare-fun res!215841 () Bool)

(assert (=> b!257547 (=> res!215841 e!178603)))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257547 (= res!215841 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-datatypes ((tuple2!22040 0))(
  ( (tuple2!22041 (_1!11956 Bool) (_2!11956 BitStream!11212)) )
))
(declare-fun lt!398767 () tuple2!22040)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257547 (validate_offset_bits!1 ((_ sign_extend 32) (size!6145 (buf!6667 (_2!11956 lt!398767)))) ((_ sign_extend 32) (currentByte!12212 (_2!11956 lt!398767))) ((_ sign_extend 32) (currentBit!12207 (_2!11956 lt!398767))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18393 0))(
  ( (Unit!18394) )
))
(declare-fun lt!398768 () Unit!18393)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11212 BitStream!11212 (_ BitVec 64) (_ BitVec 64)) Unit!18393)

(assert (=> b!257547 (= lt!398768 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11956 lt!398767) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257548 () Bool)

(assert (=> b!257548 (= e!178603 (validate_offset_bits!1 ((_ sign_extend 32) (size!6145 (buf!6667 (_2!11956 lt!398767)))) ((_ sign_extend 32) (currentByte!12212 (_2!11956 lt!398767))) ((_ sign_extend 32) (currentBit!12207 (_2!11956 lt!398767))) (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))))))

(declare-fun b!257550 () Bool)

(declare-fun e!178601 () Bool)

(assert (=> b!257550 (= e!178601 e!178602)))

(declare-fun res!215838 () Bool)

(assert (=> b!257550 (=> (not res!215838) (not e!178602))))

(declare-fun expected!109 () Bool)

(assert (=> b!257550 (= res!215838 (= (_1!11956 lt!398767) expected!109))))

(declare-fun readBit!0 (BitStream!11212) tuple2!22040)

(assert (=> b!257550 (= lt!398767 (readBit!0 thiss!1754))))

(declare-fun b!257551 () Bool)

(declare-fun res!215840 () Bool)

(assert (=> b!257551 (=> (not res!215840) (not e!178601))))

(assert (=> b!257551 (= res!215840 (not (= from!526 nBits!535)))))

(declare-fun res!215839 () Bool)

(assert (=> start!55174 (=> (not res!215839) (not e!178601))))

(assert (=> start!55174 (= res!215839 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55174 e!178601))

(assert (=> start!55174 true))

(declare-fun inv!12 (BitStream!11212) Bool)

(assert (=> start!55174 (and (inv!12 thiss!1754) e!178600)))

(declare-fun b!257549 () Bool)

(declare-fun res!215842 () Bool)

(assert (=> b!257549 (=> (not res!215842) (not e!178601))))

(assert (=> b!257549 (= res!215842 (validate_offset_bits!1 ((_ sign_extend 32) (size!6145 (buf!6667 thiss!1754))) ((_ sign_extend 32) (currentByte!12212 thiss!1754)) ((_ sign_extend 32) (currentBit!12207 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55174 res!215839) b!257549))

(assert (= (and b!257549 res!215842) b!257551))

(assert (= (and b!257551 res!215840) b!257550))

(assert (= (and b!257550 res!215838) b!257547))

(assert (= (and b!257547 (not res!215841)) b!257548))

(assert (= start!55174 b!257546))

(declare-fun m!387029 () Bool)

(assert (=> b!257546 m!387029))

(declare-fun m!387031 () Bool)

(assert (=> b!257550 m!387031))

(declare-fun m!387033 () Bool)

(assert (=> b!257547 m!387033))

(declare-fun m!387035 () Bool)

(assert (=> b!257547 m!387035))

(declare-fun m!387037 () Bool)

(assert (=> b!257548 m!387037))

(declare-fun m!387039 () Bool)

(assert (=> b!257549 m!387039))

(declare-fun m!387041 () Bool)

(assert (=> start!55174 m!387041))

(push 1)

(assert (not b!257550))

(assert (not b!257548))

(assert (not b!257546))

(assert (not b!257549))

(assert (not start!55174))

(assert (not b!257547))

(check-sat)

(pop 1)

(push 1)

(check-sat)


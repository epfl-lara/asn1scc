; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55172 () Bool)

(assert start!55172)

(declare-fun b!257529 () Bool)

(declare-fun e!178586 () Bool)

(declare-datatypes ((array!14008 0))(
  ( (array!14009 (arr!7131 (Array (_ BitVec 32) (_ BitVec 8))) (size!6144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11210 0))(
  ( (BitStream!11211 (buf!6666 array!14008) (currentByte!12211 (_ BitVec 32)) (currentBit!12206 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11210)

(declare-fun array_inv!5885 (array!14008) Bool)

(assert (=> b!257529 (= e!178586 (array_inv!5885 (buf!6666 thiss!1754)))))

(declare-fun b!257530 () Bool)

(declare-fun e!178585 () Bool)

(declare-fun e!178587 () Bool)

(assert (=> b!257530 (= e!178585 e!178587)))

(declare-fun res!215825 () Bool)

(assert (=> b!257530 (=> (not res!215825) (not e!178587))))

(declare-datatypes ((tuple2!22038 0))(
  ( (tuple2!22039 (_1!11955 Bool) (_2!11955 BitStream!11210)) )
))
(declare-fun lt!398762 () tuple2!22038)

(declare-fun expected!109 () Bool)

(assert (=> b!257530 (= res!215825 (= (_1!11955 lt!398762) expected!109))))

(declare-fun readBit!0 (BitStream!11210) tuple2!22038)

(assert (=> b!257530 (= lt!398762 (readBit!0 thiss!1754))))

(declare-fun b!257531 () Bool)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257531 (= e!178587 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257531 (validate_offset_bits!1 ((_ sign_extend 32) (size!6144 (buf!6666 (_2!11955 lt!398762)))) ((_ sign_extend 32) (currentByte!12211 (_2!11955 lt!398762))) ((_ sign_extend 32) (currentBit!12206 (_2!11955 lt!398762))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18391 0))(
  ( (Unit!18392) )
))
(declare-fun lt!398761 () Unit!18391)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11210 BitStream!11210 (_ BitVec 64) (_ BitVec 64)) Unit!18391)

(assert (=> b!257531 (= lt!398761 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11955 lt!398762) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257532 () Bool)

(declare-fun res!215826 () Bool)

(assert (=> b!257532 (=> (not res!215826) (not e!178585))))

(assert (=> b!257532 (= res!215826 (validate_offset_bits!1 ((_ sign_extend 32) (size!6144 (buf!6666 thiss!1754))) ((_ sign_extend 32) (currentByte!12211 thiss!1754)) ((_ sign_extend 32) (currentBit!12206 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257533 () Bool)

(declare-fun res!215824 () Bool)

(assert (=> b!257533 (=> (not res!215824) (not e!178585))))

(assert (=> b!257533 (= res!215824 (not (= from!526 nBits!535)))))

(declare-fun res!215827 () Bool)

(assert (=> start!55172 (=> (not res!215827) (not e!178585))))

(assert (=> start!55172 (= res!215827 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55172 e!178585))

(assert (=> start!55172 true))

(declare-fun inv!12 (BitStream!11210) Bool)

(assert (=> start!55172 (and (inv!12 thiss!1754) e!178586)))

(assert (= (and start!55172 res!215827) b!257532))

(assert (= (and b!257532 res!215826) b!257533))

(assert (= (and b!257533 res!215824) b!257530))

(assert (= (and b!257530 res!215825) b!257531))

(assert (= start!55172 b!257529))

(declare-fun m!387017 () Bool)

(assert (=> start!55172 m!387017))

(declare-fun m!387019 () Bool)

(assert (=> b!257530 m!387019))

(declare-fun m!387021 () Bool)

(assert (=> b!257529 m!387021))

(declare-fun m!387023 () Bool)

(assert (=> b!257532 m!387023))

(declare-fun m!387025 () Bool)

(assert (=> b!257531 m!387025))

(declare-fun m!387027 () Bool)

(assert (=> b!257531 m!387027))

(push 1)

(assert (not b!257530))

(assert (not start!55172))

(assert (not b!257529))

(assert (not b!257532))

(assert (not b!257531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


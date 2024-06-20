; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52428 () Bool)

(assert start!52428)

(declare-fun b!241315 () Bool)

(declare-fun e!167255 () Bool)

(declare-fun e!167258 () Bool)

(assert (=> b!241315 (= e!167255 e!167258)))

(declare-fun res!201441 () Bool)

(assert (=> b!241315 (=> (not res!201441) (not e!167258))))

(declare-datatypes ((array!13239 0))(
  ( (array!13240 (arr!6786 (Array (_ BitVec 32) (_ BitVec 8))) (size!5799 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10520 0))(
  ( (BitStream!10521 (buf!6265 array!13239) (currentByte!11628 (_ BitVec 32)) (currentBit!11623 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17681 0))(
  ( (Unit!17682) )
))
(declare-datatypes ((tuple2!20576 0))(
  ( (tuple2!20577 (_1!11210 Unit!17681) (_2!11210 BitStream!10520)) )
))
(declare-fun lt!376888 () tuple2!20576)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20578 0))(
  ( (tuple2!20579 (_1!11211 BitStream!10520) (_2!11211 Bool)) )
))
(declare-fun lt!376889 () tuple2!20578)

(assert (=> b!241315 (= res!201441 (and (= (_2!11211 lt!376889) bit!26) (= (_1!11211 lt!376889) (_2!11210 lt!376888))))))

(declare-fun thiss!1005 () BitStream!10520)

(declare-fun readBitPure!0 (BitStream!10520) tuple2!20578)

(declare-fun readerFrom!0 (BitStream!10520 (_ BitVec 32) (_ BitVec 32)) BitStream!10520)

(assert (=> b!241315 (= lt!376889 (readBitPure!0 (readerFrom!0 (_2!11210 lt!376888) (currentBit!11623 thiss!1005) (currentByte!11628 thiss!1005))))))

(declare-fun b!241316 () Bool)

(declare-fun e!167253 () Bool)

(assert (=> b!241316 (= e!167253 e!167255)))

(declare-fun res!201442 () Bool)

(assert (=> b!241316 (=> (not res!201442) (not e!167255))))

(declare-fun lt!376886 () (_ BitVec 64))

(declare-fun lt!376890 () (_ BitVec 64))

(assert (=> b!241316 (= res!201442 (= lt!376886 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376890)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241316 (= lt!376886 (bitIndex!0 (size!5799 (buf!6265 (_2!11210 lt!376888))) (currentByte!11628 (_2!11210 lt!376888)) (currentBit!11623 (_2!11210 lt!376888))))))

(assert (=> b!241316 (= lt!376890 (bitIndex!0 (size!5799 (buf!6265 thiss!1005)) (currentByte!11628 thiss!1005) (currentBit!11623 thiss!1005)))))

(declare-fun b!241317 () Bool)

(declare-fun e!167254 () Bool)

(assert (=> b!241317 (= e!167254 (not true))))

(declare-fun lt!376887 () (_ BitVec 64))

(assert (=> b!241317 (= lt!376887 (bitIndex!0 (size!5799 (buf!6265 (_2!11210 lt!376888))) (currentByte!11628 (_2!11210 lt!376888)) (currentBit!11623 (_2!11210 lt!376888))))))

(declare-fun lt!376885 () (_ BitVec 64))

(assert (=> b!241317 (= lt!376885 (bitIndex!0 (size!5799 (buf!6265 thiss!1005)) (currentByte!11628 thiss!1005) (currentBit!11623 thiss!1005)))))

(assert (=> b!241317 e!167253))

(declare-fun res!201440 () Bool)

(assert (=> b!241317 (=> (not res!201440) (not e!167253))))

(assert (=> b!241317 (= res!201440 (= (size!5799 (buf!6265 thiss!1005)) (size!5799 (buf!6265 (_2!11210 lt!376888)))))))

(declare-fun appendBit!0 (BitStream!10520 Bool) tuple2!20576)

(assert (=> b!241317 (= lt!376888 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241318 () Bool)

(declare-fun e!167257 () Bool)

(declare-fun array_inv!5540 (array!13239) Bool)

(assert (=> b!241318 (= e!167257 (array_inv!5540 (buf!6265 thiss!1005)))))

(declare-fun b!241320 () Bool)

(declare-fun res!201439 () Bool)

(assert (=> b!241320 (=> (not res!201439) (not e!167254))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241320 (= res!201439 (bvslt from!289 nBits!297))))

(declare-fun b!241321 () Bool)

(assert (=> b!241321 (= e!167258 (= (bitIndex!0 (size!5799 (buf!6265 (_1!11211 lt!376889))) (currentByte!11628 (_1!11211 lt!376889)) (currentBit!11623 (_1!11211 lt!376889))) lt!376886))))

(declare-fun b!241322 () Bool)

(declare-fun res!201443 () Bool)

(assert (=> b!241322 (=> (not res!201443) (not e!167254))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241322 (= res!201443 (validate_offset_bits!1 ((_ sign_extend 32) (size!5799 (buf!6265 thiss!1005))) ((_ sign_extend 32) (currentByte!11628 thiss!1005)) ((_ sign_extend 32) (currentBit!11623 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241319 () Bool)

(declare-fun res!201444 () Bool)

(assert (=> b!241319 (=> (not res!201444) (not e!167255))))

(declare-fun isPrefixOf!0 (BitStream!10520 BitStream!10520) Bool)

(assert (=> b!241319 (= res!201444 (isPrefixOf!0 thiss!1005 (_2!11210 lt!376888)))))

(declare-fun res!201438 () Bool)

(assert (=> start!52428 (=> (not res!201438) (not e!167254))))

(assert (=> start!52428 (= res!201438 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52428 e!167254))

(assert (=> start!52428 true))

(declare-fun inv!12 (BitStream!10520) Bool)

(assert (=> start!52428 (and (inv!12 thiss!1005) e!167257)))

(assert (= (and start!52428 res!201438) b!241322))

(assert (= (and b!241322 res!201443) b!241320))

(assert (= (and b!241320 res!201439) b!241317))

(assert (= (and b!241317 res!201440) b!241316))

(assert (= (and b!241316 res!201442) b!241319))

(assert (= (and b!241319 res!201444) b!241315))

(assert (= (and b!241315 res!201441) b!241321))

(assert (= start!52428 b!241318))

(declare-fun m!364011 () Bool)

(assert (=> b!241316 m!364011))

(declare-fun m!364013 () Bool)

(assert (=> b!241316 m!364013))

(declare-fun m!364015 () Bool)

(assert (=> b!241318 m!364015))

(declare-fun m!364017 () Bool)

(assert (=> b!241321 m!364017))

(declare-fun m!364019 () Bool)

(assert (=> start!52428 m!364019))

(declare-fun m!364021 () Bool)

(assert (=> b!241322 m!364021))

(declare-fun m!364023 () Bool)

(assert (=> b!241319 m!364023))

(assert (=> b!241317 m!364011))

(assert (=> b!241317 m!364013))

(declare-fun m!364025 () Bool)

(assert (=> b!241317 m!364025))

(declare-fun m!364027 () Bool)

(assert (=> b!241315 m!364027))

(assert (=> b!241315 m!364027))

(declare-fun m!364029 () Bool)

(assert (=> b!241315 m!364029))

(push 1)

(assert (not b!241319))

(assert (not start!52428))

(assert (not b!241317))

(assert (not b!241318))

(assert (not b!241315))

(assert (not b!241316))

(assert (not b!241322))

(assert (not b!241321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


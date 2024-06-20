; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55148 () Bool)

(assert start!55148)

(declare-fun b!257349 () Bool)

(declare-fun res!215681 () Bool)

(declare-fun e!178441 () Bool)

(assert (=> b!257349 (=> (not res!215681) (not e!178441))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257349 (= res!215681 (not (= from!526 nBits!535)))))

(declare-fun res!215680 () Bool)

(assert (=> start!55148 (=> (not res!215680) (not e!178441))))

(assert (=> start!55148 (= res!215680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55148 e!178441))

(assert (=> start!55148 true))

(declare-datatypes ((array!13984 0))(
  ( (array!13985 (arr!7119 (Array (_ BitVec 32) (_ BitVec 8))) (size!6132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11186 0))(
  ( (BitStream!11187 (buf!6654 array!13984) (currentByte!12199 (_ BitVec 32)) (currentBit!12194 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11186)

(declare-fun e!178443 () Bool)

(declare-fun inv!12 (BitStream!11186) Bool)

(assert (=> start!55148 (and (inv!12 thiss!1754) e!178443)))

(declare-fun b!257350 () Bool)

(declare-fun e!178442 () Bool)

(assert (=> b!257350 (= e!178441 e!178442)))

(declare-fun res!215683 () Bool)

(assert (=> b!257350 (=> (not res!215683) (not e!178442))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22014 0))(
  ( (tuple2!22015 (_1!11943 Bool) (_2!11943 BitStream!11186)) )
))
(declare-fun lt!398672 () tuple2!22014)

(assert (=> b!257350 (= res!215683 (and (= (_1!11943 lt!398672) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6132 (buf!6654 thiss!1754)) (size!6132 (buf!6654 (_2!11943 lt!398672))))))))

(declare-fun readBit!0 (BitStream!11186) tuple2!22014)

(assert (=> b!257350 (= lt!398672 (readBit!0 thiss!1754))))

(declare-fun b!257351 () Bool)

(declare-fun res!215682 () Bool)

(assert (=> b!257351 (=> (not res!215682) (not e!178441))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257351 (= res!215682 (validate_offset_bits!1 ((_ sign_extend 32) (size!6132 (buf!6654 thiss!1754))) ((_ sign_extend 32) (currentByte!12199 thiss!1754)) ((_ sign_extend 32) (currentBit!12194 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257352 () Bool)

(assert (=> b!257352 (= e!178442 false)))

(declare-fun lt!398671 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257352 (= lt!398671 (bitIndex!0 (size!6132 (buf!6654 (_2!11943 lt!398672))) (currentByte!12199 (_2!11943 lt!398672)) (currentBit!12194 (_2!11943 lt!398672))))))

(declare-fun lt!398670 () (_ BitVec 64))

(assert (=> b!257352 (= lt!398670 (bitIndex!0 (size!6132 (buf!6654 thiss!1754)) (currentByte!12199 thiss!1754) (currentBit!12194 thiss!1754)))))

(declare-fun b!257353 () Bool)

(declare-fun array_inv!5873 (array!13984) Bool)

(assert (=> b!257353 (= e!178443 (array_inv!5873 (buf!6654 thiss!1754)))))

(assert (= (and start!55148 res!215680) b!257351))

(assert (= (and b!257351 res!215682) b!257349))

(assert (= (and b!257349 res!215681) b!257350))

(assert (= (and b!257350 res!215683) b!257352))

(assert (= start!55148 b!257353))

(declare-fun m!386873 () Bool)

(assert (=> b!257350 m!386873))

(declare-fun m!386875 () Bool)

(assert (=> b!257353 m!386875))

(declare-fun m!386877 () Bool)

(assert (=> b!257351 m!386877))

(declare-fun m!386879 () Bool)

(assert (=> start!55148 m!386879))

(declare-fun m!386881 () Bool)

(assert (=> b!257352 m!386881))

(declare-fun m!386883 () Bool)

(assert (=> b!257352 m!386883))

(push 1)

(assert (not b!257353))

(assert (not b!257350))

(assert (not start!55148))

(assert (not b!257351))

(assert (not b!257352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21878 () Bool)

(assert start!21878)

(declare-fun b!110468 () Bool)

(declare-fun e!72455 () Bool)

(declare-fun e!72454 () Bool)

(assert (=> b!110468 (= e!72455 e!72454)))

(declare-fun res!91193 () Bool)

(assert (=> b!110468 (=> (not res!91193) (not e!72454))))

(declare-datatypes ((array!5058 0))(
  ( (array!5059 (arr!2894 (Array (_ BitVec 32) (_ BitVec 8))) (size!2301 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4076 0))(
  ( (BitStream!4077 (buf!2695 array!5058) (currentByte!5249 (_ BitVec 32)) (currentBit!5244 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4076)

(declare-fun lt!167159 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110468 (= res!91193 (validate_offset_bits!1 ((_ sign_extend 32) (size!2301 (buf!2695 thiss!1305))) ((_ sign_extend 32) (currentByte!5249 thiss!1305)) ((_ sign_extend 32) (currentBit!5244 thiss!1305)) lt!167159))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110468 (= lt!167159 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110469 () Bool)

(declare-fun res!91191 () Bool)

(assert (=> b!110469 (=> (not res!91191) (not e!72454))))

(assert (=> b!110469 (= res!91191 (bvsge i!615 nBits!396))))

(declare-fun res!91195 () Bool)

(assert (=> start!21878 (=> (not res!91195) (not e!72455))))

(assert (=> start!21878 (= res!91195 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21878 e!72455))

(assert (=> start!21878 true))

(declare-fun e!72456 () Bool)

(declare-fun inv!12 (BitStream!4076) Bool)

(assert (=> start!21878 (and (inv!12 thiss!1305) e!72456)))

(declare-fun b!110470 () Bool)

(declare-fun res!91194 () Bool)

(assert (=> b!110470 (=> (not res!91194) (not e!72454))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110470 (= res!91194 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110471 () Bool)

(declare-fun array_inv!2103 (array!5058) Bool)

(assert (=> b!110471 (= e!72456 (array_inv!2103 (buf!2695 thiss!1305)))))

(declare-fun b!110472 () Bool)

(declare-fun e!72458 () Bool)

(assert (=> b!110472 (= e!72458 true)))

(declare-datatypes ((Unit!6767 0))(
  ( (Unit!6768) )
))
(declare-fun lt!167158 () Unit!6767)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4076 array!5058 (_ BitVec 64)) Unit!6767)

(assert (=> b!110472 (= lt!167158 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2695 thiss!1305) lt!167159))))

(declare-datatypes ((tuple2!9196 0))(
  ( (tuple2!9197 (_1!4855 BitStream!4076) (_2!4855 BitStream!4076)) )
))
(declare-fun lt!167157 () tuple2!9196)

(declare-fun reader!0 (BitStream!4076 BitStream!4076) tuple2!9196)

(assert (=> b!110472 (= lt!167157 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110473 () Bool)

(assert (=> b!110473 (= e!72454 (not e!72458))))

(declare-fun res!91192 () Bool)

(assert (=> b!110473 (=> res!91192 e!72458)))

(declare-fun lt!167156 () (_ BitVec 64))

(assert (=> b!110473 (= res!91192 (not (= lt!167156 (bvadd lt!167156 lt!167159))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110473 (= lt!167156 (bitIndex!0 (size!2301 (buf!2695 thiss!1305)) (currentByte!5249 thiss!1305) (currentBit!5244 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4076 BitStream!4076) Bool)

(assert (=> b!110473 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167155 () Unit!6767)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4076) Unit!6767)

(assert (=> b!110473 (= lt!167155 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!21878 res!91195) b!110468))

(assert (= (and b!110468 res!91193) b!110470))

(assert (= (and b!110470 res!91194) b!110469))

(assert (= (and b!110469 res!91191) b!110473))

(assert (= (and b!110473 (not res!91192)) b!110472))

(assert (= start!21878 b!110471))

(declare-fun m!164033 () Bool)

(assert (=> b!110471 m!164033))

(declare-fun m!164035 () Bool)

(assert (=> start!21878 m!164035))

(declare-fun m!164037 () Bool)

(assert (=> b!110472 m!164037))

(declare-fun m!164039 () Bool)

(assert (=> b!110472 m!164039))

(declare-fun m!164041 () Bool)

(assert (=> b!110468 m!164041))

(declare-fun m!164043 () Bool)

(assert (=> b!110470 m!164043))

(declare-fun m!164045 () Bool)

(assert (=> b!110473 m!164045))

(declare-fun m!164047 () Bool)

(assert (=> b!110473 m!164047))

(declare-fun m!164049 () Bool)

(assert (=> b!110473 m!164049))

(push 1)

(assert (not start!21878))

(assert (not b!110470))

(assert (not b!110468))

(assert (not b!110471))

(assert (not b!110472))

(assert (not b!110473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


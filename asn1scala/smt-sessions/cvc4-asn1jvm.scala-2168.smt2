; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55028 () Bool)

(assert start!55028)

(declare-fun b!257019 () Bool)

(declare-fun e!178165 () Bool)

(declare-datatypes ((array!13942 0))(
  ( (array!13943 (arr!7101 (Array (_ BitVec 32) (_ BitVec 8))) (size!6114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11150 0))(
  ( (BitStream!11151 (buf!6636 array!13942) (currentByte!12160 (_ BitVec 32)) (currentBit!12155 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11150)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257019 (= e!178165 (not (invariant!0 (currentBit!12155 thiss!1754) (currentByte!12160 thiss!1754) (size!6114 (buf!6636 thiss!1754)))))))

(declare-fun b!257020 () Bool)

(declare-fun res!215406 () Bool)

(assert (=> b!257020 (=> (not res!215406) (not e!178165))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257020 (= res!215406 (not (= from!526 nBits!535)))))

(declare-fun b!257022 () Bool)

(declare-fun res!215404 () Bool)

(assert (=> b!257022 (=> (not res!215404) (not e!178165))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!21966 0))(
  ( (tuple2!21967 (_1!11919 Bool) (_2!11919 BitStream!11150)) )
))
(declare-fun readBit!0 (BitStream!11150) tuple2!21966)

(assert (=> b!257022 (= res!215404 (not (= (_1!11919 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun b!257023 () Bool)

(declare-fun e!178163 () Bool)

(declare-fun array_inv!5855 (array!13942) Bool)

(assert (=> b!257023 (= e!178163 (array_inv!5855 (buf!6636 thiss!1754)))))

(declare-fun b!257021 () Bool)

(declare-fun res!215405 () Bool)

(assert (=> b!257021 (=> (not res!215405) (not e!178165))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257021 (= res!215405 (validate_offset_bits!1 ((_ sign_extend 32) (size!6114 (buf!6636 thiss!1754))) ((_ sign_extend 32) (currentByte!12160 thiss!1754)) ((_ sign_extend 32) (currentBit!12155 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215407 () Bool)

(assert (=> start!55028 (=> (not res!215407) (not e!178165))))

(assert (=> start!55028 (= res!215407 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55028 e!178165))

(assert (=> start!55028 true))

(declare-fun inv!12 (BitStream!11150) Bool)

(assert (=> start!55028 (and (inv!12 thiss!1754) e!178163)))

(assert (= (and start!55028 res!215407) b!257021))

(assert (= (and b!257021 res!215405) b!257020))

(assert (= (and b!257020 res!215406) b!257022))

(assert (= (and b!257022 res!215404) b!257019))

(assert (= start!55028 b!257023))

(declare-fun m!386551 () Bool)

(assert (=> b!257019 m!386551))

(declare-fun m!386553 () Bool)

(assert (=> start!55028 m!386553))

(declare-fun m!386555 () Bool)

(assert (=> b!257023 m!386555))

(declare-fun m!386557 () Bool)

(assert (=> b!257021 m!386557))

(declare-fun m!386559 () Bool)

(assert (=> b!257022 m!386559))

(push 1)

(assert (not b!257022))

(assert (not b!257023))

(assert (not start!55028))

(assert (not b!257019))

(assert (not b!257021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86270 () Bool)

(assert (=> d!86270 (= (array_inv!5855 (buf!6636 thiss!1754)) (bvsge (size!6114 (buf!6636 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257023 d!86270))

(declare-fun d!86272 () Bool)

(declare-fun e!178186 () Bool)

(assert (=> d!86272 e!178186))

(declare-fun res!215416 () Bool)

(assert (=> d!86272 (=> (not res!215416) (not e!178186))))

(declare-datatypes ((Unit!18367 0))(
  ( (Unit!18368) )
))
(declare-datatypes ((tuple2!21972 0))(
  ( (tuple2!21973 (_1!11922 Unit!18367) (_2!11922 BitStream!11150)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11150) tuple2!21972)

(assert (=> d!86272 (= res!215416 (= (buf!6636 (_2!11922 (increaseBitIndex!0 thiss!1754))) (buf!6636 thiss!1754)))))

(declare-fun lt!398347 () Bool)

(assert (=> d!86272 (= lt!398347 (not (= (bvand ((_ sign_extend 24) (select (arr!7101 (buf!6636 thiss!1754)) (currentByte!12160 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12155 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398344 () tuple2!21966)

(assert (=> d!86272 (= lt!398344 (tuple2!21967 (not (= (bvand ((_ sign_extend 24) (select (arr!7101 (buf!6636 thiss!1754)) (currentByte!12160 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12155 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11922 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86272 (validate_offset_bit!0 ((_ sign_extend 32) (size!6114 (buf!6636 thiss!1754))) ((_ sign_extend 32) (currentByte!12160 thiss!1754)) ((_ sign_extend 32) (currentBit!12155 thiss!1754)))))


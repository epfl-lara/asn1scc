; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54830 () Bool)

(assert start!54830)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13873 0))(
  ( (array!13874 (arr!7075 (Array (_ BitVec 32) (_ BitVec 8))) (size!6088 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11098 0))(
  ( (BitStream!11099 (buf!6610 array!13873) (currentByte!12096 (_ BitVec 32)) (currentBit!12091 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11098)

(assert (=> start!54830 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (bvsle ((_ sign_extend 32) (size!6088 (buf!6610 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12096 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12091 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6088 (buf!6610 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12096 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12091 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54830 true))

(declare-fun e!177918 () Bool)

(declare-fun inv!12 (BitStream!11098) Bool)

(assert (=> start!54830 (and (inv!12 thiss!1754) e!177918)))

(declare-fun b!256702 () Bool)

(declare-fun array_inv!5829 (array!13873) Bool)

(assert (=> b!256702 (= e!177918 (array_inv!5829 (buf!6610 thiss!1754)))))

(assert (= start!54830 b!256702))

(declare-fun m!386305 () Bool)

(assert (=> start!54830 m!386305))

(declare-fun m!386307 () Bool)

(assert (=> b!256702 m!386307))

(push 1)

(assert (not start!54830))

(assert (not b!256702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)


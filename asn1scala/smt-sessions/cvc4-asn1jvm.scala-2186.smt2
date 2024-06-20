; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55484 () Bool)

(assert start!55484)

(declare-fun res!216577 () Bool)

(declare-fun e!179324 () Bool)

(assert (=> start!55484 (=> (not res!216577) (not e!179324))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55484 (= res!216577 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55484 e!179324))

(assert (=> start!55484 true))

(declare-datatypes ((array!14065 0))(
  ( (array!14066 (arr!7152 (Array (_ BitVec 32) (_ BitVec 8))) (size!6165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11252 0))(
  ( (BitStream!11253 (buf!6687 array!14065) (currentByte!12280 (_ BitVec 32)) (currentBit!12275 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11252)

(declare-fun e!179325 () Bool)

(declare-fun inv!12 (BitStream!11252) Bool)

(assert (=> start!55484 (and (inv!12 thiss!1754) e!179325)))

(declare-fun b!258536 () Bool)

(declare-fun res!216576 () Bool)

(assert (=> b!258536 (=> (not res!216576) (not e!179324))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258536 (= res!216576 (validate_offset_bits!1 ((_ sign_extend 32) (size!6165 (buf!6687 thiss!1754))) ((_ sign_extend 32) (currentByte!12280 thiss!1754)) ((_ sign_extend 32) (currentBit!12275 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258537 () Bool)

(assert (=> b!258537 (= e!179324 (and (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258538 () Bool)

(declare-fun array_inv!5906 (array!14065) Bool)

(assert (=> b!258538 (= e!179325 (array_inv!5906 (buf!6687 thiss!1754)))))

(assert (= (and start!55484 res!216577) b!258536))

(assert (= (and b!258536 res!216576) b!258537))

(assert (= start!55484 b!258538))

(declare-fun m!387989 () Bool)

(assert (=> start!55484 m!387989))

(declare-fun m!387991 () Bool)

(assert (=> b!258536 m!387991))

(declare-fun m!387993 () Bool)

(assert (=> b!258538 m!387993))

(push 1)

(assert (not start!55484))

(assert (not b!258536))

(assert (not b!258538))

(check-sat)

(pop 1)

(push 1)

(check-sat)


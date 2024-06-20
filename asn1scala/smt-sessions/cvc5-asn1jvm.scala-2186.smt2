; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55480 () Bool)

(assert start!55480)

(declare-fun res!216565 () Bool)

(declare-fun e!179306 () Bool)

(assert (=> start!55480 (=> (not res!216565) (not e!179306))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55480 (= res!216565 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55480 e!179306))

(assert (=> start!55480 true))

(declare-datatypes ((array!14061 0))(
  ( (array!14062 (arr!7150 (Array (_ BitVec 32) (_ BitVec 8))) (size!6163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11248 0))(
  ( (BitStream!11249 (buf!6685 array!14061) (currentByte!12278 (_ BitVec 32)) (currentBit!12273 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11248)

(declare-fun e!179307 () Bool)

(declare-fun inv!12 (BitStream!11248) Bool)

(assert (=> start!55480 (and (inv!12 thiss!1754) e!179307)))

(declare-fun b!258518 () Bool)

(declare-fun res!216564 () Bool)

(assert (=> b!258518 (=> (not res!216564) (not e!179306))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258518 (= res!216564 (validate_offset_bits!1 ((_ sign_extend 32) (size!6163 (buf!6685 thiss!1754))) ((_ sign_extend 32) (currentByte!12278 thiss!1754)) ((_ sign_extend 32) (currentBit!12273 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258519 () Bool)

(assert (=> b!258519 (= e!179306 (and (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258520 () Bool)

(declare-fun array_inv!5904 (array!14061) Bool)

(assert (=> b!258520 (= e!179307 (array_inv!5904 (buf!6685 thiss!1754)))))

(assert (= (and start!55480 res!216565) b!258518))

(assert (= (and b!258518 res!216564) b!258519))

(assert (= start!55480 b!258520))

(declare-fun m!387977 () Bool)

(assert (=> start!55480 m!387977))

(declare-fun m!387979 () Bool)

(assert (=> b!258518 m!387979))

(declare-fun m!387981 () Bool)

(assert (=> b!258520 m!387981))

(push 1)

(assert (not start!55480))

(assert (not b!258518))

(assert (not b!258520))

(check-sat)

(pop 1)

(push 1)

(check-sat)


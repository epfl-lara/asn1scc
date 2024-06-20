; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55606 () Bool)

(assert start!55606)

(declare-fun e!179477 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun b!258765 () Bool)

(declare-fun lt!400514 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!258765 (= e!179477 (not (= (bvsub (bvadd lt!400514 nBits!535) from!526) lt!400514)))))

(declare-datatypes ((array!14103 0))(
  ( (array!14104 (arr!7165 (Array (_ BitVec 32) (_ BitVec 8))) (size!6178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11278 0))(
  ( (BitStream!11279 (buf!6700 array!14103) (currentByte!12317 (_ BitVec 32)) (currentBit!12312 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11278)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258765 (= lt!400514 (bitIndex!0 (size!6178 (buf!6700 thiss!1754)) (currentByte!12317 thiss!1754) (currentBit!12312 thiss!1754)))))

(declare-fun b!258763 () Bool)

(declare-fun res!216765 () Bool)

(assert (=> b!258763 (=> (not res!216765) (not e!179477))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258763 (= res!216765 (validate_offset_bits!1 ((_ sign_extend 32) (size!6178 (buf!6700 thiss!1754))) ((_ sign_extend 32) (currentByte!12317 thiss!1754)) ((_ sign_extend 32) (currentBit!12312 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258766 () Bool)

(declare-fun e!179478 () Bool)

(declare-fun array_inv!5919 (array!14103) Bool)

(assert (=> b!258766 (= e!179478 (array_inv!5919 (buf!6700 thiss!1754)))))

(declare-fun res!216766 () Bool)

(assert (=> start!55606 (=> (not res!216766) (not e!179477))))

(assert (=> start!55606 (= res!216766 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55606 e!179477))

(assert (=> start!55606 true))

(declare-fun inv!12 (BitStream!11278) Bool)

(assert (=> start!55606 (and (inv!12 thiss!1754) e!179478)))

(declare-fun b!258764 () Bool)

(declare-fun res!216764 () Bool)

(assert (=> b!258764 (=> (not res!216764) (not e!179477))))

(assert (=> b!258764 (= res!216764 (= from!526 nBits!535))))

(assert (= (and start!55606 res!216766) b!258763))

(assert (= (and b!258763 res!216765) b!258764))

(assert (= (and b!258764 res!216764) b!258765))

(assert (= start!55606 b!258766))

(declare-fun m!388139 () Bool)

(assert (=> b!258765 m!388139))

(declare-fun m!388141 () Bool)

(assert (=> b!258763 m!388141))

(declare-fun m!388143 () Bool)

(assert (=> b!258766 m!388143))

(declare-fun m!388145 () Bool)

(assert (=> start!55606 m!388145))

(push 1)

(assert (not b!258766))

(assert (not start!55606))

(assert (not b!258765))

(assert (not b!258763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55774 () Bool)

(assert start!55774)

(declare-fun b!259256 () Bool)

(declare-fun res!217177 () Bool)

(declare-fun e!179871 () Bool)

(assert (=> b!259256 (=> (not res!217177) (not e!179871))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259256 (= res!217177 (not (= from!526 nBits!535)))))

(declare-fun b!259257 () Bool)

(assert (=> b!259257 (= e!179871 false)))

(declare-datatypes ((array!14169 0))(
  ( (array!14170 (arr!7192 (Array (_ BitVec 32) (_ BitVec 8))) (size!6205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11332 0))(
  ( (BitStream!11333 (buf!6727 array!14169) (currentByte!12365 (_ BitVec 32)) (currentBit!12360 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22208 0))(
  ( (tuple2!22209 (_1!12040 Bool) (_2!12040 BitStream!11332)) )
))
(declare-fun lt!401063 () tuple2!22208)

(declare-fun thiss!1754 () BitStream!11332)

(declare-fun readBit!0 (BitStream!11332) tuple2!22208)

(assert (=> b!259257 (= lt!401063 (readBit!0 thiss!1754))))

(declare-fun b!259255 () Bool)

(declare-fun res!217176 () Bool)

(assert (=> b!259255 (=> (not res!217176) (not e!179871))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259255 (= res!217176 (validate_offset_bits!1 ((_ sign_extend 32) (size!6205 (buf!6727 thiss!1754))) ((_ sign_extend 32) (currentByte!12365 thiss!1754)) ((_ sign_extend 32) (currentBit!12360 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217175 () Bool)

(assert (=> start!55774 (=> (not res!217175) (not e!179871))))

(assert (=> start!55774 (= res!217175 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55774 e!179871))

(assert (=> start!55774 true))

(declare-fun e!179870 () Bool)

(declare-fun inv!12 (BitStream!11332) Bool)

(assert (=> start!55774 (and (inv!12 thiss!1754) e!179870)))

(declare-fun b!259258 () Bool)

(declare-fun array_inv!5946 (array!14169) Bool)

(assert (=> b!259258 (= e!179870 (array_inv!5946 (buf!6727 thiss!1754)))))

(assert (= (and start!55774 res!217175) b!259255))

(assert (= (and b!259255 res!217176) b!259256))

(assert (= (and b!259256 res!217177) b!259257))

(assert (= start!55774 b!259258))

(declare-fun m!388589 () Bool)

(assert (=> b!259257 m!388589))

(declare-fun m!388591 () Bool)

(assert (=> b!259255 m!388591))

(declare-fun m!388593 () Bool)

(assert (=> start!55774 m!388593))

(declare-fun m!388595 () Bool)

(assert (=> b!259258 m!388595))

(push 1)

(assert (not b!259255))

(assert (not b!259258))

(assert (not b!259257))

(assert (not start!55774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


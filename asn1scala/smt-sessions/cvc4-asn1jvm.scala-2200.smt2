; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55778 () Bool)

(assert start!55778)

(declare-fun b!259281 () Bool)

(declare-fun e!179889 () Bool)

(assert (=> b!259281 (= e!179889 false)))

(declare-datatypes ((array!14173 0))(
  ( (array!14174 (arr!7194 (Array (_ BitVec 32) (_ BitVec 8))) (size!6207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11336 0))(
  ( (BitStream!11337 (buf!6729 array!14173) (currentByte!12367 (_ BitVec 32)) (currentBit!12362 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22212 0))(
  ( (tuple2!22213 (_1!12042 Bool) (_2!12042 BitStream!11336)) )
))
(declare-fun lt!401069 () tuple2!22212)

(declare-fun thiss!1754 () BitStream!11336)

(declare-fun readBit!0 (BitStream!11336) tuple2!22212)

(assert (=> b!259281 (= lt!401069 (readBit!0 thiss!1754))))

(declare-fun b!259280 () Bool)

(declare-fun res!217193 () Bool)

(assert (=> b!259280 (=> (not res!217193) (not e!179889))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259280 (= res!217193 (not (= from!526 nBits!535)))))

(declare-fun b!259282 () Bool)

(declare-fun e!179888 () Bool)

(declare-fun array_inv!5948 (array!14173) Bool)

(assert (=> b!259282 (= e!179888 (array_inv!5948 (buf!6729 thiss!1754)))))

(declare-fun res!217195 () Bool)

(assert (=> start!55778 (=> (not res!217195) (not e!179889))))

(assert (=> start!55778 (= res!217195 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55778 e!179889))

(assert (=> start!55778 true))

(declare-fun inv!12 (BitStream!11336) Bool)

(assert (=> start!55778 (and (inv!12 thiss!1754) e!179888)))

(declare-fun b!259279 () Bool)

(declare-fun res!217194 () Bool)

(assert (=> b!259279 (=> (not res!217194) (not e!179889))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259279 (= res!217194 (validate_offset_bits!1 ((_ sign_extend 32) (size!6207 (buf!6729 thiss!1754))) ((_ sign_extend 32) (currentByte!12367 thiss!1754)) ((_ sign_extend 32) (currentBit!12362 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55778 res!217195) b!259279))

(assert (= (and b!259279 res!217194) b!259280))

(assert (= (and b!259280 res!217193) b!259281))

(assert (= start!55778 b!259282))

(declare-fun m!388605 () Bool)

(assert (=> b!259281 m!388605))

(declare-fun m!388607 () Bool)

(assert (=> b!259282 m!388607))

(declare-fun m!388609 () Bool)

(assert (=> start!55778 m!388609))

(declare-fun m!388611 () Bool)

(assert (=> b!259279 m!388611))

(push 1)

(assert (not b!259282))

(assert (not b!259281))

(assert (not start!55778))

(assert (not b!259279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55738 () Bool)

(assert start!55738)

(declare-fun b!259167 () Bool)

(declare-fun e!179796 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!259167 (= e!179796 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(declare-fun b!259168 () Bool)

(declare-fun e!179797 () Bool)

(declare-datatypes ((array!14154 0))(
  ( (array!14155 (arr!7186 (Array (_ BitVec 32) (_ BitVec 8))) (size!6199 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11320 0))(
  ( (BitStream!11321 (buf!6721 array!14154) (currentByte!12356 (_ BitVec 32)) (currentBit!12351 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11320)

(declare-fun array_inv!5940 (array!14154) Bool)

(assert (=> b!259168 (= e!179797 (array_inv!5940 (buf!6721 thiss!1754)))))

(declare-fun res!217108 () Bool)

(assert (=> start!55738 (=> (not res!217108) (not e!179796))))

(assert (=> start!55738 (= res!217108 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55738 e!179796))

(assert (=> start!55738 true))

(declare-fun inv!12 (BitStream!11320) Bool)

(assert (=> start!55738 (and (inv!12 thiss!1754) e!179797)))

(declare-fun b!259169 () Bool)

(declare-fun res!217105 () Bool)

(assert (=> b!259169 (=> (not res!217105) (not e!179796))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22190 0))(
  ( (tuple2!22191 (_1!12031 Bool) (_2!12031 BitStream!11320)) )
))
(declare-fun readBit!0 (BitStream!11320) tuple2!22190)

(assert (=> b!259169 (= res!217105 (= (_1!12031 (readBit!0 thiss!1754)) expected!109))))

(declare-fun b!259170 () Bool)

(declare-fun res!217107 () Bool)

(assert (=> b!259170 (=> (not res!217107) (not e!179796))))

(assert (=> b!259170 (= res!217107 (not (= from!526 nBits!535)))))

(declare-fun b!259171 () Bool)

(declare-fun res!217106 () Bool)

(assert (=> b!259171 (=> (not res!217106) (not e!179796))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259171 (= res!217106 (validate_offset_bits!1 ((_ sign_extend 32) (size!6199 (buf!6721 thiss!1754))) ((_ sign_extend 32) (currentByte!12356 thiss!1754)) ((_ sign_extend 32) (currentBit!12351 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55738 res!217108) b!259171))

(assert (= (and b!259171 res!217106) b!259170))

(assert (= (and b!259170 res!217107) b!259169))

(assert (= (and b!259169 res!217105) b!259167))

(assert (= start!55738 b!259168))

(declare-fun m!388493 () Bool)

(assert (=> b!259168 m!388493))

(declare-fun m!388495 () Bool)

(assert (=> start!55738 m!388495))

(declare-fun m!388497 () Bool)

(assert (=> b!259169 m!388497))

(declare-fun m!388499 () Bool)

(assert (=> b!259171 m!388499))

(push 1)

(assert (not b!259171))

(assert (not b!259169))

(assert (not b!259168))

(assert (not start!55738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


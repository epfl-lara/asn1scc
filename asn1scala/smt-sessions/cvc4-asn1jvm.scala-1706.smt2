; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47244 () Bool)

(assert start!47244)

(declare-fun res!189281 () Bool)

(declare-fun e!154006 () Bool)

(assert (=> start!47244 (=> (not res!189281) (not e!154006))))

(declare-datatypes ((array!11226 0))(
  ( (array!11227 (arr!5883 (Array (_ BitVec 32) (_ BitVec 8))) (size!4926 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11226)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47244 (= res!189281 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4926 arr!308))))))

(assert (=> start!47244 e!154006))

(assert (=> start!47244 true))

(declare-fun array_inv!4667 (array!11226) Bool)

(assert (=> start!47244 (array_inv!4667 arr!308)))

(declare-datatypes ((BitStream!8948 0))(
  ( (BitStream!8949 (buf!5467 array!11226) (currentByte!10251 (_ BitVec 32)) (currentBit!10246 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8948)

(declare-fun e!154004 () Bool)

(declare-fun inv!12 (BitStream!8948) Bool)

(assert (=> start!47244 (and (inv!12 thiss!1870) e!154004)))

(declare-fun b!225564 () Bool)

(declare-fun res!189282 () Bool)

(assert (=> b!225564 (=> (not res!189282) (not e!154006))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225564 (= res!189282 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4926 (buf!5467 thiss!1870))) ((_ sign_extend 32) (currentByte!10251 thiss!1870)) ((_ sign_extend 32) (currentBit!10246 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225565 () Bool)

(assert (=> b!225565 (= e!154006 (and (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-fun b!225566 () Bool)

(assert (=> b!225566 (= e!154004 (array_inv!4667 (buf!5467 thiss!1870)))))

(assert (= (and start!47244 res!189281) b!225564))

(assert (= (and b!225564 res!189282) b!225565))

(assert (= start!47244 b!225566))

(declare-fun m!346609 () Bool)

(assert (=> start!47244 m!346609))

(declare-fun m!346611 () Bool)

(assert (=> start!47244 m!346611))

(declare-fun m!346613 () Bool)

(assert (=> b!225564 m!346613))

(declare-fun m!346615 () Bool)

(assert (=> b!225566 m!346615))

(push 1)

(assert (not b!225564))

(assert (not b!225566))

(assert (not start!47244))

(check-sat)

(pop 1)

(push 1)

(check-sat)


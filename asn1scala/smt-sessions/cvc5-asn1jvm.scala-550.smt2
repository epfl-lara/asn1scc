; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15872 () Bool)

(assert start!15872)

(declare-fun res!66334 () Bool)

(declare-fun e!52658 () Bool)

(assert (=> start!15872 (=> (not res!66334) (not e!52658))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15872 (= res!66334 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15872 e!52658))

(assert (=> start!15872 true))

(declare-datatypes ((array!3484 0))(
  ( (array!3485 (arr!2214 (Array (_ BitVec 32) (_ BitVec 8))) (size!1607 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2776 0))(
  ( (BitStream!2777 (buf!1997 array!3484) (currentByte!3889 (_ BitVec 32)) (currentBit!3884 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2776)

(declare-fun e!52659 () Bool)

(declare-fun inv!12 (BitStream!2776) Bool)

(assert (=> start!15872 (and (inv!12 thiss!1716) e!52659)))

(declare-fun b!80152 () Bool)

(declare-fun res!66333 () Bool)

(assert (=> b!80152 (=> (not res!66333) (not e!52658))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80152 (= res!66333 (validate_offset_bits!1 ((_ sign_extend 32) (size!1607 (buf!1997 thiss!1716))) ((_ sign_extend 32) (currentByte!3889 thiss!1716)) ((_ sign_extend 32) (currentBit!3884 thiss!1716)) nBits!516))))

(declare-fun b!80153 () Bool)

(assert (=> b!80153 (= e!52658 (and (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!80154 () Bool)

(declare-fun array_inv!1453 (array!3484) Bool)

(assert (=> b!80154 (= e!52659 (array_inv!1453 (buf!1997 thiss!1716)))))

(assert (= (and start!15872 res!66334) b!80152))

(assert (= (and b!80152 res!66333) b!80153))

(assert (= start!15872 b!80154))

(declare-fun m!125661 () Bool)

(assert (=> start!15872 m!125661))

(declare-fun m!125663 () Bool)

(assert (=> b!80152 m!125663))

(declare-fun m!125665 () Bool)

(assert (=> b!80154 m!125665))

(push 1)

(assert (not b!80154))

(assert (not b!80152))

(assert (not start!15872))

(check-sat)

(pop 1)


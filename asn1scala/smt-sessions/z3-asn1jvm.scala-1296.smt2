; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36924 () Bool)

(assert start!36924)

(declare-fun res!140317 () Bool)

(declare-fun e!117202 () Bool)

(assert (=> start!36924 (=> (not res!140317) (not e!117202))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36924 (= res!140317 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36924 e!117202))

(assert (=> start!36924 true))

(declare-datatypes ((array!8804 0))(
  ( (array!8805 (arr!4823 (Array (_ BitVec 32) (_ BitVec 8))) (size!3902 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6960 0))(
  ( (BitStream!6961 (buf!4354 array!8804) (currentByte!8275 (_ BitVec 32)) (currentBit!8270 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6960)

(declare-fun e!117204 () Bool)

(declare-fun inv!12 (BitStream!6960) Bool)

(assert (=> start!36924 (and (inv!12 thiss!1894) e!117204)))

(declare-fun b!168643 () Bool)

(declare-fun res!140318 () Bool)

(assert (=> b!168643 (=> (not res!140318) (not e!117202))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168643 (= res!140318 (validate_offset_bits!1 ((_ sign_extend 32) (size!3902 (buf!4354 thiss!1894))) ((_ sign_extend 32) (currentByte!8275 thiss!1894)) ((_ sign_extend 32) (currentBit!8270 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168644 () Bool)

(assert (=> b!168644 (= e!117202 (and (bvsle (bvadd (currentBit!8270 thiss!1894) nBits!600) #b00000000000000000000000000001000) (or (bvslt nBits!600 #b00000000000000000000000000000000) (bvsge nBits!600 #b00000000000000000000000000001001))))))

(declare-fun b!168645 () Bool)

(declare-fun array_inv!3643 (array!8804) Bool)

(assert (=> b!168645 (= e!117204 (array_inv!3643 (buf!4354 thiss!1894)))))

(assert (= (and start!36924 res!140317) b!168643))

(assert (= (and b!168643 res!140318) b!168644))

(assert (= start!36924 b!168645))

(declare-fun m!268239 () Bool)

(assert (=> start!36924 m!268239))

(declare-fun m!268241 () Bool)

(assert (=> b!168643 m!268241))

(declare-fun m!268243 () Bool)

(assert (=> b!168645 m!268243))

(check-sat (not b!168645) (not b!168643) (not start!36924))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36930 () Bool)

(assert start!36930)

(declare-fun res!140335 () Bool)

(declare-fun e!117229 () Bool)

(assert (=> start!36930 (=> (not res!140335) (not e!117229))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36930 (= res!140335 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36930 e!117229))

(assert (=> start!36930 true))

(declare-datatypes ((array!8810 0))(
  ( (array!8811 (arr!4826 (Array (_ BitVec 32) (_ BitVec 8))) (size!3905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6966 0))(
  ( (BitStream!6967 (buf!4357 array!8810) (currentByte!8278 (_ BitVec 32)) (currentBit!8273 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6966)

(declare-fun e!117230 () Bool)

(declare-fun inv!12 (BitStream!6966) Bool)

(assert (=> start!36930 (and (inv!12 thiss!1894) e!117230)))

(declare-fun b!168670 () Bool)

(declare-fun res!140336 () Bool)

(assert (=> b!168670 (=> (not res!140336) (not e!117229))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168670 (= res!140336 (validate_offset_bits!1 ((_ sign_extend 32) (size!3905 (buf!4357 thiss!1894))) ((_ sign_extend 32) (currentByte!8278 thiss!1894)) ((_ sign_extend 32) (currentBit!8273 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168671 () Bool)

(assert (=> b!168671 (= e!117229 (and (bvsgt (bvadd (currentBit!8273 thiss!1894) nBits!600) #b00000000000000000000000000001000) (let ((bdg!10171 (bvand (bvadd (currentBit!8273 thiss!1894) nBits!600) #b10000000000000000000000000000000))) (and (not (= bdg!10171 #b00000000000000000000000000000000)) (not (= bdg!10171 (bvand (bvsub (bvadd (currentBit!8273 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(declare-fun b!168672 () Bool)

(declare-fun array_inv!3646 (array!8810) Bool)

(assert (=> b!168672 (= e!117230 (array_inv!3646 (buf!4357 thiss!1894)))))

(assert (= (and start!36930 res!140335) b!168670))

(assert (= (and b!168670 res!140336) b!168671))

(assert (= start!36930 b!168672))

(declare-fun m!268257 () Bool)

(assert (=> start!36930 m!268257))

(declare-fun m!268259 () Bool)

(assert (=> b!168670 m!268259))

(declare-fun m!268261 () Bool)

(assert (=> b!168672 m!268261))

(check-sat (not b!168672) (not b!168670) (not start!36930))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37076 () Bool)

(assert start!37076)

(declare-fun res!140441 () Bool)

(declare-fun e!117373 () Bool)

(assert (=> start!37076 (=> (not res!140441) (not e!117373))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37076 (= res!140441 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37076 e!117373))

(assert (=> start!37076 true))

(declare-datatypes ((array!8854 0))(
  ( (array!8855 (arr!4842 (Array (_ BitVec 32) (_ BitVec 8))) (size!3921 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6998 0))(
  ( (BitStream!6999 (buf!4373 array!8854) (currentByte!8327 (_ BitVec 32)) (currentBit!8322 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6998)

(declare-fun e!117375 () Bool)

(declare-fun inv!12 (BitStream!6998) Bool)

(assert (=> start!37076 (and (inv!12 thiss!1894) e!117375)))

(declare-fun b!168823 () Bool)

(declare-fun res!140440 () Bool)

(assert (=> b!168823 (=> (not res!140440) (not e!117373))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168823 (= res!140440 (validate_offset_bits!1 ((_ sign_extend 32) (size!3921 (buf!4373 thiss!1894))) ((_ sign_extend 32) (currentByte!8327 thiss!1894)) ((_ sign_extend 32) (currentBit!8322 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168824 () Bool)

(assert (=> b!168824 (= e!117373 (and (bvsgt (bvadd (currentBit!8322 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8322 thiss!1894) nBits!600) #b00000000000000000000000000001000)) #b00000000000000000000000000100000)))))

(declare-fun b!168825 () Bool)

(declare-fun array_inv!3662 (array!8854) Bool)

(assert (=> b!168825 (= e!117375 (array_inv!3662 (buf!4373 thiss!1894)))))

(assert (= (and start!37076 res!140441) b!168823))

(assert (= (and b!168823 res!140440) b!168824))

(assert (= start!37076 b!168825))

(declare-fun m!268413 () Bool)

(assert (=> start!37076 m!268413))

(declare-fun m!268415 () Bool)

(assert (=> b!168823 m!268415))

(declare-fun m!268417 () Bool)

(assert (=> b!168825 m!268417))

(push 1)

(assert (not b!168823))

(assert (not b!168825))

(assert (not start!37076))

(check-sat)

(pop 1)

(push 1)

(check-sat)


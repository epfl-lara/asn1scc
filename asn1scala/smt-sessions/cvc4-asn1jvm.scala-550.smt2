; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15876 () Bool)

(assert start!15876)

(declare-fun res!66346 () Bool)

(declare-fun e!52675 () Bool)

(assert (=> start!15876 (=> (not res!66346) (not e!52675))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15876 (= res!66346 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15876 e!52675))

(assert (=> start!15876 true))

(declare-datatypes ((array!3488 0))(
  ( (array!3489 (arr!2216 (Array (_ BitVec 32) (_ BitVec 8))) (size!1609 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2780 0))(
  ( (BitStream!2781 (buf!1999 array!3488) (currentByte!3891 (_ BitVec 32)) (currentBit!3886 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2780)

(declare-fun e!52676 () Bool)

(declare-fun inv!12 (BitStream!2780) Bool)

(assert (=> start!15876 (and (inv!12 thiss!1716) e!52676)))

(declare-fun b!80170 () Bool)

(declare-fun res!66345 () Bool)

(assert (=> b!80170 (=> (not res!66345) (not e!52675))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80170 (= res!66345 (validate_offset_bits!1 ((_ sign_extend 32) (size!1609 (buf!1999 thiss!1716))) ((_ sign_extend 32) (currentByte!3891 thiss!1716)) ((_ sign_extend 32) (currentBit!3886 thiss!1716)) nBits!516))))

(declare-fun b!80171 () Bool)

(assert (=> b!80171 (= e!52675 (and (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!80172 () Bool)

(declare-fun array_inv!1455 (array!3488) Bool)

(assert (=> b!80172 (= e!52676 (array_inv!1455 (buf!1999 thiss!1716)))))

(assert (= (and start!15876 res!66346) b!80170))

(assert (= (and b!80170 res!66345) b!80171))

(assert (= start!15876 b!80172))

(declare-fun m!125673 () Bool)

(assert (=> start!15876 m!125673))

(declare-fun m!125675 () Bool)

(assert (=> b!80170 m!125675))

(declare-fun m!125677 () Bool)

(assert (=> b!80172 m!125677))

(push 1)

(assert (not b!80172))

(assert (not b!80170))

(assert (not start!15876))

(check-sat)

(pop 1)

(push 1)

(check-sat)


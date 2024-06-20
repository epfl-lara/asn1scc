; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15878 () Bool)

(assert start!15878)

(declare-fun res!66352 () Bool)

(declare-fun e!52685 () Bool)

(assert (=> start!15878 (=> (not res!66352) (not e!52685))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15878 (= res!66352 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15878 e!52685))

(assert (=> start!15878 true))

(declare-datatypes ((array!3490 0))(
  ( (array!3491 (arr!2217 (Array (_ BitVec 32) (_ BitVec 8))) (size!1610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2782 0))(
  ( (BitStream!2783 (buf!2000 array!3490) (currentByte!3892 (_ BitVec 32)) (currentBit!3887 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2782)

(declare-fun e!52686 () Bool)

(declare-fun inv!12 (BitStream!2782) Bool)

(assert (=> start!15878 (and (inv!12 thiss!1716) e!52686)))

(declare-fun b!80179 () Bool)

(declare-fun res!66351 () Bool)

(assert (=> b!80179 (=> (not res!66351) (not e!52685))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80179 (= res!66351 (validate_offset_bits!1 ((_ sign_extend 32) (size!1610 (buf!2000 thiss!1716))) ((_ sign_extend 32) (currentByte!3892 thiss!1716)) ((_ sign_extend 32) (currentBit!3887 thiss!1716)) nBits!516))))

(declare-fun b!80180 () Bool)

(declare-fun lt!127176 () (_ BitVec 64))

(assert (=> b!80180 (= e!52685 (and (not (= lt!127176 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!127176 (bvand (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!80180 (= lt!127176 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!80181 () Bool)

(declare-fun array_inv!1456 (array!3490) Bool)

(assert (=> b!80181 (= e!52686 (array_inv!1456 (buf!2000 thiss!1716)))))

(assert (= (and start!15878 res!66352) b!80179))

(assert (= (and b!80179 res!66351) b!80180))

(assert (= start!15878 b!80181))

(declare-fun m!125679 () Bool)

(assert (=> start!15878 m!125679))

(declare-fun m!125681 () Bool)

(assert (=> b!80179 m!125681))

(declare-fun m!125683 () Bool)

(assert (=> b!80181 m!125683))

(push 1)

(assert (not b!80179))

(assert (not start!15878))

(assert (not b!80181))

(check-sat)

(pop 1)

(push 1)

(check-sat)


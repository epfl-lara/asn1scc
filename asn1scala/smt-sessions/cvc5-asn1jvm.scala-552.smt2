; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15884 () Bool)

(assert start!15884)

(declare-fun res!66370 () Bool)

(declare-fun e!52712 () Bool)

(assert (=> start!15884 (=> (not res!66370) (not e!52712))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15884 (= res!66370 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15884 e!52712))

(assert (=> start!15884 true))

(declare-datatypes ((array!3496 0))(
  ( (array!3497 (arr!2220 (Array (_ BitVec 32) (_ BitVec 8))) (size!1613 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2788 0))(
  ( (BitStream!2789 (buf!2003 array!3496) (currentByte!3895 (_ BitVec 32)) (currentBit!3890 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2788)

(declare-fun e!52711 () Bool)

(declare-fun inv!12 (BitStream!2788) Bool)

(assert (=> start!15884 (and (inv!12 thiss!1716) e!52711)))

(declare-fun b!80206 () Bool)

(declare-fun res!66369 () Bool)

(assert (=> b!80206 (=> (not res!66369) (not e!52712))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80206 (= res!66369 (validate_offset_bits!1 ((_ sign_extend 32) (size!1613 (buf!2003 thiss!1716))) ((_ sign_extend 32) (currentByte!3895 thiss!1716)) ((_ sign_extend 32) (currentBit!3890 thiss!1716)) nBits!516))))

(declare-fun b!80207 () Bool)

(assert (=> b!80207 (= e!52712 (bvsge (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!80208 () Bool)

(declare-fun array_inv!1459 (array!3496) Bool)

(assert (=> b!80208 (= e!52711 (array_inv!1459 (buf!2003 thiss!1716)))))

(assert (= (and start!15884 res!66370) b!80206))

(assert (= (and b!80206 res!66369) b!80207))

(assert (= start!15884 b!80208))

(declare-fun m!125697 () Bool)

(assert (=> start!15884 m!125697))

(declare-fun m!125699 () Bool)

(assert (=> b!80206 m!125699))

(declare-fun m!125701 () Bool)

(assert (=> b!80208 m!125701))

(push 1)

(assert (not b!80208))

(assert (not start!15884))

(assert (not b!80206))

(check-sat)

(pop 1)

(push 1)

(check-sat)


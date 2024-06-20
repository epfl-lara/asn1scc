; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15894 () Bool)

(assert start!15894)

(declare-fun res!66399 () Bool)

(declare-fun e!52757 () Bool)

(assert (=> start!15894 (=> (not res!66399) (not e!52757))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15894 (= res!66399 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15894 e!52757))

(assert (=> start!15894 true))

(declare-datatypes ((array!3506 0))(
  ( (array!3507 (arr!2225 (Array (_ BitVec 32) (_ BitVec 8))) (size!1618 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2798 0))(
  ( (BitStream!2799 (buf!2008 array!3506) (currentByte!3900 (_ BitVec 32)) (currentBit!3895 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2798)

(declare-fun e!52756 () Bool)

(declare-fun inv!12 (BitStream!2798) Bool)

(assert (=> start!15894 (and (inv!12 thiss!1716) e!52756)))

(declare-fun b!80251 () Bool)

(declare-fun res!66400 () Bool)

(assert (=> b!80251 (=> (not res!66400) (not e!52757))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80251 (= res!66400 (validate_offset_bits!1 ((_ sign_extend 32) (size!1618 (buf!2008 thiss!1716))) ((_ sign_extend 32) (currentByte!3900 thiss!1716)) ((_ sign_extend 32) (currentBit!3895 thiss!1716)) nBits!516))))

(declare-fun b!80252 () Bool)

(declare-fun lt!127191 () (_ BitVec 64))

(assert (=> b!80252 (= e!52757 (and (bvslt lt!127191 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!127191 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> b!80252 (= lt!127191 (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80253 () Bool)

(declare-fun array_inv!1464 (array!3506) Bool)

(assert (=> b!80253 (= e!52756 (array_inv!1464 (buf!2008 thiss!1716)))))

(assert (= (and start!15894 res!66399) b!80251))

(assert (= (and b!80251 res!66400) b!80252))

(assert (= start!15894 b!80253))

(declare-fun m!125727 () Bool)

(assert (=> start!15894 m!125727))

(declare-fun m!125729 () Bool)

(assert (=> b!80251 m!125729))

(declare-fun m!125731 () Bool)

(assert (=> b!80253 m!125731))

(push 1)

(assert (not start!15894))

(assert (not b!80253))

(assert (not b!80251))

(check-sat)

(pop 1)

(push 1)

(check-sat)


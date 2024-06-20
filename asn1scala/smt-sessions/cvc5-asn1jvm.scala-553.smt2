; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15890 () Bool)

(assert start!15890)

(declare-fun res!66388 () Bool)

(declare-fun e!52738 () Bool)

(assert (=> start!15890 (=> (not res!66388) (not e!52738))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15890 (= res!66388 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15890 e!52738))

(assert (=> start!15890 true))

(declare-datatypes ((array!3502 0))(
  ( (array!3503 (arr!2223 (Array (_ BitVec 32) (_ BitVec 8))) (size!1616 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2794 0))(
  ( (BitStream!2795 (buf!2006 array!3502) (currentByte!3898 (_ BitVec 32)) (currentBit!3893 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2794)

(declare-fun e!52740 () Bool)

(declare-fun inv!12 (BitStream!2794) Bool)

(assert (=> start!15890 (and (inv!12 thiss!1716) e!52740)))

(declare-fun b!80233 () Bool)

(declare-fun res!66387 () Bool)

(assert (=> b!80233 (=> (not res!66387) (not e!52738))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80233 (= res!66387 (validate_offset_bits!1 ((_ sign_extend 32) (size!1616 (buf!2006 thiss!1716))) ((_ sign_extend 32) (currentByte!3898 thiss!1716)) ((_ sign_extend 32) (currentBit!3893 thiss!1716)) nBits!516))))

(declare-fun b!80234 () Bool)

(declare-fun lt!127185 () (_ BitVec 64))

(assert (=> b!80234 (= e!52738 (and (bvslt lt!127185 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!127185 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> b!80234 (= lt!127185 (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80235 () Bool)

(declare-fun array_inv!1462 (array!3502) Bool)

(assert (=> b!80235 (= e!52740 (array_inv!1462 (buf!2006 thiss!1716)))))

(assert (= (and start!15890 res!66388) b!80233))

(assert (= (and b!80233 res!66387) b!80234))

(assert (= start!15890 b!80235))

(declare-fun m!125715 () Bool)

(assert (=> start!15890 m!125715))

(declare-fun m!125717 () Bool)

(assert (=> b!80233 m!125717))

(declare-fun m!125719 () Bool)

(assert (=> b!80235 m!125719))

(push 1)

(assert (not b!80233))

(assert (not b!80235))

(assert (not start!15890))

(check-sat)

(pop 1)

(push 1)

(check-sat)


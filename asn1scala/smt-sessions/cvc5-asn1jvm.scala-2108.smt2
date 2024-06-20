; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53610 () Bool)

(assert start!53610)

(declare-fun b!249017 () Bool)

(declare-fun res!208404 () Bool)

(declare-fun e!172524 () Bool)

(assert (=> b!249017 (=> (not res!208404) (not e!172524))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13546 0))(
  ( (array!13547 (arr!6925 (Array (_ BitVec 32) (_ BitVec 8))) (size!5938 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10798 0))(
  ( (BitStream!10799 (buf!6431 array!13546) (currentByte!11856 (_ BitVec 32)) (currentBit!11851 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10798)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249017 (= res!208404 (validate_offset_bits!1 ((_ sign_extend 32) (size!5938 (buf!6431 thiss!1005))) ((_ sign_extend 32) (currentByte!11856 thiss!1005)) ((_ sign_extend 32) (currentBit!11851 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249018 () Bool)

(declare-fun res!208403 () Bool)

(assert (=> b!249018 (=> (not res!208403) (not e!172524))))

(assert (=> b!249018 (= res!208403 (bvsge from!289 nBits!297))))

(declare-fun b!249020 () Bool)

(declare-fun e!172526 () Bool)

(declare-fun array_inv!5679 (array!13546) Bool)

(assert (=> b!249020 (= e!172526 (array_inv!5679 (buf!6431 thiss!1005)))))

(declare-fun res!208402 () Bool)

(assert (=> start!53610 (=> (not res!208402) (not e!172524))))

(assert (=> start!53610 (= res!208402 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53610 e!172524))

(assert (=> start!53610 true))

(declare-fun inv!12 (BitStream!10798) Bool)

(assert (=> start!53610 (and (inv!12 thiss!1005) e!172526)))

(declare-fun b!249019 () Bool)

(assert (=> b!249019 (= e!172524 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10798 BitStream!10798) Bool)

(assert (=> b!249019 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18024 0))(
  ( (Unit!18025) )
))
(declare-fun lt!388038 () Unit!18024)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10798) Unit!18024)

(assert (=> b!249019 (= lt!388038 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (= (and start!53610 res!208402) b!249017))

(assert (= (and b!249017 res!208404) b!249018))

(assert (= (and b!249018 res!208403) b!249019))

(assert (= start!53610 b!249020))

(declare-fun m!375501 () Bool)

(assert (=> b!249017 m!375501))

(declare-fun m!375503 () Bool)

(assert (=> b!249020 m!375503))

(declare-fun m!375505 () Bool)

(assert (=> start!53610 m!375505))

(declare-fun m!375507 () Bool)

(assert (=> b!249019 m!375507))

(declare-fun m!375509 () Bool)

(assert (=> b!249019 m!375509))

(push 1)

(assert (not b!249017))

(assert (not b!249019))

(assert (not start!53610))

(assert (not b!249020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


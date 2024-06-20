; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50204 () Bool)

(assert start!50204)

(declare-fun res!197067 () Bool)

(declare-fun e!162962 () Bool)

(assert (=> start!50204 (=> (not res!197067) (not e!162962))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50204 (= res!197067 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50204 e!162962))

(assert (=> start!50204 true))

(declare-datatypes ((array!12422 0))(
  ( (array!12423 (arr!6443 (Array (_ BitVec 32) (_ BitVec 8))) (size!5456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9876 0))(
  ( (BitStream!9877 (buf!5931 array!12422) (currentByte!11040 (_ BitVec 32)) (currentBit!11035 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9876)

(declare-fun e!162961 () Bool)

(declare-fun inv!12 (BitStream!9876) Bool)

(assert (=> start!50204 (and (inv!12 thiss!1848) e!162961)))

(declare-fun b!235737 () Bool)

(declare-fun res!197066 () Bool)

(assert (=> b!235737 (=> (not res!197066) (not e!162962))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235737 (= res!197066 (validate_offset_bits!1 ((_ sign_extend 32) (size!5456 (buf!5931 thiss!1848))) ((_ sign_extend 32) (currentByte!11040 thiss!1848)) ((_ sign_extend 32) (currentBit!11035 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235738 () Bool)

(assert (=> b!235738 (= e!162962 (bvsgt (bvsub nBits!593 i!756) #b00000000000000000000000001000000))))

(declare-fun b!235739 () Bool)

(declare-fun array_inv!5197 (array!12422) Bool)

(assert (=> b!235739 (= e!162961 (array_inv!5197 (buf!5931 thiss!1848)))))

(assert (= (and start!50204 res!197067) b!235737))

(assert (= (and b!235737 res!197066) b!235738))

(assert (= start!50204 b!235739))

(declare-fun m!358419 () Bool)

(assert (=> start!50204 m!358419))

(declare-fun m!358421 () Bool)

(assert (=> b!235737 m!358421))

(declare-fun m!358423 () Bool)

(assert (=> b!235739 m!358423))

(check-sat (not b!235739) (not b!235737) (not start!50204))
(check-sat)

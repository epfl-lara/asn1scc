; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53624 () Bool)

(assert start!53624)

(declare-fun res!208434 () Bool)

(declare-fun e!172561 () Bool)

(assert (=> start!53624 (=> (not res!208434) (not e!172561))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53624 (= res!208434 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53624 e!172561))

(assert (=> start!53624 true))

(declare-datatypes ((array!13554 0))(
  ( (array!13555 (arr!6929 (Array (_ BitVec 32) (_ BitVec 8))) (size!5942 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10806 0))(
  ( (BitStream!10807 (buf!6435 array!13554) (currentByte!11860 (_ BitVec 32)) (currentBit!11855 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10806)

(declare-fun e!172560 () Bool)

(declare-fun inv!12 (BitStream!10806) Bool)

(assert (=> start!53624 (and (inv!12 thiss!1005) e!172560)))

(declare-fun b!249060 () Bool)

(declare-fun res!208433 () Bool)

(assert (=> b!249060 (=> (not res!208433) (not e!172561))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249060 (= res!208433 (validate_offset_bits!1 ((_ sign_extend 32) (size!5942 (buf!6435 thiss!1005))) ((_ sign_extend 32) (currentByte!11860 thiss!1005)) ((_ sign_extend 32) (currentBit!11855 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249061 () Bool)

(assert (=> b!249061 (= e!172561 (and (not (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!249062 () Bool)

(declare-fun array_inv!5683 (array!13554) Bool)

(assert (=> b!249062 (= e!172560 (array_inv!5683 (buf!6435 thiss!1005)))))

(assert (= (and start!53624 res!208434) b!249060))

(assert (= (and b!249060 res!208433) b!249061))

(assert (= start!53624 b!249062))

(declare-fun m!375537 () Bool)

(assert (=> start!53624 m!375537))

(declare-fun m!375539 () Bool)

(assert (=> b!249060 m!375539))

(declare-fun m!375541 () Bool)

(assert (=> b!249062 m!375541))

(check-sat (not b!249062) (not b!249060) (not start!53624))
(check-sat)

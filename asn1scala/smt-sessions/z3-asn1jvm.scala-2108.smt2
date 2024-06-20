; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53612 () Bool)

(assert start!53612)

(declare-fun b!249032 () Bool)

(declare-fun e!172533 () Bool)

(declare-datatypes ((array!13548 0))(
  ( (array!13549 (arr!6926 (Array (_ BitVec 32) (_ BitVec 8))) (size!5939 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10800 0))(
  ( (BitStream!10801 (buf!6432 array!13548) (currentByte!11857 (_ BitVec 32)) (currentBit!11852 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10800)

(declare-fun array_inv!5680 (array!13548) Bool)

(assert (=> b!249032 (= e!172533 (array_inv!5680 (buf!6432 thiss!1005)))))

(declare-fun res!208411 () Bool)

(declare-fun e!172535 () Bool)

(assert (=> start!53612 (=> (not res!208411) (not e!172535))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53612 (= res!208411 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53612 e!172535))

(assert (=> start!53612 true))

(declare-fun inv!12 (BitStream!10800) Bool)

(assert (=> start!53612 (and (inv!12 thiss!1005) e!172533)))

(declare-fun b!249029 () Bool)

(declare-fun res!208413 () Bool)

(assert (=> b!249029 (=> (not res!208413) (not e!172535))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249029 (= res!208413 (validate_offset_bits!1 ((_ sign_extend 32) (size!5939 (buf!6432 thiss!1005))) ((_ sign_extend 32) (currentByte!11857 thiss!1005)) ((_ sign_extend 32) (currentBit!11852 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249031 () Bool)

(assert (=> b!249031 (= e!172535 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10800 BitStream!10800) Bool)

(assert (=> b!249031 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18026 0))(
  ( (Unit!18027) )
))
(declare-fun lt!388041 () Unit!18026)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10800) Unit!18026)

(assert (=> b!249031 (= lt!388041 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!249030 () Bool)

(declare-fun res!208412 () Bool)

(assert (=> b!249030 (=> (not res!208412) (not e!172535))))

(assert (=> b!249030 (= res!208412 (bvsge from!289 nBits!297))))

(assert (= (and start!53612 res!208411) b!249029))

(assert (= (and b!249029 res!208413) b!249030))

(assert (= (and b!249030 res!208412) b!249031))

(assert (= start!53612 b!249032))

(declare-fun m!375511 () Bool)

(assert (=> b!249032 m!375511))

(declare-fun m!375513 () Bool)

(assert (=> start!53612 m!375513))

(declare-fun m!375515 () Bool)

(assert (=> b!249029 m!375515))

(declare-fun m!375517 () Bool)

(assert (=> b!249031 m!375517))

(declare-fun m!375519 () Bool)

(assert (=> b!249031 m!375519))

(check-sat (not b!249031) (not start!53612) (not b!249032) (not b!249029))
(check-sat)
